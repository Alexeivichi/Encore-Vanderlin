/datum/ai_planning_subtree/droid_guard_retaliate
	var/datum/ai_behavior/droid_guard_retaliate/retaliate_behavior = /datum/ai_behavior/droid_guard_retaliate

/datum/ai_planning_subtree/droid_guard_retaliate/SelectBehaviors(datum/ai_controller/controller, delta_time)
	. = ..()

	// Check if droid was pulled
	var/mob/living/simple_animal/hostile/retaliate/droid_warden/droidguard = controller.pawn
	if(droidguard.pulledby)
		controller.queue_behavior(retaliate_behavior, BB_BASIC_MOB_CURRENT_TARGET)
		return SUBTREE_RETURN_FINISH_PLANNING


/datum/ai_behavior/droid_guard_retaliate
	action_cooldown = 0.5 SECONDS

/datum/ai_behavior/droid_guard_retaliate/perform(delta_time, datum/ai_controller/controller, target_key)
	var/mob/living/simple_animal/hostile/retaliate/droid_warden/droidguard = controller.pawn
	var/mob/puller = droidguard.pulledby

	if(puller)
		droidguard.lance_sweep()

	finish_action(controller, TRUE)
