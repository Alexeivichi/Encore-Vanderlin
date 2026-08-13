
/datum/clan_leader/pomettic
	lord_spells = list(
		/datum/action/cooldown/spell/enslave_mortal,
		/datum/action/cooldown/spell/undirected/mansion_portal,
		/datum/action/cooldown/spell/undirected/shapeshift/frog,
		/datum/action/cooldown/spell/charm/vampire,
		/datum/action/cooldown/spell/undirected/list_target/encode_thoughts/vampire,
		/datum/action/cooldown/spell/undirected/conjure_item/vamp_sword,
	)
	lord_traits = list(TRAIT_HEAVYARMOR, TRAIT_NOSTAMINA)
	lord_title = "Elder"

/datum/clan/pomettic
	name = "Vitabella Family"
	desc = "Pomette, moved by your relentless pursuit of art and beauty, has bestowed her blessing upon your bloodline. Gani, who refused to permit your possession of Her daughter's power, has cursed you now; after centuries of madness, you now only care for self-centered ends."
	curse = "Obsession with vanity, need to be loved"
	blood_preference = BLOOD_PREFERENCE_SLEEPING|BLOOD_PREFERENCE_VIRGIN // such is the price of no downside
	blood_disgust = BLOOD_PREFERENCE_DEAD | BLOOD_PREFERENCE_RATS

	clane_traits = list(
		TRAIT_BEAUTIFUL,
		TRAIT_EMPATH,
		TRAIT_EXTEROCEPTION,
		TRAIT_STRONGBITE,
		TRAIT_BLOODDRINKER,
		TRAIT_NOENERGY,
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_NOPAIN,
		TRAIT_NOSLEEP,
		TRAIT_VAMPMANSION,
		TRAIT_VAMP_DREAMS,
		TRAIT_NOAMBUSH,
		TRAIT_DARKVISION,
		TRAIT_LIMBATTACHMENT,
	)

	clan_covens = list(
		/datum/coven/auspex,
		/datum/coven/presence,
		/datum/coven/bloodheal,
		/datum/coven/pomette
	)
	leader = /datum/clan_leader/pomettic

/datum/clan/pomettic/get_blood_preference_string()
	return "the blood of lovers and virgins, but not those already dead"

/datum/clan/pomettic/get_downside_string()
	return "you are perfect, you do not have any downsides."

/datum/clan/pomettic/apply_clan_components(mob/living/carbon/human/H)
	H.AddComponent(/datum/component/vampire_disguise)







