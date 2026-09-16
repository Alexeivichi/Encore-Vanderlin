//Subtype of automatons that can work in more intelligent roles and generally be more of an independent person.
//Tradeoff is being generally much more fragile
/mob/living/carbon/human/species/automaton/android
	icon = 'icons/roguetown/mob/bodies/m/android.dmi'
	icon_state = MAP_SWITCH("human_basic", "an")
	race = /datum/species/automaton/android
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pronouns = IT_ITS
	bodyparts = list(
		/obj/item/bodypart/chest/automaton/android,
		/obj/item/bodypart/head/automaton/android,
		/obj/item/bodypart/l_arm/automaton/android,
		/obj/item/bodypart/r_arm/automaton/android,
		/obj/item/bodypart/r_leg/automaton/android,
		/obj/item/bodypart/l_leg/automaton/android,
		/obj/item/bodypart/mouth, // fuk it they don't get spawned anyways
	)

/datum/attribute_holder/sheet/job/species/automaton/android
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 1,
		STAT_SPEED = -1,
		STAT_FORTUNE = -3,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/wrestling = 5,
		/datum/attribute/skill/labor/mathematics = 45,
		/datum/attribute/skill/misc/reading = 35,
	)

/datum/species/automaton/android
	name = "Automaton Android"
	id = SPEC_ID_ANDROID
	desc = "Ancient Arnkin mechanisms long lost to history have frequently left only faded memories. One of the most striking of these are autonomous machines, simply called automatons by the masses. Androids are costly, well-equipped automatons which have such potent Thauma so as to wrest intellect from the otherwise unsophisticated hardware of the current age. Their origin varies extensively, with some being merely ancient shells suddenly jolted with the blessing of life, and others manufactured to serve a purpose."

	skin_tone_wording = "plating"
	default_color = "FFFFFF"

	changesource_flags = WABBAJACK
	meat = list(/obj/item/gear/metal = 2, /obj/item/ingot/thaumic = 3, /obj/item/ingot/steel = 2)

	species_traits = list(
		NO_UNDERWEAR,
		NOTRANSSTING,
		EYECOLOR,
		HAIR,
		FACEHAIR,
		LIPS,
		STUBBLE,
		OLDGREY,
		CUSCOLORS
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/automaton/android
	statsheet_female = /datum/attribute_holder/sheet/job/species/automaton/android

	allowed_pronouns = PRONOUNS_LIST

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/android.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/android.dmi'

	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/skin,
		/datum/descriptor_choice/voice,
	)

	bleed_mod = 0.5
	punch_damage = 5
	kick_damage = 5

	custom_id = "android"

	offset_features_m = list(
		OFFSET_RING = list(0,1),\
		OFFSET_GLOVES = list(0,1),\
		OFFSET_WRISTS = list(0,1),\
		OFFSET_HANDS = list(0,1),\
		OFFSET_CLOAK = list(0,1),\
		OFFSET_FACEMASK = list(0,1),\
		OFFSET_HEAD = list(0,1),\
		OFFSET_FACE = list(0,0),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,1),\
		OFFSET_NECK = list(0,1),\
		OFFSET_MOUTH = list(0,1),\
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
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,0),\
		OFFSET_NECK = list(0,0),\
		OFFSET_MOUTH = list(0,0),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,1),\
		OFFSET_ARMOR = list(0,1),\
		OFFSET_UNDIES = list(0,1),\
	)

	actions = list()

