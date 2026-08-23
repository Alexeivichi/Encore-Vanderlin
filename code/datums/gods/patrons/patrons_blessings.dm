/// Admin proc to apply or remove blessings from a character
/// Supports timed expiration, auto-removal on sleep, and dynamic flavor text injection
/datum/admins/proc/admin_bless(mob/living/carbon/human/M in GLOB.mob_list)
	set name = "Bless"
	set desc = "Bless or lift a blessing from a character"
	set category = "GameMaster.Gods"

	if(!check_rights())
		return FALSE

	var/category = input("Select Blessing Category") as null|anything in list("Divine", "Food", "Special", "Mending")
	if(!category)
		return FALSE

	var/blessing_path
	switch(category)
		if("Divine")
			blessing_path = input("Choose Divine Blessing") as null|anything in list( \
				/datum/status_effect/buff/akan, \
				/datum/status_effect/buff/mordsol, \
				/datum/status_effect/buff/beastsense, \
				/datum/status_effect/buff/trollshape, \
				/datum/status_effect/buff/divine_beauty, \
				/datum/status_effect/buff/call_to_arms, \
				/datum/status_effect/buff/craft_buff)
		if("Food")
			blessing_path = input("Choose Food Blessing") as null|anything in list( \
				/datum/status_effect/buff/foodbuff, \
				/datum/status_effect/buff/clean_plus)
		if("Special")
			blessing_path = input("Choose Special Blessing") as null|anything in list( \
				/datum/status_effect/buff/featherfall, \
				/datum/status_effect/buff/darkvision, \
				/datum/status_effect/buff/haste, \
				/datum/status_effect/buff/calm, \
				/datum/status_effect/buff/barbrage)
		if("Mending")
			var/mending_amount = input("Choose Lifeblood Amount") as null|anything in list(5, 10, 15, 20, 25, 30)
			if(!mending_amount)
				return FALSE

			if(!M || !M.reagents)
				to_chat(usr, span_warning("[M] has no reagent container."))
				return FALSE

			M.reagents.add_reagent(/datum/reagent/medicine/stronghealth, mending_amount)
			var/patron_name = (M.patron && istype(M.patron)) ? M.patron.name : "a divine presence"
			to_chat(M, span_nicegreen("You feel your body renewing. [patron_name] has renewed your body with temporary divinity."))
			to_chat(usr, span_notice("You mended [M] with [mending_amount] units of Lifeblood."))
			log_admin("[key_name(usr)] mended [key_name(M)] with [mending_amount] units of Lifeblood.")
			return TRUE

	if(!blessing_path)
		return FALSE

	var/duration_choice = input("Select Duration for the Blessing:") as null|anything in list( \
		"1 Minute", "5 Minutes", "10 Minutes", "20 Minutes", \
		"30 Minutes", "60 Minutes", "Until Sleep", "Infinite")
	if(!duration_choice)
		return FALSE

	var/until_sleep = FALSE
	var/duration = -1
	switch(duration_choice)
		if("1 Minute") duration = 1 MINUTES
		if("5 Minutes") duration = 5 MINUTES
		if("10 Minutes") duration = 10 MINUTES
		if("20 Minutes") duration = 20 MINUTES
		if("30 Minutes") duration = 30 MINUTES
		if("60 Minutes") duration = 60 MINUTES
		if("Until Sleep") until_sleep = TRUE
		if("Infinite") duration = -1

	/// Apply Blessing
	if(M.apply_status_effect(blessing_path))
		message_admins(span_notice("Admin [key_name_admin(usr)] blessed [key_name_admin(M)] with [blessing_path]! Duration: [duration_choice]."))
		log_admin("[key_name(usr)] blessed [key_name(M)] with [blessing_path] for [duration_choice].")

		M.playsound_local(get_turf(M), 'sound/magic/bless.ogg', 100, FALSE)

		var/flavor_text = get_patron_blessing_text(M, blessing_path)
		if(flavor_text)
			to_chat(M, span_nicegreen("[flavor_text]"))

		/// Set actual expiration if needed (manual override for duration_modification types)
		if(duration > 0)
			M.start_blessing_duration_timer(blessing_path, duration)

		if(until_sleep)
			M.start_blessing_sleep_monitor(blessing_path)

		var/alert_desc = flavor_text ? span_nicegreen("[flavor_text]") : span_nicegreen("A divine force blesses you!")
		M.modify_blessing_alert_desc(blessing_path, alert_desc)

		return TRUE

	/// Toggle Off: Remove if present
	else if(M.remove_status_effect(blessing_path))
		message_admins(span_notice("Admin [key_name_admin(usr)] lifted blessing [blessing_path] from [key_name_admin(M)]!"))
		log_admin("[key_name(usr)] lifted blessing [key_name(M)] from [blessing_path].")
		return TRUE

	return FALSE


