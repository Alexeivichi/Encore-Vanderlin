// Language
/datum/language/lifesong
	name = "Lifesong"
	desc = "The tongue of the lost beasts that once held claim of the Earth, offered its name for unclear reasons in an age where things were thought not to speak. It is associated with creatures who fall outside the realm of Mankind but possess primordial wisdom still."
	speech_verb = "remarks"
	ask_verb = "inquires"
	exclaim_verb = "asserts"
	key = "s"
	space_chance = 45
	default_priority = 90
	icon_state = "gronnic"
	spans = list(SPAN_GRONNIC)
	syllables = list(
		"to", "ost", "no", "na", "ni", "ko", "ne", "en", "po", "ra", "li",
		"on", "ro", "er", "go", "ol", "al", "ot", "ov", "re", "vo", "ka",
		"pro", "ta", "by", "el", "os", "yet", "la", "an", "or", "de", "ve",
		"lo", "te", "byl", "štó", "eni", "ego", "astv", "pro", "ver", "ogo", "èto",
		"pri", "tor", "est", "oto", "enn", "ova", "oro", "kak", "plu", "cha", "fö", "är",
		"ha", "ti", "va", "ör", "för", "int", "til", "ans", "der", "ara", "han", "var", "det",
		"och", "ing", "sam", "onne", "gen", "eska", "ig", "ende", "lig", "nin")
	mutual_understanding = list(
		/datum/language/common = 15,
	)
