/datum/antagonist/wretch
	name = ROLE_WRETCH
	roundend_category = "Wretches"
	job_rank = ROLE_WRETCH
	antagpanel_category = "Wretches"
	show_name_in_check_antagonists = TRUE
	allow_preference_switching = TRUE
	antag_flags = FLAG_ANTAG_CAP_IGNORE

	innate_traits = list(
		TRAIT_VILLAIN,
		TRAIT_NOAMBUSH,
	)

/datum/antagonist/wretch/on_gain()
	remove_job()
	var/mob/living/carbon/human/W = owner.current
	W.delete_equipment()
	W.purge_combat_knowledge()
	owner.forget_and_be_forgotten()
	move_to_spawnpoint()
	. = ..()
	W.reset_and_reroll_stats()
	owner.special_role = ROLE_WRETCH

	if(W.client)
		SSrole_class_handler.setup_class_handler(W, list(CTAG_WRETCH = 30))
	else
		RegisterSignal(W, COMSIG_MOB_LOGIN, PROC_REF(on_wretch_login))

/datum/antagonist/wretch/proc/on_wretch_login()
	SIGNAL_HANDLER
	var/mob/living/carbon/human/W = owner.current
	UnregisterSignal(W, COMSIG_MOB_LOGIN)
	if(W.client)
		SSrole_class_handler.setup_class_handler(W, list(CTAG_WRETCH = 30))

/datum/antagonist/wretch/greet()
	to_chat(owner.current, span_notice("Somewhere in your lyfe, you fell to the wrong side of civilization. Hounded by the consequences of your actions, you now threaten the peace of those who still heed the authority that condemned you."))

/datum/antagonist/wretch/on_removal()
	. = ..()
	owner?.special_role = null

/datum/antagonist/wretch/move_to_spawnpoint()
    if(LAZYLEN(GLOB.bandit_starts))
        owner.current?.forceMove(pick(GLOB.bandit_starts))
    else
        ..()
