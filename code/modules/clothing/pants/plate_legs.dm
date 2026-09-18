
/obj/item/clothing/pants/platelegs
	name = "plated chausses"
	desc = "Cuisses made of plated steel, offering additional protection against blunt force."
	gender = PLURAL
	icon_state = "plate_legs"
	item_state = "plate_legs"
	sewrepair = null
	blocksound = PLATEHIT
	equip_delay_self = 30
	unequip_delay_self = 30
	resistance_flags = FIRE_PROOF
	var/do_sound = FALSE
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	pickup_sound = "rustle"
	break_sound = 'sound/foley/breaksound.ogg'
	anvilrepair = /datum/attribute/skill/craft/armor_repair
	smeltresult = /obj/item/ingot/steel_slag
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	clothing_flags = CANT_SLEEP_IN

	armor_class = AC_HEAVY
	armor_type = /datum/armor/pants/plate
	max_integrity = INTEGRITY_STRONGEST
	prevent_crits = ALL_EXCEPT_BLUNT
	item_weight = 3.95 KILOGRAMS

	material_category = ARMOR_MAT_PLATE

/obj/item/clothing/pants/platelegs/Initialize()
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, custom_sounds = SFX_PLATE_STEP)

/obj/item/clothing/pants/platelegs/iron
	name = "iron plated chausses"
	desc = "Cuisses made of plated iron, offering additional protection against blunt force."
	icon_state = "iplate_legs"
	item_state = "iplate_legs"
	smeltresult = /obj/item/ingot/iron

	armor_type = /datum/armor/pants/plate/bad
	max_integrity = INTEGRITY_STRONG
	item_weight = 5.2 KILOGRAMS

/obj/item/clothing/pants/platelegs/captain
	name = "captain's chausses"
	desc = "Cuisses made of plated steel, offering additional protection against blunt force. These are specially fitted for the captain."
	icon_state = "capplateleg"
	item_state = "capplateleg"
	icon = 'icons/roguetown/clothing/special/captain.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/captain.dmi'

/obj/item/clothing/pants/platelegs/rust
	name = "rusted chausses"
	desc = "Old rusted chausses made of plated iron. They'll still protect your legs quite well."
	icon = 'icons/roguetown/clothing/special/rust_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/rust_armor.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/rust_armor.dmi'
	icon_state = "rustpants"
	item_state = "rustpants"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR/2
	armor_type = /datum/armor/pants/plate/bad
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/pants/platelegs/blk
	name = "blacksteel legs"
	desc = "Leg armor of blacksteel, resilient and surprisingly light."
	icon_state = "bklegs"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	anvilrepair = /datum/attribute/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/blacksteel
	armor_class = AC_MEDIUM
	armor_type = /datum/armor/pants/plate/good
	item_weight = 4.95 KILOGRAMS
	sellprice = VALUE_SILVER_ITEM * 2

//............... Evil Pants ............... //

/obj/item/clothing/pants/platelegs/envy
	name = "darksteel garments"
	desc = "Leg garments worn by true anointed of the One Envy. In Her name."
	icon_state = "zizocloth"
	icon = 'icons/roguetown/clothing/special/evilarmor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	sellprice = 0 // Incredibly evil Zizoid armor, this should be burnt, nobody wants this

/obj/item/clothing/pants/platelegs/deceivers
	name = "gilded leggings"
	desc = "Plate leggings. perfect for sprinting away after a theft of mammon, or life."
	icon_state = "matthioslegs"
	icon = 'icons/roguetown/clothing/special/evilarmor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	sellprice = 0 // See above comment

/obj/item/clothing/pants/platelegs/archdevils
	name = "vicious leggings"
	desc = "A sinister pair of plate chausses that have born witness many violent atrocities."
	icon_state = "graggarplatelegs"
	icon = 'icons/roguetown/clothing/special/evilarmor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/evilarmor.dmi'
	sellprice = 0 // See above comment

//.............. Silver Platelegs .................//

/obj/item/clothing/pants/platelegs/silver
	name = "silver platelegs"
	desc = "A finely forged pair of silver plate leggings, offering additional protection against blunt force."
	icon_state = "silverlegs"
	allowed_ages = ALL_AGES_LIST //placeholder until younglings have onmob sprites for this item
	armor_type = /datum/armor/pants/plate/silver
	smeltresult = /obj/item/ingot/silver
	item_weight = 5.42 KILOGRAMS
	sellprice = VALUE_SILVER_ARMOR

/obj/item/clothing/pants/platelegs/silver/Initialize(mapload)
	. = ..()
	enchant(/datum/enchantment/silver)

//.............. Gronn Platelegs .................//

/obj/item/clothing/pants/platelegs/iron/gronn
	name = "nortic iron chausses"
	desc = "Iron chausses with an added layer of leather for comfort and padding. The knees are adorned with a skull-like shape, reminscent of the hunt."
	icon = 'icons/roguetown/clothing/special/gronn.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/gronn.dmi'
	icon_state = "gronnplatepants"
	item_state = "gronnplatepants"

//................. Shirleighan Platelegs .............. //
/obj/item/clothing/pants/platelegs/shirleigh
	name = "first doman platelegs"
	desc = "A second skin, woven in hard, tempered blacksteel of a pure make. It's impossibly old. Seared into each and every face is a deep embroidery of floral-embellished calligraphy. The writing is in a thousand languages. Gleaming plates ensure unbroken stride through the inferno."
	icon_state = "plate_legs"
	icon = 'icons/roguetown/clothing/special/shirleigh.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/shirleigh.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/shirleigh.dmi'
	anvilrepair = /datum/attribute/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/blacksteel
	armor_class = AC_MEDIUM
	armor_type = /datum/armor/pants/plate/good
	item_weight = 4.95 KILOGRAMS
	sellprice = VALUE_SILVER_ITEM * 15
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	resistance_flags = LAVA_PROOF | EXPLOSION_MOVE_PROOF | ACID_PROOF | FREEZE_PROOF | UNACIDABLE
	max_integrity = ARMOR_INT_LEG_BLACKSTEEL
