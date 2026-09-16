/datum/patron/alternate
	abstract_type = /datum/patron/alternate
	associated_faith = /datum/faith/alternate

//round and round we goooooo
//Honestly this patron is so cool I don't actually intend to overwrite or remove it at all.
/datum/patron/alternate/great_hunt
	name = GREAT_HUNT
	display_name = "The Great Hunt (Unproven)"
	desc = "The Great Hunt is a concept adopted by the eldest of wild folk which, per the Motonium, predates the modern concept of the Elemental Pantheon. It is a simple, primitive belief that orients around the Mother, Gani, having tutored the first of Her believers on the preservation of nature itself. Her will is that Man protect nature. In the furthest isolated edges of the world, tribal theology lives on by word of mouth in sanctified worship of Gani's role in the groves. Hunters are thought to have their lives guided by the ancestral beasts, and become proven once the manifestation of that beast becomes their own."
	added_traits = list(TRAIT_MANEATER_IMMUNITY, TRAIT_ENTANGLER_IMMUNITY)
	boons = "You are left untouched by the flesh eating plants."
	flaws = "Isolationist, technophobic, and primitive."
	worshippers = "Tribesfolk and unfamiliar people of distant lands."
	sins = "Cruelty, wastefulness, disrespect of nature."

	confess_lines = list(
		"GOLDEN GREENING!",
		"WE SPROUT ANEW!",
		"BY LEAF AND LIMB!",
	)
	devotion_holder = /datum/devotion/alternate/great_hunt

/datum/patron/alternate/great_hunt/can_pray(mob/living/carbon/human/follower)
	var/amulet_type = /obj/item/clothing/neck/psycross/great_hunt

	if(istype(follower.wear_wrists, amulet_type) || istype(follower.wear_neck, amulet_type) || istype(follower.get_active_held_item(), amulet_type))
		return TRUE

	to_chat(follower, span_danger("I specifically need an amulet of the hunt for my prayers to be heard..."))
	return FALSE

/datum/patron/alternate/great_hunt/proven
	display_name = "The Great Hunt (Proven)"
	desc = "You are a Hunter who has somehow acquired their ancestral beast. Your Hunt is at an end, and your path in life is to follow in the Earth Mother's footsteps. In Her name, protect the elder wood."

/datum/patron/alternate/black_briar
	name = "The Black Briar"
	desc = "The Briar is not worshipped, it is joined. Roots in the body connect the consciousnesses of those afflicted into a Gestalt. During assimilation, many Afflicted desire to spread from their infection point."
	domain = "The Black Briar"
	flaws = "...really?"
	worshippers = "The Gestalt"
	sins = "Denying Your Beauty, Resisting the Gestalt"
	boons = "Beauty of the Umbral Rosa"

	confess_lines = list(
		"WE ARE BEAUTIFUL!",
		"LISTEN TO OUR SONG!",
		"CUT MY FLESH SO I MAY SPROUT!",
		"OH AKAN, SWEET AKAN, YOUR GAZE IS THE NECTAR IN WHICH I DRINK!",
	)
	added_traits = list(TRAIT_BRIAR_HOST)
	allowed_races = SPECIES_BASE_BODY//Automatons and other miscellaneous races dont play nice with this

//todo: unique prayer system?
/datum/patron/alternate/black_briar/preference_accessible(datum/preferences/prefs)
	return FALSE
