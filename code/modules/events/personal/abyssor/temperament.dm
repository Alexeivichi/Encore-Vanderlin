/datum/round_event_control/mjallidhorns_temperament
	name = "Mjallidhorn's Temperament"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/mjallidhorns_temperament
	weight = 10
	earliest_start = 5 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_MJALLIDHORN,
		TAG_WATER,
		TAG_UNEXPECTED,
	)

/datum/round_event_control/mjallidhorns_temperament/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/mjallidhorn))
			continue
		return TRUE

	return FALSE

/datum/round_event/mjallidhorns_temperament/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/mjallidhorn))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)
	var/datum/objective/mjallidhorn_objective

	var/calm
	if(prob(50))
		mjallidhorn_objective = new /datum/objective/personal/mjallidhorn_bath(owner = chosen_one.mind)
		calm = TRUE
	else
		mjallidhorn_objective = new /datum/objective/personal/mjallidhorn_splash(owner = chosen_one.mind)
		calm = FALSE

	chosen_one.mind.add_personal_objective(mjallidhorn_objective)

	to_chat(chosen_one, span_userdanger("YOU ARE MJALLIDHORN'S CHOSEN!"))
	if(calm)
		to_chat(chosen_one, span_notice("Mjallidhorn is calm at the moment. Take a relaxing bath while wearing his amulet to honor him!"))
	else
		to_chat(chosen_one, span_notice("Mjallidhorn is RAGING like a storm! Splash those who forgot his name with a bucket full of water to help them remember!"))
	chosen_one.playsound_local(chosen_one, 'sound/items/bucket_transfer (2).ogg', 100)

	chosen_one.mind.announce_personal_objectives()
