/mob/living/carbon/human/species/medicator
	race = /datum/species/medicator

/datum/attribute_holder/sheet/job/species/medicator
	raw_attribute_list = list(
		/datum/attribute/skill/misc/medicine = 10
	)

/datum/attribute_holder/sheet/job/species/medicator/stats
	raw_attribute_list = list(
		STAT_PERCEPTION = 1,
		STAT_INTELLIGENCE = 2,
		STAT_SPEED = -1,
		STAT_CONSTITUTION = -1
	)
/datum/species/medicator
	name = "Vultura"
	id = "medicator"
	changesource_flags = WABBAJACK

	meat = list(/obj/item/reagent_containers/food/snacks/meat/strange/inhumen = 1)

	desc = "<b>Vultura</b><br>\
	Displaced refugees from the Big Burn, the Vultura are a humanoid species of birds that share \
	many visual similarities with the birds of prey that are their namesake. With most of their history \
	lost to the blaze, these mysterious avians are oft mistrusted and misunderstood, and have attained \
	a reputation as scavengers; not least of all for their capacity to feed on carrion.<br>\
	+1 Perception, +2 Intelligence, -1 Constitution, -1 Speed, Dead Nose, Inhuman Digestion"

	possible_ages = NORMAL_AGES_LIST

	skin_tone_wording = "Spawn"
	default_color = "3e3e3e"
	use_skintones = TRUE

	hygiene_mod = 1.25

	species_traits = list(NO_UNDERWEAR, HAIR, OLDGREY, CUSCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_DEADNOSE, TRAIT_NASTY_EATER)
	inherent_sheet = /datum/attribute_holder/sheet/job/species/medicator

	statsheet_male = /datum/attribute_holder/sheet/job/species/medicator/stats

	limbs_icon_m = 'icons/roguetown/mob/bodies/f/medicator.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/medicator.dmi'

	soundpack_m = /datum/voicepack/male/medicator
	soundpack_f = /datum/voicepack/female/medicator

	swap_male_clothes = TRUE

	exotic_bloodtype = /datum/blood_type/human/medicator
	enflamed_icon = "widefire"

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

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_SPLEEN = /obj/item/organ/spleen,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/medicator,
		ORGAN_SLOT_SNOUT = /obj/item/organ/snout/beak,
		ORGAN_SLOT_NECK_FEATURE = /obj/item/organ/neck_feature/medicator,
	)

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/organ/tail/medicator,
		/datum/customizer/organ/snout/beak/thin,
		/datum/customizer/organ/neck_feature/medicator,
		/datum/customizer/bodypart_feature/hair/head/humanoid/medicator,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)

	COOLDOWN_DECLARE(medicator_cough_cooldown)

/datum/species/medicator/on_species_gain(mob/living/carbon/C, datum/species/old_species, datum/preferences/pref_load)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)

/datum/species/medicator/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/medicator/spec_life(mob/living/carbon/human/H)
	. = ..()
	if(prob(0.1))
		if(!COOLDOWN_FINISHED(src, medicator_cough_cooldown))
			return
		var/list/emotes = list("cough", "sneeze", "clearthroat")
		if(prob(15))
			emotes = list("choke")
		H.emote(pick(emotes), forced = TRUE)

		COOLDOWN_START(src, medicator_cough_cooldown, 15 MINUTES)

/datum/species/medicator/check_roundstart_eligible()
	return TRUE

/datum/species/medicator/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/medicator/get_skin_list()
	// Manually sorted please sort your new entries
	return list(
		"Crude" = SKIN_COLOR_OIL,
		"Scrap" = SKIN_COLOR_SCRAP,
		"Smoke" = SKIN_COLOR_SMOKE,
		"Toxin" = SKIN_COLOR_TOXIN,
		"Waste" = SKIN_COLOR_WASTE,
	)

/datum/species/medicator/get_hairc_list()
	return list(
		"Poison" = HAIR_COLOR_POISON,
		"Smog" = HAIR_COLOR_SMOG,
		"Steam" = HAIR_COLOR_STEAM,
		"Slick" = HAIR_COLOR_SLICK,
	)

/datum/species/medicator/get_oldhc_list()
	return list(
		"Concrete" = HAIR_COLOR_CONCRETE,
		"Smog" = HAIR_COLOR_SMOG,
		"Steam" = HAIR_COLOR_STEAM,
	)

/datum/species/medicator/get_possible_names(gender)
	return file2list('strings/rt/names/other/medicator.txt')

/datum/species/medicator/get_possible_surnames(gender)
	return null
