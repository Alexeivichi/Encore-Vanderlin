/datum/round_event_control/iliope_gamble
	name = "Iliope's Game"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/iliope_gamble
	weight = 7
	earliest_start = 10 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_ILIOPE,
		TAG_GAMBLE,
		TAG_TRICKERY,
	)

/datum/round_event_control/iliope_gamble/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/iliope))
			continue
		return TRUE

	return FALSE

/datum/round_event/iliope_gamble/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/iliope))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/coin_flip/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE ILIOPE'S CHOSEN!"),
		span_notice("Iliope challenges you to a game! Simply flip a zenar and let fate decide your reward! Win the game, and Iliope's favor is yours. Lose, and your zenar is forfeit!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_air.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
