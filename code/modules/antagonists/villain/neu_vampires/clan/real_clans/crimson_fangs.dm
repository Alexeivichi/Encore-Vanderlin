/datum/clan/crimson_fang
	name = "Camadinnes"
	desc = "Camadinnes, often seen by other kindred as dangerous assassins and diablerists, but in truth they are guardians, warriors, and scholars who seek to distance themselves from politics of both vampyre and mundane worlds. They are tentative associates and sometimes ally to the Shirleighs."
	curse = "Blood addiction."
	clan_covens = list(
		/datum/coven/celerity,
		/datum/coven/obfuscate,
		/datum/coven/quietus,
		/datum/coven/bloodheal
	)
	blood_preference = BLOOD_PREFERENCE_KIN | BLOOD_PREFERENCE_FANCY | BLOOD_PREFERENCE_LIVING
	blood_disgust = BLOOD_PREFERENCE_RATS | BLOOD_PREFERENCE_EUPHORIC
	clane_traits = list(
		TRAIT_STRONGBITE,
		TRAIT_BLOODDRINKER,
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_NOPAIN,
		TRAIT_STEELHEARTED,
		TRAIT_NOSLEEP,
		TRAIT_VAMPMANSION,
		TRAIT_VAMP_DREAMS,
		TRAIT_DARKVISION,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOENERGY,
	)

/datum/clan/crimson_fang/get_blood_preference_string()
	return "the blood of your kindred or nobility"
