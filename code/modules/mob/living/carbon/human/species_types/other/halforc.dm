	/*==============*
	*				*
	*	Half-Orc		*
	*				*
	*===============*/

//	( + Dead Nose )

/mob/living/carbon/human/species/halforc
	race = /datum/species/halforc

/datum/attribute_holder/sheet/job/species/halforc
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_PERCEPTION = -2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 1,
	)

/datum/species/halforc
	name = "Half-Orc"
	id = SPEC_ID_HALF_ORC
	multiple_accents = list(
		"No Accent" = ACCENT_NONE,
		"Half-Orc Accent" = ACCENT_HORC,
		"Nortic Accent" = ACCENT_NORTIC,
	)
	native_language = "Orcish"
	desc = "<b>Half-Orcs</b><br>\
    Half-Orcs are a race of bulky humanoids, descended from the union of humanoids and true Orcs. While present in civilised society today, \
	they are typically kept to the fringes of it. Trueborn Orcs are often tribal, isolationist, and aggressive; they have centuries of violent \
	history with the other peoples of the Goblet, and not without reason, as they are creatures tainted by Hell. This leaves the origins of \
	Half-Orcs mysterious - though the widely accepted tale is that of the divine interference of Erdl, the Bloodfather. The tale states that He \
	saw incredible potential in Orcs, though the taint of Hell vexed Him. It was He, with powers divine, who took the strength of true Orcs and \
	combined it with the mind and soul of Men, seeking to create a whole greater than the sum of its parts; in doing so, the first Half-Orcs were born. \
	This act divided the Pantheon however, and many mortals yet feared these people who resembled the vicious Orcs. Only within the last century have \
	Half-Orcs started to carve out societal tolerance.<br>\
    +2 Strength, +2 Constitution, +1 Endurance, -2 Perception, Dead Nose, 20% Hunger Increase"

	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_DEADNOSE)

	allowed_voicetypes_m = VOICE_TYPES_MASCANDRO

	allowed_voicetypes_f = VOICE_TYPES_MASCANDRO

	use_skintones = 1

	possible_ages = NORMAL_AGES_LIST
	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt_muscular.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/ft_muscular.dmi'

	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'

	swap_female_clothes = TRUE

	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf

	offset_features_m = list(
		OFFSET_RING = list(0,1),\
		OFFSET_GLOVES = list(0,1),\
		OFFSET_WRISTS = list(0,1),\
		OFFSET_HANDS = list(0,1),\
		OFFSET_CLOAK = list(0,1),\
		OFFSET_FACEMASK = list(0,1),\
		OFFSET_HEAD = list(0,1),\
		OFFSET_FACE = list(0,1),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,1),\
		OFFSET_NECK = list(0,1),\
		OFFSET_MOUTH = list(0,1),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,1),\
		OFFSET_ARMOR = list(0,1),\
		OFFSET_UNDIES = list(0,1),\
	)

	offset_features_f = list()

	statsheet_male = /datum/attribute_holder/sheet/job/species/halforc
	statsheet_female = /datum/attribute_holder/sheet/job/species/halforc

	enflamed_icon = "widefire"

	exotic_bloodtype = /datum/blood_type/human/horc
	meat = list(/obj/item/reagent_containers/food/snacks/meat/steak/human = 1, /obj/item/reagent_containers/food/snacks/meat/strange = 0.5)

	customizers = list(
		/datum/customizer/organ/ears/halforc,
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/halforc,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
	)

	nutrition_mod = 1.2 // 120% higher hunger rate. Hungry, hungry horcs

/datum/species/halforc/check_roundstart_eligible()
	return TRUE

/datum/species/halforc/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/orcish)

/datum/species/halforc/after_creation(mob/living/carbon/C)
	..()
	C.grant_language(/datum/language/orcish)
	to_chat(C, span_info("I can speak Orcish with ,o before my speech."))

/datum/species/halforc/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/orcish)

/datum/species/halforc/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/halforc/get_skin_list()
	return list(
		"Shellcrest" = SKIN_COLOR_SHELLCREST,
		"Bloodaxe" = SKIN_COLOR_BLOOD_AXE,
		"Gronn" = SKIN_COLOR_GROONN, //Changed name from Gronn, which no longer aligned with lore here or elsewhere.
		"Blackhammer" = SKIN_COLOR_BLACK_HAMMER,
		"Skullseeker" = SKIN_COLOR_SKULL_SEEKER,
		"Crescent Fang" = SKIN_COLOR_CRESCENT_FANG,
		"Murkwalker" = SKIN_COLOR_MURKWALKER,
		"Shatterhorn" = SKIN_COLOR_SHATTERHORN,
		"Spiritcrusher" = SKIN_COLOR_SPIRITCRUSHER
	)

/datum/species/halforc/get_hairc_list()
	return sortList(list(
		"brown - minotaur" = "58433b",
		"brown - volf" = "48322a",
		"brown - bark" = "2d1300",

		"green - maneater" = "458745",
		"green - swampgrass" = "2A3B2B",

		"black - charcoal" = "201616"
	))

/datum/species/halforc/get_possible_names(gender = MALE)
	var/static/list/male_names = file2list('strings/rt/names/other/halforcm.txt')
	var/static/list/female_names = file2list('strings/rt/names/other/halforcf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/halforc/get_possible_surnames(gender = MALE)
	return null
