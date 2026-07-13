/datum/customizer/organ/snout
	abstract_type = /datum/customizer/organ/snout
	name = "Snout"

/datum/customizer_choice/organ/snout
	abstract_type = /datum/customizer_choice/organ/snout
	name = "Snout"
	organ_type = /obj/item/organ/snout
	organ_slot = ORGAN_SLOT_SNOUT

/datum/customizer/organ/snout/beak
	name = "Beak"
	customizer_choices = list(/datum/customizer_choice/organ/snout/beak)

/datum/customizer_choice/organ/snout/beak
	name = "Beak"
	organ_type = /obj/item/organ/snout/beak
	sprite_accessories = list(
		/datum/sprite_accessory/snout/bird,
		/datum/sprite_accessory/snout/bigbeak,
		/datum/sprite_accessory/snout/bigbeakshort,
		/datum/sprite_accessory/snout/slimbeak,
		/datum/sprite_accessory/snout/slimbeakshort,
		/datum/sprite_accessory/snout/slimbeakalt,
		/datum/sprite_accessory/snout/hookbeak,
		/datum/sprite_accessory/snout/hookbeakbig,
	)

/datum/customizer/organ/snout/beak/thin
	name = "Thin Beak"
	customizer_choices = list(/datum/customizer_choice/organ/snout/beak/thin)

/datum/customizer_choice/organ/snout/beak/thin
	name = "Thin Beak"
	organ_type = /obj/item/organ/snout/beak
	allows_accessory_color_customization = FALSE
	default_accessory = /datum/sprite_accessory/snout/thin_beak/slimbeak
	sprite_accessories = list(
		/datum/sprite_accessory/snout/thin_beak/bigbeak,
		/datum/sprite_accessory/snout/thin_beak/bigbeakshort,
		/datum/sprite_accessory/snout/thin_beak/slimbeak,
		/datum/sprite_accessory/snout/thin_beak/slimbeakshort,
		/datum/sprite_accessory/snout/thin_beak/slimbeakalt,
		/datum/sprite_accessory/snout/thin_beak/hookbeak,
		/datum/sprite_accessory/snout/thin_beak/hookbeakbig,
	)

/datum/customizer/organ/snout/lupian
	customizer_choices = list(/datum/customizer_choice/organ/snout/lupian)

/datum/customizer_choice/organ/snout/lupian
	name = "Lupian Snout"
	organ_type = /obj/item/organ/snout/lupian
	sprite_accessories = list(
		/datum/sprite_accessory/snout/husky,
		/datum/sprite_accessory/snout/lcanid,
		/datum/sprite_accessory/snout/lcanidalt,
		/datum/sprite_accessory/snout/scanid,
		/datum/sprite_accessory/snout/scanidalt,
		/datum/sprite_accessory/snout/scanidalt2,
		/datum/sprite_accessory/snout/scanidalt3,
		/datum/sprite_accessory/snout/wolf,
		/datum/sprite_accessory/snout/wolfalt,
		/datum/sprite_accessory/snout/otie,
		/datum/sprite_accessory/snout/hjackal,
		/datum/sprite_accessory/snout/front/husky,
		/datum/sprite_accessory/snout/front/lcanid,
		/datum/sprite_accessory/snout/front/lcanidalt,
		/datum/sprite_accessory/snout/front/lcanidstriped,
		/datum/sprite_accessory/snout/front/lcanidstripedalt,
		/datum/sprite_accessory/snout/front/scanid,
		/datum/sprite_accessory/snout/front/scanidalt,
		/datum/sprite_accessory/snout/front/scanidalt2,
		/datum/sprite_accessory/snout/front/scanidalt3,
		/datum/sprite_accessory/snout/front/wolf,
		/datum/sprite_accessory/snout/front/wolfalt,
		/datum/sprite_accessory/snout/front/otie,
		/datum/sprite_accessory/snout/stubby,
		/datum/sprite_accessory/snout/stubbyalt,
	)


/datum/customizer/organ/snout/lizard
	customizer_choices = list(/datum/customizer_choice/organ/snout/lizard)

/datum/customizer_choice/organ/snout/lizard
	name = "Lizard Snout"
	organ_type = /obj/item/organ/snout/lizard
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/snout/sharp,
		/datum/sprite_accessory/snout/round,
		/datum/sprite_accessory/snout/sharplight,
		/datum/sprite_accessory/snout/roundlight,
		/datum/sprite_accessory/snout/front/sharp,
		/datum/sprite_accessory/snout/front/round,
		/datum/sprite_accessory/snout/front/sharplight,
		/datum/sprite_accessory/snout/front/roundlight,
		/datum/sprite_accessory/snout/stubby,
		/datum/sprite_accessory/snout/stubbyalt,
	)

