/datum/clan_leader/daewalker
	lord_spells = list()
	lord_verbs = list()
	lord_traits = list(TRAIT_HEAVYARMOR, TRAIT_NOSTAMINA)
	lord_title = "Starfallen"

/datum/clan/daewalker
	name = "Visires's Will"
	desc = "An actor of Visires' own manifest rage. You serve Her undying fury to erase what is left of Angros, and there is none you hate more than His followers. Out of the scorched cauldron and into the fire, you walk so that they remember to fear the day."
	clan_covens = list(
		/datum/coven/bloodheal,
		/datum/coven/celerity,
		/datum/coven/potence,
	)
	intro_music = 'sound/music/daewalkerintro.ogg'
	blood_preference = BLOOD_PREFERENCE_KIN
	blood_disgust = BLOOD_PREFERENCE_HOLY | BLOOD_PREFERENCE_EUPHORIC
	clane_traits = list(
		TRAIT_STRONGBITE,
		TRAIT_BLOODDRINKER,
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_NOPAIN,
		TRAIT_STEELHEARTED,
		TRAIT_SLEEPIMMUNE,
		TRAIT_VAMP_DREAMS,
		TRAIT_DARKVISION,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOENERGY,
		TRAIT_ZJUMP,
		TRAIT_IMMUNE_TO_FRENZY,
		TRAIT_COVEN_RESISTANT
	)
	leader_title = "Starfallen"
	leader = /datum/clan_leader/daewalker

/datum/clan/daewalker/get_downside_string()
	return "serve Visires eternally."

/datum/clan/daewalker/get_blood_preference_string()
	return "the blood of bloodsuckers"

/datum/clan/daewalker/on_gain(mob/living/carbon/human/H, is_vampire)
	. = ..()
	//canceling it out
	H.mob_biotypes &= ~MOB_UNDEAD

/datum/clan/daewalker/initialize_hierarchy()
	// Create the root leadership position
	hierarchy_root = new /datum/clan_hierarchy_node("Starfallen", "Visires's Chosen", 0)
	hierarchy_root.position_color = "#gold"
	hierarchy_root.max_subordinates = 0
	all_positions += hierarchy_root

/datum/clan/daewalker/apply_vampire_look(mob/living/carbon/human/H)
	return

/datum/clan/daewalker/apply_clan_components(mob/living/carbon/human/H)
	return

/datum/clan/daewalker/setup_vampire_abilities(mob/living/carbon/human/H)
	return

