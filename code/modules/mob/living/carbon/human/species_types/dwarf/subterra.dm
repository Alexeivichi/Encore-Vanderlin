/mob/living/carbon/human/species/dwarf/mountain/subterra
	race = /datum/species/dwarf/mountain/subterra

/datum/species/dwarf/mountain/subterra
	name = "Wormblooded Dwarf"
	id = SPEC_ID_DWARF_SUBTERRAN
	id_override = SPEC_ID_DWARF
	desc = "Wurm-touched dwarves of Nidhogg's realm, usually cannibals who thrive in acidic insect-ridden caves. Their environment and heretical praise has warped their bodies to resemble that of abominations, usually with a carapace and disgusting tumor-growths to match."

	custom_id = SPEC_ID_DWARF // this is stupid
	custom_clothes = TRUE

	exotic_bloodtype = /datum/blood_type/human/dwarf/subterra

	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_ACID_IMMUNE, TRAIT_ORGAN_EATER)

/datum/species/dwarf/mountain/subterra/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()

	if(!istype(C.patron, /datum/patron/inhumen/nidhogg))
		return // :)

	var/list/slots = list(
		ORGAN_SLOT_LIVER = 10,
		ORGAN_SLOT_LUNGS = 8,
		ORGAN_SLOT_GUTS = 5,
		ORGAN_SLOT_HEART = 3,
		ORGAN_SLOT_BRAIN = 1,
	)

	for(var/i in 1 to 2)
		var/slot = pickweight(slots)
		slots -= slot
		var/obj/item/organ/organ = C.getorganslot(slot)
		if(organ)
			organ.generate_chimeric_organ(C)

/datum/species/dwarf/mountain/subterra/after_creation(mob/living/carbon/C)
	. = ..()

	if(!istype(C.patron, /datum/patron/inhumen/nidhogg))
		return

	if(C.mind && SSticker.current_state < GAME_STATE_PLAYING && length(GLOB.jarosite_starts))
		var/turf/place = pick(GLOB.jarosite_starts) // Lord forgive my sins
		SSticker.OnRoundstart(CALLBACK(C, TYPE_PROC_REF(/atom/movable, forceMove), place))

/datum/species/dwarf/mountain/subterra/preference_accessible(datum/preferences/prefs)
	. = ..()
	if(!.)
		return

	if(!prefs?.parent)
		return FALSE

	return prefs.parent.has_triumph_buy(TRIUMPH_BUY_SUBTERRAN_DWARF)

/datum/species/dwarf/mountain/subterra/get_skin_list()
	return sortList(list(
		"Wormblood" = "aabf7c"
	))
