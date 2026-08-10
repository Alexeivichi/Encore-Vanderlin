/datum/patron/angros
	name = "Angros"
	display_name = "Salvationist"
	domain = "The Mad; former Aspect of Fire. Harbinger of ruin, now maintainer of the Worldflame."
	desc = "Deceased; slain by the rest of the Pantheon, ending the apocalyptic Big Burn. Angros was once the Aspect of Fire, worshipped similar to how Visires is in the modern day. Yet, after being corrupted by Hell, his death was necessary to avert the end of the world. To be a Salvationist is to remember the deity that Angros used to be before his corruption, and to mourn his loss; not to wish for his return. You occupy a peculiar position, holy lamb. The Katholikos permits your worship, as your continued belief in Angros is what sustains the Worldflame. Other faithful may respect you or pity you, but they all keep a watchful eye lest your belief change to something more sinister, and draw the ire of the Inquisition. Mourn your dead God, remember who he used to be, and bring silence to any foolish enough to wish for the return of the one who brought the world to its knees."
	flaws = "Grudge-holding, sullen, self-sacrificing"
	worshippers = "Fatigued warriors, Martyrs, the lost without purpose."
	sins = "Zealotry, demon worship, Angrosian Absolutionism"
	boons = "Your enduring faith grants you more tolerance to pain."
	devotion_holder = /datum/devotion/divine/angros
	added_traits = (TRAIT_ANGROSIAN_GRIT)
	associated_faith = /datum/faith/angros
	confess_lines = list(
		"I'M ASH UPON THE WIND!",
		"THE MAD MUST STAY DREAMING!",
		"WE TEND THE FLAME OF THE WORLD!",
	)

/datum/patron/angros/can_pray(mob/living/carbon/human/follower)
	//We just kind of assume the follower is a human here
	if(
		istype(follower.wear_wrists, /obj/item/clothing/neck/psycross) || istype(follower.wear_neck, /obj/item/clothing/neck/psycross) || istype(follower.get_active_held_item(), /obj/item/clothing/neck/psycross)
		)
		return TRUE

	to_chat(follower, span_danger("My prayers of respite cannot reach Him... I need His amulet!"))
	return FALSE

/datum/patron/angros/extremist
	display_name = "Absolutionist Angrosian"
	desc = "Betrayed; murdered by the rest of the Pantheon, sacrificed as fuel for the Worldflame. Angros was once the Aspect of Fire, a glorious and powerful conquerer that led the Sultanate to victory far and wide. Yet, after being influenced by Hell, the Pantheon resigned to slay their former comrade instead of aiding him. To be an Absolutionist is to believe that Angros' death has absolved him of any sin, and to pray wholeheartedly for his return as the rightful Aspect of Fire; not the pretender and usurper Visires. The Katholikos declares you a heretic of the highest order, the common faithful despise you, the Inquisition seeks your head for the pyre. Even those Salvationist fools, your so-called brethren, want you snuffed out. Will you endure through these trials, sacrifical lamb, and burn in a blaze of glory?"
	flaws = "Zealous, Fanatical, Hell-Corrupted"
	worshippers = "Fanatics, misinformed fools, and madmen."
	sins = "False prophets, worship of the Elemental Pantheon, Angrosian Salvationism"
	boons = "Your bitter determination towards your own faith in your dead God lends you an enhanced resistance to pain, and your wounds will slowly regenerate as long as your body is not bled dry. The beneficial miracles of the betrayer Elemental Pantheon will not benefit you, however."
	added_traits = list(TRAIT_ANGROSIAN_GRIT, TRAIT_ANGROSIAN, TRAIT_CORRUPTED)
	devotion_holder = /datum/devotion/inhumen/angros
	confess_lines = list(
		"CAST DOWN THE PRETENDER! THE FIRE RISES!",
		"THE MAD MUST RISE AGAIN!",
		"CLAW AT THE SOIL! BREAK THE FIRMAMENT!",
	)

/datum/patron/angros/extremist/can_pray(mob/living/carbon/human/follower)
	//We just kind of assume the follower is a human here
	if(
		istype(follower.wear_wrists, /obj/item/clothing/neck/psycross) || istype(follower.wear_neck, /obj/item/clothing/neck/psycross) || istype(follower.get_active_held_item(), /obj/item/clothing/neck/psycross)
		)
		return TRUE

	to_chat(follower, span_danger("My fervent prayers cannot reach Him... I need His amulet!"))
	return FALSE

