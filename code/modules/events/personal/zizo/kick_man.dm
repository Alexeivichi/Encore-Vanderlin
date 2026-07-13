/datum/round_event_control/archdevils_misandry
	name = "Hell's Misandry"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/archdevils_misandry
	weight = 10
	earliest_start = 10 MINUTES
	max_occurrences = 0
	min_players = 20

	tags = list(
		TAG_ARCHDEVILS,
		TAG_BATTLE,
	)

/datum/round_event_control/archdevils_misandry/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/inhumen/archdevils))
			continue
		if(H.gender == MALE)
			continue
		return TRUE

	return FALSE

/datum/round_event/archdevils_misandry/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/inhumen/archdevils))
			continue
		if(human_mob.gender == MALE)
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/kick_groin/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE HELL'S CHOSEN!"),
		span_notice("Mortals are weak and must be dominated. Kick a male in the nuts to satisfy the Archdevils!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_hell.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
