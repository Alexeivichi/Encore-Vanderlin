/datum/ai_controller/droid_guard
	movement_delay = 0.5 SECONDS
	ai_movement = /datum/ai_movement/hybrid_pathing
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
		BB_DROID_GUARD_SPECIAL_COOLDOWN = 0,
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/droid_guard_retaliate,
		/datum/ai_planning_subtree/aggro_find_target,
		/datum/ai_planning_subtree/droid_guard_attack_subtree,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

	idle_behavior = /datum/idle_behavior/idle_random_walk
