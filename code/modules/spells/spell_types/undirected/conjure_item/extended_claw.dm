/datum/action/innate/extend_claws
	name = "Extend Claws"
	desc = "Extend your claws."
	button_icon_state = "giants_strength"

	var/obj/item/weapon/extended_claw/claws

/datum/action/innate/extend_claws/Destroy(force)
	if(!QDELETED(claws))
		qdel(claws)
	claws = null
	return ..()

/datum/action/innate/extend_claws/Activate()
	. = ..()

	if(!owner.check_stamina(5))
		owner.balloon_alert(owner, "exhausted!")
		return

	owner.adjust_stamina(5)

	if(QDELETED(claws))
		claws = new(owner)

	if(!owner.put_in_active_hand(claws))
		owner.balloon_alert(owner, "hand full!")
		clean_fists()
		return

	owner.balloon_alert_to_viewers("extends [owner.p_their()] claws")
	RegisterSignal(claws, COMSIG_QDELETING, PROC_REF(clean_fists))
	active = TRUE

/datum/action/innate/extend_claws/Deactivate()
	. = ..()

	if(QDELETED(claws))
		return

	owner.balloon_alert_to_viewers("retracts [owner.p_their()] claws")
	clean_fists()
	active = FALSE

/datum/action/innate/extend_claws/proc/clean_fists()
	SIGNAL_HANDLER

	if(!QDELETED(claws))
		qdel(claws)
	active = FALSE
	build_all_button_icons(UPDATE_BUTTON_STATUS)
	claws = null
