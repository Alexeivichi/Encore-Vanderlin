/obj/machinery/essence/reservoir
	name = "essence reservoir"
	desc = "A large glass sphere for storing massive quantities of alchemical essences."
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "essence_tank"
	density = TRUE
	anchored = TRUE
	network_priority = 2

	var/list/allowed_essence_types = list()
	var/filter_mode = FALSE
	var/whitelist_policy_mode = TRUE // TRUE for whitelist, FALSE for blacklist

	var/void_mode = FALSE
	var/void_rate = 10

/obj/machinery/essence/reservoir/Initialize()
	. = ..()
	storage.max_total = 5000
	storage.max_types = 25

/obj/machinery/essence/reservoir/process()
	if(void_mode && GLOB.thaumic_research?.has_research(/datum/thaumic_research_node/resevoir_decay))
		if(storage.total() > 0)
			var/remaining = void_rate
			var/list/types = storage.contents.Copy()
			while(remaining > 0 && length(types))
				var/essence_type = pick(types)
				var/available = storage.get(essence_type)
				if(available <= 0)
					types -= essence_type
					continue
				var/to_void = min(available, remaining, rand(1, 5))
				storage.remove(essence_type, to_void)
				remaining -= to_void
				if(storage.get(essence_type) <= 0)
					types -= essence_type
			update_appearance(UPDATE_OVERLAYS)
			var/datum/effect_system/spark_spread/quantum/void_effect = new
			void_effect.set_up(3, 0, src)
			void_effect.start()

	push_to_linked(storage)

/obj/machinery/essence/reservoir/build_allowed_types()
	if(!filter_mode || !length(allowed_essence_types))
		return ..() // Default: accept anything up to storage capacity

	var/room = storage.space()
	if(room <= 0)
		return list()

	var/list/allowed = list()
	if (whitelist_policy_mode)
		// quick add for whitelist
		for(var/essence_type in allowed_essence_types)
			allowed[essence_type] = room
	else
		// gotta invert essence list for blacklist
		for(var/essence_type in GLOB.all_essences)
			if (essence_type in allowed_essence_types) continue
			allowed[essence_type] = room
	return allowed

/obj/machinery/essence/reservoir/update_overlays()
	. = ..()
	var/essence_percent = storage.total() / storage.max_total
	if(!essence_percent)
		return
	var/level = clamp(CEILING(essence_percent * 5, 1), 1, 5)
	. += mutable_appearance(icon, "liquid_[level]", color = calculate_mixture_color())
	. += emissive_appearance(icon, "liquid_[level]", alpha = src.alpha)

/obj/machinery/essence/reservoir/examine(mob/user)
	. = ..()
	if(filter_mode)
		. += span_notice("Filter Mode: ACTIVE")
		. += span_notice("[whitelist_policy_mode ? "Allowed" : "Blocked"] types: [length(allowed_essence_types) ? "[allowed_essence_types.len]" : "all allowed (empty list)"]")
	else
		. += span_notice("Filter Mode: DISABLED")

	if(void_mode)
		. += span_warning("Void Mode: ACTIVE, destroying [void_rate] units per cycle.")

/obj/machinery/essence/reservoir/attack_hand(mob/living/user)
	. = ..()
	show_filter_menu(user)

/obj/machinery/essence/reservoir/attackby(obj/item/I, mob/user, list/modifiers)
	if(istype(I, /obj/item/essence_connector))
		return ..()

	if(istype(I, /obj/item/essence_vial))
		handle_vial(I, user) // base class covers both directions
		return

	return ..()

