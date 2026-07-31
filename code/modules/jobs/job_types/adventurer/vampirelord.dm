datum/job/vampirelord
	title = "Vampire Lord"
	tutorial = "An embodiment of the living dead, you eke out a meagre existence on the fringes of the weeping wood in your underground lair. Chances are, the mortals and their Shirleigh masters know you're here, and sooner or later your peace is going to be disturbed. If you don't disturb theirs first."
	department_flag = OUTSIDERS
	job_flags = (JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE | JOB_SHOW_IN_CREDITS)
	faction = FACTION_NEUTRAL
	total_positions = 1
	spawn_positions = 1

	is_foreigner = FALSE
	job_reopens_slots_on_death = FALSE
	same_job_respawn_delay = 30 MINUTES

	can_have_apprentices = FALSE
	traits = list(TRAIT_NOAMBUSH, TRAIT_BANDITCAMP)
	antag_role = /datum/antagonist/vampire/lord
	cmode_music = 'sound/music/cmode/antag/combatskeleton.ogg'


/datum/job/vampirelord/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	..()
	if(!spawned.mind)
		return
	to_chat(spawned, span_boldwarning("You are not an antagonist in the sense you kill everyone you're near, it is up to you to pave your own story. It is your choice if you want to take the role of a narcissistic vampire freak or a destitute creature on the road to redemption. Above all else, make the round interesting for everyone else!"))
	to_chat(spawned, span_boldwarning("In the same manner, you are NOT an adventurer."))
