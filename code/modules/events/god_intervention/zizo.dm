/datum/round_event_control/envy_defilement
	name = "The One Envy's Defilement"
	track = EVENT_TRACK_INTERVENTION
	typepath = /datum/round_event/envy_defilement
	weight = 8
	earliest_start = 15 MINUTES
	max_occurrences = 2
	min_players = MIDPOP_THRESHOLD
	dedicated_storytellers = list(/datum/storyteller/envy)
	allowed_storytellers = INHUMEN_STORYTELLERS

	tags = list(
		TAG_ENVY,
	)

/datum/round_event/envy_defilement/start()
	SSmapping.add_world_trait(/datum/world_trait/envy_defilement, 20 MINUTES)

	if(is_ascendant(ENVY))
		for(var/mob/living/carbon/human/potential_zombie as anything in GLOB.human_list)
			if(potential_zombie.stat != DEAD)
				continue
			if(potential_zombie.mind?.has_antag_datum(/datum/antagonist/zombie))
				continue
			var/datum/antagonist/zombie/zombie_datum = potential_zombie.zombie_check()
			if(!zombie_datum)
				continue
			zombie_datum.wake_zombie()

			bordered_message(potential_zombie, list(
				span_danger("An overwhelming power of the One Envy commands you! RISE AND RAVAGE!")
			))
