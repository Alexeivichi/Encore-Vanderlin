/obj/item/clothing/shoes/boots/rare
	icon_state = "elfshoes"
	icon = 'icons/roguetown/clothing/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleevetype = null
	resistance_flags = FIRE_PROOF // All of these are plated
	prevent_crits = list(BCLASS_LASHING, BCLASS_BITE, BCLASS_TWIST, BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	pickup_sound = "rustle"
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	break_sound = 'sound/foley/breaksound.ogg'
	anvilrepair = /datum/attribute/skill/craft/armor_repair
	melt_amount = 75
	melting_material = /datum/material/steel
	armor_type = /datum/armor/boots/plate/elf
	clothing_flags = CANT_SLEEP_IN
	sellprice = 30
	max_integrity = INTEGRITY_STRONGEST
	abstract_type = /obj/item/clothing/shoes/boots/rare

	material_category = ARMOR_MAT_PLATE

/obj/item/clothing/shoes/boots/rare/elfplate
	name = "dark elvish plated boots"
	desc = "Bizarrely shaped boots of exquisite dark elven craftsmanship, forged from steel alloyed in ways unbeknownst to every other species."
	body_parts_covered = FEET
	icon_state = "elfshoes"
	item_state = "elfshoes"
	allowed_race = RACES_PLAYER_ELF_ALL
	color = null
	blocksound = PLATEHIT
	item_weight = 2.1 KILOGRAMS

/obj/item/clothing/shoes/boots/rare/elfplate/welfplate
	name = "elvish plated boots"
	desc = "Bizarrely shaped boots of exquisite elven craftsmanship, forged from steel alloyed in ways unbeknownst to every other species."
	icon_state = "welfshoes"
	item_state = "welfshoes"

/obj/item/clothing/shoes/boots/rare/elfplate/welfplate
	name = "elvish plated boots"
	icon_state = "welfshoes"
	item_state = "welfshoes"

/obj/item/clothing/shoes/boots/rare/bastardsplate
	name = "high aelondan sabatons"
	allowed_race = list(SPEC_ID_HUMEN, SPEC_ID_AASIMAR)
	allowed_sex = list(MALE)
	desc = "The sabatons that guided the King's men to the Good Bastard in the first mythos of Aelonda."
	body_parts_covered = FEET|LEGS
	icon_state = "human_swordshoes"
	item_state = "human_swordshoes"
	color = null
	blocksound = PLATEHIT
	item_weight = 2.1 KILOGRAMS

/obj/item/clothing/shoes/boots/rare/qadiridplate
	name = "Qadirid segmented plate boots"
	allowed_race = list(SPEC_ID_HUMEN)
	allowed_sex = list(MALE)
	desc = "The segmented plate boots are a recent alteration to the Qadirid Elite, \
			many old warriors decorate their own by tieing ribbons and other knick-knacks \
			as a homage to the colorful socks they wore in simpler times."
	body_parts_covered = FEET|LEGS
	icon_state = "human_spearshoe"
	item_state = "human_spearshoe"
	color = null
	blocksound = PLATEHIT
	item_weight = 2.25 KILOGRAMS

/obj/item/clothing/shoes/boots/armor/shirleigh
	name = "first doman sabatons"
	desc = "A second skin, woven in hard, tempered steel of a pure make. It's impossibly old. Seared into each and every face is a deep embroidery of floral-embellished calligraphy. The writing is in a thousand languages. These mighty shoes ensure that nature itself can be brought to heel, and crushed under it in the same step."
	icon_state = "armorboots"
	icon = 'icons/roguetown/clothing/special/shirleigh.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/shirleigh.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/shirleigh.dmi'
	anvilrepair = /datum/attribute/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/blacksteel
	armor_class = AC_MEDIUM
	armor_type = /datum/armor/boots/plate
	item_weight = 2.1 KILOGRAMS
	sellprice = VALUE_SILVER_ITEM * 12
	max_integrity = ARMOR_INT_SIDE_BLACKSTEEL

/obj/item/clothing/shoes/boots/armor/shirleigh/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, custom_sounds = list(SFX_EVIL_BOOT_STEP))
