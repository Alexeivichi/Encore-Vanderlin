/obj/machinery/essence/cauldron_alchemy
	name = "cauldron"
	desc = "Bubble, Bubble, toil and trouble. A great iron cauldron for brewing potions from alchemical essences."
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "cauldron1"
	var/base_state = "cauldron" // TODO - something to do with overlay that was dropped from the old fuel light
	opacity = FALSE
	anchored = TRUE
	accepts_input = TRUE
	accepts_output = TRUE
	network_priority = 3

	var/brewing = 0
	var/is_brewing = FALSE
	var/datum/weakref/lastuser

	var/datum/alch_cauldron_recipe/selected_recipe = null
	/// How many units of potion this brew is set to make (1-100). Water and essences scale from this.
	var/brew_units = 0

	/// Ticks of heat needed before a brew resolves.
	var/brew_time = 20

/obj/machinery/essence/cauldron_alchemy/Initialize()
	. = ..()
	if(reagents)
		QDEL_NULL(reagents)
	create_reagents(100, DRAINABLE | AMOUNT_VISIBLE | DRAWABLE)
	reagents.maximum_volume = 100
	storage.max_total = 300
	storage.max_types = 6
	START_PROCESSING(SSobj, src)

/obj/machinery/essence/cauldron_alchemy/Destroy()
	STOP_PROCESSING(SSobj, src)
	lastuser = null
	if(selected_recipe)
		qdel(selected_recipe)
		selected_recipe = null
	return ..()

/obj/machinery/essence/cauldron_alchemy/push_to_linked(datum/essence_storage/from_storage)
	push_surplus_to_linked(from_storage)

/obj/machinery/essence/cauldron_alchemy/build_allowed_types()
	if(!selected_recipe || is_brewing)
		return list()
	var/list/allowed = list()
	for(var/essence_type in selected_recipe.required_essences)
		var/needed_total = selected_recipe.required_essences[essence_type]
		var/already_have = storage.get(essence_type)
		var/deficit = needed_total - already_have
		if(deficit > 0)
			allowed[essence_type] = deficit
	return allowed

/obj/machinery/essence/cauldron_alchemy/get_mechanics_examine(mob/user)
	. = ..()
	if(is_brewing)
		. += span_notice("Brewing in progress…")
	if(brewing > 0)
		. += span_notice("The mixture is boiling. ([brewing]/[brew_time])")
	if(reagents?.total_volume)
		. += span_notice("There is [reagents.total_volume] ligulae of brewed potions in the cauldron.")

	if(selected_recipe)
		. += span_info("Recipe selected: [initial(selected_recipe.recipe_name)] ([brew_units] units)")
		. += span_notice("Required essences:")
		for(var/datum/thaumaturgical_essence/etype as anything in selected_recipe.required_essences)
			var/needed = selected_recipe.required_essences[etype]
			var/have = storage.get(etype)
			var/color = (have >= needed) ? "green" : "red"
			. += span_notice("  <font color='[color]'>[initial(etype.name)]: [have]/[needed]</font>")
		if(recipe_complete())
			. += span_info("<font color='green'>Ready to brew!</font>")
	else
		. += span_notice("No recipe selected. Click with empty hand to choose a potion and amount.")

/obj/machinery/essence/cauldron_alchemy/attack_hand(mob/user)
	if(!user.default_can_use_topic(src))
		return
	if(is_brewing)
		to_chat(user, span_warning("[src] is currently brewing."))
		return
	show_main_menu(user)

/obj/machinery/essence/cauldron_alchemy/proc/show_recipe_selection(mob/user, browse_only)
	var/list/opts = list()

	for(var/recipe_path in subtypesof(/datum/alch_cauldron_recipe))
		var/datum/alch_cauldron_recipe/recipe = new recipe_path
		var/key = "[recipe.recipe_name] - [get_recipe_summary(recipe)]"
		opts[key] = recipe_path
		qdel(recipe)

	if(!opts)
		to_chat(user, span_warning("No brew recipes available."))
		return

	var/choice = browser_input_list(user,
		browse_only ? "Browse Recipe Details" : "Select a recipe for the cauldron",
		"Cauldron Recipes", opts)

	if(!choice || !user.default_can_use_topic(src)) return

	var/recipe_path = opts[choice]
	if(browse_only)
		var/datum/alch_cauldron_recipe/recipe = new recipe_path
		show_recipe_details(user, recipe)
		qdel(recipe)
	else
		select_recipe(user, recipe_path)

