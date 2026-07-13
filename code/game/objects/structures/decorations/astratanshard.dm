GLOBAL_LIST_EMPTY(street_lamp_lights)

/obj/structure/crystalreactor
	name = "shirleighan reactor"
	max_integrity = 1500
	icon = 'icons/roguetown/misc/64x64.dmi'
	icon_state = "clockcrystal"
	desc = "An unfamiliar machine of pipes and wiry veins that seems to groan in a rather disconcerting way. It appears to harness the power of some large sanguine crystal crowning it, though it holds no semblance to any particular aspect..."
	var/datum/looping_sound/the_hum
	var/broken_containment = FALSE
	anchored = TRUE
	density = TRUE
	SET_BASE_PIXEL(-16, -12)

/obj/structure/crystalreactor/Initialize()
	. = ..()
	the_hum = new /datum/looping_sound/crystalreactor_hum(src,FALSE)
	the_hum.start()
	set_light(5, 4, 30, l_color = LIGHT_COLOR_PINK)

/obj/structure/crystalreactor/Destroy()
	if(broken_containment)
		Unregall()
	for(var/obj/machinery/light/fueledstreet/lamp as anything in GLOB.street_lamp_lights)
		lamp.lights_out(TRUE)
	if(the_hum)
		QDEL_NULL(the_hum)
	return ..()

/obj/structure/crystalreactor/deconstruct(disassembled = FALSE)
	if(!broken_containment)
		broken_containment = TRUE
		QDEL_NULL(the_hum)
		the_hum = new /datum/looping_sound/crystalreactor_broken(src, FALSE)
		the_hum.start()
		RegisterSignal(src, COMSIG_ATOM_ATTACK_HAND,PROC_REF(on_touched))
		RegisterSignal(src, COMSIG_ATOM_ATTACK_PAW,PROC_REF(on_touched))
		RegisterSignal(src, COMSIG_ATOM_WAS_ATTACKED,PROC_REF(on_whacked))
		RegisterSignal(src, COMSIG_ATOM_BUMPED,PROC_REF(on_bump))
		icon_state = "clockcrystal_broken"
		resistance_flags |= INDESTRUCTIBLE
		return FALSE
	else
		Unregall()
		. = ..()

/obj/structure/crystalreactor/proc/Unregall()
	UnregisterSignal(src, COMSIG_ATOM_ATTACK_HAND)
	UnregisterSignal(src, COMSIG_ATOM_ATTACK_PAW)
	UnregisterSignal(src, COMSIG_ATOM_WAS_ATTACKED)
	UnregisterSignal(src, COMSIG_ATOM_BUMPED)

/obj/structure/crystalreactor/proc/on_bump(atom/shard,atom/movable/movie)
	SIGNAL_HANDLER
	if(ismob(movie))
		send_to_valdala(movie)
	else
		on_whacked(movie)

/obj/structure/crystalreactor/proc/on_touched(atom/shard,mob/fool)
	SIGNAL_HANDLER
	send_to_valdala(fool)

/obj/structure/crystalreactor/proc/on_whacked(atom/shard,atom/thingy)
	SIGNAL_HANDLER
	if(ismob(thingy))
		send_to_valdala(thingy)
	if(istype(thingy,/obj))
		var/obj/deadthing = thingy
		src.visible_message(span_danger("\The [deadthing] vanishes in a violent flash on contact with \The [src]!"))
		deadthing.Destroy()

/obj/structure/crystalreactor/proc/send_to_valdala(mob/fool,visible_message,mob_message,cause)
	if(isdead(fool))
		return
	if(!visible_message)
		visible_message = span_danger("[fool] reaches out and touches \the [src], on making contact,[fool.p_they()] turn to dust!")
	if(!mob_message)
		mob_message = span_userdanger("You reach out and touch \the [src]. Your body is filled with undescribable pain, your mind unable to even comprehend the energies you make contact with. Your consciousness fades in a flash... lost to infinite agony.")
	if(!cause)
		cause = "contact"
	fool.visible_message(visible_message,mob_message,span_hear("You hear a pained, echoing scream."))
	src.investigate_log("has been attacked ([cause]) by [key_name(fool)]", INVESTIGATE_SUPERMATTER)
	fool.dust(drop_items = TRUE)

/datum/looping_sound/crystalreactor_hum
	mid_sounds = list('sound/misc/loops/LightCrystal1.ogg')
	mid_length = 145
	volume = 100
	extra_range = 1
	vary = TRUE

/datum/looping_sound/crystalreactor_broken
	mid_sounds = list('sound/misc/loops/LightCrystal2.ogg')
	mid_length = 145
	volume = 100
	extra_range = 1
	vary = TRUE
