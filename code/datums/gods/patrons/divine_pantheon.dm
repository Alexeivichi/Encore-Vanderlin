GLOBAL_LIST_INIT(patron_sound_themes, list(
	VISIRES = 'sound/misc/gods/omen_fire.ogg',
	AKAN = 'sound/misc/gods/omen_air.ogg',
	POMETTE = 'sound/misc/gods/omen_earth.ogg',
	GANI = 'sound/misc/gods/omen_earth.ogg',
	GOLERKANH = 'sound/misc/gods/omen_base.ogg',
	ILIOPE = 'sound/misc/gods/omen_air.ogg',
	VALDALA = 'sound/misc/gods/omen_frost.ogg',
	MJALLIDHORN = 'sound/misc/gods/omen_frost.ogg',
	MORDSOL = 'sound/misc/gods/omen_war.ogg',
	ERDL = 'sound/misc/gods/omen_air.ogg',
	ENVY = 'sound/misc/gods/omen_envy.ogg',
	ARCHDEVILS = 'sound/misc/gods/omen_hell.ogg',
	HERTANNEA = 'sound/misc/gods/omen_hertannea.ogg',
	DECEIVERS = 'sound/misc/gods/omen_deceivers.ogg'
))

/datum/patron/divine
	abstract_type = /datum/patron/divine
	associated_faith = /datum/faith/divine_pantheon
	profane_words = list("zizo", "cock", "dick", "fuck", "shit", "pussy", "cuck", "cunt", "asshole")
	var/associated_psycross = /obj/item/clothing/neck/psycross

/datum/patron/divine/can_pray(mob/living/carbon/human/follower)
	//you can pray anywhere inside a church
	if(istype(get_area(follower), /area/indoors/town/church))
		return TRUE

	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(!cross.obj_broken)
			return TRUE

	if(istype(follower.wear_wrists, associated_psycross) || istype(follower.wear_neck, associated_psycross) || istype(follower.get_active_held_item(), associated_psycross))
		return TRUE


	to_chat(follower, span_danger("I need an amulet of my patron, or a nearby Pantheon Cross, for my prayers to be heard..."))
	return FALSE

/* ----------------- */
/datum/patron/divine/centrist
	name = DIVINE_CENTRIST
	desc = "The worship of the balance and order of things between the Four Elementals equally. This is usually the focus of the Katholikos, the largest sect within the Goblet which acts in favor of all Elementals."
	domain = "Earth, Air, Fire and Frost"
	flaws = "Indecisiveness"
	worshippers = "The Katholikos, high clergy and obsessed zealots"
	sins = "Seeking Divinity, Stifling the Soul"
	boons = "None"
	added_traits = list(TRAIT_DIVINE_CENTRIST)
	devotion_holder = /datum/devotion/divine/centrist
	confess_lines = list(
		"I SEE WHAT THE BLIND MAN SEES!",
		"I SERVE THE STARS!",
		"BY LEAF AND LIMB!",
		"BLOOD IN THE FIRMAMENT! BLOOD IN ALL THINGS!",
	)
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine


/datum/patron/divine/visires
	name = VISIRES
	domain = "The Youthful; Aspect and sole remainder of the Court of Fire."
	desc = "The youngest of the Elemental Gods. A once-mortal given host to the Aspect of Fire and made divine. The worship of Visires represents the plea for passion, life and the will to live; just as much it does the destruction, the hunger and the chaos that it may impose."
	flaws = "Tyrannical, ill-tempered, uncompromising."
	worshippers = "Conquerors, the wrathful, the pupils of the Sun's science."
	sins = "Charity, overt benevolence without gain, giving handouts."
	boons = "Your stamina regeneration delay is lowered during daytime."
	added_traits = list(TRAIT_APRICITY)
	devotion_holder = /datum/devotion/divine/visires
	confess_lines = list(
		"VISIRES SUNDERS!",
		"THE ASPECT OF FIRE HUNGERS!",
		"I SERVE THE STARS!",
	)
	storyteller = /datum/storyteller/visires
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/visires

