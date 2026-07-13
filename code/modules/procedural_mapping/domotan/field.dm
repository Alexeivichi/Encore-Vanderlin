/obj/effect/landmark/mapGenerator/domotan/field
	mapGeneratorType = /datum/mapGenerator/domotanfields
	endTurfX = 200
	endTurfY = 200
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/domotanfields
	modules = list(/datum/mapGeneratorModule/ambushing,
				/datum/mapGeneratorModule/domotansnow,
				/datum/mapGeneratorModule/domotansnow/grass,
				/datum/mapGeneratorModule/domotansnow/grass/patchy,
				/datum/mapGeneratorModule/domotandirt,
				/datum/mapGeneratorModule/domotandirt/grass,
				/datum/mapGeneratorModule/domotandirt/road,
				/datum/mapGeneratorModule/domotangrass,
				/datum/mapGeneratorModule/domotangrass/grass)

/datum/mapGeneratorModule/domotansnow
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	clusterMax = 2
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/snow,
							/turf/open/floor/snow/rough)
	excluded_turfs = list(/turf/open/floor/snow/patchy)
	spawnableAtoms = list(/obj/structure/flora/grass/bush/tundra = 3,
							/obj/structure/flora/grass/bush_meagre/tundra = 14,
							/obj/structure/flora/grass/bush/wall/tall/tundra = 0.25,
							/obj/structure/flora/grass/herb/random = 1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/structure/essence_node = 0.1,
							/obj/item/natural/stone = 2,
							/obj/item/natural/rock = 4,
							/obj/item/grown/log/tree/stick = 6)
	spawnableTurfs = list(/turf/open/floor/snow/rough = 10,
							/turf/open/floor/snow/patchy = 10,
							/turf/open/floor/grass/cold = 5)
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe)

/datum/mapGeneratorModule/domotansnow/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/snow,
							/turf/open/floor/snow/rough)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 5)
	spawnableTurfs = list()
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe,
							/area/outdoors/town)

/datum/mapGeneratorModule/domotansnow/grass/patchy
		allowed_turfs = list(/turf/open/floor/snow/patchy)
		spawnableAtoms = list(/obj/structure/flora/grass/tundra = 25)

/datum/mapGeneratorModule/domotandirt
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	clusterMax = 2
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/grass/bush/tundra = 3,
							/obj/structure/flora/grass/bush_meagre/tundra = 14,
							/obj/structure/flora/grass/bush/wall/tall/tundra = 0.25,
							/obj/structure/flora/grass/herb/random = 1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 4,
							/obj/item/grown/log/tree/stick = 8,
							/obj/structure/essence_node = 0.1,
							/obj/structure/closet/dirthole/closed/loot=0.75,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage=0.5)
	spawnableTurfs = list(/turf/open/floor/dirt/road=5)
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe)

/datum/mapGeneratorModule/domotandirt/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 10)
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe,
							/area/outdoors/town,
							/area/outdoors/town/neighborhood,
							/area/outdoors/town/neighborhood/east,
							/area/outdoors/town/neighborhood/west)

/datum/mapGeneratorModule/domotandirt/road
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 5,
							/obj/item/natural/stone = 4,
							/obj/item/natural/rock = 1,
							/obj/item/grown/log/tree/stick = 4)
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe,
							/area/outdoors/town)

/datum/mapGeneratorModule/domotangrass
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	clusterMax = 2
	clusterMin = 1
	allowed_turfs = list(/turf/open/floor/grass/cold,
							/turf/open/floor/grass/yel)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/grass/bush/tundra = 3,
							/obj/structure/flora/grass/bush_meagre/tundra = 14,
							/obj/structure/flora/grass/bush/wall/tall/tundra = 0.25,
							/obj/structure/flora/grass/herb/random = 1,
							/obj/structure/flora/grass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 2,
							/obj/item/grown/log/tree/stick = 8)
	spawnableTurfs = list()
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe,
							/area/outdoors/town,
							/area/outdoors/town/neighborhood,
							/area/outdoors/town/neighborhood/east,
							/area/outdoors/town/neighborhood/west)

/datum/mapGeneratorModule/domotangrass/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/grass/cold,
							/turf/open/floor/grass/yel)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 50)
	spawnableTurfs = list()
	allowed_areas = list(/area/outdoors/basin,
							/area/outdoors/basin/safe,
							/area/outdoors/town,
							/area/outdoors/town/neighborhood,
							/area/outdoors/town/neighborhood/east,
							/area/outdoors/town/neighborhood/west)
