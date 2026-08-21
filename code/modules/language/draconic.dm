/datum/language/draconic
	name = "Draconic"
	desc = "An ancient tongue spoken by the venerable beings known as Dragons. Like the Beast-Tongue, \
	this speech is associated with creatures of inscrutable primordial wisdom. Dragons however, proud \
	as they are, sought to elevate their own tongue above that of the common beast. In modernity, it's \
	largely been usurped by the Drakian, as well as the Aelondan and Nortic hunters of Dragons."
	speech_verb = "hisses"
	ask_verb = "hisses"
	exclaim_verb = "roars"
	key = "s"
	flags = LANGUAGE_HIDE_ICON_IF_UNDERSTOOD | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 40
	default_priority = 90
	icon_state = "lizard"
	spans = list(SPAN_DRACONIC)
	syllables = list(
		"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
		"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh", "hs", "sh",
		"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
		"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
		"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
		"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
		"a",  "a",  "e",  "e",  "i",  "i",  "o",  "o",  "u",  "u",  "s",  "s")
