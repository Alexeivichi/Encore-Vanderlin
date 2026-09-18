#define DROIDGUARD_ATTACK_PULL 1
#define DROIDGUARD_ATTACK_TRIP 2
#define DROIDGUARD_ATTACK_POUND 3
#define DROIDGUARD_ATTACK_IMPALE 4

/datum/ai_planning_subtree/droid_guard_attack_subtree
	var/datum/ai_behavior/droid_guard_attack/attack_behavior = /datum/ai_behavior/droid_guard_attack

/datum/ai_planning_subtree/droid_guard_attack_subtree/SelectBehaviors(datum/ai_controller/controller, delta_time)
	. = ..()

	if(world.time < controller.blackboard[BB_DROID_GUARD_SPECIAL_COOLDOWN])
		return

	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(QDELETED(target))
		return

	// Choose attack type based on health and conditions
	var/attack_type = choose_attack(controller)
	controller.blackboard[BB_DROID_GUARD_ATTACK_TYPE] = attack_type

	controller.queue_behavior(attack_behavior, BB_BASIC_MOB_CURRENT_TARGET, BB_DROID_GUARD_ATTACK_TYPE)

	return SUBTREE_RETURN_FINISH_PLANNING

/datum/ai_planning_subtree/droid_guard_attack_subtree/proc/choose_attack(datum/ai_controller/controller)
	var/mob/living/simple_animal/hostile/retaliate/droid_warden/droidguard = controller.pawn
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	var/list/possible_attacks = list()
	var/list/priority_attacks = list()

	// Get distance to target for range-based decision making
	var/distance_to_target = get_dist(droidguard, target)
	var/target_in_melee = distance_to_target <= 1

	if(target_in_melee)
		priority_attacks += DROIDGUARD_ATTACK_POUND
		possible_attacks += DROIDGUARD_ATTACK_IMPALE

	// If trying to keep distance, trip them up or yank em
	if(distance_to_target >= 2)
		priority_attacks += DROIDGUARD_ATTACK_PULL

	// If no attacks are available, default to pound
	if(!length(possible_attacks))
		return DROIDGUARD_ATTACK_POUND

	// Make the final attack selection
	var/attack_choice

	// If we have priority attacks available, use those with high probability
	if(length(priority_attacks))
		if(prob(80)) // 80% chance to use a priority attack when available
			attack_choice = pick(priority_attacks)
		else // 20% chance to use any possible attack for variety
			attack_choice = pick(possible_attacks)
	else
		attack_choice = pick(possible_attacks)

	return attack_choice

/datum/ai_behavior/droid_guard_attack
	action_cooldown = 1 SECONDS
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT | AI_BEHAVIOR_MOVE_AND_PERFORM

/datum/ai_behavior/droid_guard_attack/setup(datum/ai_controller/controller, target_key, attack_type_key)
	. = ..()
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		return FALSE

	set_movement_target(controller, target)

/datum/ai_behavior/droid_guard_attack/perform(delta_time, datum/ai_controller/controller, target_key, attack_type_key)
	. = ..()
	var/mob/living/simple_animal/hostile/retaliate/droid_warden/droidguard = controller.pawn
	var/atom/target = controller.blackboard[target_key]
	var/attack_type = controller.blackboard[attack_type_key]

	if(QDELETED(target))
		finish_action(controller, FALSE)
		return

	// Perform the chosen attack
	switch(attack_type)
		if(DROIDGUARD_ATTACK_PULL)
			droidguard.visible_message(span_danger("[droidguard] holds forth a hand and yanks unseen threads around them!"))
			droidguard.come_hither(target)
			controller.set_blackboard_key(BB_DROID_GUARD_SPECIAL_COOLDOWN, world.time + 2 SECONDS)

		if(DROIDGUARD_ATTACK_POUND)
			droidguard.pulverize(target)
			controller.set_blackboard_key(BB_DROID_GUARD_SPECIAL_COOLDOWN, world.time + 2 SECONDS)

		if(DROIDGUARD_ATTACK_IMPALE)
			droidguard.visible_message(span_danger("[droidguard] twirls their weapon and prepares to thrust."))
			droidguard.impale(target)
			controller.set_blackboard_key(BB_DROID_GUARD_SPECIAL_COOLDOWN, world.time + 2 SECONDS)

		if(DROIDGUARD_ATTACK_TRIP)
			droidguard.lance_sweep()
			controller.set_blackboard_key(BB_DROID_GUARD_SPECIAL_COOLDOWN, world.time + 2 SECONDS)

	controller.set_blackboard_key(BB_DROID_GUARD_SPECIAL_COOLDOWN, world.time + 2 SECONDS)
	finish_action(controller, TRUE)

#undef DROIDGUARD_ATTACK_PULL
#undef DROIDGUARD_ATTACK_TRIP
#undef DROIDGUARD_ATTACK_POUND
#undef DROIDGUARD_ATTACK_IMPALE
