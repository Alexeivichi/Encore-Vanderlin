/datum/patron/inhumen
	abstract_type = /datum/patron/inhumen
	associated_faith = /datum/faith/inhumen_pantheon

	confess_lines = list(
		"CLAW AT THE SOIL! BREAK THE FIRMAMENT!",
		"RELEASE THE OLD ONES! RETURN THEIR CROWN!",
		"WHAT ONCE WAS WILL BECOME NOW, AGAIN!",
	)

/datum/patron/inhumen/can_pray(mob/living/follower)
	for(var/obj/structure/fluff/psycross/cross in view(7, get_turf(follower)))
		if(cross.divine && !cross.obj_broken)
			to_chat(follower, span_danger("That accursed cross won't let me commune with the Forbidden One!"))
			return FALSE

	return TRUE

/* ----------------- */
/// Encore edit- Zizo needs to become the One Envy. This involves over 500 file changes, so, lmao, see you soon
/datum/patron/inhumen/envy
	name = ENVY
	domain = "Domotan Island, and seemingly little else."
	desc = "She whose name is unknown, she whose agenda is lost; the Jealous God embodies no elemental aspect, and serves neither the divine nor ilk of Hell. Her solemn devotees are the royal family of Etgard itself, the Shirleigh Dynasty and their constituents. They are the only divine to lay absolute claim over Domotan Island, and is thus praised only in hushed tones beyond the walls of Etgard Keep."
	flaws = "Unknown."
	worshippers = "The Shirleigh Dynasty, the brainwashed and the desperate"
	sins = "Unknown."
	boons = "You can recognise other worshippers at a glance. For the Shirleighs; access to innate and sinister miracles, and the awareness of when and where a mortal meets their demise, but not how. For all else; nothing."
	added_traits = list(TRAIT_CABAL_CHUD)
	devotion_holder = /datum/devotion/inhumen/envy
	confess_lines = list(
		"SHE SEES! SHE LAUGHS!",
		"SHE LAUGHS! SHE SEES!",
		"SHE KNOWS! SHE KNOWS!",
	)
	storyteller = /datum/storyteller/envy
	added_verbs = list(
		/mob/living/carbon/human/proc/draw_sigil,
		/mob/living/carbon/human/proc/praise,
	)

/datum/patron/inhumen/archdevils
	name = ARCHDEVILS
	domain = "All heretical anti-deities subservient to Hell."
	desc = "The Archdevils of Hell, despite their hand in bringing the world to its knees, attract worshippers for any number of reasons - for vengeance, for power, from indoctrination, or from those who yet quake in terror from the threat it poses - but such belief is a poisoned chalice, for Hell's power corrupts all it touches. You may worship the Archdevils directly, or worship a Deceiver God who has been corrupted by Hell's power; but whatever the case, you seek the disruption of the Elemental balance and the downfall of the Aspects."
	flaws = "Rage, hatred, bloodthirst."
	worshippers = "The vengeful, the power-hungry, the indoctrinated, the fearful."
	sins = "Compassion, frailty, servility."
	boons = "You are drawn to the flavour of raw flesh, organs, and rotten food, and may consume without worry. You can recognise other Archdevil worshippers at a glance, as well as servants of other Hell-corrupted deities."
	added_traits = list(TRAIT_ORGAN_EATER, TRAIT_ROT_EATER, TRAIT_BLOODDRINKER, TRAIT_CORRUPTED)
	devotion_holder = /datum/devotion/inhumen/archdevils
	confess_lines = list(
		"CLAW AT THE SOIL! BREAK THE FIRMAMENT!",
		"RELEASE THE OLD ONES! RETURN THEIR CROWN!",
		"WHAT ONCE WAS WILL BECOME NOW, AGAIN!",
	)
	storyteller = /datum/storyteller/archdevils

/datum/patron/inhumen/deceivers
	name = DECEIVERS
	domain = "Secret sects hidden within the Divine Courts."
	desc = "The praise of divines other than those subservient to the Four Elementals is heresy, even if those stragglers seek not to disrupt the balance; the mere worship gives power to Heavenly figures, after all. Which God that is remains up to you."
	flaws = "Specific to the divine in question."
	worshippers = "The desperate, the drunk, the disillusioned and the depraved."
	sins = "Specific to the divine in question."
	boons = "You can see the most expensive item someone is carrying."
	added_traits = list(TRAIT_DECEIVERS_EYES, TRAIT_CORRUPTED)
	devotion_holder = /datum/devotion/inhumen/deceivers
	confess_lines = list(
		"THE DECEIVERS FLEE! SEE THEIR LIES!",
		"A PANTHEON EXISTS BEYOND YOUR OWN!",
		"DIVINES WITHOUT NUMBER ARE BEYOND THE STARS!",
	)
	storyteller = /datum/storyteller/deceivers

