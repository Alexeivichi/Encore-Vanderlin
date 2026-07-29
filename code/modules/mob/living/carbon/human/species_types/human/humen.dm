	/*==============*
	*				*
	*	 Humen		*
	*				*
	*===============*/

/mob/living/carbon/human/species/human/northern
	race = /datum/species/human/northern

/datum/attribute_holder/sheet/job/species/northern
	raw_attribute_list = list(
		STAT_CONSTITUTION = 1,
		STAT_ENDURANCE = 2,
		STAT_FORTUNE = 1
	)

/datum/species/human/northern
	name = "Human"
	id = SPEC_ID_HUMEN
	multiple_accents = list(
		"No Accent" = ACCENT_NONE,
		"Sterkenstadt Accent" = ACCENT_STERKENSTADT,
		"Nortic Accent" = ACCENT_NORTIC,
	)
	desc = "<b>Human</b><br>\
	Humans are the common face of civilization throughout the Goblet. Before the world fell, this was less the case.\
	Now, they represent a baseline by which the most extraordinary beings are measured.\
	In the greatest legends, there is always a Human who has strived to climb beyond what they are afforded.\
	They are a naturally independent and clever race, owing them boons of intellect where it counts.<br>\
	+1 Constitution, +2 Endurance, +1 Fortune"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	use_skintones = TRUE

	possible_ages = NORMAL_AGES_LIST

	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mm.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'

	offset_features_m = list(
		OFFSET_RING = list(0,0),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,0),\
		OFFSET_HEAD = list(0,0),\
		OFFSET_FACE = list(0,0),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,0),\
		OFFSET_NECK = list(0,0),\
		OFFSET_MOUTH = list(0,0),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,-1),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-1),\
		OFFSET_HEAD = list(0,-1),\
		OFFSET_FACE = list(0,-1),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-1),\
		OFFSET_NECK = list(0,-1),\
		OFFSET_MOUTH = list(0,-1),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/northern
	statsheet_female = /datum/attribute_holder/sheet/job/species/northern

	enflamed_icon = "widefire"

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/human/northern/check_roundstart_eligible()
	return TRUE

/datum/species/human/northern/get_possible_names(gender = MALE)
	var/static/list/male_names = file2list('strings/rt/names/human/humnorm.txt')
	var/static/list/female_names = file2list('strings/rt/names/human/humnorf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/human/northern/get_possible_surnames(gender = MALE)
	var/static/list/last_names = file2list('strings/rt/names/human/humnorlast.txt')
	return last_names
