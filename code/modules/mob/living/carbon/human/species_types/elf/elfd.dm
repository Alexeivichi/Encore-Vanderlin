	/*==============*
	*				*
	*	Dark Elf	*
	*				*
	*===============*/

//	( + Night Vision )

/mob/living/carbon/human/species/elf/dark
	race = /datum/species/elf/dark

/datum/attribute_holder/sheet/job/species/dark
	raw_attribute_list = list(
		STAT_STRENGTH = -1,
		STAT_PERCEPTION = -1,
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		STAT_SPEED = 2,
	)

/datum/species/elf/dark
	name = "Dark Elf"
	id = SPEC_ID_DROW
	desc = "<b>Dark Elf</b><br>\
	Elves, are a generic term for tall, pointy-eared humanoids of whom trace their original heritage to the ancient mysterious Arnkin Dynasty. \
	These ones are of a dark complexion and originate mostly from subterranean settlements.\
	Previously rare but in recent times, more and more dark elves can be seen on the surface.<br>\
	+1 Intelligence, +2 Endurance, +2 Speed, -1 Strength, -1 Perception, Darkvision"

	skin_tone_wording = "Parent House"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_NIGHT_OWL, TRAIT_DARKVISION)
	use_skintones = 1
	disliked_food = NONE
	liked_food = NONE
	possible_ages = NORMAL_AGES_LIST
	changesource_flags = WABBAJACK
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mem.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/ft.dmi'
	hairyness = "t3"
	exotic_bloodtype = /datum/blood_type/human/delf

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/elf,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/elf,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
	)


	customizers = list(
		/datum/customizer/organ/ears/elf,
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	swap_male_clothes = TRUE

	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf

	offset_features_m = list(
		OFFSET_RING = list(0,0),\
		OFFSET_GLOVES = list(0,1),\
		OFFSET_WRISTS = list(0,1),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK = list(0,1),\
		OFFSET_FACEMASK = list(0,0),\
		OFFSET_HEAD = list(0,0),\
		OFFSET_FACE = list(0,0),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,0),\
		OFFSET_NECK = list(0,0),\
		OFFSET_MOUTH = list(0,0),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,1),\
		OFFSET_ARMOR = list(0,1),\
		OFFSET_UNDIES = list(0,1),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,0),\
		OFFSET_GLOVES = list(0,1),\
		OFFSET_WRISTS = list(0,1),\
		OFFSET_HANDS = list(0,1),\
		OFFSET_CLOAK = list(0,1),\
		OFFSET_FACEMASK = list(0,0),\
		OFFSET_HEAD = list(0,0),\
		OFFSET_FACE = list(0,0),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,0),\
		OFFSET_NECK = list(0,0),\
		OFFSET_MOUTH = list(0,0),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,1),\
		OFFSET_ARMOR = list(0,1),\
		OFFSET_UNDIES = list(0,1),\
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/dark
	statsheet_female = /datum/attribute_holder/sheet/job/species/dark
	enflamed_icon = "widefire"

	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/elf/dark/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/elvish)
		return list(SPAN_DELF)
	return message_language.spans
/*
/datum/species/elf/dark/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.remove_language(/datum/language/common)

/datum/species/elf/dark/on_species_loss(mob/living/carbon/C)
	. = ..()
	C.grant_language(/datum/language/common)
*/
/datum/species/elf/dark/check_roundstart_eligible()
	return TRUE

/datum/species/elf/dark/get_skin_list()
	return sortList(list(
		"Farposter" = SKIN_COLOR_MAGGOT, // - (Pale blue)
		"Valesteader" = SKIN_COLOR_COCOON, // - (Pale purple)
		"Ashen" = SKIN_COLOR_ASHEN, // - (Pale grey)
		"Sundered" = SKIN_COLOR_SPIDER_VENOM, // - (Deep grey)
		"Jackpoison" = SKIN_COLOR_JACKPOISON, // - (Grey-purple)
		"Homunculus" = SKIN_COLOR_HOMUNCULUS, // - (Grey-blue)
		"Arachnid Ichor" = SKIN_COLOR_ARACHNID_ICHOR, // - (Black-blue)
		"Pale Descendant" = SKIN_COLOR_ICECAP, // - (Pale white)
		"Gloomhaven" = SKIN_COLOR_GLOOMHAVEN, // - (Pink)
	))

/datum/species/elf/dark/get_hairc_list()
	return sortList(list(
		"black - oil" = "181a1d",
		"black - cave" = "201616",
		"black - rogue" = "2b201b",
		"black - midnight" = "1d1b2b",

		"white - cavedew" = "dee9ed",
		"white - spiderweb" = "f4f4f4"
	))

/datum/species/elf/dark/get_possible_names(gender = MALE)
	var/static/list/male_names = file2list('strings/rt/names/elf/elfdm.txt')
	var/static/list/female_names = file2list('strings/rt/names/elf/elfdf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/elf/dark/get_possible_surnames(gender = MALE)
	var/static/list/last_names = file2list('strings/rt/names/elf/elfsnf.txt')
	return last_names

/datum/species/elf/dark/after_creation(mob/living/carbon/human/C)
	C.dna.species.accent_language = C.dna.species.get_accent(native_language, 2)
	if(C.skin_tone == SKIN_COLOR_ICECAP)
		exotic_bloodtype = /datum/blood_type/human/cursed_elf