/datum/patron/inhumen/hertannea
	display_name = "Hertannea"
	domain = "A corrupted deity, hiding within the shadows from the wrath of the Aspect of Fire; the Faerie Devil, Visires' Loathed, euphoric release of inhibitions."
	desc = "A once-mortal Drow, Visires' most intimate companion in their youth, Hertannea is a goddess scorned and exiled for her betrayal of the nascent Aspect of Fire at the moment of her ascension. Lurking beneath the twisting spires of Palasi Necra, she represents the lowest of depravity; the proliferation of the most potent narcotic substances, the alteration of the mind, defilement of purity and self, all in the pursuit of the most hedonistic desires. She provides an escape to the downtrodden, ensnaring them in her corrupt and addictive web before they realise they've become trapped. Though not an Archdevil herself, Hertannea was afflicted by the corruption of Hell when she was still mortal, and to this day she still acts upon the will of Hell and its accursed bounty."
	flaws = "Manipulation, self-Destruction, willingness to sacrifice others."
	worshippers = "Addicts, hedonists, the downtrodden, the heartbroken and those seeking escape."
	sins = "Sobriety, self-Sacrifice, faltering willpower."
	boons = "You will never overdose on drugs. You can recognise other Hertannea worshippers at a glance, as well as servants of other Hell-corrupted deities."
	added_traits = list(TRAIT_CRACKHEAD, TRAIT_CORRUPTED)
	devotion_holder = /datum/devotion/inhumen/hertannea
	confess_lines = list(
		"LIVE, LAUGH, LOVE! IN THE FAERIE DEVIL'S NAME!",
		"JOY AT ALL COSTS! HERTANNEA'S TEACHINGS REIGN!",
		"THE WHISPERS BELOW CALM MY MIND!",
	)
	storyteller = /datum/storyteller/hertannea

/// Encore edit for below- pending whatever the fuck we need to do to swap Zizo to the One Envy. I guess it works but it will definitely need some adjustment
/// Maniac Patron - Their mind is broken by secrets of the world before. They quite possibly know the reality of what happens outside the planet. They may think this is all a game. They are clearly insane.
/datum/patron/inhumen/sages
	name = "The Sages"
	domain = "Forever lost deities of the old world whose meddling has somehow endured far longer than civilization's memory."
	desc = "Empowered entities of divinity and unholy nature alike may, with enough effort and systemic erasure, simply cease to exist in the world altogether in the past, present and future- this option represents a disciple of one such unknowable idol. They toil in shadows in opposition to both elementalist and heretic alike, seeking knowledge through the ephemeral Sages to rekindle their lost history. They may be carryovers from cultures sundered in the Big Burn, or perhaps simply enamored by visions of lost grandeur you seek in a constant trance."
	flaws = "Nothing, Everything, Nothing."
	worshippers = "Lunatics, the lost and the outsiders."
	sins = "The New World and its theology as a whole."
	boons = "Secrets of the past reveal themselves in manic and insane ways."
	added_traits = list(TRAIT_SCHIZO_FLAW, TRAIT_CORRUPTED)
	confess_lines = list(
		"WHERE AM I!",
		"NONE OF THIS IS REAL!",
		"YOU SEE IT TOO, RIGHT?!",
	)

/datum/patron/inhumen/sages/preference_accessible(datum/preferences/prefs)
	return FALSE

/datum/patron/inhumen/sages/can_pray(mob/living/follower)
	var/datum/antagonist/maniac/dreamer = follower.mind.has_antag_datum(/datum/antagonist/maniac)
	if(dreamer)
		return TRUE
	// if a non-maniac somehow gets this patron,
	// something interesting should happen if they try to pray.
	INVOKE_ASYNC(follower, GLOBAL_PROC_REF(cant_wake_up), follower)  //Something interesting happened.
	message_admins("[ADMIN_LOOKUPFLW(follower)] has been gibbed due to praying as a non-maniac with their patron set to the Sages. Whoops..")
	return FALSE

/datum/patron/inhumen/sages/hear_prayer(mob/living/follower, message)
	var/datum/antagonist/maniac/dreamer = follower.mind.has_antag_datum(/datum/antagonist/maniac)
	if(!dreamer)
		return FALSE
	if(text2num(message) == dreamer.sum_keys)
		INVOKE_ASYNC(dreamer, TYPE_PROC_REF(/datum/antagonist/maniac, wake_up))
		return TRUE
	. = ..()

/datum/patron/inhumen/nidhogg
	name = NIDHOGG
	desc = "Once a dwarf born to Gurney's own lineage, corrupted by his ambition to make Geramor his alone. An ancient, avaricious evil that lives in the deepest depths of the world. Nidhogg's name musn't be invoked by his faithful unless they are willing to pay the price, for even The Wurm's name hungers to extract what is rightfully his from the world."
	flaws = "Covetous, Spiteful, Vainglorious. Weakness to fire."
	worshippers = "The entitled, the exiled yearning for comfort, the corrupted sons of the Deeps."
	sins = "Generosity, Loyalty, Contentment with one's lot."
	boons = "Insects do not attack you, and their dens can be traversed easily."

	confess_lines = list(
		"THE WORLD FOR MY HUNGER!",
		"MY SOUL CRIES TO BE SATED!",
		"A TRIBUTE FOR THE TRUE KING!",
		"LET HIS LEGACY SWALLOW ALL!",
	)

	allowed_races = RACES_PLAYER_GERAMOR
	storyteller = /datum/storyteller/archdevils
	added_traits = list(TRAIT_WEBWALK, TRAIT_ABOMINATION, TRAIT_STINKY, TRAIT_STRONGBITE)
