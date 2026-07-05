//genstuff
/obj/effect/landmark/mapGenerator/decap
	mapGeneratorType = /datum/mapGenerator/decap
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/decap
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/decapdirt,/datum/mapGeneratorModule/decaproad)


/datum/mapGeneratorModule/decapdirt
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/naturalstone, /turf/open/floor/dirt, /turf/open/floor/grass, /turf/open/floor/grass/cold, /turf/open/floor/grass/yel, /turf/open/floor/grass/red, /turf/open/floor/snow, /turf/open/floor/snow/rough)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/tree/burnt = 30,
							/obj/structure/flora/grass/bush_meagre = 25,
							/obj/structure/flora/grass/bush/tundra = 15,
							/obj/structure/flora/tree/dead_bush = 15,
							/obj/structure/flora/tree/dying_bush = 15,
							/obj/structure/flora/grass = 23,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock = 8,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/closet/dirthole/closed/loot = 3,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage = 7,
							/obj/structure/flora/grass/pyroclasticflowers = 15,
							/obj/structure/flora/grass/thorn_bush = 25,
							/obj/structure/flora/grass/herb/random = 15,
							/obj/structure/flora/ausbushes/brflowers = 12,
							/obj/structure/flora/ausbushes/sparsegrass = 12)
	spawnableTurfs = list(/turf/open/floor/dirt/ambush = 36)
	allowed_areas = list(/area/outdoors/mountains, /area/outdoors/mountains/decap, /area/outdoors/seculton, /area/outdoors/mountains/decap/miracle_caldera)

/datum/mapGeneratorModule/decaproad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/dirt/road, /turf/open/floor/sand)
	spawnableAtoms = list(/obj/item/natural/stone = 23,/obj/item/natural/rock = 8,/obj/item/grown/log/tree/stick = 6)
	allowed_areas = list(/area/outdoors/mountains, /area/outdoors/mountains/decap, /area/outdoors/seculton)
