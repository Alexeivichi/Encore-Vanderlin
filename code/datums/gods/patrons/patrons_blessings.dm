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
			/datum/status_effect/buff/beastsense = "Hertannea smoothly speaks: \"So many secrets are held from your lovely eyes...\"",
			/datum/status_effect/buff/trollshape = "Hertannea whispers: \"Your body could be capable of so much more. Go on, grow stronger.\"",
			/datum/status_effect/buff/divine_beauty = "Hertannea rasps: \"You're trying to be as beautiful as me? Brave of you.\"",
			/datum/status_effect/buff/call_to_arms = "Hertannea smoothly demands: \"My palace could use more corpses. Pile them high.\"",
			/datum/status_effect/buff/craft_buff = "Hertannea imagines out loud: \"A masterpiece to hang on my wall...\"",
			/datum/status_effect/buff/foodbuff = "Hertannea blissfully wonders: \"The richest banquet...\"",
			/datum/status_effect/buff/clean_plus = "Hertannea remarks: \"Even I have standards. Do you think I live in a pig sty?\"",
			/datum/status_effect/buff/featherfall = "Hertannea mutters: \"You can try falling. You'll probably survive.\"",
			/datum/status_effect/buff/darkvision = "Hertannea smoothly whispers: \"The dark can't hide the light from you forever. Let's hasten that.\"",
			/datum/status_effect/buff/haste = "Hertannea smoothly urges: \"Put those muscles to good work and move fast, won't you?\"",
			/datum/status_effect/buff/calm = "Hertannea gives questionable reassurance: \"Fear doesn't look good on you when you're alive.\"",
			/datum/status_effect/buff/barbrage = "Hertannea shouts rudely: \"I'm exhausted of watching your tiresome life! Pillage and plunder, already!\""
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
			/datum/status_effect/buff/beastsense = "Pomette whispers, \"You should see what the wilder things see...\"",
			/datum/status_effect/buff/trollshape = "Pomette urges, \"Grow bigger! Bigger, still! There's so much more a mortal body can do!\"",
			/datum/status_effect/buff/divine_beauty = "Pomette reassures, \"You're perfect just the way you are!\"",
			/datum/status_effect/buff/call_to_arms = "Pomette mulls, \"Oh... is this the time to fight?\"",
			/datum/status_effect/buff/craft_buff = "Pomette yaps, \"You can make anything! Your mind is so bright!\"",
			/datum/status_effect/buff/foodbuff = "Pomette murmurs, \"Hungry again...\"",
			/datum/status_effect/buff/clean_plus = "Pomette blabbers needlessly, \"Spick and span, tidy and neat!\"",
			/datum/status_effect/buff/featherfall = "Pomette reassures, \"You can fall forever! For now...?\"",
			/datum/status_effect/buff/darkvision = "Pomette shouts, \"Cat's eyes!\"",
			/datum/status_effect/buff/haste = "Pomette urges, \"Quick feet! Mother's not looking!\"",
			/datum/status_effect/buff/calm = "Pomette soothes, \"Come on, now... I get scared sometimes, too...\"",
			/datum/status_effect/buff/barbrage = "Pomette worries, \"Don't make too big a mess, okay?\""
		),

		/// Archdevil
		/datum/patron/inhumen/archdevils = list(
			/datum/status_effect/buff/beastsense = "Hell calls, \"The forma of old sight embraces your true self. See the unseen.\"",
			/datum/status_effect/buff/trollshape = "Hell calls, \"The forma of the first men embraces your true self. Grow and endure as they did.\"",
			/datum/status_effect/buff/divine_beauty = "Hell calls, \"The forma of lustor embraces your true self. Walk in the light of purest beauty.\"",
			/datum/status_effect/buff/call_to_arms = "Hell calls, \"The forma of war embraces your true self. Feed the inferno.\"",
			/datum/status_effect/buff/craft_buff = "Hell calls, \"The forma of discipline embraces your true self. Craft your masterwork, and live eternally in its memory.\"",
			/datum/status_effect/buff/foodbuff = "Hell calls, \"The forma of flavor embraces your true self. Embody Hell's kitchen.\"",
			/datum/status_effect/buff/clean_plus = "Hell calls, \"The forma of purity embraces your true self. Cleanse the world of its mundane filth.\"",
			/datum/status_effect/buff/featherfall = "Hell calls, \"The forma of gravity embraces your true self. Even a fall from the Firmament shall bring you no harm.\"",
			/datum/status_effect/buff/darkvision = "Hell calls, \"The forma of Lunae embraces your true self. Behold the light beyond the darkness.\"",
			/datum/status_effect/buff/haste = "Hell calls, \"The forma of energy embraces your true self. Burst forth like lightning.\"",
			/datum/status_effect/buff/calm = "Hell calls, \"The forma of clarity embraces your true self. Be soothed, knowing all will succumb to the fire in time.\"",
			/datum/status_effect/buff/barbrage = "Hell calls, \"The forma of fury embraces your true self. Bring Hell's rage upon them all!\""
		),

		/// Goler Kanh
		/datum/patron/divine/golerkanh = list(
			/datum/status_effect/buff/beastsense = "Goler Kanh deeply intones, \"See. Imperfections. So subtle.\"",
			/datum/status_effect/buff/trollshape = "Goler Kanh deeply drones, \"Flesh. More powerful. Joined with steel.\"",
			/datum/status_effect/buff/divine_beauty = "Goler Kanh deeply booms, \"You are perfection.\"",
			/datum/status_effect/buff/call_to_arms = "Goler Kanh deeply intones, \"The machines. They cry war.\"",
			/datum/status_effect/buff/craft_buff = "Goler Kanh deeply rumbles, \"Waste not. My guiding hand.\"",
			/datum/status_effect/buff/foodbuff = "Goler Kanh deeply intones, \"A full belly. Is the beginning. Of masterwork.\"",
			/datum/status_effect/buff/clean_plus = "Goler Kanh deeply growls, \"Disorganized. Inefficient. Remedy.\"",
			/datum/status_effect/buff/featherfall = "Goler Kanh deeply speaks, \"Gravity. A mason's enemy. But, now. No concern to you.\"",
			/datum/status_effect/buff/darkvision = "Goler Kanh deeply intones, \"Darkness. An illusion. Behold truth.\"",
			/datum/status_effect/buff/haste = "Goler Kanh deeply urges, \"Your stamina. Lacking. Remedy.\"",
			/datum/status_effect/buff/calm = "Goler Kanh deeply intones, \"Erring focus. The early doom of perfection. Be calm.\"",
			/datum/status_effect/buff/barbrage = "Goler Kanh deeply commands, \"A worker's hand. Must be strong. Embrace the heating of blood. Embody fury.\""
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
			/datum/status_effect/buff/beastsense = "The winds pick up and reveal the truth of your surroundings.",
			/datum/status_effect/buff/trollshape = "Father's winds pierce your skin, twisting it into the likeness of an ancient beast.",
			/datum/status_effect/buff/divine_beauty = "You know that you'd be the star of the court of the sky. Your beauty gleams in the light. You look like a breath of fresh air...",
			/datum/status_effect/buff/call_to_arms = "Ancient drums pound in your head. Huge gears turn the world over. The path of war is yours to command.",
			/datum/status_effect/buff/craft_buff = "You feel able to craft a treasure which would cause even Father to turn his gaze toward you!",
			/datum/status_effect/buff/foodbuff = "A banquet to rouse the whole of the heavens is easily within your grasp.",
			/datum/status_effect/buff/clean_plus = "It feels as if this is a recently-left home, and you're empowered to clean it.",
			/datum/status_effect/buff/featherfall = "A gust of air thrusts into your feet from below, making it clear that a fall from any height will do you no harm.",
			/datum/status_effect/buff/darkvision = "You attempt to see the horizon, and in that clarity, Father's gale parts the darkness for you.",
			/datum/status_effect/buff/haste = "Your legs feel lighter than ever. Like lightning you can move, and like a cloud you can soar.",
			/datum/status_effect/buff/calm = "Akan sets his gaze upon you! All of a sudden, tranquility. Everything will be fine.",
			/datum/status_effect/buff/barbrage = "A maelstrom wells up within your heart. You are the crushing gust. You are the whipping gale. Take their breath away."
		),

		/// Erdl
		/datum/patron/divine/erdl = list(
			/datum/status_effect/buff/beastsense = "Your blood calls upon an ancient memory. Your eyes shift in their sockets, and after a moment of sightlessness, things seem clearer to you all of a sudden.",
			/datum/status_effect/buff/trollshape = "Your blood calls upon an ancient memory. Your veins bulge out and glow a deep red. Your body mutates into a beast-like form.",
			/datum/status_effect/buff/divine_beauty = "Your blood calls upon an ancient memory. Your face grows finer, your hair thicker and fairer, and your body more healthy in appearance. The impeccable beauty of the perfect lifeform!",
			/datum/status_effect/buff/call_to_arms = "Your blood calls upon an ancient memory. Pieces of a game fall into place, and the way this ends is obvious. The waging of war is so simple now.",
			/datum/status_effect/buff/craft_buff = "Your blood calls upon an ancient memory. The hands of a forgotten craftsman now share your own.",
			/datum/status_effect/buff/foodbuff = "Your blood calls upon an ancient memory. Good food is timeless.",
			/datum/status_effect/buff/clean_plus = "Your blood calls upon an ancient memory. This environment is hardly sterile. You're compelled to fix it.",
			/datum/status_effect/buff/featherfall = "Your blood calls upon an ancient memory. Your bones feel lighter, and your step feels springy. You could fall from any height and be unphased...",
			/datum/status_effect/buff/darkvision = "Your blood calls upon an ancient memory. Your eyes take the form of a cat's, and in an instant, the darkness hardly bothers you anymore.",
			/datum/status_effect/buff/haste = "Your blood calls upon an ancient memory. Your legs deepen in tone, heft and power. You're faster than a bullet.",
			/datum/status_effect/buff/calm = "Your blood calls upon an ancient memory. It warms, soothing you as something courses through your veins.",
			/datum/status_effect/buff/barbrage = "Your blood calls upon an ancient memory. Fury engulfs you."
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
			/datum/status_effect/buff/beastsense = "A fool's eyes replace your own!",
			/datum/status_effect/buff/trollshape = "The fool speaks to an unseen audience: \"And now, the beast of the show!\"",
			/datum/status_effect/buff/divine_beauty = "The fool draws open a curtain: \"And behold, the most beautiful of them all!\"",
			/datum/status_effect/buff/call_to_arms = "The fool booms: \"And so, the great commander's tact was reborn!\"",
			/datum/status_effect/buff/craft_buff = "The fool frollicks along the stage, and pulls along a masterwork. It's an exact depiction of what you wish to create, and it practically commands inspiration from your soul.",
			/datum/status_effect/buff/foodbuff = "The fool shouts: \"And so, at the behest of the tyrant, the hero's hand would be made to boast the finest of cullinary expertise!\"",
			/datum/status_effect/buff/clean_plus = "The fool declares: \"Cut! Clean up this mess, show's over!\"",
			/datum/status_effect/buff/featherfall = "The fool shouts: \"And now, the impossibility of trapeze in life before you!\"",
			/datum/status_effect/buff/darkvision = "The spotlights slam their shutters open, illuminating everything around you! It's your show, now...",
			/datum/status_effect/buff/haste = "The fool shouts: \"Alacrity!\"",
			/datum/status_effect/buff/calm = "A somber tune erupts from all around, as if you were comfortably seated in a far theater booth. Aside you, dear friends and fine wine. You're entranced in an unforgettable moment.",
			/datum/status_effect/buff/barbrage = "The fool recalls: \"With the death of his dignity, the soul of the barbarian was enraged! Oh, how his madness was frightening!\""
		),

		/// One Envy
		/datum/patron/inhumen/envy = list(
			/datum/status_effect/buff/beastsense = "Your eyes feel like they're burning as you gain a slightly better view of what's ahead. A horrible presence is at your side.",
			/datum/status_effect/buff/trollshape = "Blackened tendrils slowly rise around your peripheral. Your body bloats into a muscular, abominable form. In its strength, you feel bliss.",
			/datum/status_effect/buff/divine_beauty = "Your skin is burning with something unholy. It commands the respect of those around you. You feel beautiful.",
			/datum/status_effect/buff/call_to_arms = "It feels as if you could lead an army. Banners you don't recognize wave eagerly at the edges of your vision.",
			/datum/status_effect/buff/craft_buff = "Dark hands wrap around your forearms and grasp your own, seeming to guide your craft.",
			/datum/status_effect/buff/foodbuff = "You feel as if you could cook anything.",
			/datum/status_effect/buff/clean_plus = "All of a sudden, you feel compelled to cleanse this world of its impurity.",
			/datum/status_effect/buff/featherfall = "A dark cloud winds around your legs that only you can see. It feels as if you could fall from any height unscathed.",
			/datum/status_effect/buff/darkvision = "A black fog blinds you. When you blink, you see everything, and you find nothing can stay your vision any longer...",
			/datum/status_effect/buff/haste = "Your legs feel as if they move on their own. You could outrun a horse. As you peer down, your veins are a deathly black. Only you can apparently notice it.",
			/datum/status_effect/buff/calm = "You're somehow soothed knowing there's something far, far worse in your proximity than anything else that could possibly bother you.",
			/datum/status_effect/buff/barbrage = "Burning eyes of amber set their gaze upon you. You're engulfed in a furious rage as they flash away."
		)
	)

	/// Return specific blessing line if available
	if(blessing_flavor[patron_type] && blessing_flavor[patron_type][blessing_path])
		return blessing_flavor[patron_type][blessing_path]

	/// Generic fallback
	return "A divine force surges through you, wrapping your soul in unseen power."
