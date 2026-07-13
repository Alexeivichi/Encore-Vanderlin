/datum/round_event_control/akan_literacy
	name = "Get Literate"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/akan_literacy
	weight = 10
	earliest_start = 5 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_AKAN,
	)

/datum/round_event_control/akan_literacy/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	var/has_valid_target = FALSE
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.is_literate() && H.patron && istype(H.patron, /datum/patron/divine/akan))
			has_valid_target = TRUE
			break

	return has_valid_target

/datum/round_event/akan_literacy/start()
	var/list/illiterate_noc_followers = list()

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.is_literate() && H.patron && istype(H.patron, /datum/patron/divine/akan))
			illiterate_noc_followers += H

	if(!length(illiterate_noc_followers))
		return

	var/mob/living/carbon/human/chosen_illiterate = pick(illiterate_noc_followers)
	var/datum/objective/personal/literacy/new_objective = new(owner = chosen_illiterate.mind)
	chosen_illiterate.mind.add_personal_objective(new_objective)

	to_chat(chosen_illiterate, span_userdanger("YOU ARE AKAN'S CHOSEN!"))
	to_chat(chosen_illiterate, span_notice("Akan demands you get literate! Learn to read to earn Akan's favor!"))
	chosen_illiterate.playsound_local(chosen_illiterate, 'sound/ambience/noises/mystical (4).ogg', 100)

	chosen_illiterate.mind.announce_personal_objectives()
