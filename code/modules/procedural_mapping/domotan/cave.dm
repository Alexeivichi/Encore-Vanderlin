/obj/effect/landmark/mapGenerator/domotan/cave
	mapGeneratorType = /datum/mapGenerator/domotancaves
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/domotancaves
	modules = list(/datum/mapGeneratorModule/ambushing,
				/datum/mapGeneratorModule/domotancave,
				/datum/mapGeneratorModule/domotancave/dirt,
				/datum/mapGeneratorModule/domotancave/sewers,
				/datum/mapGeneratorModule/domotancave/wet,
				/datum/mapGeneratorModule/domotancave/smugglertunnels)

/datum/mapGeneratorModule/domotancave
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	clusterMax = 3
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/naturalstone)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/roguerock = 5,
							/obj/item/natural/stone = 10,
							/obj/structure/essence_node = 0.2,
							/obj/item/natural/rock = 3,
							/obj/item/natural/rock/random = 0.5)
	spawnableTurfs = list(/turf/open/floor/cobblerock = 25,
							/turf/open/floor/dirt = 10)
	allowed_areas = list(/area/under/cave,
							/area/under/cavewet)

/datum/mapGeneratorModule/domotancave/dirt
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	clusterMax = 3
	clusterMin = 2
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/grass/herb/random = 1,
							/obj/item/grown/log/tree/stick = 4,
							/obj/structure/flora/grass/bush_meagre/tundra = 1)
	spawnableTurfs = list()
	allowed_areas = list(/area/under/cave,
							/area/under/cavewet)

/datum/mapGeneratorModule/domotancave/sewers
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/sewer, /turf/open/floor/blocks/green, /turf/open/floor/naturalstone)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/kneestingers = 15,
							/obj/structure/spider/stickyweb = 25,
							/obj/item/natural/stone = 25,
							/obj/item/natural/wood/plank = 5,
							/obj/structure/flora/driftwood = 5,
							/obj/structure/roguerock = 3)
	spawnableTurfs = list()
	allowed_areas = list(/area/under/town/sewer)

/datum/mapGeneratorModule/domotancave/wet
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water, /turf/open/floor/naturalstone, /turf/open/floor/dirt, /turf/open/floor/sand)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/kneestingers = 3,
							/obj/structure/flora/grass/water = 4,
							/obj/structure/flora/grass/mushroom = 8,
							/obj/structure/flora/shroom_tree = 8,
							/obj/structure/flora/grass/water/reeds = 8,
							/obj/structure/wild_plant/nospread/mushroom/waddle = 4,
							/obj/structure/wild_plant/nospread/mushroom/merkel = 4,
							/obj/structure/wild_plant/nospread/mushroom/caveweep = 4,
							/obj/structure/wild_plant/nospread/mushroom/capillus = 4,
							/obj/structure/wild_plant/nospread/mushroom/borowiki = 4)
	spawnableTurfs = list()
	allowed_areas = list(/area/under/cavewet)

/datum/mapGeneratorModule/domotancave/smugglertunnels
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/ruinedwood/darker, /turf/open/floor/twig)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/kneestingers = 4,
							/obj/structure/spider/stickyweb = 12,
							/obj/effect/decal/cleanable/dirt = 35,
							/obj/item/natural/stone = 25,
							/obj/item/natural/wood/plank = 5,
							/obj/structure/flora/driftwood = 5,
							/obj/structure/roguerock = 3,
							/obj/structure/lootable_structure/grain_barrel = 0.5,
							/obj/structure/lootable_structure/mining_cache = 0.1,
							/obj/structure/lootable_structure/fish_barrel = 0.1,
							/obj/structure/lootable_structure/powder_sack = 0.5,
							/obj/structure/closet/crate/chest/crate = 0.6,
							/obj/structure/barricade/wooden = 0.2,
							/obj/effect/spawner/map_spawner/loot/common = 0.1,
							/obj/effect/spawner/map_spawner/loot/medium = 0.1,)
	spawnableTurfs = list()
	allowed_areas = list(/area/under/town/basement/smugglers_tunnels)
