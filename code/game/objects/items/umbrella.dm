// Parasol and umbrellas go here, for all your - I hate sun and I hate the rain - needs!

/obj/item/weapon/umbrella
	icon = 'icons/roguetown/weapons/32/umbrellas.dmi'
	lefthand_file = 'icons/mob/inhands/misc/umbrella_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/umbrella_righthand.dmi'
	resistance_flags = FLAMMABLE
	experimental_inhand = FALSE
	parrysound = "parrywood"
	attacked_sound = "parrywood"
	sharpness = IS_BLUNT
	wdefense = GOOD_PARRY
	max_integrity = INTEGRITY_POOR + 25 // desperate weapon
	w_class = WEIGHT_CLASS_SMALL
	possible_item_intents = list(SHIELD_BASH)
	var/open = FALSE


/obj/item/weapon/umbrella/attack_self(mob/user, list/modifiers)
	. = ..()
	if(!user)
		return

	open = !open
	update_appearance(UPDATE_ICON_STATE)
	user.update_inv_hands()

	if(open)
		user.add_traits(list(TRAIT_WEATHER_IMMUNE), REF(src))
		to_chat(user, span_notice("You open the umbrella."))
	else
		user.remove_traits(list(TRAIT_WEATHER_IMMUNE), REF(src))
		to_chat(user, span_notice("You close the umbrella."))

/obj/item/weapon/umbrella/dropped(mob/user, silent = FALSE) //dropped cleanup
	if(open && user)
		user.remove_traits(list(TRAIT_WEATHER_IMMUNE), REF(src))
	return ..()

/obj/item/weapon/umbrella/Destroy() //qdel or item breaking cleanup
	if(open && isliving(loc))
		loc.remove_traits(list(TRAIT_WEATHER_IMMUNE), REF(src))
	return ..()

/obj/item/weapon/umbrella/update_icon_state() //open and close sprites update, coded to support other umbrella subpaths
	. = ..()
	icon_state = "[initial(icon_state)][open ? "-on" : ""]"
	item_state = "[initial(item_state)][open ? "-on" : ""]"

/*
	NORMAL UMBRELLAS
*/

/obj/item/weapon/umbrella/basic
	name = "parasol"
	desc = "A well-made foldable canopy, used for shielding one's self from the rain and sun during a harsh day."
	icon_state = "umbrella"
	item_state = "umbrella"
	force = DAMAGE_MACE - 8
	w_class = WEIGHT_CLASS_SMALL
	dyeable = TRUE
	anvilrepair = /datum/attribute/skill/craft/carpentry
	associated_skill = /datum/attribute/skill/combat/swords
	item_weight = 250 GRAMS
