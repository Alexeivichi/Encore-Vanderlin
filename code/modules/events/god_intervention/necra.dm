/datum/round_event_control/valdala_requiem
	name = "Valdala's Requiem"
	track = EVENT_TRACK_INTERVENTION
	typepath = /datum/round_event/valdala_requiem
	weight = 8
	earliest_start = 15 MINUTES
	max_occurrences = 2
	min_players = 20
	dedicated_storytellers = list(/datum/storyteller/valdala)
	allowed_storytellers = DIVINE_STORYTELLERS

	tags = list(
		TAG_VALDALA,
	)

/datum/round_event/valdala_requiem/start()
	SSmapping.add_world_trait(/datum/world_trait/valdala_requiem, 20 MINUTES)

	if(is_ascendant(VALDALA))
		for(var/mob/living/carbon/human/potential_zombie as anything in GLOB.human_list)
			if(!IS_DEADITE(potential_zombie))
				continue
			bordered_message(potential_zombie, list(
				span_danger("An overwhelming power of Valdala purifies your body and puts you to an eternal rest!")
			))
			potential_zombie.mind.remove_antag_datum(/datum/antagonist/zombie)
			potential_zombie.death()
