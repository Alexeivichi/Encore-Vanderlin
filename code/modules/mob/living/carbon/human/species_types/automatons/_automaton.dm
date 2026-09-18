/mob/living/carbon/human/species/automaton
	icon = 'icons/roguetown/mob/bodies/m/automaton.dmi'
	icon_state = MAP_SWITCH("human_basic", "at")
	race = /datum/species/automaton
	footstep_type = FOOTSTEP_MOB_METAL
	pronouns = IT_ITS
	bodyparts = list(
		/obj/item/bodypart/chest/automaton,
		/obj/item/bodypart/head/automaton,
		/obj/item/bodypart/l_arm/automaton,
		/obj/item/bodypart/r_arm/automaton,
		/obj/item/bodypart/r_leg/automaton,
		/obj/item/bodypart/l_leg/automaton,
		/obj/item/bodypart/mouth, // fuk it they don't get spawned anyways
	)
	uses_random_stats = FALSE
	culture = /datum/culture/universal/cudao
	cmode_music = 'sound/music/cmode/towner/CombatPrisoner.ogg'

/mob/living/carbon/human/species/automaton/vessel/LateInitialize()
	. = ..()
	AddComponent(/datum/component/ghost_vessel, /obj/item/riddleofsteel)

/mob/living/carbon/human/species/automaton/prefilled_vessel/LateInitialize()
	. = ..()
	SEND_SIGNAL(src, COMSIG_AUGMENT_INSTALL, new /datum/augment/loyalty_binder(), src)
	SEND_SIGNAL(src, COMSIG_AUGMENT_INSTALL, new /datum/augment/armor/copper(), src)
	AddComponent(/datum/component/ghost_vessel)

/datum/attribute_holder/sheet/job/species/automaton
	raw_attribute_list = list(
		STAT_STRENGTH = 4,
		STAT_CONSTITUTION = 4,
		STAT_ENDURANCE = 4,
		STAT_SPEED = -2,
		STAT_FORTUNE = -4,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/labor/mathematics = 30,
		/datum/attribute/skill/labor/mining = 10,
		/datum/attribute/skill/misc/reading = 10,
	)

/datum/species/automaton
	name = "Automaton Golem"
	id = SPEC_ID_AUTOMATON
	desc = "Ancient Arnkin mechanisms long lost to history have frequently left only faded memories. One of the most striking of these are autonomous machines, simply called automatons by the masses. They are embraced at least somewhat inside by a smidgen of Thauma, usually by willing volunteer or harvested in nature, though it is oft used as a means of execution within the far south. Golems are merely automatons created from facsimiles of those same advanced robotic forms, and in their simplest revision. Golems are short-sighted, slow and often hardly the intellectual peer of their mortal counterparts. However, if maintained and held in good favor, these machines have been known to endure for centuries, giving the flicker of soul within time to grow and learn. The majority that don't make the cut never break free from the eternal servitude demanded of their rather costly upkeep."

	skin_tone_wording = "plating"
	default_color = "FFFFFF"

	changesource_flags = WABBAJACK
	meat = list(/obj/item/gear/metal = 2, /obj/item/ingot/thaumic = 3, /obj/item/ingot/steel = 2)

	species_traits = list(
		NO_UNDERWEAR,
		NOTRANSSTING,
		EYECOLOR,
		CUSCOLORS
	)
	inherent_traits = list(
		TRAIT_NOBLOOD,
		TRAIT_BLOODLOSS_IMMUNE,
		TRAIT_NORMALIZED_BLOOD,
		TRAIT_NOMOOD,
		TRAIT_NOMETABOLISM,
		TRAIT_NOHUNGER,
		TRAIT_NOSTAMINA,
		TRAIT_EASYDISMEMBER,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOFALLDAMAGE1,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_NOBREATH,
		TRAIT_NOPAIN,
		TRAIT_SLEEPIMMUNE,
		TRAIT_SLEEPIMMUNE,
		TRAIT_TOXIMMUNE,
		TRAIT_FEARLESS,
		TRAIT_NO_ORGAN_PROCESS
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/automaton

	allowed_pronouns = PRONOUNS_LIST_IT_ONLY

	possible_ages = list(AGE_IMMORTAL)
	use_skintones = TRUE

	native_language = "Common"

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/automaton.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/m/automaton.dmi'

	soundpack_m = /datum/voicepack/silent/m
	soundpack_f = /datum/voicepack/silent/f

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
	)

	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
	)

	enflamed_icon = "widefire"

	inherent_biotypes = MOB_ROBOTIC | MOB_HUMANOID
	exotic_bloodtype = /datum/blood_type/oil

	bleed_mod = 0.7
	punch_damage = 10
	kick_damage = 15

	custom_id = "automaton"
	custom_clothes = FALSE

	offset_features_m = list()
	offset_features_f = list()

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain/automaton,
		ORGAN_SLOT_SPLEEN = /obj/item/organ/spleen,
		ORGAN_SLOT_HEART = /obj/item/organ/heart/automaton,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/automaton,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/automaton,
	)

	var/list/actions = list(
		/datum/action/manage_voice_actions
	)

