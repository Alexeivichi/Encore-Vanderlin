/datum/action/cooldown/spell/angroslux_tamper
	name = "WEEP"
	spell_type = SPELL_ANGROSIC_MIRACLE
	spell_flags = SPELL_ANGROS

	spell_cost = 40
	charge_time = 1
	cast_range = 2
	sound = 'sound/magic/psydonbleeds.ogg'
	invocation = "I BLEED, SO THAT YOU MIGHT ENDURE!"
	invocation_type = "shout"
	associated_skill = /datum/attribute/skill/magic/holy
	cooldown_time = 1 MINUTES // 60 seconds cooldown
	button_icon_state = "WEEP"

/datum/action/cooldown/spell/angroslux_tamper/cast(mob/living/carbon/human/H)
	. = ..()
	var/mob/living/user = owner
	if(!ishuman(H))
		to_chat(user, span_warning("I cannot merge my Thauma with Daemonic beings."))
		return FALSE

	if(H == user)
		to_chat(user, span_warning("I refuse to tamper with my own Thauma."))
		return FALSE

	if(H.stat == DEAD)
		to_chat(user, span_warning("[H]'s Thauma is gone. I can't do anything, anymore."))
		user.emote("cry")
		return FALSE

	// Transfer wounds.
	if(ishuman(H) && ishuman(user))
		var/mob/living/carbon/human/C_target = H
		var/mob/living/carbon/human/C_caster = user
		var/list/datum/wound/tw_List = C_target.get_wounds()

		if(!tw_List.len)
			return FALSE

		//Transfer wounds from each bodypart.
		for(var/datum/wound/targetwound in tw_List)
			if (istype(targetwound, /datum/wound/dismemberment))
				continue
			if (istype(targetwound, /datum/wound/facial))
				continue
			if (istype(targetwound, /datum/wound/fracture/head))
				continue
			if (istype(targetwound, /datum/wound/fracture/neck))
				continue
			if (istype(targetwound, /datum/wound/cbt/permanent))
				continue
			var/obj/item/bodypart/c_BP = C_caster.get_bodypart(targetwound.bodypart_owner.body_zone)
			c_BP.add_wound(targetwound.type)
			var/obj/item/bodypart/t_BP = C_target.get_bodypart(targetwound.bodypart_owner.body_zone)
			t_BP.remove_wound(targetwound.type)


	// Visual effects
	user.visible_message(span_danger("[user] shoulders [H]'s wounds!"))
	playsound(user, 'sound/magic/psydonbleeds.ogg', 50, TRUE)

	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97")

	// Notify the user and target
	to_chat(user, span_notice("You purify their Thauma with the merging of theirs and your own, for a mote."))
	to_chat(H, span_info("You feel a strange stirring sensation pour over your Thauma, stealing your wounds."))

	return TRUE