// Override base extract_to_vial to respect filter mode on deposit side
// Deposit via vial respects the filter; extraction is always allowed
/obj/machinery/essence/reservoir/handle_vial(obj/item/essence_vial/vial, mob/user)
	if(!vial.contained_essence || vial.essence_amount <= 0)
		extract_to_vial(vial, user)
		return

	var/essence_type = vial.contained_essence.type

	if(!is_essence_allowed(essence_type))
		to_chat(user, span_warning("This reservoir's filter does not allow [vial.contained_essence.name]."))
		return

	var/moved = storage.add(essence_type, vial.essence_amount)
	if(moved <= 0)
		to_chat(user, span_warning("The reservoir cannot accept this essence (full or too many types)."))
		return

	to_chat(user, span_info("You pour [moved] units of [vial.contained_essence.name] into the reservoir."))
	vial.essence_amount -= moved
	if(vial.essence_amount <= 0)
		vial.contained_essence = null
	vial.update_appearance(UPDATE_OVERLAYS)
	update_appearance(UPDATE_OVERLAYS)
	if(network)
		network.invalidate_cache()

/obj/machinery/essence/reservoir/proc/is_essence_allowed(essence_type)
	if(!filter_mode || !length(allowed_essence_types))
		return TRUE
	// perform a XNOR check to handle a whitelist toggle (trust me i'm smart)
	// whitelist is true, blacklist is false, condition allows essence when the IN/OUT of list matches the policy
	return ((essence_type in allowed_essence_types) == whitelist_policy_mode)

/obj/machinery/essence/reservoir/proc/toggle_filter_mode(mob/user)
	filter_mode = !filter_mode
	to_chat(user, span_info("Filter mode [filter_mode ? "enabled" : "disabled"]."))
	if(network)
		network.invalidate_cache()

/obj/machinery/essence/reservoir/proc/toggle_filter_policy(mob/user)
	whitelist_policy_mode = !whitelist_policy_mode
	to_chat(user, span_info("Filter policy is now [whitelist_policy_mode ? "whitelisting" : "blacklisting"]."))
	if(network)
		network.invalidate_cache()

/obj/machinery/essence/reservoir/proc/toggle_void_mode(mob/user)
	if(!GLOB.thaumic_research?.has_research(/datum/thaumic_research_node/resevoir_decay))
		to_chat(user, span_warning("You lack the knowledge to operate this reservoir in void mode."))
		return
	void_mode = !void_mode
	if(void_mode)
		to_chat(user, span_warning("Void mode enabled. Essences will be destroyed at [void_rate] units per cycle!"))
	else
		to_chat(user, span_info("Void mode disabled."))

/obj/machinery/essence/reservoir/proc/adjust_void_rate(mob/user)
	if(!void_mode)
		to_chat(user, span_warning("Enable void mode first."))
		return
	var/new_rate = input(user, "Set void rate (units destroyed per cycle):", "Void Rate", void_rate) as num|null
	if(isnull(new_rate))
		return
	void_rate = clamp(new_rate, 1, 50)
	to_chat(user, span_info("Void rate set to [void_rate] units per cycle."))

/obj/machinery/essence/reservoir/proc/add_essence_filter(essence_type, mob/user)
	if(essence_type in allowed_essence_types)
		to_chat(user, span_warning("Already in filter list."))
		return FALSE
	allowed_essence_types += essence_type
	var/datum/thaumaturgical_essence/essence = essence_type
	to_chat(user, span_info("[initial(essence.name)] added to filter."))
	if(network)
		network.invalidate_cache()
	return TRUE

/obj/machinery/essence/reservoir/proc/remove_essence_filter(essence_type, mob/user)
	if(!(essence_type in allowed_essence_types))
		to_chat(user, span_warning("Not in filter list."))
		return FALSE
	allowed_essence_types -= essence_type
	var/datum/thaumaturgical_essence/essence = essence_type
	to_chat(user, span_info("[initial(essence.name)] removed from filter."))
	if(network)
		network.invalidate_cache()
	return TRUE

