// Mob spawners specifically for the Necropolis
// these differ from ambush spawns in the fact that they are guarunteed for shenanigans, preventing traversing the entire thing without any danger
#define NECROPOLIS_MOBS_TRIVIAL list(/obj/item/reagent_containers/food/snacks/smallrat = 20, /mob/living/simple_animal/hostile/retaliate/bigrat = 15)
#define NECROPOLIS_MOBS_EASY list(/mob/living/carbon/human/species/goblin/npc/cave = 30, /mob/living/simple_animal/hostile/retaliate/bogbug = 20, /mob/living/simple_animal/hostile/retaliate/spider = 15)
#define NECROPOLIS_MOBS_ORCS list(/mob/living/simple_animal/hostile/orc/spear = 20, /mob/living/simple_animal/hostile/orc/ranged = 20, /mob/living/simple_animal/hostile/retaliate/lamia = 20, /mob/living/carbon/human/species/goblin/npc/cave = 15)
#define NECROPOLIS_MOBS_ORCS_HARD list(/mob/living/simple_animal/hostile/orc/orc_marauder/ravager = 20, /mob/living/simple_animal/hostile/orc/ranged = 15)
#define NECROPOLIS_MOBS_DEEPONES list(/mob/living/simple_animal/hostile/deepone = 30, /mob/living/simple_animal/hostile/deepone/arm = 15)
#define NECROPOLIS_MOBS_DEEPONES_HARD list(/mob/living/simple_animal/hostile/deepone/wiz = 30, /mob/living/simple_animal/hostile/deepone/spit = 35)
#define NECROPOLIS_MOBS_ANIMALS_SMALL list(/mob/living/simple_animal/hostile/retaliate/raccoon = 30, /mob/living/simple_animal/hostile/retaliate/bigrat = 30, /mob/living/simple_animal/hostile/retaliate/bobcat = 30, /mob/living/simple_animal/hostile/retaliate/bogbug = 30, /mob/living/simple_animal/hostile/retaliate/fox = 30, /mob/living/simple_animal/hostile/retaliate/bat = 30, /mob/living/simple_animal/hostile/retaliate/frog = 30)
#define NECROPOLIS_MOBS_ANIMALS_MEDIUM list(/mob/living/simple_animal/hostile/retaliate/spider = 30, /mob/living/simple_animal/hostile/retaliate/wolf = 30, /mob/living/simple_animal/hostile/mirespider_lurker = 30)

/obj/effect/spawner/map_spawner/necropolis/mob_spawner
	name = "Trivial Necropolis Mob Spawner"
	icon_state = "raiseskele"
	icon = 'icons/mob/actions/roguespells.dmi'
	probby = 50
	color = "#48ff00"
	spawned = NECROPOLIS_MOBS_TRIVIAL

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/easy
	name = "Easy Necropolis Mob Spawner"
	color = "#eeff00"
	spawned = NECROPOLIS_MOBS_EASY

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/orcs
	name = "Orc Necropolis Mob Spawner"
	icon = 'icons/roguetown/mob/monster/simple_orcs.dmi'
	icon_state = "savageorc"
	color = "#0084ff"
	spawned = NECROPOLIS_MOBS_ORCS

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/orcs/hard
	name = "Orc Necropolis Mob Spawner"
	icon = 'icons/roguetown/mob/monster/simple_orcs.dmi'
	icon_state = "orcmarauder"
	color = "#ff0000"
	spawned = NECROPOLIS_MOBS_ORCS_HARD

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/deepones
	name = "Deep Ones Necropolis Mob Spawner"
	icon = 'icons/roguetown/mob/monster/fishman.dmi'
	icon_state = "deep1_spit"
	color = "#0084ff"
	spawned = NECROPOLIS_MOBS_DEEPONES

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/deepones/hard
	name = "Deep Ones Necropolis Mob Spawner"
	color = "#ff0000"
	spawned = NECROPOLIS_MOBS_DEEPONES_HARD

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/goblin
	name = "Goblin Necropolis Mob Spawner"
	probby = 100
	spawned = list(/mob/living/carbon/human/species/goblin/npc/cave = 100)

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/animal
	name = "Small Animal Mob Spawner"
	probby = 100
	spawned = NECROPOLIS_MOBS_ANIMALS_SMALL

/obj/effect/spawner/map_spawner/necropolis/mob_spawner/animal/medium
	name = "Medium Animal Mob Spawner"
	probby = 100
	spawned = NECROPOLIS_MOBS_ANIMALS_MEDIUM
