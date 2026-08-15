/datum/objective/personal/mjallidhorn_bath
	name = "Take Bath"
	category = "Mjallidhorn's Chosen"
	triumph_count = 2
	rewards = list("2 Triumphs", "Mjallidhorn grows stronger", "Permanent Serenity (-1 Stress)")

/datum/objective/personal/mjallidhorn_bath/on_creation()
	. = ..()
	if(owner?.current)
		RegisterSignal(owner.current, COMSIG_BATH_TAKEN, PROC_REF(on_bath_taken))
	update_explanation_text()

/datum/objective/personal/mjallidhorn_bath/Destroy()
	if(owner?.current)
		UnregisterSignal(owner.current, COMSIG_BATH_TAKEN)
	return ..()

/datum/objective/personal/mjallidhorn_bath/proc/on_bath_taken(datum/source)
	SIGNAL_HANDLER
	if(completed)
		return

	var/amulet_found = FALSE
	for(var/obj/item/clothing/neck/current_item in owner.current.get_equipped_items(INCLUDE_POCKETS))
		if(current_item.type in list(/obj/item/clothing/neck/psycross/silver/divine/mjallidhorn))
			amulet_found = TRUE

	if(!amulet_found)
		return

	complete_objective()

/datum/objective/personal/mjallidhorn_bath/complete_objective()
	. = ..()
	to_chat(owner.current, span_greentext("You have honored Mjallidhorn by taking a relaxing bath while wearing his amulet!"))
	adjust_storyteller_influence(MJALLIDHORN, 20)
	UnregisterSignal(owner.current, COMSIG_BATH_TAKEN)

/datum/objective/personal/mjallidhorn_bath/reward_owner()
	. = ..()
	owner.current.add_stress(/datum/stress_event/mjallidhorn_serenity)

/datum/objective/personal/mjallidhorn_bath/update_explanation_text()
	explanation_text = "Mjallidhorn is calm at the moment. Take a relaxing bath while wearing his amulet to honor him!"
