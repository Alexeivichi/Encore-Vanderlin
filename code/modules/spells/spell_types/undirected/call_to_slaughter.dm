/datum/action/cooldown/spell/undirected/call_to_slaughter
	name = "Call to Slaughter"
	desc = "Grants you and all allies nearby a buff to their strength, endurance, and constitution."
	button_icon_state = "call_to_slaughter"
	sound = 'sound/magic/timestop.ogg'

	spell_type = SPELL_MIRACLE
	antimagic_flags = MAGIC_RESISTANCE_HOLY
	associated_skill = /datum/attribute/skill/magic/holy
	invocation = "LAMBS TO THE SLAUGHTER!"
	invocation_type = INVOCATION_SHOUT

	charge_required = FALSE
	cooldown_time = 5 MINUTES
	spell_cost = 40

/datum/action/cooldown/spell/undirected/call_to_slaughter/cast(atom/cast_on)
	. = ..()
	for(var/mob/living/carbon/target in viewers(3, get_turf(owner)))
		if(istype(target.patron, /datum/patron/inhumen/archdevils || /datum/patron/inhumen/hertannea || /datum/patron/angros/extremist))
			target.apply_status_effect(/datum/status_effect/buff/call_to_slaughter)	//Buffs patrons in service to Hell
			to_chat(target, span_danger("You feel the ancient roiling madness call to you from beneath the Firmament, briefly empowering you."))
			return
		if(istype(target.patron, /datum/patron/inhumen/envy))
			if((target.job == "Prince Regent") || (target.job == "Prince"))
				to_chat(target, span_danger("You feel a wash of heat and the scent of iron rush past you - but the One Envy holds you apart from its path..."))	//Jealous God protects the Shirleighs
				return
			else if((target.job != "Prince Regent") || (target.job == "Prince"))
				to_chat(target, span_danger("The Jealous God cares not to shield you from the maddened blood-call of Hell."))	//But She doesn't give a shit otherwise
			continue
		if(istype(target.patron, /datum/patron/inhumen/deceivers))
			to_chat(target, span_danger("Your enigmatic patron recoils, caught unprepared by the vicious call of demonic hunger."))	//Deceiver Gods are caught unprepared
			continue
		if(istype(target.patron, /datum/patron/divine || /datum/patron/angros))
			to_chat(target, span_danger("You smell rot and taste bile as the reeking madness of the Hells crashes into you, ravenous for Flesh and Thauma. Yours."))	//Elementals and All-Aspect are Hell's biggest rivals
			continue
		if(!owner.faction_check_mob(target))
			continue
		if(target.mob_biotypes & MOB_UNDEAD)
			continue
		target.apply_status_effect(/datum/status_effect/debuff/call_to_slaughter)	//Debuffs all patrons not loyal to Hell
