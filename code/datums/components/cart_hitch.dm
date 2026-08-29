#define CART_HITCH_TRAIT_SOURCE "cart_hitch"
#define CART_HITCH_SPEED_ID "CART HITCH"

/datum/component/cart_hitch
	dupe_mode = COMPONENT_DUPE_UNIQUE

	var/obj/structure/handcart/hitched_cart
	var/unhitching = FALSE

/datum/component/cart_hitch/Initialize()
	if(!istype(parent, /mob/living/simple_animal))
		return COMPONENT_INCOMPATIBLE

/datum/component/cart_hitch/RegisterWithParent()
	RegisterSignal(parent, COMSIG_LIVING_DEATH, PROC_REF(on_parent_death))
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(on_parent_moved))
	RegisterSignal(parent, COMSIG_QDELETING, PROC_REF(on_parent_qdel))

/datum/component/cart_hitch/UnregisterFromParent()
	unhitch(silent = TRUE)
	UnregisterSignal(parent, list(
		COMSIG_LIVING_DEATH,
		COMSIG_MOVABLE_MOVED,
		COMSIG_QDELETING,
	))

/datum/component/cart_hitch/Destroy()
	unhitch(silent = TRUE)
	return ..()

/datum/component/cart_hitch/proc/handle_hitch_interaction(mob/living/user, obj/structure/handcart/cart)
	if(!istype(user) || user.incapacitated())
		return FALSE
	if(!istype(cart))
		return FALSE
	if(!user.Adjacent(parent) || !user.Adjacent(cart))
		return FALSE
	try_toggle_hitch(user, cart)
	return TRUE

/datum/component/cart_hitch/proc/freeze_animal()
	var/mob/living/simple_animal/animal = parent
	if(!animal)
		return
	ADD_TRAIT(animal, TRAIT_IMMOBILIZED, CART_HITCH_TRAIT_SOURCE)
	walk(animal, 0)

/datum/component/cart_hitch/proc/unfreeze_animal()
	var/mob/living/simple_animal/animal = parent
	if(QDELETED(animal))
		return
	REMOVE_TRAIT(animal, TRAIT_IMMOBILIZED, CART_HITCH_TRAIT_SOURCE)

/datum/component/cart_hitch/proc/try_toggle_hitch(mob/living/user, obj/structure/handcart/cart)
	if(!istype(cart) || QDELETED(cart) || QDELETED(parent))
		return

	freeze_animal()

	if(hitched_cart == cart)
		user.visible_message(span_notice("[user] begins unhitching [cart] from [parent]..."), span_notice("I begin unhitching [cart] from [parent]..."))
		if(!do_after(user, 1.5 SECONDS, parent))
			unfreeze_animal()
			return
		if(hitched_cart != cart)
			unfreeze_animal()
			return
		user.visible_message(span_notice("[user] unhitches [cart] from [parent]."), span_notice("I unhitch [cart] from [parent]."))
		unhitch(silent = TRUE)
		playsound(parent, 'sound/foley/cartdump.ogg', 80, FALSE, -1)
		unfreeze_animal()
		return

	if(!can_hitch(user, cart))
		unfreeze_animal()
		return
	user.visible_message(span_notice("[user] begins hitching [cart] to [parent]..."), span_notice("I begin hitching [cart] to [parent]..."))
	if(!do_after(user, 2 SECONDS, parent))
		unfreeze_animal()
		return
	if(!can_hitch(user, cart))
		unfreeze_animal()
		return
	hitch(cart, user)
	user.visible_message(span_notice("[user] hitches [cart] to [parent]."), span_notice("I hitch [cart] to [parent]."))
	playsound(parent, 'sound/foley/cartadd.ogg', 100, FALSE, -1)
	unfreeze_animal()

/datum/component/cart_hitch/proc/can_hitch(mob/user, obj/structure/handcart/cart)
	var/mob/living/simple_animal/animal = parent
	if(!animal.can_hitch)
		to_chat(user, span_warning("You can't hitch [animal] to a cart!"))
		return FALSE
	if(!animal.tame)
		to_chat(user, span_warning("[animal] doesn't trust you enough to let you do this..."))
		return FALSE
	if(animal.stat != CONSCIOUS)
		to_chat(user, span_warning("[animal] can't pull in that condition!"))
		return FALSE
	if(hitched_cart)
		to_chat(user, span_warning("[animal] is already hitched to [hitched_cart]!"))
		return FALSE
	if(cart.hitched_animal)
		to_chat(user, span_warning("[cart] is already hitched to [cart.hitched_animal]!"))
		return FALSE
	if(get_dist(animal, cart) > 1)
		to_chat(user, span_warning("[cart] is too far from [animal]!"))
		return FALSE
	return TRUE