/obj/machinery/essence/cauldron_alchemy/proc/select_recipe(mob/user, datum/alch_cauldron_recipe/recipe_path)
	var/units = tgui_input_number(user, "How many units of [recipe_path.recipe_name] do you want to brew? A full pot is 100.", "Brew Amount", 100, 100, 1)
	if(!units || !user.default_can_use_topic(src))
		return
	units = clamp(round(units), 1, 100)

	// update or replace selected recipe and then handle essence requirements
	if(selected_recipe) qdel(selected_recipe)
	selected_recipe = new recipe_path
	scale_recipe_to_units(selected_recipe, units)
	if(network) network.invalidate_cache()
	push_surplus_to_linked(storage)
	to_chat(user, span_info("Recipe set to [initial(selected_recipe.recipe_name)] ([brew_units] units)."))
	show_recipe_details(user, selected_recipe)
	update_appearance(UPDATE_OVERLAYS)

// adjust our recipe essence requirements based on how much we want to brew
/obj/machinery/essence/cauldron_alchemy/proc/scale_recipe_to_units(datum/alch_cauldron_recipe/recipe, units)
	brew_units = units
	if(!recipe)
		return
	for(var/essence_type in recipe.required_essences)
		var/base_amount = recipe.required_essences[essence_type]
		recipe.required_essences[essence_type] = max(1, CEILING((base_amount * units) / 100, 1))
	for(var/reagent in recipe.output_reagents)
		recipe.output_reagents[reagent] = units
	// add 1 water essence per 10 units we want to brew
	recipe.required_essences[/datum/thaumaturgical_essence/water] += max(1, CEILING((10 * units) / 100, 1))
	// add a flat 5 fire essence for brew heating tax
	recipe.required_essences[/datum/thaumaturgical_essence/fire] += 5

/obj/machinery/essence/cauldron_alchemy/proc/clear_recipe(mob/user)
	if(!selected_recipe) return
	qdel(selected_recipe)
	selected_recipe = null
	if(network) network.invalidate_cache()
	push_surplus_to_linked(storage)
	brew_units = 0
	brewing = 0
	to_chat(user, span_info("Recipe cleared."))
	update_appearance(UPDATE_OVERLAYS)

/obj/machinery/essence/cauldron_alchemy/update_overlays()
	. = ..()
	var/mutable_appearance/filling
	if(is_brewing)
		filling = mutable_appearance('icons/roguetown/misc/alchemy.dmi', "cauldron_boiling")
	else if(reagents?.total_volume || LAZYLEN(storage.contents))
		filling = mutable_appearance('icons/roguetown/misc/alchemy.dmi', "cauldron_full")
	if(!filling)
		return
	filling.color = calculate_mixture_color()
	. += filling

/obj/machinery/essence/cauldron_alchemy/proc/has_required_essences()
	if(!selected_recipe)
		return FALSE
	for(var/essence_type in selected_recipe.required_essences)
		var/required = selected_recipe.required_essences[essence_type]
		var/current = storage.get(essence_type) || 0
		if(current < required)
			return FALSE
	return TRUE

/obj/machinery/essence/cauldron_alchemy/process()
	if(!is_brewing && selected_recipe && !recipe_complete()) pull_from_linked(storage)
	// play some cool boiling sounds while it's brewing, finish when "done"
	if(is_brewing)
		if(brewing < brew_time)
			brewing++
			update_appearance(UPDATE_OVERLAYS)
			if(prob(10))
				playsound(src, "bubbles", 100, FALSE)
			return
		finish_brew()

/obj/machinery/essence/cauldron_alchemy/proc/recipe_complete()
	if(!selected_recipe)
		return FALSE
	for(var/etype in selected_recipe.required_essences)
		if(storage.get(etype) < selected_recipe.required_essences[etype])
			return FALSE
	return TRUE

/obj/machinery/essence/cauldron_alchemy/proc/begin_brew(mob/living/user)
	if(!selected_recipe || !recipe_complete()) return
	if(reagents?.total_volume >= 100)
		to_chat(user, span_warning("The cauldron is too full to brew anything!"))
		return

	lastuser = WEAKREF(user) // brew initiator gets credit

	for(var/etype in selected_recipe.required_essences)
		storage.remove(etype, selected_recipe.required_essences[etype])
	brewing = 0
	is_brewing = TRUE
	update_appearance(UPDATE_OVERLAYS)
	playsound(src, "bubbles", 100, FALSE)
	to_chat(user, span_info("You begin brewing [selected_recipe.recipe_name]…"))

/obj/machinery/essence/cauldron_alchemy/proc/finish_brew()
	if(selected_recipe.output_reagents && reagents)
		reagents.maximum_volume = 100
		reagents.add_reagent_list(selected_recipe.output_reagents.Copy())

	if(length(selected_recipe.output_items))
		for(var/itempath in selected_recipe.output_items)
			new itempath(get_turf(src))

	visible_message(span_info("The cauldron finishes boiling with a faint [selected_recipe.smells_like] smell."))

	is_brewing = FALSE
	brewing = 0
	if(lastuser)
		var/mob/living/L = lastuser.resolve()
		if(L)
			record_featured_stat(FEATURED_STATS_ALCHEMISTS, L)
			record_round_statistic(STATS_POTIONS_BREWED, 1)
			var/boon = L.get_learning_boon(/datum/attribute/skill/craft/alchemy)
			var/amt2raise = GET_MOB_ATTRIBUTE_VALUE(L, STAT_INTELLIGENCE) * 2
			L.adjust_experience(/datum/attribute/skill/craft/alchemy, amt2raise * boon, FALSE)

	playsound(src, "bubbles", 100, TRUE)
	playsound(src, 'sound/misc/smelter_fin.ogg', 30, FALSE)
	if(network) network.invalidate_cache()
	update_appearance(UPDATE_OVERLAYS)

