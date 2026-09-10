// Parasol and umbrellas go here, for all your - I hate sun and I hate the rain - needs!

/obj/item/weapon/umbrella
	icon = 'icons/roguetown/weapons/32/umbrellas.dmi'
	lefthand_file = 'icons/mob/inhands/misc/umbrella_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/umbrella_righthand.dmi'
	resistance_flags = FLAMMABLE
	parrysound = "parrywood"
	attacked_sound = "parrywood"
	sharpness = IS_BLUNT
	wdefense = AVERAGE_PARRY
	max_integrity = INTEGRITY_STANDARD
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	possible_item_intents = list(SHIELD_BASH)
	var/open = FALSE


/obj/item/weapon/umbrella/attack_self(mob/user, list/modifiers)
	. = ..()
	open = !open
	update_appearance(UPDATE_ICON_STATE)
	user.update_inv_hands()
	to_chat(user, span_notice("You [open ? "open" : "close"] the umbrella."))

/obj/item/weapon/umbrella/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][open ? "-open" : ""]"
	item_state = "[initial(item_state)][open ? "-open" : ""]"


/*
	NORMAL UMBRELLAS
*/

/obj/item/weapon/umbrella/basic
	name = "test parasol"
	desc = "A well-made parasol, for shielding one's self from the rain and sun during a harsh day."
	icon_state = "umbrella"
	force = DAMAGE_MACE - 8
	w_class = WEIGHT_CLASS_BULKY
	anvilrepair = /datum/attribute/skill/craft/carpentry
	associated_skill = /datum/attribute/skill/combat/swords
	item_weight = 250 GRAMS
