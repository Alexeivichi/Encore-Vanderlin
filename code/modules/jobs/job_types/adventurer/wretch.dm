/datum/job/wretch
	title = "Wretch"
	tutorial = "Somewhere in your life, you fell to the wrong side of civilization. Hounded by the consequences of your actions, you now threaten the peace of those who still heed the authority that condemned you."
	department_flag = OUTSIDERS
	job_flags = (JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE | JOB_SHOW_IN_CREDITS)
	display_order = JDO_WRETCH
	faction = FACTION_NEUTRAL
	total_positions = 2
	spawn_positions = 2

	advclass_cat_rolls = list(CTAG_WRETCH = 20)
	blacklisted_species = list(SPEC_ID_HALFLING)

	is_foreigner = TRUE
	job_reopens_slots_on_death = FALSE
	same_job_respawn_delay = 30 MINUTES

	can_have_apprentices = FALSE
	traits = list(TRAIT_NOAMBUSH, TRAIT_BANDITCAMP)
	antag_role = /datum/antagonist/wretch
	cmode_music = 'sound/music/cmode/antag/combatskeleton.ogg'


/datum/job/wretch/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	..()
	if(!spawned.mind)
		return
	to_chat(spawned, span_boldwarning("You are not an antagonist in the sense you kill everyone you're near, it is up to you to pave your own story. It is your choice if you want to take the roll of a highwayman or robber, or to follow a path of redemption, as your role exists to add flavor the round."))
	to_chat(spawned, span_boldwarning("In the same manner, you are NOT an adventurer."))

/// Wretches don't HAVE a root class, just subclasses!

/datum/job/advclass/wretch
	abstract_type = /datum/job/advclass/wretch
	category_tags = list(CTAG_WRETCH)
	spawn_with_torch = TRUE


	/// An associative list of honorary titles to choose from.
	/// The key is the title, the value indicates whether it is a prefix (0) or a suffix (1)
	var/list/honoraries = list()

/datum/job/advclass/wretch/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(length(honoraries) && tgui_alert(player_client, "Do you wish for a random title? You will not receive one if you click No.", "", DEFAULT_INPUT_CHOICES) == CHOICE_YES)
		var/honorary = pick(honoraries)
		if(honoraries[honorary])
			spawned.honorary_suffix = honorary
		else
			spawned.honorary = honorary
	wretch_select_bounty(spawned)

/datum/job/advclass/wretch/proc/wretch_select_bounty(mob/living/carbon/human/H)
	var/bounty_poster = browser_input_list(H, "Who placed a bounty on you?", "Filthy Criminal", list("The Katholikos", "Noman Eastern Trade Company"))
	if(bounty_poster == "Noman Eastern Trade Company")
		GLOB.outlawed_players += H.real_name
	else
		GLOB.heretical_players += H.real_name

