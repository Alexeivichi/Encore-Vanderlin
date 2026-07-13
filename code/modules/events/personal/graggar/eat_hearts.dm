/datum/round_event_control/archdevils_organs
	name = "Feast of Organs"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/archdevils_organs
	weight = 7
	earliest_start = 15 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_ARCHDEVILS,
		TAG_BLOOD,
		TAG_BATTLE,
	)

/datum/round_event_control/archdevils_organs/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/inhumen/archdevils))
			continue
		if(H.get_spell(/datum/action/cooldown/spell/extract_heart))
			continue
		return TRUE

	return FALSE

/datum/round_event/archdevils_organs/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/inhumen/archdevils))
			continue
		if(human_mob.get_spell(/datum/action/cooldown/spell/extract_heart))
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/consume_organs/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	chosen_one.add_spell(/datum/action/cooldown/spell/extract_heart)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE THE ARCHDEVILS'S CHOSEN!"),
		span_biginfo("Archdevil hungers! [new_objective.explanation_text]"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_hell.ogg', 100)

	to_chat(chosen_one, span_notice("Archdevil grants you a power to extract hearts from the dead!"))

	chosen_one.mind.announce_personal_objectives()
