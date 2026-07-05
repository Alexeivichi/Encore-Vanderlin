// Clutter spawners specifically for the Necropolis
// These differ from the mapgenerators in that they allow a more specific touch to where things spawn
// these also are probably more efficient given the system Encore uses
#define NECROPOLIS_CLUTTER_GENERIC list(/obj/structure/flora/grass = 30, /obj/item/natural/stone = 15, /obj/item/natural/rock = 12, /obj/structure/closet/dirthole/closed/loot=0.1, /obj/structure/flora/rock/jungle = 1)
#define NECROPOLIS_CLUTTER_SHROOMS list(/obj/structure/kneestingers = 3, /obj/structure/flora/grass/mushroom = 3, /obj/structure/flora/shroom_tree = 2, /obj/structure/wild_plant/nospread/mushroom/waddle = 4, /obj/structure/wild_plant/nospread/mushroom/merkel = 4, /obj/structure/wild_plant/nospread/mushroom/caveweep = 5, /obj/structure/wild_plant/nospread/mushroom/capillus = 5, /obj/structure/wild_plant/nospread/mushroom/borowiki = 5)
#define NECROPOLIS_CLUTTER_WATER list(/obj/structure/flora/grass/water = 35, /obj/structure/flora/grass/water/reeds = 5, /obj/structure/flora/rock/jungle = 5)
#define NECROPOLIS_CLUTTER_TECH list(/obj/machinery/light/fueledstreet = 3, /obj/machinery/light/fueledstreet/blue = 3)
#define NECROPOLIS_TILESPAWNER_WATER list(/turf/open/water/ocean = 3, /turf/open/floor/dirt = 2)
#define NECROPOLIS_TILESPAWNER_ROCKWALL list(/turf/closed/mineral = 15, /turf/closed/mineral/random/low_valuable = 3)
#define NECROPOLIS_DIRTY_SPAWNER list(/obj/effect/decal/cleanable/dirt/dust = 15, /obj/effect/decal/cleanable/dirt/dust = 15, /obj/structure/spider/stickyweb = 5, /obj/structure/spider/stickyweb/solo = 5)

/obj/effect/spawner/map_spawner/necropolis
	name = "Necropolis Generic Clutter"
	icon_state = "grass"
	icon = 'icons/obj/structures_spawners.dmi'
	probby = 75
	color = "#1100ff"
	spawned = NECROPOLIS_CLUTTER_GENERIC

/obj/effect/spawner/map_spawner/necropolis/shroom_clutter
	name = "Necropolis Mushroom Clutter"
	icon_state = "tree"
	icon = 'icons/mob/actions/roguespells.dmi'
	probby = 45
	color = "#48ff00"
	spawned = NECROPOLIS_CLUTTER_SHROOMS

/obj/effect/spawner/map_spawner/necropolis/water_clutter
	name = "Necropolis Water Clutter"
	icon_state = "kneestinger"
	icon = 'icons/mob/actions/roguespells.dmi'
	probby = 35
	color = "#a200ff"
	spawned = NECROPOLIS_CLUTTER_WATER

/obj/effect/spawner/map_spawner/necropolis/tech_clutter
	name = "Necropolis Tech Clutter"
	icon_state = "heal"
	icon = 'icons/mob/actions/roguespells.dmi'
	probby = 15
	color = "#ff0080"
	spawned = NECROPOLIS_CLUTTER_TECH

/obj/effect/spawner/map_spawner/necropolis/water_tiles
	name = "Necropolis Water Randomizer"
	icon_state = "heal"
	icon = 'icons/mob/actions/roguespells.dmi'
	probby = 35
	color = "#001aff"
	spawned = NECROPOLIS_TILESPAWNER_WATER

/obj/effect/spawner/map_spawner/necropolis/random_rock_wall
	name = "Necropolis Rock Wall Randomizer"
	icon_state = "lesserheal"
	icon = 'icons/mob/actions/roguespells.dmi'
	probby = 15
	color = "#8a6515"
	spawned = NECROPOLIS_TILESPAWNER_ROCKWALL

/obj/effect/spawner/map_spawner/necropolis/random_dirty
	name = "Necropolis Filth Randomizer"
	icon_state = "dirt"
	icon = 'icons/effects/effects.dmi'
	probby = 75
	color = "#533c09"
	spawned = NECROPOLIS_DIRTY_SPAWNER
