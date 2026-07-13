/datum/round_event_control/mordsol_combat
	name = "Get Stronger"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/mordsol_combat
	weight = 10
	earliest_start = 5 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_MORDSOL,
	)

/datum/round_event_control/mordsol_combat/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/mordsol))
			continue
		return TRUE

	return FALSE

/datum/round_event/mordsol_combat/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/mordsol))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/improve_combat/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE MORDSOL'S CHOSEN!"),
		span_notice("Mordsol demands you prove your might! Improve your combat skills to earn Mordsol's favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/vo/male/knight/rage (6).ogg', 70)

	chosen_one.mind.announce_personal_objectives()
