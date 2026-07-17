/mob/living/carbon/human/species/kobold/formikrag
	race = /datum/species/kobold/formikrag

/datum/attribute_holder/sheet/job/species/formikrag
	raw_attribute_list = list(
		STAT_STRENGTH = -4,
		STAT_PERCEPTION = 2,
		STAT_INTELLIGENCE = 2,
		STAT_CONSTITUTION = -4,
		STAT_ENDURANCE = 2,
		STAT_SPEED = 2,
	)

/datum/species/kobold/formikrag
	name = "Hobknoblit"
	id = SPEC_ID_KOBOLD_FORMIKRAG
	id_override = SPEC_ID_KOBOLD
	desc = "<b>Hobknoblit</b><br>\
	Hobknoblits are a twisted bastardization of the common Knoblit through the evil manipulation \
	of the Faerie Devil, Hertannea. Her tampering was intended to create a legion of monsters to \
	serve Her bidding in Palasi Necra. Though no matter how hard She toiled, She could never mold \
	them to suit Her needs. Hobknoblits are a somewhat recent creation, being dark-scaled, more \
	rancid and quick-witted Knoblits with a set of wings gifted by Her touch. Assumedly, Hertannea \
	uses the Hobknoblits as Her eyes and ears beyond Palasi Necra, but many believe She simply wanted \
	them to go away and made them our problems instead. Unlike normal Knoblits, Hobknoblits are seen \
	as daemonic imps in nature, and are often killed whenever they are seen by civilized folk.<br> \
	+2 Perception, +2 Intelligence, +2 Endurance, +2 Speed, -4 Strength, -4 Constitution, Tiny, Darkvision"

	allowed_pronouns = PRONOUNS_LIST_IT_ONLY

	statsheet_male = /datum/attribute_holder/sheet/job/species/formikrag

	limbs_icon_m = 'icons/roguetown/mob/bodies/f/kobold_alt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/kobold_alt.dmi'

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain/smooth,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/kobold,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach/acid_spit,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/kobold/round,
		ORGAN_SLOT_WINGS = /obj/item/organ/wings/flight/kobold,
	)

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