/datum/patron/divine/akan
	name = AKAN
	domain = "The Elder; Aspect and ruler of the Court of Air. God of the sky and heavens."
	desc = "Akan, the Elder, embodies the fundamental element of air. They are an ancient spirit made divine as they would personify the very essence of the wistful, everlasting and free Aspect of the Sky."
	flaws = "Fleeting, non-commital, unfiltered honesty."
	worshippers = "Nomads, scholars, sailors and the forever-free."
	sins = "Suppressing truth, burning books, willful ignorance."
	boons = "You learn, dream, and teach apprentices slightly better. The veil of darkness parts easier for you under the light of the moon."
	added_traits = list(TRAIT_NIGHT_OWL, TRAIT_TUTELAGE)
	devotion_holder = /datum/devotion/divine/akan
	confess_lines = list(
		"AKAN HEARS, BUT DOES NOT SEE!",
		"I SEE WHAT THE BLIND MAN SEES!",
		"A CLOUD 'BOUT THE ERRANT SOUL!",
	)
	storyteller = /datum/storyteller/akan
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/akan

/datum/patron/divine/gani
	name = GANI
	domain = "The Mother; Aspect and ruler of the Court of Earth. Goddess of the stone and soil."
	desc = "Gani, the Mother, embodies the fundamental element of earth. They are an ancient spirit made divine as they would personify the very essence of the stern, immovable and protective Aspect of Stone. Gani is the world beneath the feet of all. She is the only God of the Four whose omnipresence extends beyond her domain."
	flaws = "Overbearing, autophobic, anxiety-prone."
	worshippers = "All Earthly things, the farms, the huntsmen, matriarchs and druids."
	sins = "Cruelty, isolationism, disrespect of nature."
	boons = "You are immune to kneestingers and various tangling flora. You instinctively understand when people are stressed, in pain, or hungry. You find it easier to locate seeds in the wild."
	added_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_EMPATH, TRAIT_EXTEROCEPTION, TRAIT_FLOWERFIELD_IMMUNITY, TRAIT_SEED_FINDER)
	devotion_holder = /datum/devotion/divine/gani
	confess_lines = list(
		"GOLDEN GREENING!",
		"WE SPROUT ANEW!",
		"BY LEAF AND LIMB!",
	)
	storyteller = /datum/storyteller/gani
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/gani

/datum/patron/divine/mjallidhorn
	name = MJALLIDHORN
	domain = "The Warrior; Aspect and ruler of the Court of Frost."
	desc = "Mjhallidhorn, the Warrior, embodies the fundamental element of ice. They are a once-mortal made divine as they would personify the very essence of the ruthless, brutal and materialistic Aspect of Frost. Mjallidhorn is an Elemental locked in battle in the far north against the hordes of Hell, perhaps forevermore."
	flaws = "Reckless, stubborn, destructive."
	worshippers = "Warriors, sellswords, the vengeful and sailors."
	sins = "Cowardice, hesitation, passivity."
	boons = "Your used weapons dull slower. Swimming is less tiring. You are immune to leeches."
	added_traits = list(TRAIT_LEECHIMMUNE, TRAIT_GOOD_SWIM, TRAIT_SHARPER_BLADES)
	devotion_holder = /datum/devotion/divine/mjallidhorn
	confess_lines = list(
		"THE NORTH'S MADNESS!",
		"BLOOD IN THE FIRMAMENT! BLOOD IN ALL THINGS!",
		"I FEAR NOT DEATH, THE FOREVER WAR AWAITS ME!",
	)
	storyteller = /datum/storyteller/mjallidhorn
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/mjallidhorn

