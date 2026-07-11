/mob/living/carbon/human/species/triton
	race = /datum/species/triton

/datum/attribute_holder/sheet/job/species/triton
	raw_attribute_list = list(
		/datum/attribute/skill/labor/fishing = 30,
		/datum/attribute/skill/misc/swimming = 40,
	)

/datum/attribute_holder/sheet/job/species/triton/stats
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_PERCEPTION = -2, //They potentially hit very hard, so penalty to accuracy. No eye/nose targetting meta please.
		STAT_CONSTITUTION = 3,
		STAT_SPEED = -3, //If you have strongbite, good swimmer, underwater breathing, +2 str and +3 con; you're a murder machine, especially in the water. You need to be SLOW.
	)

/datum/species/triton
	name = "Triton"
	id = SPEC_ID_TRITON
	native_language = "Deepspeak"
	changesource_flags = WABBAJACK

	desc = "<b>Triton</b><br>\
	Fearsome and powerful aquatic humanoids that resemble sharks, Tritons are native \
	to the shallow regions of the Goblet's oceans. Originally populating the region now \
	known as Angros' Dying Sea, countless were forced to flee after the Big Burn as the \
	Mad God's head sank into its depths, spawning monsters and boiling the sea as it cooled. \
	In the aftermath, many can be found as refugees in any major port city in the Goblet, or \
	in small coastal settlements dotted throughout the Sea of Fire. Many are scared off by their \
	frightening appearance, but the Triton are not an inherently violent people.<br>\
	+2 Strength, +3 Constitution, -2 Perception, -3 Speed, Good Swimmer, Water Breathing, Strong Bite, Fishface"

	possible_ages = NORMAL_AGES_LIST

	skin_tone_wording = "Spawn"
	default_color = "9cc2e2"
	use_skintones = TRUE

	species_traits = list(NO_UNDERWEAR, HAIR, FACEHAIR, OLDGREY, CUSCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_NODROWN, TRAIT_SWIMMER, TRAIT_FISHFACE)
	inherent_traits_f = list(TRAIT_STRONGBITE)
	inherent_sheet = /datum/attribute_holder/sheet/job/species/triton

	statsheet_male = /datum/attribute_holder/sheet/job/species/triton/stats
	statsheet_female = /datum/attribute_holder/sheet/job/species/triton/stats

	limbs_icon_m = 'icons/roguetown/mob/bodies/f/triton.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/m/triton.dmi'

	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female

	meat = list(/obj/item/reagent_containers/food/snacks/meat/triton = 1)
	exotic_bloodtype = /datum/blood_type/human/triton
	enflamed_icon = "widefire"

	offset_features_f = list(
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

	offset_features_m = list(
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

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_SPLEEN = /obj/item/organ/spleen,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/triton,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/fish,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns/triton,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/triton
	)

	customizers = list(
		/datum/customizer/organ/tail/triton,
		/datum/customizer/bodypart_feature/hair/head/humanoid/triton,
		/datum/customizer/bodypart_feature/hair/facial/humanoid/triton,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/triton/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/deepspeak)

	var/obj/item/bodypart/mouth/jaw = C.get_bodypart(BODY_ZONE_PRECISE_MOUTH)
	jaw.replace_teeth(/obj/item/natural/bundle/teeth/fang)
	var/datum/action/innate/bioluminescence/action = new(C)
	action.Grant(C)

/datum/species/triton/after_creation(mob/living/carbon/C)
	. = ..()
	C.grant_language(/datum/language/deepspeak)
	to_chat(C, "<span class='info'>I can speak Deepspeak with ,f before my speech.</span>")

/datum/species/triton/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/deepspeak)
	var/datum/action/innate/bioluminescence/action = locate() in C.actions
	if(action)
		qdel(action)

/datum/species/triton/check_roundstart_eligible()
	return TRUE

/datum/species/triton/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/triton/get_skin_list()
	// Manually sorted please sort your new entries
	return list(
		"Algae Borne" = SKIN_COLOR_ALGAE,
		"Deep Borne" = SKIN_COLOR_DEEP,
		"Jellyfish Borne" = SKIN_COLOR_JELLYFISH,
		"kelp Borne" = SKIN_COLOR_KELP,
		"Reef Borne" = SKIN_COLOR_REEF,
		"Sand Borne" = SKIN_COLOR_SAND,
		"Shallow Borne" = SKIN_COLOR_SHALLOW,
		"Urchin Borne" = SKIN_COLOR_URCHIN,
	)

/datum/species/triton/get_hairc_list()
	return list(
		"Abyss" = HAIR_COLOR_ABYSS,
		"Clown" = HAIR_COLOR_CLOWN,
		"Hydrothermal" = HAIR_COLOR_HYDROTHERMAL,
		"Inky" = HAIR_COLOR_INKY,
		"Sea Foam" = HAIR_COLOR_SEA_FOAM,
	)

/datum/species/triton/get_oldhc_list()
	return list(
		"Fog" = HAIR_COLOR_SEA_FOG,
		"Gravel" = HAIR_COLOR_GRAVEL,
		"Mist" = HAIR_COLOR_MIST,
		"Photic" = HAIR_COLOR_PHOTIC,
		"Turtle Egg" = HAIR_COLOR_TURTLE,
	)

/datum/action/innate/bioluminescence
	name = "Bioluminescence"
	desc = "Toggle a bright bioluminescent light from your body, moving with you."
	button_icon_state = "shieldsparkles"

	var/obj/effect/dummy/lighting_obj/moblight/our_light

/datum/action/innate/bioluminescence/Destroy(force)
	QDEL_NULL(our_light)
	return ..()

/datum/action/innate/bioluminescence/Activate()
	. = ..()
	if(!owner)
		return FALSE

	if(!QDELETED(our_light))
		our_light.set_light_on(TRUE)
	else
		our_light = new /obj/effect/dummy/lighting_obj/moblight(owner, "#66ddff", 7, 1)

	owner.visible_message(span_notice("[owner]'s body begins to glow with a deep blue bioluminescent light!"))
	active = TRUE

/datum/action/innate/bioluminescence/Deactivate()
	. = ..()
	if(!owner)
		return FALSE
	if(our_light)
		our_light.set_light_on(FALSE)
		our_light.update_light()
	owner.visible_message(span_notice("[owner]'s bioluminescent glow fades away."))
	active = FALSE

