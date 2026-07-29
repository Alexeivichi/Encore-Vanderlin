	/*==============*
	*				*
	*	  Dwarf		*
	*				*
	*===============*/

//	( + Poison Resistance )

/mob/living/carbon/human/species/dwarf/mountain
	race = /datum/species/dwarf/mountain

/datum/attribute_holder/sheet/job/species/mountain_dwarf
	raw_attribute_list = list(
		/datum/attribute/skill/labor/mining = 10,
	)

/datum/attribute_holder/sheet/job/species/mountain_dwarf/stats
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_PERCEPTION = -2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		STAT_SPEED = -1,
	)

/datum/species/dwarf/mountain
	name = "Dwarf"
	id = SPEC_ID_DWARF
	desc = "<b>Dwarf</b><br>\
	Dwarves are a short and stout race of humanoids, possessed of a proud history of craftsmen, \
	architects, warriors, and sorcerous excellence. To many surfacers, Dwarves are most known \
	for their beards and booze, but their history is so much more. From the fortresses of Tor Bachtershild \
	to the jagged spires of the Holy Towers, the Dwarven people span at least half the world and still stand proud, \
	despite the enemies within and without that might see them bend the knee.<br> \
	+1 Strength, +2 Constitution, +2 Endurance, -2 Perception, -1 Speed, Poison Resistance"

	skin_tone_wording = "Ore Attunement"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, YOUNGBEARD, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_POISON_RESILIENCE)
	inherent_sheet = /datum/attribute_holder/sheet/job/species/mountain_dwarf

	possible_ages = NORMAL_AGES_LIST
	use_skintones = TRUE

	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/md.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fd.dmi'

	hairyness = "t3"

	soundpack_m = /datum/voicepack/male/dwarf
	soundpack_f = /datum/voicepack/female/dwarf

	custom_clothes = TRUE

	offset_features_m = list(
		OFFSET_RING = list(0,0),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,-3),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-4),\
		OFFSET_HEAD = list(0,-4),\
		OFFSET_FACE = list(0,-4),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-4),\
		OFFSET_NECK = list(0,-4),\
		OFFSET_MOUTH = list(0,-4),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,-4),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,-4),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-5),\
		OFFSET_HEAD = list(0,-5),\
		OFFSET_FACE = list(0,-5),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-5),\
		OFFSET_NECK = list(0,-5),\
		OFFSET_MOUTH = list(0,-5),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0)\
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/mountain_dwarf/stats

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

/datum/species/dwarf/mountain/check_roundstart_eligible()
	return TRUE

/datum/species/dwarf/mountain/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/dwarvish)
		return list(SPAN_DWARF)
	return message_language.spans

/datum/species/dwarf/mountain/get_skin_list()
	return sortList(list(
		"Platinum" = SKIN_COLOR_PLATINUM, // - (White 1)
		"Aurum" = SKIN_COLOR_AURUM, // - (White 2)
		"Quicksilver" = SKIN_COLOR_QUICKSILVER, // - (White 3)
		"Brass" = SKIN_COLOR_BRASS, // - (White 4)
		"Iron" = SKIN_COLOR_IRON, // - (Tan)
		"Malachite" = SKIN_COLOR_MALACHITE, // - (Middle-Eastern)
		"Obsidian" = SKIN_COLOR_OBSIDIAN, // - (Black)
		"Brimstone" = SKIN_COLOR_BRIMSTONE, // - (Black 2)
		"Cerargyrite" =	SKIN_COLOR_CERARGYRITE, // - (Purple)
	))

/datum/species/dwarf/mountain/get_hairc_list()
	return sortList(list(
		"black - oil" = "181a1d",
		"black - cave" = "201616",
		"black - rogue" = "2b201b",
		"black - midnight" = "1d1b2b",

		"blond - pale" = "9d8d6e",
		"blond - dirty" = "88754f",
		"blond - drywheat" = "d5ba7b",
		"blond - strawberry" = "c69b71",

		"brown - mud" = "362e25",
		"brown - oats" = "7a4e1e",
		"brown - grain" = "58433b",
		"brown - soil" = "48322a",
		"brown - bark" = "2d1300",

		"red - berry" = "b23434",
		"red - wine" = "b87f77",
		"red - sunset" = "bf6821",
		"red - blood" = "822b2b",
		"red - maroon" = "612929",

		"white - withered" = "7c828a"
	))

/datum/species/dwarf/mountain/get_possible_names(gender = MALE)
	var/static/list/male_names = file2list('strings/rt/names/dwarf/dwarmm.txt')
	var/static/list/female_names = file2list('strings/rt/names/dwarf/dwarmf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/dwarf/mountain/get_possible_surnames(gender = MALE)
	var/static/list/last_names = file2list('strings/rt/names/dwarf/dwarmlast.txt')
	return last_names