/datum/patron/divine/valdala
	name = VALDALA
	domain = "Demi-deity of the Court of Frost; The Valkyrie, shepherd of souls."
	desc = "Valdala, a once-earth spirit and daughter of Gani, now demi-deity of Mjallidhorn's court. Her eternal charge is the stewardship of souls after death; ferrying them to Heaven, or to the Forever War that Mjallidhorn fights in the north. She fights in the eternal battle against Hell alongside Mordsol for the Aspect of Frost, sewing her grief for mortals slain among her foes and reaping it as their doom."
	flaws = "Melancholic, dismal, gloomy."
	worshippers = "Orderlies, gravetenders, mourners and the bereaved."
	sins = "Necromancy, disrespecting the dead, pre-meditated murder."
	boons = "You may see the presence of a soul within a body. You become aware of when a person dies, though not where or how. You maintain your composure better when witnessing violence or dismemberment."
	added_traits = list(TRAIT_SOUL_EXAMINE, TRAIT_DEATHSIGHT, TRAIT_STEELHEARTED)
	devotion_holder = /datum/devotion/divine/valdala
	confess_lines = list(
		"VALDALA'S WINGS STAY ALL BURDENS!",
		"THE LAST ANGEL'S WAIL HAUNTS US!",
		"THE SISTERS OF FROST OBSESS UPON THE WICK OF OUR SOUL!",
	)
	storyteller = /datum/storyteller/valdala
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/valdala

/datum/patron/divine/mordsol
	name = MORDSOL
	domain = "Demi-deity of the Court of Frost; The Righteous, servant of honour and justice."
	desc = "Mordsol, once Al'aqshir. Water, once fire. He is one of the oldest and has a storied past. Friend to Akan, servant to Angros, champion of Mjallidhorn; in modernity, Mordsol is part of the Court of Frost. He represents the pursuit of honourable combat, true justice, and what is truly right; as opposed to blind obedience to codified, written mortal laws; and reminds the worshippers of Frost to never let their hearts truly freeze."
	flaws = "Stubborn, duty-bound, single-minded."
	worshippers = "Honourbound warriors, freedom fighters, the noble-hearted and sailors."
	sins = "Cowardice, injustice, tyranny."
	boons = "Your weapons dull slower. You have less difficulty carrying heavy weights upon your back."
	added_traits = list(TRAIT_SHARPER_BLADES, TRAIT_AMAZING_BACK)
	devotion_holder = /datum/devotion/divine/mordsol
	confess_lines = list(
		"THE RIGHTEOUS WILL PREVAIL!",
		"MORDSOL IS MY STRENGTH, AND MY MERCY!",
		"THE EMBERS OF JUSTICE KEEP MY HEART THAWED!",
	)
	storyteller = /datum/storyteller/mordsol
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/mordsol

/datum/patron/divine/iliope
	name = ILIOPE
	desc = "A demi-deity of Akan's court, both famous and infamous for their sway over the forces of luck. Iliope is known for the inspiration of many a bards lyric. Speaks through their gift to man; the Tarot deck."
	domain = "Demi-deity of the Court of Air; The Fool, comedy and tragedy."
	flaws = "Petulant, deceptive, gambling-prone."
	worshippers = "Gamblers, bards, artists, and the silver-tongued."
	sins = "Boredom, predictability, routine."
	boons = "You can rig different forms of gambling in your favor."
	added_traits = list(TRAIT_BLACKLEG)
	devotion_holder = /datum/devotion/divine/iliope
	confess_lines = list(
		"VISIRES IS MY LIGHT!",
		"AKAN FLIES FREE AND TOO FAR FROM ME!",
		"GANI PROVIDES!",
		"MJALLIDHORN IS MY TERROR!",
		"MORDSOL IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO VALDALA!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!", //the only iliope-related confession
		"ERDL SOOTHES ALL ILLS!",
		"GOLER KANH IS MY MUSE!",
		"POMETTE BRINGS US TOGETHER!",
	)
	storyteller = /datum/storyteller/iliope
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/iliope

