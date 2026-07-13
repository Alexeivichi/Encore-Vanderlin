/datum/round_event_control/deceivers_hoard
	name = "Mammon Desire"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/deceivers_hoard
	weight = 10
	earliest_start = 5 MINUTES
	max_occurrences = 1
	min_players = HIGHPOP_THRESHOLD

	tags = list(
		TAG_DECEIVERS,
		TAG_LOOT,
		TAG_CORRUPTION,
	)

/datum/round_event_control/deceivers_hoard/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/inhumen/deceivers))
			continue
		if(H.is_noble())
			continue
		return TRUE

	return FALSE

/datum/round_event/deceivers_hoard/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/inhumen/deceivers))
			continue
		if(human_mob.is_noble())
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/hoard_mammons/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE THE DECEIVERS' CHOSEN!"),
		span_notice("Accumulate [new_objective.target_mammons] mammons to prove your greed to Deceivers!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_deceivers.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
