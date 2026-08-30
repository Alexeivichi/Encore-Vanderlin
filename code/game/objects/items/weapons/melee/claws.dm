/obj/item/weapon/extended_claw
	name = "extended claw"
	desc = "Claws that can rake flesh and tear through fabric."
	icon = 'icons/roguetown/weapons/32/fists_claws.dmi'
	icon_state = "extendedclaw"
	item_flags = ABSTRACT | DROPDEL
	force = DAMAGE_KNIFE
	minstr = 1
	item_weight = 0 GRAMS
	wbalance = HARD_TO_DODGE
	wdefense = GOOD_PARRY
	max_integrity = INTEGRITY_STANDARD
	experimental_inhand = FALSE
	possible_item_intents = list(/datum/intent/claw/cut, /datum/intent/claw/lunge, /datum/intent/claw/rend, /datum/intent/snip)

/obj/item/weapon/extended_claw/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOEMBED, INNATE_TRAIT)
	RegisterSignal(src, COMSIG_ATOM_INTEGRITY_CHANGED, PROC_REF(on_integrity_changed))

/obj/item/weapon/extended_claw/Destroy()
	UnregisterSignal(src, COMSIG_ATOM_INTEGRITY_CHANGED)
	return ..()

/obj/item/weapon/extended_claw/proc/on_integrity_changed(datum/source, old_value, new_value)
	if(new_value >= old_value || !ismob(loc))
		return
	var/mob/living/carbon/human/user = loc
	var/arm_damage = max(1, round((old_value - new_value) / 2))
	var/target_zone = user.get_active_hand() == LEFT_HANDS ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM
	user.apply_damage(arm_damage, BRUTE, target_zone, damage_type = BCLASS_CUT, can_crit = FALSE)

/obj/item/weapon/extended_claw/atom_destruction(damage_flag)
	if(ismob(loc))
		var/mob/living/carbon/human/user = loc
		var/target_zone = BODY_ZONE_L_ARM
		if(user.get_active_hand() == LEFT_HANDS)
			target_zone = BODY_ZONE_L_ARM
		else
			target_zone = BODY_ZONE_R_ARM
		user.apply_damage(40, BRUTE, target_zone, damage_type = BCLASS_CUT, can_crit = TRUE)
	. = ..()


/datum/intent/claw/lunge
	name = "lunge"
	icon_state = "inimpale"
	attack_verb = list("lunges")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	swingdelay = 3
	penfactor = 20
	misscost = 4

/datum/intent/claw/cut
	name = "cut"
	icon_state = "incut"
	attack_verb = list("cuts", "slashes")
	animname = "cut"
	blade_class = BCLASS_CUT
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	item_damage_type = "slash"
	misscost = 4
	penfactor = AP_AXE_CHOP
	swingdelay = 3

/datum/intent/claw/rend
	name = "rend"
	icon_state = "inrend"
	attack_verb = list("rends")
	animname = "cut"
	blade_class = BCLASS_CHOP
	reach = 1
	penfactor = AP_AXE_CHOP
	swingdelay = 5
	clickcd = 16
	damfactor = 1.1
	no_early_release = TRUE
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	item_damage_type = "slash"
	misscost = 8

/datum/intent/snip
	name = "snip"
	icon_state = "insnip"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	canparry = FALSE
	misscost = 0
	no_attack = TRUE
	releasedrain = 0
	blade_class = BCLASS_PUNCH


/obj/item/weapon/extended_claw/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(user.cmode)
		return NONE

	if(!isitem(interacting_with))
		return NONE

	if(!isturf(interacting_with.loc))
		return NONE

	if(!istype(user.used_intent, /datum/intent/snip))
		return NONE

	var/obj/item/item = interacting_with

	if(!item.sewrepair || !item.salvage_result) // We can only salvage objects which can be sewn!
		return NONE

	var/skill_level = GET_MOB_SKILL_VALUE_OLD(user, /datum/attribute/skill/misc/sewing)

	var/salvage_time = (7 SECONDS - (skill_level * 10))
	if(!do_after(user, salvage_time, item))
		return ITEM_INTERACT_BLOCKING

	if(item.fiber_salvage) //We're getting fiber as base if fiber is present on the item
		new /obj/item/natural/fibers(get_turf(item))

	if(istype(item, /obj/item/storage))
		var/obj/item/storage/bag = item
		bag.emptyStorage()

	var/probability = max(0, 50 - (skill_level * 10))
	if(prob(probability))
		to_chat(user, span_warning("I ruined some of the materials due to my lack of skill..."))
		playsound(item, 'sound/foley/cloth_rip.ogg', 50, TRUE)
		qdel(item)
		user.mind.add_sleep_experience(item.sewrepair, GET_MOB_ATTRIBUTE_VALUE(user, STAT_INTELLIGENCE)) //Getting exp for failing
		return ITEM_INTERACT_SUCCESS

	item.salvage_amount -= item.torn_sleeve_number
	for(var/i in 1 to item.salvage_amount)
		var/obj/item/Sr = new item.salvage_result(get_turf(item))
		Sr.color = item.color

	user.visible_message(span_notice("[user] salvages [item] into usable materials."))
	playsound(item, 'sound/items/flint.ogg', 100, TRUE) //In my mind this sound was more fitting for a scissor
	qdel(item)
	user.mind.add_sleep_experience(item.sewrepair, GET_MOB_ATTRIBUTE_VALUE(user, STAT_INTELLIGENCE))

	return ITEM_INTERACT_SUCCESS