/datum/patron/divine/erdl
	name = ERDL
	domain = "Demi-deity of the Court of Air; The Bloodfather, sculptor of flesh."
	desc = "A demi-deity of Akan's court, Erdl embodies utter devotion to the progression of the academic understanding of medicine; all to one end - to create a fix-all elixir against death itself. Where the Court of Frost handles the inevitability of death, Erdl seeks to eliminate it entire through the perfection of flesh. His teachings have created the finest physicians in the Goblet, though many more would-be disciples of His teachings find themselves falling short of the exacting standards and the utter devotion to the craft that He demands. Though many of his doctors are known to toe the line of ethical boundaries, the Bloodfather is absolute that every act must be done for a reason and for the greater good; to pervert the art of medicine into mere butchery or cruelty is a sin."
	flaws = "Obsessive, fervent, thanatophobic."
	worshippers = "The ill and infirm, alchemists, physicians and healers."
	sins = "Idleness, sadism, abandonment of the ill and infirm, reducing medicine to butchery."
	boons = "Leeches will not seek your blood. You have a natural resilience against most poisons."
	added_traits = list(TRAIT_LEECHIMMUNE, TRAIT_POISON_RESILIENCE)
	devotion_holder = /datum/devotion/divine/erdl
	confess_lines = list(
		"THE BLOODFATHER SEEKS PERFECTION!",
		"THE ESCAPE OF DEATH LIES IN THE MASTERING OF FLESH!",
		"I SEEK THE ICHOR OF LIFE!",
	)
	storyteller = /datum/storyteller/erdl
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/erdl

/datum/patron/divine/golerkanh
	name = GOLERKANH
	domain = "Demi-deity of the Court of Earth; The Shaper, divine artifice."
	desc = "A demi-deity of Gani's court. The creator of technology, and he who first harnessed land and rock to serve mortal will."
	flaws = "Obsessive, exacting, single-minded."
	worshippers = "Smiths, engineers, tinkerers and craftsmen of all kinds."
	sins = "Cheating, shoddy work, duplicity."
	boons = "You recover more energy when sleeping. You learn, dream, and teach apprentices slightly better."
	added_traits = list(TRAIT_BETTER_SLEEP, TRAIT_TUTELAGE)
	devotion_holder = /datum/devotion/divine/golerkanh
	confess_lines = list(
		"IN MY HAND IS ALL MORTAL POWER!",
		"WITH GANI'S EDGE I STRIKE!",
		"I AM AN INSTRUMENT OF CREATION!",
	)
	storyteller = /datum/storyteller/golerkanh
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/golerkanh

/datum/patron/divine/pomette
	name = POMETTE
	domain = "Demi-deity of the Court of Earth; The Daughter, love transcendent."
	desc = "A demi-deity of Gani's court. An immaculately-conceived Daughter, crafted from a shard of the Mother's own divinity; Pomette's divine purity is thought to be absolute among the Pantheon. The youngest of the Elementals, Pomette's love for all grants her the capacity to assume any form she wishes; and alongside her Mother, she taught the first Druids the art of shapeshifting. However, her naivety leads her to hold love for all things in creation, even the soulless and wicked. This fringe belief is only possible due to her being the child of Gani, and it brews worry in the rest of the Pantheon. All fundamentalist texts reinforce that the whole Pantheon - even the solitary Visires - owe Pomette protection due to such childish beliefs."
	flaws= "Naivete, impulsiveness, underestimation of danger."
	worshippers = "The truly benevolent, friends and lovers, parents and grandparents, and druids."
	sins = "Cruelty, abandonment, bigotry."
	boons = "You can understand the needs of others better. You're immune to the shock of kneestingers and various tangling flora. Cats adore you."
	added_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_EMPATH, TRAIT_EXTEROCEPTION, TRAIT_FLOWERFIELD_IMMUNITY, TRAIT_KITTEN_MOM)
	devotion_holder = /datum/devotion/divine/pomette
	confess_lines = list(
		"THE SACRED DAUGHTER STEELS MY HEART!",
		"HER LOVE IS WITH US EVEN NOW!",
		"SHE NEVER FALTERED! NOR SHALL I!",
	)
	storyteller = /datum/storyteller/pomette
	associated_psycross = /obj/item/clothing/neck/psycross/silver/divine/pomette
