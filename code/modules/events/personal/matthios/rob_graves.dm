/datum/round_event_control/grave_robbery
	name = "Grave Robbery"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/grave_robbery
	weight = 7
	earliest_start = 10 MINUTES
	max_occurrences = 1
	min_players = HIGHPOP_THRESHOLD

	tags = list(
		TAG_DECEIVERS,
		TAG_LOOT,
	)

/datum/round_event_control/grave_robbery/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/inhumen/deceivers))
			continue
		return TRUE

	return FALSE

/datum/round_event/grave_robbery/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/inhumen/deceivers))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/grave_robbery/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE THE DECEIVERS' CHOSEN!"),
		span_notice("Dead don't need anything anymore! Rob graves to earn Deceivers' approval!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_deceivers.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
