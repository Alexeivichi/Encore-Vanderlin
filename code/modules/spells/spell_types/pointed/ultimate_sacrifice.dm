/datum/action/cooldown/spell/undirected/list_target/ultimate_sacrifice
	name = "Ultimate Sacrifice"
	button_icon_state = "revive"
	sound = null
	has_visual_effects = FALSE
	cast_range = 1

	antimagic_flags = NONE

	charge_required = FALSE
	invocation = "MORDSOL, HEAR MY PLEA!"
	invocation_type = INVOCATION_SHOUT

/datum/action/cooldown/spell/undirected/list_target/ultimate_sacrifice/get_list_targets(atom/center, target_radius = 7)
	var/list/things = list()
	if(target_radius)
		for(var/mob/living/carbon/human/H in oview(target_radius, center))
			if(H.stat != DEAD)
				continue
			things += H

	return things

/datum/action/cooldown/spell/undirected/list_target/ultimate_sacrifice/cast(mob/living/carbon/human/cast_on)
	. = ..()

	if(!isliving(owner))
		return

	if(HAS_TRAIT(cast_on, TRAIT_VALDALA_CURSE))
		to_chat(owner, span_warning("Valdala holds tight to this one."))
		return

	var/confirm = tgui_alert(owner, "Your life will be sacrificed to revive [cast_on.real_name]. You CANNOT be revived after this. Are you absolutely sure?", "Ultimate Sacrifice", list("Sacrifice Myself", "Cancel"))
	if(QDELETED(src) || QDELETED(owner) || QDELETED(cast_on) || !can_cast_spell())
		return

	if(confirm != "Sacrifice Myself")
		return

	owner.visible_message(
		span_userdanger("[owner] begins chanting Mordsol's sacrificial rites!"),
		span_userdanger("You feel Mordsol's presence around you as you prepare to give your life..."),
	)

	if(!do_after(owner, 10 SECONDS, owner))
		to_chat(owner, span_warning("The ritual was interrupted!"))
		return

	if(cast_on.stat != DEAD || QDELETED(cast_on))
		return

	owner.say("MORDSOL, I GIVE MY LIFE FOR THEIRS!", forced = "mordsol_ritual")
	owner.emote("rage", forced = TRUE)

	add_abstract_elastic_data(ELASCAT_MEDICAL, ELASDATA_ULTIMATE_REVIVE, 1)
	cast_on.revive(HEAL_ALL)
	cast_on.grab_ghost(force = TRUE, grab_spirit = TRUE)
	playsound(owner, 'sound/magic/churn.ogg', 80)
	ADD_TRAIT(owner, TRAIT_VALDALA_CURSE, "mordsol_ritual")

	if(owner.mind)
		var/datum/objective/personal/ultimate_sacrifice/objective = target
		if(objective && !objective.completed)
			objective.complete_objective()

	qdel(src)
