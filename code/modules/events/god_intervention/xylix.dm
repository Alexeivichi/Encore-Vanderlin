/datum/round_event_control/iliope_fortune
	name = "Iliope's Fortune"
	track = EVENT_TRACK_INTERVENTION
	typepath = /datum/round_event/iliope_fortune
	weight = 8
	earliest_start = 15 MINUTES
	max_occurrences = 1
	min_players = MIDPOP_THRESHOLD
	dedicated_storytellers = list(/datum/storyteller/iliope)
	allowed_storytellers = DIVINE_STORYTELLERS

	tags = list(
		TAG_ILIOPE,
	)

/datum/round_event_control/iliope_fortune/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE
	if(GLOB.patron_follower_counts[/datum/patron/divine/iliope::name] < 2)
		return FALSE

/datum/round_event/iliope_fortune/start()
	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue

		if(!human_mob.patron || (!is_ascendant(ILIOPE) && !istype(human_mob.patron, /datum/patron/divine/iliope)))
			continue

		var/luck_roll = rand(-3, 6)
		human_mob.adjust_stat_modifier(STATMOD_ILIOPE_FORTUNE, list(STAT_FORTUNE = luck_roll))

		bordered_message(human_mob, list(
			span_biginfo("You have caught Iliope's attention and you can feel your fortune changing... Whether you'll laugh or weep about it later... well, that's part of the fun!")
		))
		human_mob.playsound_local(human_mob, 'sound/misc/gods/omen_air.ogg', 100)
