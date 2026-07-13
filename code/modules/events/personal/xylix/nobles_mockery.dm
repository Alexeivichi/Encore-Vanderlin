/datum/round_event_control/iliope_mocking_nobles
	name = "Mockery (Nobles)"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/iliope_mocking_nobles
	weight = 10
	earliest_start = 10 MINUTES
	max_occurrences = 1
	min_players = HIGHPOP_THRESHOLD

	tags = list(
		TAG_ILIOPE,
		TAG_TRICKERY,
	)

/datum/round_event_control/iliope_mocking_nobles/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client || !istype(H.patron, /datum/patron/divine/iliope) || H.is_noble())
			continue
		if(H.get_spell(/datum/action/cooldown/spell/vicious_mockery))
			return TRUE
	return FALSE

/datum/round_event/iliope_mocking_nobles/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client || !istype(H.patron, /datum/patron/divine/iliope) || H.is_noble())
			continue
		if(H.get_spell(/datum/action/cooldown/spell/vicious_mockery))
			valid_targets += H

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/mock/noble/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE ILIOPE'S CHOSEN!"),
		span_notice("Iliope demands entertainment! Viciously mock [new_objective.required_count] nobles to prove your wit and earn Iliope's favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/misc/gods/omen_air.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