/datum/species/automaton/on_species_gain(mob/living/carbon/C, datum/species/old_species, datum/preferences/pref_load)
	. = ..()
	C.AddComponent(/datum/component/abberant_eater, list(/obj/item/ore/coal, /obj/item/grown/log/tree), _keeps_items = FALSE)
	C.AddComponent(/datum/component/steam_life)
	C.AddComponent(/datum/component/command_follower)
	C.AddComponent(/datum/component/augmentable)
	C.AddComponent(/datum/component/damage_shutdown)

	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	RegisterSignal(C, COMSIG_MOB_TOGGLE_CMODE, PROC_REF(cmode_changed))
	C.grant_language(/datum/language/common)

	for(var/datum/action/action as anything in actions)
		action = new action(src)
		action.Grant(C)
	C.add_movespeed_modifier(MOVESPEED_ID_AUTOMATON, multiplicative_slowdown = 0.9)

/datum/species/automaton/on_species_loss(mob/living/carbon/C)
	. = ..()

	C.remove_movespeed_modifier(MOVESPEED_ID_AUTOMATON)

	UnregisterSignal(C, list(COMSIG_MOB_SAY, COMSIG_MOB_TOGGLE_CMODE))
	C.remove_language(/datum/language/common)
w

/datum/species/automaton/check_roundstart_eligible()
	return TRUE

/datum/species/automaton/proc/cmode_changed(mob/living/carbon/source, cmode)
	source.set_eye_color(cmode ? "#ff0000" : "#ff7b00")

/datum/species/automaton/get_skin_list()
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
	))

/datum/species/automaton/get_possible_names(gender = MALE)
	var/static/list/automaton_names = list(
		"Breath of Annihilation",
		"Seeker of Truth",
		"Shadow of Intent",
		"Song of Retribution",
		"Herald of Judgment",
		"Whisper of Oblivion",
		"Fist of Conviction",
		"Eye of Eternity",
		"Voice of Silence",
		"Hand of Providence",
		"Keeper of Mysteries",
		"Bearer of Burdens",
		"Walker of Paths",
		"Guardian of Thresholds",
		"Servant of Order"
	)
	return automaton_names

/datum/species/automaton/get_possible_surnames(gender = MALE)
	return list()

/obj/item/bodypart/head/automaton
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 170
	max_integrity = 350
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

/obj/item/bodypart/chest/automaton
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 170
	max_integrity = 350
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

/obj/item/bodypart/r_arm/automaton
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 170
	max_integrity = 350
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

/obj/item/bodypart/l_arm/automaton
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 170
	max_integrity = 350
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

/obj/item/bodypart/r_leg/automaton
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 170
	max_integrity = 350
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

/obj/item/bodypart/l_leg/automaton
	status = BODYPART_ROBOTIC
	resistance_flags = FIRE_PROOF
	max_damage = 170
	max_integrity = 350
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


/obj/item/organ/brain/automaton
	name = "thaumatic core"
	desc = "A crystalline matrix containing a trapped amalgam of Thauma, bound in service through specialized artifice."
	icon_state = "soul_core"
	resistance_flags = FIRE_PROOF
	zone = BODY_ZONE_CHEST // this means decaps are non-lethal, how quaint
	organ_flags = ORGAN_ROBOTIC|ORGAN_VITAL
	food_type = null

/obj/item/organ/heart/automaton
	name = "steam engine"
	desc = "A miniature steam engine that powers the automaton's movements."
	resistance_flags = FIRE_PROOF
	zone = BODY_ZONE_PRECISE_STOMACH // the engine's in the stomach
	organ_flags = ORGAN_ROBOTIC
	food_type = null

/obj/item/organ/eyes/automaton
	name = "optical sensors"
	desc = "Glowing lenses that allow the automaton to perceive the world."
	resistance_flags = FIRE_PROOF
	organ_flags = ORGAN_ROBOTIC
	food_type = null
	glows = TRUE
	eye_color = "#ff7b00"

/obj/item/organ/ears/automaton
	name = "audio interface"
	desc = "The audio processor for automatons to receive orders."
	resistance_flags = FIRE_PROOF
	organ_flags = ORGAN_ROBOTIC
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "broadcaster"
	food_type = null
	dropshrink = 0.7

/datum/blood_type/oil
	name = "Lubricating Oil"
	color = "#1C1C1C"
	reagent_type = /datum/reagent/blood/fuel
