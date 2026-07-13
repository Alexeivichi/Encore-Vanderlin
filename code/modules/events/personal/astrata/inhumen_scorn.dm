/datum/round_event_control/inhumen_scorn
	name = "Heretic Scorn"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/inhumen_scorn
	weight = 10
	earliest_start = 10 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_VISIRES,
	)

/datum/round_event_control/inhumen_scorn/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/visires))
			continue
		if(!(H.dna?.species.id in RACES_PLAYER_NONHERETICAL))
			continue
		return TRUE

	return FALSE

/datum/round_event/inhumen_scorn/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/visires))
			continue
		if(!(human_mob.dna?.species.id in RACES_PLAYER_NONHERETICAL))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/inhumen_scorn/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE VISIRES'S CHOSEN!"),
		span_notice("Visires wishes you to insult a heretic! Spit in the face of a heretic to earn her favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/magic/bless.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
