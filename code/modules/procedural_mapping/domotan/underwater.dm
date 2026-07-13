/obj/effect/landmark/mapGenerator/domotan/underwater
	mapGeneratorType = /datum/mapGenerator/underwater
	endTurfX = 200
	endTurfY = 200
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/underwater
	modules = list(/datum/mapGeneratorModule/underwater)

/datum/mapGeneratorModule/underwater
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water)
	spawnableAtoms = list(/obj/structure/flora/rock/coral = 7,
							/obj/structure/flora/rock/water = 14,
							/obj/structure/flora/ocean_plants = 35,
							/obj/structure/flora/kelp = 25,)
	allowed_areas = list(/area/under/underwater)
