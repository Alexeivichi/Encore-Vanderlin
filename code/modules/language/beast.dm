/datum/language/beast
	name = "Lifesong"
	desc = "The tongue of the lost beasts that once held claim of the Earth, offered its name for unclear reasons \
	in an age where things were thought not to speak. It is associated with creatures who fall outside the realm of \
	Mankind but possess primordial wisdom still."
	icon_state = "beastial"
	spans = list(SPAN_BEAST)
	speech_verb = "growls"
	ask_verb = "grrs"
	exclaim_verb = "howls"
	key = "b"
	space_chance = 15
	sentence_chance = 0
	between_word_sentence_chance = 10
	between_word_space_chance = 75
	additional_syllable_low = -1
	additional_syllable_high = 1
	default_priority = 100

	syllables = list(
		"GRRrrrr",
		"GGGrrr",
		"RRRRrr",
		"GRrr",
		"Rr",
		"Rrrr",
		"Rrrrr",
	)