/// Starts a timer to auto-remove the blessing after duration expires
/mob/living/proc/start_blessing_duration_timer(blessing_path, duration)
	spawn(duration)
		if(has_status_effect(blessing_path))
			remove_status_effect(blessing_path)
			to_chat(src, span_warning("Your blessing fades with time..."))

/// Monitors if the mob falls asleep, removing the blessing if so
/mob/living/proc/start_blessing_sleep_monitor(blessing_path)
	spawn while(has_status_effect(blessing_path))
		if(IsSleeping())
			remove_status_effect(blessing_path)
			to_chat(src, span_warning("Your blessing fades as you fall asleep..."))
			return
		sleep(10)  /// Adjust check frequency as needed

/// Dynamically modifies the alert description for the active blessing
/// Can be used to customize Trollshape or any other active buff's description
/mob/living/proc/modify_blessing_alert_desc(blessing_path, new_desc)
	if(!blessing_path || !new_desc)
		return FALSE

	var/datum/status_effect/B = get_status_effect(blessing_path)
	if(!B || !B.alert_type)
		to_chat(src, span_warning("No active buff or invalid blessing path found to modify."))
		return FALSE

	for(var/atom/movable/screen/alert/A in client.screen)
		if(istype(A, B.alert_type))
			A.desc = new_desc
			//to_chat(src, span_notice("Blessing visual updated: [new_desc]"))
			return TRUE

	to_chat(src, span_warning("Could not find active alert instance for the blessing."))
	return FALSE

/// Returns the active status effect datum for the given type if it exists on the mob
/mob/living/proc/get_status_effect(path)
	if(!status_effects)
		return null
	for(var/datum/status_effect/B in status_effects)
		if(istype(B, path))
			return B
	return null

