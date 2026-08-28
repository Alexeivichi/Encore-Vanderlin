/mob/living/simple_animal/hostile/retaliate/scrabbler
	name = "scrabbler"
	desc = "A small and skittish creature native to Domotan Island. It is commonly known as a pest due to its burrowing nature and tendency to reproduce at uncontrollable scales. The horrible noises it seems to make doesn't really help its case, nor the relative lack of useful materials it yields by harvest."
	icon = 'icons/roguetown/mob/monster/scrabbler.dmi'
	icon_state = "scrabbler"
	icon_living = "scrabbler"
	icon_dead = "scrabbler_dead"
	aggro_vision_range = 4

	ai_controller = /datum/ai_controller/scrabbler

	faction = list("scrabblers")
	attack_sound = list('sound/mobs/non-humanoids/scrabblers/scrabbler_attack.ogg','sound/mobs/non-humanoids/scrabblers/scrabbler_attack_2.ogg','sound/mobs/non-humanoids/scrabblers/scrabbler_attack_3.ogg', 'sound/mobs/non-humanoids/scrabblers/scrabbler_attack_4.ogg')
	dodge_sound = 'sound/mobs/non-humanoids/scrabblers/scrabbler_yap.ogg'

	butcher_results = list(,
		/obj/item/alch/sinew = 1,
		/obj/item/alch/bone = 1,
		/obj/item/alch/viscera = 1,
	)
	perfect_butcher_results = list(
		/obj/item/alch/sinew = 2,
		/obj/item/alch/bone = 1,
		/obj/item/alch/viscera = 1,
	)

	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	density = FALSE

	health = 15
	maxHealth = 15

	melee_damage_lower = 5
	melee_damage_upper = 15

	base_constitution = 1
	base_strength = 3
	base_speed = 17

	see_in_dark = 9
	move_to_delay = 1

	defprob = 35
	defdrain = 5

	dodgetime = 17

/mob/living/simple_animal/hostile/retaliate/scrabbler/Initialize()
	. = ..()
	update_icon()
	pixel_x += rand(-15, 15)
	pixel_y += rand(-15, 15)
	AddElement(/datum/element/ai_retaliate)
	AddComponent(/datum/component/ai_aggro_system)

/obj/effect/decal/remains/scrabbler
	desc = "Some hero in the past decided the fate of this terrible creature."
	icon = 'icons/roguetown/mob/monster/scrabbler.dmi'
	icon_state = "bones"

/mob/living/simple_animal/hostile/retaliate/scrabbler/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/mobs/non-humanoids/scrabblers/scrabbler_attack.ogg','sound/mobs/non-humanoids/scrabblers/scrabbler_attack_2.ogg','sound/mobs/non-humanoids/scrabblers/scrabbler_attack_3.ogg', 'sound/mobs/non-humanoids/scrabblers/scrabbler_attack_4.ogg')
		if("pain")
			return pick('sound/mobs/non-humanoids/scrabblers/scrabbler_roar.ogg')
		if("death")
			return pick('sound/mobs/non-humanoids/scrabblers/scrabbler_death.ogg')
		if("idle")
			return pick('sound/mobs/non-humanoids/scrabblers/scrabbler_idle.ogg','sound/mobs/non-humanoids/scrabblers/scrabbler_idle_2.ogg')

/mob/living/simple_animal/hostile/retaliate/scrabbler/taunted(mob/user)
	emote("aggro")
	return
