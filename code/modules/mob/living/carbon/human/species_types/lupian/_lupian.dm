	/*==============*
	*				*
	*	 Lupian		*
	*				*
	*===============*/

/mob/living/carbon/human/species/lupian
	race = /datum/species/lupian

/datum/attribute_holder/sheet/job/species/lupian
	raw_attribute_list = list(
		/datum/attribute/skill/labor/butchering = 10,
		STAT_PERCEPTION = 1,
	)

/datum/species/lupian
	name = "Lupian"
	id = SPEC_ID_LUPIAN
	multiple_accents = list(
		"No Accent" = ACCENT_NONE,
	)
	desc = "<b>Lupian</b><br>\
	Lupians are a humanoid race of canines typically resembling wolves, a proud species of hunters \
	well-regarded for both their capability in battle and their community spirit. Lupians formed a \
	friendship with Humanity early in the Goblet’s history and can commonly be found in Human communities.<br>\
	+1 Perception, Dark Vision, Strong Bite, Scent-Sense, +1 skill tier Butchering."

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY, CUSCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_DARKVISION, TRAIT_STRONGBITE)
	use_skintones = TRUE

	possible_ages = NORMAL_AGES_LIST

	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mm.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/lupian,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/lupian,
		ORGAN_SLOT_SNOUT = /obj/item/organ/snout/lupian
	)

	offset_features_m = list(
		OFFSET_RING = list(0,1),\
		OFFSET_GLOVES = list(0,1),\
		OFFSET_WRISTS = list(0,1),\
		OFFSET_HANDS = list(0,1),\
		OFFSET_CLOAK = list(0,1),\
		OFFSET_FACEMASK = list(0,1),\
		OFFSET_HEAD = list(0,1),\
		OFFSET_FACE = list(0,1),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,1),\
		OFFSET_NECK = list(0,1),\
		OFFSET_MOUTH = list(0,1),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,1),\
		OFFSET_ARMOR = list(0,1),\
		OFFSET_UNDIES = list(0,1),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,-1),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-1),\
		OFFSET_HEAD = list(0,-1),\
		OFFSET_FACE = list(0,-1),\
		OFFSET_BELT = list(0,-1),\
		OFFSET_BACK = list(0,-1),\
		OFFSET_NECK = list(0,-1),\
		OFFSET_MOUTH = list(0,-1),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,-1),\
	)

	statsheet_male = /datum/attribute_holder/sheet/job/species/lupian
	statsheet_female = /datum/attribute_holder/sheet/job/species/lupian

	enflamed_icon = "widefire"

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/tail/lupian,
		/datum/customizer/organ/snout/lupian,
		/datum/customizer/organ/ears/lupian,
		/datum/customizer/organ/neck_feature/anthro
	)

	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/plain,
		/datum/body_marking/belly,
		/datum/body_marking/bellyslim,
		/datum/body_marking/butt,
		/datum/body_marking/sock,
		/datum/body_marking/socklonger,
		/datum/body_marking/tips,
		/datum/body_marking/backspots,
		/datum/body_marking/front,
		/datum/body_marking/tonage,
	)

	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one,
		/datum/descriptor_choice/prominent_two,
		/datum/descriptor_choice/prominent_three,
		/datum/descriptor_choice/prominent_four,
	)

/datum/species/lupian/on_species_gain(mob/living/carbon/C, datum/species/old_species, datum/preferences/pref_load)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)

/datum/species/lupian/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/lupian/check_roundstart_eligible()
	return TRUE

/datum/species/lupian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/lupian/get_skin_list()
	return list(
		"Vakran" = "271f1b",
		"Lanarain" = "271f1c",
		"Frostfell" = "271f1d",
		"Varghelm" = "271f1e",
		"Dawnbreak" = "271f1f",
		"Bloodmoon" = "271f2a",
		"Felsaad" = "271f2b",
		"Hizmut" = "271f2c",
		"Langqan" = "271f2d",
		"a tangled lineage" = "271f2e",
		"disputed" = "271f2f",
		"bastardized" = "271f3a"
	) // This is a dirty hack that stops me using mob defines, the colors do not do anything, it just a var that relates to their pack name on examine

/datum/action/cooldown/keen_nose_lupian
	name = "Sniff for scents"
	desc = "Smell the air to detect living beings at a distance."
	button_icon_state = "shieldsparkles"
	cooldown_time = 30 SECONDS

/datum/action/cooldown/keen_nose_lupian/proc/get_smell_message(mob/living/target)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = target
		var/mob/living/carbon/human/U = owner
		var/datum/species/target_species = H.dna.species
		var/datum/species/user_species = U.dna.species

		if(!target_species)
			return "You smell something"
		if((H.mind && H.mind.has_antag_datum(/datum/antagonist/werewolf)) && U.mind.has_antag_datum(/datum/antagonist/werewolf))
			return "You smell [H.name], a fellow werevolf"
		if((H.mob_biotypes & MOB_UNDEAD) || H.stat == DEAD || H.hygiene == HYGIENE_LEVEL_DISGUSTING)
			return "Euuugh! You smell something rotten"
		if(istype(target_species, /datum/species/lupian) && istype(user_species, /datum/species/lupian))
			return "You smell [H.name], the lupian"
		if(target_species.id in RACES_PLAYER_LUXLESS)
			return "You smell an animal"
		if(target_species.id in RACES_PLAYER_NONDISCRIMINATED)
			return "You smell something humen"
		if((target_species.id in RACES_PLAYER_HERETICAL_RACE) || (istype(target_species, /datum/species/goblin) || istype(target_species, /datum/species/orc)))
			return "Ugh! You smell something tainted"

	if(istype(target, /mob/living/simple_animal))
		return "You smell an animal"

	if(istype(target, /mob/living))
		var/mob/living/L = target
		if((L.mob_biotypes & MOB_UNDEAD) || L.stat == DEAD)
			return "Euuugh! You smell something rotten"

		return "You smell something"

/datum/action/cooldown/keen_nose_lupian/Activate(atom/target)
	. = ..(target)
	if(!owner)
		return

	var/list/smelled_targets = list()
	for(var/mob/living/smell_target in range(20, owner))
		smelled_targets += smell_target
	smelled_targets -= owner

	owner.visible_message(span_notice("[owner] sniffs the air!"))
	playsound(owner, 'sound/items/sniff.ogg', 70, TRUE)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), owner, 'sound/items/sniff.ogg', 70, TRUE), 0.5 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(finish_sniff), smelled_targets), 1.5 SECONDS)

/datum/action/cooldown/keen_nose_lupian/proc/finish_sniff(list/smelled_targets)
	if(QDELETED(owner) || QDELETED(src))
		return

	playsound(owner, 'sound/items/sniff.ogg', 100, TRUE)
	if(!length(smelled_targets))
		to_chat(owner, span_notice("You smell the air! No creatures are nearby, save yourself."))
		return

	for(var/mob/living/smell_target in smelled_targets)
		var/distance = get_dist(owner, smell_target)
		var/direction = dir2text(get_dir(owner, smell_target))
		var/distance_phrase = " to the [direction]"
		if(distance <= 6)
			distance_phrase = " close to the [direction]"
		else if(distance > 12)
			distance_phrase = " far to the [direction]"

		var/message = get_smell_message(smell_target)
		if(message)
			to_chat(owner, span_notice("[message][distance_phrase]!"))