/datum/component/cart_hitch/proc/hitch(obj/structure/handcart/cart, mob/user)
	if(hitched_cart)
		unhitch(silent = TRUE)
	hitched_cart = cart
	cart.hitched_animal = parent
	RegisterSignal(cart, COMSIG_ATOM_CAN_BE_PULLED, PROC_REF(on_cart_pulled))
	RegisterSignal(cart, COMSIG_QDELETING, PROC_REF(on_cart_qdel))
	update_slowdown()
	cart.update_appearance(UPDATE_ICON)

/datum/component/cart_hitch/proc/unhitch(silent = FALSE)
	if(unhitching)
		return
	unhitching = TRUE
	var/mob/living/simple_animal/animal = parent
	var/obj/structure/handcart/cart = hitched_cart
	hitched_cart = null
	if(cart)
		UnregisterSignal(cart, list(COMSIG_ATOM_CAN_BE_PULLED, COMSIG_QDELETING))
		if(cart.hitched_animal == parent)
			cart.hitched_animal = null
		cart.update_appearance(UPDATE_ICON)
	if(animal)
		clear_slowdown()
	if(!silent && animal && cart)
		animal.visible_message(span_warning("[cart] comes unhitched from [animal]."))
	unhitching = FALSE

/datum/component/cart_hitch/proc/on_parent_death(datum/source)
	SIGNAL_HANDLER
	unhitch()

/datum/component/cart_hitch/proc/on_parent_qdel(datum/source)
	SIGNAL_HANDLER
	unhitch(silent = TRUE)

/datum/component/cart_hitch/proc/on_cart_qdel(datum/source)
	SIGNAL_HANDLER
	unhitch(silent = TRUE)

/datum/component/cart_hitch/proc/on_cart_pulled(datum/source, mob/living/puller)
	SIGNAL_HANDLER
	if(puller != parent)
		to_chat(puller, span_warning("[hitched_cart] is hitched to [parent]! Unhitch it first."))
		return COMSIG_ATOM_CANT_PULL

/datum/component/cart_hitch/proc/drag_cart_to(turf/dest, mob/living/simple_animal/animal)
	if(!isturf(dest) || !hitched_cart || hitched_cart.loc == dest)
		return
	hitched_cart.set_glide_size(animal.glide_size)
	if(!hitched_cart.Move(dest, get_dir(hitched_cart, dest), animal.glide_size))
		hitched_cart.forceMove(dest)
	hitched_cart.setDir(animal.dir)

/datum/component/cart_hitch/proc/on_parent_moved(datum/source, atom/old_loc, movement_dir, forced)
	SIGNAL_HANDLER
	if(!hitched_cart || QDELETED(hitched_cart))
		return
	var/mob/living/simple_animal/animal = parent
	var/turf/dest = get_turf(old_loc)
	drag_cart_to(dest, animal)
	if(hitched_cart.loc != dest)
		drag_cart_to(get_step(animal, REVERSE_DIR(animal.dir)), animal)
	if(get_dist(animal, hitched_cart) > 2)
		unhitch()
		return
	update_slowdown()

/datum/component/cart_hitch/proc/cart_slowdown()
	if(!hitched_cart?.maximum_capacity)
		return 0.8
	var/fill = CLAMP(hitched_cart.current_capacity / hitched_cart.maximum_capacity, 0, 1)
	return 0.8 + (fill * 2.4) // empty +0.8, packed +3.2 before the ride multiplier

/datum/component/cart_hitch/proc/update_slowdown()
	var/mob/living/simple_animal/animal = parent
	if(!hitched_cart || !animal)
		return
	var/slow = cart_slowdown()
	animal.add_movespeed_modifier(CART_HITCH_SPEED_ID, update = TRUE, override = TRUE, multiplicative_slowdown = slow)

	var/datum/component/riding/creature/riding = animal.GetComponent(/datum/component/riding/creature)
	if(!riding)
		return
	var/base_delay = riding.vehicle_move_delay
	var/mob/living/simple_animal/hostile/hostile_animal = animal
	if(istype(hostile_animal))
		base_delay = hostile_animal.move_to_delay
	riding.vehicle_move_delay = base_delay + slow

/datum/component/cart_hitch/proc/clear_slowdown()
	var/mob/living/simple_animal/animal = parent
	if(!animal)
		return
	animal.remove_movespeed_modifier(CART_HITCH_SPEED_ID)
	var/datum/component/riding/creature/riding = animal.GetComponent(/datum/component/riding/creature)
	if(!riding)
		return
	var/mob/living/simple_animal/hostile/hostile_animal = animal
	if(istype(hostile_animal))
		riding.vehicle_move_delay = hostile_animal.move_to_delay

#undef CART_HITCH_TRAIT_SOURCE
#undef CART_HITCH_SPEED_ID
