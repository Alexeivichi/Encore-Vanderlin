/datum/action/innate/embrace_death
	name = "Embrace Death"
	button_icon_state = "necra"

/datum/action/innate/embrace_death/Activate()
	. = ..()
	if(!isliving(owner) || !owner.mind)
		return

	var/confirm = tgui_alert(owner, "Are you ready to embrace death? You will not be able to be revived.", "Embrace Death", DEFAULT_INPUT_CHOICES)
	if(QDELETED(src) || QDELETED(owner))
		return

	if(confirm != CHOICE_CONFIRM)
		return

	owner.say("VALDALA, I AM READY!", forced = "valdala_ritual")

	owner.visible_message(
		span_warning("[owner] begins chanting Valdala's last rites!"), \
		span_warning("You feel Valdala's presence as you start the ritual...")
	)

	if(!do_after(owner, 10 SECONDS, owner))
		to_chat(owner, span_warning("The ritual was interrupted!"))
		return

	if(QDELETED(src) || QDELETED(owner))
		return

	owner.say("VALDALA, EMBRACE ME!", forced = "valdala_ritual")
	playsound(owner, 'sound/magic/churn.ogg', 80)
	ADD_TRAIT(owner, TRAIT_VALDALA_CURSE, "valdala_ritual")
	ADD_TRAIT(owner, TRAIT_BURIED_COIN_GIVEN, "valdala_ritual")
	var/mob/living/living_owner = owner
	living_owner.death()

	var/datum/objective/personal/embrace_death/objective = target
	if(!QDELETED(objective) && !objective.completed)
		objective.complete_objective()

	qdel(src)