/datum/species/automaton/android/get_skin_list()
	return sortList(list(
		"None" = "FFFFFF",
		"Tin Can" = "ABE8E6",
		"Copper Shine" = "B87A3D",
		"Tarnished Bronze" = "CCA241",
		"Ironclad" = "A6A695",
		"Steel Grey" = "9EC0D3",
		"Sterling" = "CBD6D4",
		"Golden Alloy" = "DBC70C",
		"Blacksteel" = "767B97",
		"Blacksteel" = "767B97",
		"Ice Cap" = SKIN_COLOR_ICECAP,
		"Arctic" = SKIN_COLOR_ARCTIC,
		"Tundra" = SKIN_COLOR_TUNDRA,
		"Continental" = SKIN_COLOR_CONTINENTAL,
		"Temperate" = SKIN_COLOR_TEMPERATE,
		"Coastal" = SKIN_COLOR_COASTAL,
		"Subtropical" = SKIN_COLOR_SUBTROPICAL,
		"Tropical Dry" = SKIN_COLOR_TROPICALDRY,
		"Tropical Wet" = SKIN_COLOR_TROPICALWET,
		"Desert" = SKIN_COLOR_DESERT,
		"Crimson Lands" = SKIN_COLOR_CRIMSONLANDS,
	))

/datum/species/automaton/android/get_possible_names(gender = MALE)
	var/static/list/male_names = file2list('strings/rt/names/human/humnorm.txt')
	var/static/list/female_names = file2list('strings/rt/names/human/humnorf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/automaton/android/get_possible_surnames(gender = MALE)
	return list()

/obj/item/bodypart/head/automaton/android
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 90
	max_integrity = 135
	sellprice = 40
	melt_amount = 100
	anvilrepair = /datum/attribute/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze
	heavy_brute_msg = "MANGLED"
	medium_brute_msg = "battered"
	light_brute_msg = "dented"
	no_brute_msg = "undented"
	heavy_burn_msg = "CHARRED"
	medium_burn_msg = "burnt"
	light_burn_msg = "tempered"
	no_burn_msg = "unburned"

/obj/item/bodypart/chest/automaton/android
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 145
	max_integrity = 190
	sellprice = 40
	melt_amount = 100
	anvilrepair = /datum/attribute/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze
	heavy_brute_msg = "MANGLED"
	medium_brute_msg = "battered"
	light_brute_msg = "dented"
	no_brute_msg = "undented"
	heavy_burn_msg = "CHARRED"
	medium_burn_msg = "burnt"
	light_burn_msg = "tempered"
	no_burn_msg = "unburned"

/obj/item/bodypart/r_arm/automaton/android
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 85
	max_integrity = 95
	sellprice = 40
	melt_amount = 100
	anvilrepair = /datum/attribute/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze
	heavy_brute_msg = "MANGLED"
	medium_brute_msg = "battered"
	light_brute_msg = "dented"
	no_brute_msg = "undented"
	heavy_burn_msg = "CHARRED"
	medium_burn_msg = "burnt"
	light_burn_msg = "tempered"
	no_burn_msg = "unburned"

/obj/item/bodypart/l_arm/automaton/android
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 85
	max_integrity = 95
	sellprice = 40
	melt_amount = 100
	anvilrepair = /datum/attribute/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze
	heavy_brute_msg = "MANGLED"
	medium_brute_msg = "battered"
	light_brute_msg = "dented"
	no_brute_msg = "undented"
	heavy_burn_msg = "CHARRED"
	medium_burn_msg = "burnt"
	light_burn_msg = "tempered"
	no_burn_msg = "unburned"

/obj/item/bodypart/r_leg/automaton/android
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 85
	max_integrity = 95
	sellprice = 40
	melt_amount = 100
	anvilrepair = /datum/attribute/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze
	heavy_brute_msg = "MANGLED"
	medium_brute_msg = "battered"
	light_brute_msg = "dented"
	no_brute_msg = "undented"
	heavy_burn_msg = "CHARRED"
	medium_burn_msg = "burnt"
	light_burn_msg = "tempered"
	no_burn_msg = "unburned"

/obj/item/bodypart/l_leg/automaton/android
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 85
	max_integrity = 95
	sellprice = 40
	melt_amount = 100
	anvilrepair = /datum/attribute/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze
	heavy_brute_msg = "MANGLED"
	medium_brute_msg = "battered"
	light_brute_msg = "dented"
	no_brute_msg = "undented"
	heavy_burn_msg = "CHARRED"
	medium_burn_msg = "burnt"
	light_burn_msg = "tempered"
	no_burn_msg = "unburned"
