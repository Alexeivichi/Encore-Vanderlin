/obj/effect/landmark/mapGenerator/domotan/forest
	mapGeneratorType = /datum/mapGenerator/domotanforest
	endTurfX = 200
	endTurfY = 200
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/domotanforest
	modules = list(/datum/mapGeneratorModule/ambushing,
					/datum/mapGeneratorModule/domotanforestturfs,
					/datum/mapGeneratorModule/domotanforestturfs/dirt,
					/datum/mapGeneratorModule/domotanforestsnow,
					/datum/mapGeneratorModule/domotanforestsnow/grass,
					/datum/mapGeneratorModule/domotanforestsnow/grass/patchy,
					/datum/mapGeneratorModule/domotanforestgrass,
					/datum/mapGeneratorModule/domotanforestgrass/grass,
					/datum/mapGeneratorModule/domotanforestgrassgreen,
					/datum/mapGeneratorModule/domotanforestdirt,
					/datum/mapGeneratorModule/domotanforestdirt/grass,
					/datum/mapGeneratorModule/domotanforestwater)

/datum/mapGeneratorModule/domotanforestturfs
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_TURFS
	clusterMax = 5
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/snow,
							/turf/open/floor/snow/rough)
	excluded_turfs = list(/turf/open/floor/snow/patchy,
							/turf/open/floor/snow/rough)
	spawnableTurfs = list(/turf/open/floor/snow/rough = 75,
							/turf/open/floor/snow/patchy = 15,
							/turf/open/floor/grass/cold = 5,
							/turf/open/floor/dirt = 5)
	allowed_areas = list(/area/outdoors/woods,
							/area/outdoors/woods_safe,
							/area/outdoors/basin/safe)

/datum/mapGeneratorModule/domotanforestturfs/dirt
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/dirt,
							/turf/open/floor/grass,
							/turf/open/floor/grass/cold)
	excluded_turfs = list()
	spawnableTurfs = list(/turf/open/floor/dirt = 5,
							/turf/open/floor/dirt/road = 5)

/datum/mapGeneratorModule/domotanforestsnow
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	clusterMax = 3
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/snow,
							/turf/open/floor/snow/rough)
	excluded_turfs = list(/turf/open/floor/snow/patchy)
	spawnableAtoms = list(/obj/structure/flora/grass/bush/tundra = 3,
							/obj/structure/flora/grass/bush_meagre/tundra = 14,
							/obj/structure/flora/grass/bush/wall/tall/tundra = 0.25,
							/obj/structure/flora/grass/herb/random = 3,
							/obj/structure/essence_node = 0.1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/structure/chair/bench/ancientlog = 0.25,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage = 0.1,
							/obj/item/natural/stone = 2,
							/obj/item/natural/rock = 4,
							/obj/item/grown/log/tree/stick = 6)
	allowed_areas = list(/area/outdoors/woods,
							/area/outdoors/woods_safe,
							/area/outdoors/basin/safe)

/datum/mapGeneratorModule/domotanforestsnow/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 5)

/datum/mapGeneratorModule/domotanforestsnow/grass/patchy
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/snow/patchy)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 25)

/datum/mapGeneratorModule/domotanforestgrass
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	clusterMax = 3
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/grass/cold)
	spawnableAtoms = list(/obj/structure/flora/grass/bush/tundra = 3,
							/obj/structure/flora/grass/bush_meagre/tundra = 14,
							/obj/structure/flora/grass/bush/wall/tall/tundra = 0.25,
							/obj/structure/flora/grass/herb/random = 7,
							/obj/structure/essence_node = 0.1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/structure/chair/bench/ancientlog = 5,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage = 0.1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 2,
							/obj/item/grown/log/tree/stick = 8)
	allowed_areas = list(/area/outdoors/woods,
							/area/outdoors/woods_safe,
							/area/outdoors/basin/safe)

/datum/mapGeneratorModule/domotanforestgrass/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 50)

/datum/mapGeneratorModule/domotanforestgrassgreen
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/grass,
						/turf/open/floor/grass/yel)
	excluded_turfs = list(/turf/open/floor/grass/cold)
	spawnableAtoms = list(/obj/structure/flora/grass/bush = 3,
							/obj/structure/flora/grass/bush_meagre = 14,
							/obj/structure/flora/grass/bush/wall/tall = 0.25,
							/obj/structure/flora/grass = 30,
							/obj/structure/essence_node = 0.1,
							/obj/structure/flora/grass/herb/random = 1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 2,
							/obj/item/grown/log/tree/stick = 8)
	allowed_areas = list(/area/outdoors/woods,
							/area/outdoors/woods_safe,
							/area/outdoors/basin/safe,
							/area/outdoors/woods/crossroads,
							/area/outdoors/woods/heavenscoast,
							/area/outdoors/woods/whisperen,
							/area/outdoors/bog)

/datum/mapGeneratorModule/domotanforestdirt
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	clusterMax = 3
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/grass/bush = 3,
							/obj/structure/flora/grass/bush_meagre = 14,
							/obj/structure/flora/grass/bush/wall/tall/tundra = 0.25,
							/obj/structure/flora/grass/herb/random = 1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 4,
							/obj/item/grown/log/tree/stick = 8,
							/obj/structure/closet/dirthole/closed/loot= 1,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage=0.5)
	allowed_areas = list(/area/outdoors/woods,
							/area/outdoors/woods_safe,
							/area/outdoors/basin/safe,
							/area/outdoors/woods/crossroads,
							/area/outdoors/woods/heavenscoast,
							/area/outdoors/woods/whisperen,
							/area/outdoors/bog,
							/area/outdoors/woods/etgard,
							/area/outdoors/woods/lakeside)

/datum/mapGeneratorModule/domotanforestdirt/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 10)

/datum/mapGeneratorModule/domotanforestdirt/road
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 5,
							/obj/item/natural/stone = 4,
							/obj/item/natural/rock = 1,
							/obj/item/grown/log/tree/stick = 4)

/datum/mapGeneratorModule/domotanforestwater
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water,
							/turf/open/water/swamp,
							/turf/open/water/swamp/deep,
							/turf/open/water/marsh,
							/turf/open/water/marsh/deep)
	excluded_turfs = list(/turf/open/water/river)
	spawnableAtoms = list(/obj/structure/flora/grass/water = 20,
		                    /obj/structure/flora/grass/water/reeds = 30,
	                        /obj/structure/kneestingers = 2,
							/obj/structure/roguerock = 5)
	allowed_areas = list(/area/outdoors/woods,
							/area/outdoors/woods_safe,
							/area/under/cave,
							/area/outdoors/basin/safe,
							/area/outdoors/woods/crossroads,
							/area/outdoors/woods/heavenscoast,
							/area/outdoors/woods/whisperen,
							/area/outdoors/bog)