/obj/machinery/essence/reservoir/proc/show_filter_menu(mob/user)
	var/list/options = list()
	options["Toggle Filter Mode ([filter_mode ? "ON" : "OFF"])"] = "toggle_filter"
	options["Toggle Filter Policy ([whitelist_policy_mode ? "WHITELISTING" : "BLACKLISTING"])"]  = "toggle_policy"

	if(GLOB.thaumic_research?.has_research(/datum/thaumic_research_node/resevoir_decay))
		options["Toggle Void Mode ([void_mode ? "ON" : "OFF"])"] = "toggle_void"
		if(void_mode)
			options["Adjust Void Rate ([void_rate]/cycle)"] = "adjust_void"

	options["Add Essence Type to Filter"] = "add"
	if(allowed_essence_types.len)
		options["Remove Essence Type from Filter"] = "remove"
		options["Clear All Filters"] = "clear"
	options["View Current Filters"] = "view"
	options["Cancel"] = "cancel"

	var/choice = tgui_input_list(user, "Essence Filter Configuration", "Filter Menu", options)
	if(!choice || choice == "cancel" || !Adjacent(user))
		return

	switch(options[choice])
		if("toggle_filter")
			toggle_filter_mode(user)
		if("toggle_policy")
			toggle_filter_policy(user)
		if("toggle_void")
			toggle_void_mode(user)
		if("adjust_void")
			adjust_void_rate(user)
		if("add")
			var/list/filter_options = list()
			for(var/essence_path in GLOB.all_essences)
				if(essence_path in allowed_essence_types)
					continue
				var/datum/thaumaturgical_essence/essence = essence_path
				filter_options[initial(essence.name)] = essence_path

			var/max_picks = 8 - length(allowed_essence_types)
			if(max_picks < 1)
				to_chat(user, span_warning("There are already too many essences in the filter!"))
				return

			var/list/selected = tgui_input_checkboxes(user, "Choose Essences to Add", "Filter", filter_options, 1, max_picks)
			if(!selected || !Adjacent(user))
				return

			for(var/ess in selected)
				add_essence_filter(ess, user)
		if("remove")
			if(!length(allowed_essence_types))
				to_chat(user, span_warning("There are no filters to remove!"))
				return

			var/list/filter_options = list()
			for(var/essence_type in allowed_essence_types)
				var/datum/thaumaturgical_essence/e = essence_type
				filter_options[initial(e.name)] = essence_type

			var/list/selected = tgui_input_checkboxes(user, "Choose Essences to Remove", "Remove Filter", filter_options)
			if(!selected || !Adjacent(user))
				return

			for(var/essence_type in selected)
				remove_essence_filter(essence_type, user)
		if("clear")
			allowed_essence_types.Cut()
			to_chat(user, span_info("All essence filters cleared."))
			if(network)
				network.invalidate_cache()
		if("view")
			if(!length(allowed_essence_types))
				to_chat(user, span_info("No filters configured — accepting all essence types."))
			else
				to_chat(user, span_info("[whitelist_policy_mode ? "Allowed" : "Blocked"] essence types:"))
				for(var/essence_type in allowed_essence_types)
					var/datum/thaumaturgical_essence/essence = essence_type
					to_chat(user, span_info("  - [initial(essence.name)]"))

/obj/machinery/essence/reservoir/filled
	var/list/essence_list = list()

/obj/machinery/essence/reservoir/filled/Initialize()
	. = ..()
	for(var/essence_type in essence_list)
		storage.add(essence_type, essence_list[essence_type])

/obj/machinery/essence/reservoir/filled/life
	essence_list = list(/datum/thaumaturgical_essence/life = 1000)

/obj/machinery/essence/reservoir/filled/order
	essence_list = list(/datum/thaumaturgical_essence/order = 1000)

/obj/machinery/essence/reservoir/filled/magic
	essence_list = list(/datum/thaumaturgical_essence/magic = 1000)

/obj/machinery/essence/reservoir/filled/motion
	essence_list = list(/datum/thaumaturgical_essence/motion = 1000)
