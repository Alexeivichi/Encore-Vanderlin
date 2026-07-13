/datum/round_event_control/golerkanh_crafting
	name = "Crafting Request"
	track = EVENT_TRACK_PERSONAL
	typepath = /datum/round_event/golerkanh_crafting
	weight = 7
	earliest_start = 10 MINUTES
	max_occurrences = 1
	min_players = LOWPOP_THRESHOLD

	tags = list(
		TAG_GOLERKANH,
		TAG_WORK,
	)

/datum/round_event_control/golerkanh_crafting/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return FALSE

	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!istype(H) || H.stat == DEAD || !H.client)
			continue
		if(!H.patron || !istype(H.patron, /datum/patron/divine/golerkanh))
			continue
		if(GET_MOB_SKILL_VALUE_OLD(H, /datum/attribute/skill/craft/crafting) < 3)
			continue
		return TRUE

	return FALSE

/datum/round_event/golerkanh_crafting/start()
	var/list/valid_targets = list()

	for(var/mob/living/carbon/human/human_mob in GLOB.player_list)
		if(!istype(human_mob) || human_mob.stat == DEAD || !human_mob.client)
			continue
		if(!human_mob.patron || !istype(human_mob.patron, /datum/patron/divine/golerkanh))
			continue
		if(GET_MOB_SKILL_VALUE_OLD(human_mob, /datum/attribute/skill/craft/crafting) < 3)
			continue
		valid_targets += human_mob

	if(!length(valid_targets))
		return

	var/mob/living/carbon/human/chosen_one = pick(valid_targets)

	var/datum/objective/personal/craft_shrine/new_objective = new(owner = chosen_one.mind)
	chosen_one.mind.add_personal_objective(new_objective)

	bordered_message(chosen_one, list(
		span_userdanger("YOU ARE GOLERKANH'S CHOSEN!"),
		span_notice("Goler Kanh demands a physical manifestation of devotion! Build 2 sacred pantheon crosses to earn Goler Kanh's favor!"),
	))
	chosen_one.playsound_local(chosen_one, 'sound/magic/dwarf_chant01.ogg', 100)

	chosen_one.mind.announce_personal_objectives()
