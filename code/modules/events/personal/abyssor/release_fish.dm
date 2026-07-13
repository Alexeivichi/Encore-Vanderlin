/datum/round_event_control/fish_release
	name = "Release Fish"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/fish_release
	weight = 10
	earliest_start = 10 MINUTES
	max_occurrences = 1
	min_players = 0

	tags = list(
		TAG_MJALLIDHORN,
		TAG_WATER,
		TAG_NATURE,
	)

/datum/round_event_control/fish_release/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/mjallidhorn))
			continue
		if(GET_MOB_SKILL_VALUE_OLD(H, /datum/attribute/skill/labor/fishing) < 2)
			continue
		return TRUE

	return FALSE

/datum/round_event/fish_release/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/mjallidhorn))
			continue
		if(GET_MOB_SKILL_VALUE_OLD(H, /datum/attribute/skill/labor/fishing) < 2)
			continue
		valid_targets += H

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/release_fish/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE MJALLIDHORN'S CHOSEN!"),
		span_notice(PLACEHOLDER_PATRON_REBRANDING),
	))
	chosen_one.playsound_local(chosen_one, 'sound/items/bucket_transfer (2).ogg', 100)

	chosen_one.mind.announce_personal_objectives()
