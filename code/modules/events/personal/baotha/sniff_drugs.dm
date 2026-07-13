/datum/round_event_control/hertannea_sniffing
	name = "Drug Desire"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/hertannea_sniffing
	weight = 10
	earliest_start = 5 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_HERTANNEA,
		TAG_INSANITY,
		TAG_ALCHEMY,
	)

/datum/round_event_control/hertannea_sniffing/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/inhumen/hertannea))
			continue
		return TRUE

	return FALSE

/datum/round_event/hertannea_sniffing/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/inhumen/hertannea))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/sniff_drugs/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE HERTANNEA'S CHOSEN!"),
		span_notice("Hertannea demands chemical ecstasy! Sniff drugs to earn Hertannea's favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_hertannea.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
