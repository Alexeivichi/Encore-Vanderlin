//The base here is a borderline unfun level of overpowered robot that defends the vault during lowpop hours.
//This, coupled with the vault's inability to be easily quickly entered and exited, should make robbery pointless.
//That is, unless there is an actual coordinated effort to confront the murderbot below.
/mob/living/simple_animal/hostile/retaliate/droid_warden
	name = "Kraf Warden"
	desc = "It's an ancient robot in pristine condition. Beneath its hissing optics is a mind wholly fixated on one purpose. By any estimation, you can assume this to involve killing, quite efficiently at that."
	faction = list(SUB_FACTION_VAULT)//Will gleefully kill anyone not authorized to enter the vault

//Sprites
	icon = 'icons/roguetown/mob/monster/droid/doll.dmi'
	icon_state = "sturmkat"
	icon_living = "sturmkat"
	icon_dead = "sturmkat_dead"
	pixel_x = -16

//Descriptors and emotes
	mob_size = MOB_SIZE_LARGE
	mob_biotypes = MOB_ROBOTIC|MOB_BEAST
	footstep_type = FOOTSTEP_MOB_HEAVY
	emote_hear = null
	emote_see = null
	verb_say = "whirrs"
	verb_ask = "drones"
	verb_exclaim = "wails"
	verb_yell = "roars"

//Audio
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')

//Vision, aggro and ai control
	ai_controller = /datum/ai_controller/droid_guard
	simple_detect_bonus = 100
	see_in_dark = 16
	retreat_distance = 0
	minimum_distance = 0
	deaggroprob = 0
	retreat_health = 0
	food_max = 1
	wander = FALSE

//Damages, health and resistances
	health = 3500
	maxHealth = 3500
	base_intents = list(/datum/intent/unarmed/droidpunch)
	melee_damage_lower = 25
	melee_damage_upper = 75
	obj_damage = 100
	environment_smash = ENVIRONMENT_SMASH_RWALLS

//Attributes
	base_constitution = 28
	base_strength = 40//lmao
	base_speed = 15
	base_endurance = 35
	base_intelligence = 16

	defprob = 15
	defdrain = 5

	dodgetime = 25

//Butchering and remains
	botched_butcher_results = null
	butcher_results = null
	perfect_butcher_results = null

/mob/living/simple_animal/hostile/retaliate/droid_warden/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	AddElement(/datum/element/ai_retaliate)
	ADD_TRAIT(src, TRAIT_NOBREATH, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_ANTIMAGIC, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOMOOD, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOHUNGER, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOFIRE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_BASHDOORS, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOPAIN, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOFALLDAMAGE1, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_BREADY, INNATE_TRAIT)

	var/datum/ai_controller/droid_guard/controller = ai_controller
	if(controller)
		controller.blackboard[BB_DROID_GUARD_SPECIAL_COOLDOWN] = 0

/mob/living/simple_animal/hostile/retaliate/droid_warden/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/droid/warden/aggro1.ogg')
		if("pain")
			return pick('sound/vo/mobs/droid/warden/pain1.ogg','sound/vo/mobs/droid/warden/pain2.ogg')
		if("death")
			return pick('sound/vo/mobs/droid/warden/death.ogg')
		if("idle")
			return pick('sound/vo/mobs/droid/warden/idle1.ogg','sound/vo/mobs/droid/warden/idle2.ogg')
		if("cidle")
			return pick('sound/vo/mobs/droid/warden/cidle.ogg')

/obj/effect/temp_visual/droid_sparks
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks"
	duration = 5
	randomdir = 0

/obj/effect/temp_visual/droid_plume
	icon = 'icons/effects/effects.dmi'
	icon_state = "jet_plume"
	duration = 2
	randomdir = 0

/mob/living/simple_animal/hostile/retaliate/droid_warden/proc/come_hither(atom/target)
	var/turf/T = get_turf(src)
	playsound(T, 'sound/vo/mobs/droid/warden/winding.ogg', 100, TRUE)

	// Visual effect
	new /obj/effect/temp_visual/droid_plume(T)

	// Pull in all mobs within range
	for(var/mob/living/L in range(7, src))
		if(L == src || L.stat == DEAD)
			continue
		L.visible_message(span_warning("[L] is yanked toward [src]!"))

		var/throw_dist = get_dist(L, src)

		// Calculate throw speed based on distance
		var/throw_speed = max(1, 3 - round(throw_dist / 3))
		L.throw_at(src, throw_dist, throw_speed)
		L.apply_damage(20, BRUTE)

	addtimer(CALLBACK(src, PROC_REF(come_hither_aftermath)), 1 SECONDS)

/mob/living/simple_animal/hostile/retaliate/droid_warden/proc/come_hither_aftermath()
	var/turf/T = get_turf(src)
	playsound(T, 'sound/vo/mobs/droid/warden/droid_punch.ogg', 600, TRUE)

	for(var/mob/living/L in range(2, src))
		if(L == src)
			continue
		L.apply_damage(15, BRUTE)
		new /obj/effect/temp_visual/droid_sparks(get_turf(L))

/mob/living/simple_animal/hostile/retaliate/droid_warden/proc/lance_sweep()

	var/turf/T = get_turf(src)
	playsound(T, 'sound/combat/wooshes/blunt/wooshhuge (1).ogg', 200, TRUE)

	T.pollute_turf(/datum/pollutant/steam, 25)

	for(var/mob/living/L in range(6, src))
		if(L == src)
			continue

		var/throw_dir = get_dir(src, L)
		var/throw_dist = max(2, 6 - get_dist(src, L))

		L.visible_message(span_danger("[L] is upturned by the forces of gravity by [src]'s mighty lance!"))
		L.throw_at(get_edge_target_turf(L, throw_dir), throw_dist, 2)
		L.apply_damage(15, BRUTE)

		// Apply a brief stun
		L.Knockdown(1 SECONDS)

/mob/living/simple_animal/hostile/retaliate/droid_warden/proc/pulverize(mob/victim)
	var/mob/living/target = victim
	src.visible_message(span_notice("[src] commands gravity to crush [target] with the heavy pommel of its lance!"))
	target.Paralyze(5)
	target.apply_damage(35, BRUTE)
	shake_camera(target, 2, 1)
	var/turf/T = get_turf(src)
	playsound(T, 'sound/vo/mobs/droid/warden/droid_punch2.ogg', 600, TRUE)

/mob/living/simple_animal/hostile/retaliate/droid_warden/proc/impale(mob/victim)
	var/mob/living/target = victim
	src.visible_message(span_notice("[src] brutally impales [target] with its mighty lance!"))
	target.Paralyze(5)
	target.apply_damage(75, BRUTE)
	shake_camera(target, 2, 1)
	var/turf/T = get_turf(src)
	playsound(T, 'sound/combat/gib (2).ogg', 100, TRUE)

/mob/living/simple_animal/hostile/retaliate/droid_warden/shirleigh
	name = "First Doman Kraf"
	faction = list(FACTION_SHIRLEIGH)//Will gleefully kill anyone who is not a Shirleigh
