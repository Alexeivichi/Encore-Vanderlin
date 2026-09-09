// Parasol and umbrellas go here, for all your - I hate sun and I hate the rain - needs!

/obj/item/weapon/umbrella
	icon = 'icons/roguetown/weapons/32/scabbard.dmi' //temporarily using scabbards for testing .dmi
	resistance_flags = FLAMMABLE
	parrysound = "parrywood"
	attacked_sound = "parrywood"
	sharpness = IS_BLUNT
	wdefense = AVERAGE_PARRY
	max_integrity = INTEGRITY_STANDARD
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	possible_item_intents = list(SHIELD_BASH)

/*
	NORMAL UMBRELLAS
*/

/obj/item/weapon/umbrella/brown
	name = "brown umbrella"
	desc = "A brown umbrella, for keeping the rain off your head."
	icon_state = "scabbard"
	force = DAMAGE_MACE - 8
	w_class = WEIGHT_CLASS_BULKY
	anvilrepair = /datum/attribute/skill/craft/carpentry
	associated_skill = /datum/attribute/skill/combat/swords
