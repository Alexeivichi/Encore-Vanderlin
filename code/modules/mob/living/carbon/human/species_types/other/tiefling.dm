	/*==============*
	*				*
	*	Tiefling	*
	*				*
	*===============*/

/mob/living/carbon/human/species/tieberian
	race = /datum/species/tieberian

/datum/attribute_holder/sheet/job/species/tieberian
	raw_attribute_list = list(
		STAT_PERCEPTION = 2,
		STAT_INTELLIGENCE = 1,
		STAT_CONSTITUTION = -1,
		STAT_SPEED = 1,
		STAT_FORTUNE = -1
	)

/datum/species/tieberian
	name = "Tiefling"
	id = SPEC_ID_TIEFLING
	native_language = "Infernal"
	desc = "<b>Tiefling</b><br>\
	Tieflings or Daemonkin are the wiry tendrils of the infernal Hells creeping out in a more subtle manner. \
	These are folk who are the offspring of the soulless mingling with another who possesses Thauma. \
	It is assumed that, prior to the Big Burn, such things were biologically impossible. \
	However, after Angros' betrayal, Tieflings began to appear in the world; different from demons in that they possess Thauma, \
	but carrying the burden of the monstrous features endemic to Hell's minions. \
	Expect to be treated very poorly in-character and shunned from the majority of Holy circles by selecting this species.<br>\
	+2 Perception, +1 Intelligence, +1 Speed, -1 Constitution, -1 Fortune"

	skin_tone_wording = "Progenitor"

	exotic_bloodtype = /datum/blood_type/human/tiefling

	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_NOFIRE)
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
		OFFSET_CLOAK_ = list(0,0),\
		OFFSET_FACEMASK = list(0,-1),\
		OFFSET_HEAD = list(0,-1),\
		OFFSET_FACE = list(0,-1),\
		OFFSET_BELT = list(0,-1),\
		OFFSET_BACK = list(0,-1),\
		OFFSET_NECK = list(0,-1),\
		OFFSET_MOUTH = list(0,-1),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/tieberian

	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns/tiefling,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/tiefling
	)

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)

	customizers = list(
		/datum/customizer/organ/ears/tiefling,
		/datum/customizer/organ/horns/tiefling,
		/datum/customizer/organ/tail/tiefling,
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/ears/demihuman,
		/datum/customizer/organ/horns/demihuman,
		/datum/customizer/organ/tail/demihuman,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/tieberian/check_roundstart_eligible()
	return TRUE

/datum/species/tieberian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/hellspeak)
	C.AddComponent(/datum/component/malaguero, 2, 1, 30 SECONDS)

/datum/species/tieberian/after_creation(mob/living/carbon/C)
	. = ..()
	to_chat(C, "<span class='info'>I can speak Infernal with ,h before my speech.</span>")

/datum/species/tieberian/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/hellspeak)
	var/datum/component/bad_luck = C.GetComponent(/datum/component/malaguero)
	if(bad_luck)
		bad_luck.RemoveComponent()

/datum/species/tieberian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/tieberian/get_skin_list()
	var/static/list/skin_colors = sortList(list(
		"First Sage" = SKIN_COLOR_LOVELOST,
		"Second Sage" = SKIN_COLOR_MALEVOLEKET,
		"Third Sage" = SKIN_COLOR_GARGANT,
		"Fourth Sage" = SKIN_COLOR_LOSTURGE,
		"Fifth Sage" = SKIN_COLOR_PROTOMOS,
		"Sixth Sage" = SKIN_COLOR_HEAVEN,
		"Seventh Sage" = SKIN_COLOR_VISTAMATRA,
		"Artenfel" = SKIN_COLOR_AGATROS,
		"Gemini" = SKIN_COLOR_GEMINI
	))

	return skin_colors

/datum/species/tieberian/get_hairc_list()
	var/static/list/hair_colors = sortList(list(
		"black - oil" = "181a1d",
		"black - cave" = "201616",
		"black - rogue" = "2b201b",
		"black - midnight" = "1d1b2b",

		"blond - pale" = "9d8d6e",
		"blond - dirty" = "88754f",
		"blond - drywheat" = "d5ba7b",
		"blond - strawberry" = "c69b71",

		"purple - arcane" = "3f2f42",

		"blue - abyss" = "09282d",

		"red - demonic" = "480808",
		"red - impish" = "641010",
		"red - rubescent" = "8d5858"
	))

	return hair_colors

/datum/species/tieberian/get_possible_names(gender = MALE)
	var/static/list/male_names = file2list('strings/rt/names/other/tiefm.txt')
	var/static/list/female_names = file2list('strings/rt/names/other/tiefm.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/tieberian/get_possible_surnames(gender = MALE)
	var/static/list/last_names = file2list('strings/rt/names/other/tieflast.txt')
	return last_names