/obj/machinery/essence/cauldron_alchemy/proc/calculate_mixture_color()
	if(!length(storage.contents))
		return "#4A90E2"

	var/total_weight = 0
	var/r = 0
	var/g = 0
	var/b = 0

	for(var/essence_type in storage.contents)
		var/datum/thaumaturgical_essence/essence = new essence_type
		var/amount = storage.contents[essence_type]
		var/weight = amount * (essence.tier + 1)

		total_weight += weight
		var/color_string = essence.color
		if(length(color_string) >= 7)
			r += hex2num(copytext(color_string, 2, 4)) * weight
			g += hex2num(copytext(color_string, 4, 6)) * weight
			b += hex2num(copytext(color_string, 6, 8)) * weight
		qdel(essence)

	if(total_weight <= 0)
		return "#4A90E2"

	return rgb(FLOOR(r / total_weight, 1), FLOOR(g / total_weight, 1), FLOOR(b / total_weight, 1))

/obj/machinery/essence/cauldron_alchemy/proc/show_recipe_progress(mob/user)
	if(!selected_recipe) return
	to_chat(user, span_info("Progress for '[selected_recipe.recipe_name]':"))
	for(var/datum/thaumaturgical_essence/etype as anything in selected_recipe.required_essences)
		var/needed = selected_recipe.required_essences[etype]
		var/have = storage.get(etype)
		var/color = (have >= needed) ? "green" : "red"
		to_chat(user, span_info(" <font color='[color]'>[initial(etype.name)]: [have]/[needed]</font>"))
	if(recipe_complete())
		to_chat(user, span_info("<font color='green'>Ready to brew!</font>"))

/obj/machinery/essence/cauldron_alchemy/proc/show_recipe_details(mob/user, datum/alch_cauldron_recipe/recipe)
	if(!recipe) return
	to_chat(user, span_info("=== [recipe.recipe_name] ==="))
	if(recipe.output_reagents)
		for (var/datum/reagent/brew_reagent as anything in recipe.output_reagents)
			to_chat(user, span_info("[brew_reagent.name]: [brew_reagent.description ? brew_reagent.description : "... usage was left blank."]"))

	to_chat(user, span_info("Required essences:"))
	for(var/datum/thaumaturgical_essence/etype as anything in recipe.required_essences)
		to_chat(user, span_info(" [initial(etype.name)]: [recipe.required_essences[etype]] units"))
	qdel(recipe)

/obj/machinery/essence/cauldron_alchemy/proc/get_recipe_summary(datum/alch_cauldron_recipe/recipe)
	var/list/parts = list()
	for(var/datum/thaumaturgical_essence/etype as anything in recipe.required_essences)
		parts += "[recipe.required_essences[etype]] [initial(etype.name)]"
	return jointext(parts, ", ")

/obj/machinery/essence/cauldron_alchemy/proc/purge_cauldron(mob/user)
	if(selected_recipe) clear_recipe(user)
	if(reagents?.total_volume) reagents.clear_reagents()
	if(LAZYLEN(storage.contents)) storage.clear()
	if(network) network.invalidate_cache()
	update_appearance(UPDATE_OVERLAYS)

/obj/machinery/essence/cauldron_alchemy/proc/show_main_menu(mob/user)
	var/list/opts = list()
	if(selected_recipe && recipe_complete())
		opts["Begin Brewing"] = "brew"
	else if(selected_recipe)
		opts["Check Recipe Progress"] = "progress"
	opts["Select Recipe"] = "recipe"
	if(selected_recipe)
		opts["Clear Recipe"] = "clear"
		opts["Recipe Details"] = "details"
	opts["Browse All Recipes"] = "browse"
	opts["Purge Cauldron Contents"] = "purge"
	opts["Cancel"] = "cancel"

	var/choice = browser_input_list(user, "Cauldron Menu", "[src.name]", opts)
	if(!choice || choice == "cancel") return
	switch(opts[choice])
		if("brew") begin_brew(user)
		if("progress") show_recipe_progress(user)
		if("recipe") show_recipe_selection(user, FALSE)
		if("clear") clear_recipe(user)
		if("details") show_recipe_details(user, selected_recipe)
		if("browse") show_recipe_selection(user, TRUE)
		if("purge") purge_cauldron(user)