/// Returns the immersive flavor text based on both the target's patron and the specific blessing applied
/// Falls back to generic patron text or a default generic divine message
/proc/get_patron_blessing_text(mob/living/carbon/human/M, blessing_path)
	var/patron_type = M.patron?.type
	if(!patron_type)
		return "A divine force surges through you, wrapping your soul in unseen power."

	/// Specific god -> specific blessing mapping
	var/static/list/blessing_flavor = list(
		/// Mjallidhorn
		/datum/patron/divine/mjallidhorn = list(
			/datum/status_effect/buff/beastsense = "Mjallidhorn inhales: \"Your senses sharpen and you know that no prey will escape you now.\"",
			/datum/status_effect/buff/trollshape = "Mjallidhorn grits his teeth: \"Your muscles tighten as the Storm Father gifts you a thimble of his strength.\"",
			/datum/status_effect/buff/divine_beauty = "Mjallidhorn narrows his eyes: \"A divine radiance shines upon you.\"",
			/datum/status_effect/buff/call_to_arms = "Mjallidhorn blows his warhorn: \"You hear the warcall and prepare for righteous battle!\"",
			/datum/status_effect/buff/craft_buff = "Mjallidhorn cracks his knuckles: \"You feel pride and accomplishment as your understanding for the crafts deepens.\"",
			/datum/status_effect/buff/foodbuff = "Mjallidhorn rumbles: \"Your hunger is satiated and your thirst quenched.\"",
			/datum/status_effect/buff/clean_plus = "Mjallidhorn’s waves engulf you: \"You feel fresh cleansing saltwater coat your skin.\"",
			/datum/status_effect/buff/featherfall = "Mjallidhorn exhales: \"Dark storm clouds pool around your feet to soften any fall.\"",
			/datum/status_effect/buff/darkvision = "Mjallidhorn blinks: \"You blink in unison and suddenly the dark is no longer so daunting.\"",
			/datum/status_effect/buff/haste = "Mjallidhorn snaps his fingers: \"The harsh frost nips at your heels and urges you to press on.\"",
			/datum/status_effect/buff/calm = "Mjallidhorn shifts his gaze: \"The battle rages on elsewhere. You are allowed a moment of reprieve.\"",
			/datum/status_effect/buff/barbrage = "Mjallidhorn roars: \"You hear His thunderous battlecry and feel the storm rage within you!\""
		),

		/// Visires
		/datum/patron/divine/visires = list(
			/datum/status_effect/buff/beastsense = "Visires commandeth: \"The senses are wrong to refuse. Take more of the world into your presence.\"",
			/datum/status_effect/buff/trollshape = "Visires proclaimeth: \"Burn. Crush. Rend. May this feast never end.\"",
			/datum/status_effect/buff/divine_beauty = "Visires speaketh: \"The blessing of mine Holiest visage veils you.\"",
			/datum/status_effect/buff/call_to_arms = "Visires belloweth: \"To arms! May your banner burn to its last cinder!\"",
			/datum/status_effect/buff/craft_buff = "Visires declareth: \"With unerring fervor, your hammer will strike certain.\"",
			/datum/status_effect/buff/foodbuff = "Visires blesseth: \"Hunger more, childe of mine! Tear from the firmament! Devour it all!\"",
			/datum/status_effect/buff/clean_plus = "Visires proclaims: \"In my eternal flame, cast asunder the filth!\"",
			/datum/status_effect/buff/featherfall = "Visires commandeth: \"Be free! Beat the very sky into submission 'neath your wings!\"",
			/datum/status_effect/buff/darkvision = "Visires murmurs: \"In the dark there rests only pain. You needn't suffer it any longer.\"",
			/datum/status_effect/buff/haste = "Visires ordereth: \"Be free! The firmament will spring and coil upon your step!\"",
			/datum/status_effect/buff/calm = "Visires bemoans: \"Be calm, pathetic whelp!\"",
			/datum/status_effect/buff/barbrage = "Visires declareth: \"In this heat, blood runs easy! Burn 'til it flows from the billowing clouds!\""
		),

		/// Hertannea
		/datum/patron/inhumen/hertannea = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Gani
		/datum/patron/divine/gani = list(
			/datum/status_effect/buff/beastsense = "Gani whispers: \"All things of the wild are interconnected; see them, my child.\"",
			/datum/status_effect/buff/trollshape = "Gani whispers: \"Let the power of the wilds shape your form, my child.\"",
			/datum/status_effect/buff/divine_beauty = "Gani whispers: \"Bloom with verdant beauty, my child.\"",
			/datum/status_effect/buff/call_to_arms = "Gani proclaims: \"Strike with mercy, strike with precision! The errant stem must be cut at the root.\"",
			/datum/status_effect/buff/craft_buff = "Gani whispers: \"Show me what you can create, my child.\"",
			/datum/status_effect/buff/foodbuff = "Gani whispers: \"Eat up, my dear.\"",
			/datum/status_effect/buff/clean_plus = "Gani rasps: \"Always more cleaning to do, my child.\"",
			/datum/status_effect/buff/featherfall = "Gani chuckles: \"Jump, my child. Do not fear, Mother has you.\"",
			/datum/status_effect/buff/darkvision = "Gani whispers: \"See all that the trees and roots do.\"",
			/datum/status_effect/buff/haste = "Gani encourages: \"Run as the wolves do, my child!\"",
			/datum/status_effect/buff/calm = "Gani whispers: \"Be calm, my child. Mother will keep you safe.\"",
			/datum/status_effect/buff/barbrage = "Gani proclaims: \"Feel a Mother's rage!\""
		),

		/// Pomette
		/datum/patron/divine/pomette = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Archdevil
		/datum/patron/inhumen/archdevils = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Goler Kanh
		/datum/patron/divine/golerkanh = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Deceivers
		/datum/patron/inhumen/deceivers = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Valdala
		/datum/patron/divine/valdala = list(
			/datum/status_effect/buff/beastsense = "Valdala murmurs: \"The grave knows your scent... and waits.\"",
			/datum/status_effect/buff/trollshape = "Valdala hums: \"Mass returns to earth. Let the soil remember you.\"",
			/datum/status_effect/buff/divine_beauty = "Valdala whispers: \"Even beauty rots. But for now... wear it.\"",
			/datum/status_effect/buff/call_to_arms = "Valdala states: \"Raise thy blade. All paths end the same.\"",
			/datum/status_effect/buff/craft_buff = "Valdala sighs: \"All things break. Make them, even so.\"",
			/datum/status_effect/buff/foodbuff = "Valdala croons: \"Feast whilst thou breathe. The hunger ends soon.\"",
			/datum/status_effect/buff/clean_plus = "Valdala sighs: \"Thou mayest wash flesh... but not its fate.\"",
			/datum/status_effect/buff/featherfall = "Valdala hums: \"Fall gently. The earth shall catch thee.\"",
			/datum/status_effect/buff/darkvision = "Valdala whispers: \"The dark is not empty. It welcomes.\"",
			/datum/status_effect/buff/haste = "Valdala murmurs: \"Quickly now. Time thins beneath thy feet.\"",
			/datum/status_effect/buff/calm = "Valdala soothes: \"Rest... the silence shall come for all.\"",
			/datum/status_effect/buff/barbrage = "Valdala intones: \"Rage, if thy must. The dead are silent, but not still.\""
		),

		/// Akan
		/datum/patron/divine/akan = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Erdl
		/datum/patron/divine/erdl = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// Mordsol
		/datum/patron/divine/mordsol  = list(
			/datum/status_effect/buff/beastsense = "Mordsol growls: \"A good warrior needs keen senses to protect his home. Let no evil escape you.\"",
			/datum/status_effect/buff/trollshape = "Mordsol offers: \"A strong arm is needed to lift the shield. Let me share thy burden.\"",
			/datum/status_effect/buff/divine_beauty = "Mordsol declares: \"Be proud child of Frost and wear your glory like a crown.\"",
			/datum/status_effect/buff/call_to_arms = "Mordsol bellows: \"Duty calls and victory is sure to follow!\"",
			/datum/status_effect/buff/craft_buff = "Mordsol praises: \"You know your craft like the back of your hand, child of storm.\"",
			/datum/status_effect/buff/foodbuff = "Mordsol grunts: \"A warrior can’t be strong on an empty stomach, eat up.\"",
			/datum/status_effect/buff/clean_plus = "Mordsol chuckles: \"Wash up, child! A warrior should look respectable.\"",
			/datum/status_effect/buff/featherfall = "Mordsol comments: \"Even the bold must fall with grace.\"",
			/datum/status_effect/buff/darkvision = "Mordsol declares: \"The soul of the brave shines brighter than any darkness.\"",
			/datum/status_effect/buff/haste = "Mordsol barks: \"Swift feet carry righteous blades.\"",
			/datum/status_effect/buff/calm = "Mordsol sighs: \"The hearth is warm and the time for fighting has passed. Come and rest awhile, child.\"",
			/datum/status_effect/buff/barbrage = "Mordsol roars: \"BE FILLED WITH RIGHTEOUS ANGER!\""
		),

		/// Iliope
		/datum/patron/divine/iliope = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		),

		/// One Envy
		/datum/patron/inhumen/envy = list(
			/datum/status_effect/buff/beastsense = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/trollshape = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/divine_beauty = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/call_to_arms = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/craft_buff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/foodbuff = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/clean_plus = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/featherfall = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/darkvision = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/haste = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/calm = PLACEHOLDER_PATRON_REBRANDING,
			/datum/status_effect/buff/barbrage = PLACEHOLDER_PATRON_REBRANDING
		)
	)

	/// Return specific blessing line if available
	if(blessing_flavor[patron_type] && blessing_flavor[patron_type][blessing_path])
		return blessing_flavor[patron_type][blessing_path]

	/// Generic fallback
	return "A divine force surges through you, wrapping your soul in unseen power."
