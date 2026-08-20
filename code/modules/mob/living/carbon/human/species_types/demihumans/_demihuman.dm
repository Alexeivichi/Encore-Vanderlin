	/*=================*
	*				   *
	*	 Hollow-kin	   *
	*				   *
	*==================*/

// ( -1 STR, +2 PER, +1 INT, -1 CON, +1 SPD, -1 FOR)

/mob/living/carbon/human/species/demihuman
	race = /datum/species/demihuman

/datum/attribute_holder/sheet/job/species/demihuman
	raw_attribute_list = list(
		STAT_PERCEPTION = 1,
	)

/datum/species/demihuman
	name = "Otherkin"
	id = SPEC_ID_HOLLOWKIN
	desc = "A product of any variety of upbringing in all the globe- in being called Otherkin, one is generally classified as a lesser-populated species. \
	Never having had the forefront of the world's attention before the creation of the Goblet, they now consist of a huge minority of leftovers in the new world. \
	This selection enables the player to create their own species; whether to represent a wholly unique species, or the mixdd half-kin offspring of two other existing races. \
	Beware that all normal server rules, especially believability, are still enforced; and you may not contradict existing lore. \
	You are solely responsible for your character's origins.<br> \
	+1 Perception."

	allowed_pronouns = PRONOUNS_LIST

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR, HAIR ,FACEHAIR, LIPS, STUBBLE, OLDGREY, CUSCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = TRUE
	possible_ages = NORMAL_AGES_LIST
	disliked_food = NONE
	liked_food = NONE
	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'

	meat = list(/obj/item/reagent_containers/food/snacks/meat/steak = 1,
		/obj/item/natural/fur/gote = 0.1,
		/obj/item/natural/fur/volf = 0.1,
		/obj/item/natural/fur/rous = 0.1,
		/obj/item/natural/fur/cabbit = 0.1,
		/obj/item/natural/fur/fox = 0.1,
		/obj/item/natural/fur/bobcat = 0.1,
	)
	exotic_bloodtype = /datum/blood_type/human/demihuman

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

	statsheet_male = /datum/attribute_holder/sheet/job/species/demihuman

	enflamed_icon = "widefire"

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
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/demihuman,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns,
	)

	optional_organ_slots = list(
		ORGAN_SLOT_HORNS,
		ORGAN_SLOT_TAIL,
	)

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
		/datum/customizer/organ/ears/demihuman,
		/datum/customizer/organ/horns/demihuman,
		/datum/customizer/organ/tail/demihuman,
	)

	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/skin,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one_wild,
		/datum/descriptor_choice/prominent_two_wild,
		/datum/descriptor_choice/prominent_three_wild,
		/datum/descriptor_choice/prominent_four_wild,
	)

/datum/species/demihuman/check_roundstart_eligible()
	return TRUE

/datum/species/demihuman/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/demihuman/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)

/datum/species/demihuman/after_creation(mob/living/carbon/C)
	. = ..()
	C.grant_language(/datum/language/lifesong)
	to_chat(C, "<span class='info'>I can speak Lifesong with ,b before my speech.</span>")

/datum/species/demihuman/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/lifesong)
