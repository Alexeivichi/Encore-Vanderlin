/obj/item/clothing/armor/rare
	name = "rare armor template"
	icon = 'icons/roguetown/clothing/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleevetype = null
	anvilrepair = /datum/attribute/skill/craft/armor_repair
	smeltresult = /obj/item/ingot/steel_slag
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	sellprice = VALUE_SNOWFLAKE_STEEL
	clothing_flags = CANT_SLEEP_IN

	armor_class = AC_HEAVY
	armor_type = /datum/armor/plate/good
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_STRONGEST
	abstract_type = /obj/item/clothing/armor/rare

/obj/item/clothing/armor/rare/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
												'sound/foley/footsteps/armor/fullplate (2).ogg',\
												'sound/foley/footsteps/armor/fullplate (3).ogg'), 80, falloff_exponent = 20)

/obj/item/clothing/armor/rare/elfplate
	name = "dark elf plate"
	desc = "A fine suit of sleek, moulded dark elf metal. Its interlocking nature and light weight allow for increased maneuverability."
	icon_state = "elfchest"
	allowed_race = RACES_PLAYER_ELF_ALL
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS

	armor_class = AC_MEDIUM // Elven craft, also a cuirass
	body_parts_covered = COVERAGE_VEST
	item_weight = 17 KILOGRAMS

/obj/item/clothing/armor/rare/elfplate/welfplate
	name = "elvish plate"
	desc = "A suit of steel interwoven, through honed elven technique, with hardened bark plates."
	icon_state = "welfchest"
	item_weight = 17 KILOGRAMS

/obj/item/clothing/armor/rare/bastardsplate
	name = "high aelondan plate regalia"
	desc = "Engraved on this masterwork of Human metallurgy lies the visage of the bastard king, Rols. One could only imagine the adventures this thing has seen."
	icon_state = "human_swordchest"
	allowed_race = list(SPEC_ID_HUMEN, SPEC_ID_AASIMAR)
	allowed_sex = list(MALE)
	item_weight = 12 KILOGRAMS
	stand_speed_reduction = 1.2

/obj/item/clothing/armor/rare/qadiridplate
	name = "Qadirid scaleskin"
	desc = "Steel scales woven into armor with miniscule threads of adamantine, \
			ensuring the wearer optimal defence with forgiving breathability."
	icon_state = "human_spearchest"
	allowed_race = list(SPEC_ID_HUMEN)
	allowed_sex = list(MALE)
	item_weight = 9.4 KILOGRAMS

// Aasimar hoplite armor, a very rare armor indeed
/obj/item/clothing/armor/rare/hoplite
	name = "ancient plate armor"
	desc = "A battered set of bronze plate armor. Intricate runes and carvings once adorned the pieces, but most have faded with age."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "aasimarplate"
	allowed_race = list(SPEC_ID_AASIMAR)
	smeltresult = /obj/item/ingot/bronze
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_MODEST // It has great value to historical collectors
	stand_speed_reduction = 1.2

	body_parts_covered = COVERAGE_ALL_BUT_ARMS
	item_weight = 12.4 KILOGRAMS

/obj/item/clothing/armor/plate/shirleigh
	name = "first doman plate"
	desc = "A second skin, woven in hard, tempered steel of a pure make. It's impossibly old. Seared into each and every face is a deep embroidery of floral-embellished calligraphy. The writing is in a thousand languages. The emblem of the Shirleighs faces the world with unyielding pride, always carried upon the back of its wearer."
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	armor_class = AC_MEDIUM
	max_integrity = ARMOR_INT_CHEST_PLATE_BLACKSTEEL
	icon_state = "plate"
	icon = 'icons/roguetown/clothing/special/shirleigh.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/shirleigh.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/shirleigh.dmi'
	anvilrepair = /datum/attribute/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/blacksteel
	item_weight = 20.45 KILOGRAMS
	sellprice = VALUE_SILVER_ITEM * 15
	stand_speed_reduction = 1.05
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	resistance_flags = LAVA_PROOF | EXPLOSION_MOVE_PROOF | ACID_PROOF | FREEZE_PROOF | UNACIDABLE
	allowed_race = list(SPEC_ID_HUMEN, SPEC_ID_HALF_ELF, SPEC_ID_ELF)
