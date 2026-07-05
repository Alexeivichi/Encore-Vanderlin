//The highest level of the Necropolis
//the safest part, if you could call any part safe
#define NECROPOLIS_Z3_TEMPLATES list("z3_corridor_base")
#define NECROPOLIS_Z3_CORRIDORS list("z3_corridor_1", "z3_corridor_2", "z3_corridor_3", "z3_corridor_4", "z3_corridor_5", "z3_corridor_6", "z3_corridor_7", "z3_corridor_8", "z3_corridor_9", "z3_corridor_10", "z3_corridor_11")
#define NECROPOLIS_Z3_PILLARS list("z3_pillar_1", "z3_pillar_2", "z3_pillar_3", "z3_pillar_4", "z3_pillar_5", "z3_pillar_6", "z3_pillar_7", "z3_pillar_8")

/obj/effect/landmark/map_load_mark/necropolis/z3
	name = "Necropolis Z3 Template Spawner"
	templates = NECROPOLIS_Z3_TEMPLATES

/obj/effect/landmark/map_load_mark/necropolis/z3_corridors
	name = "Necropolis Z3 Corridor Spawner"
	templates = NECROPOLIS_Z3_CORRIDORS

/obj/effect/landmark/map_load_mark/necropolis/z3_pillars
	name = "Necropolis Z3 Pillar Spawner"
	templates = NECROPOLIS_Z3_PILLARS

// Respite camp
// same on every level, exactly what it sounds like
// These only really vary by area type and loot spawn
// /datum/map_template/dungeon/z3_respite_camp
// 	name = "Z3RespiteCamp"
// 	id = "z3_respite_camp"
// 	mappath = "_maps/domotan_necropolis/z3_dermus/z3_respite_camp.dmm"

//base 25 tile size corridor
//Separated into 4 quarters
//This is the generic hall tileset
/datum/map_template/dungeon/z3_corridor_base
	name = "Z3CorridorBase"
	id = "z3_corridor_base"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_base.dmm"

//corridor quarters are 12 tile size here
/datum/map_template/dungeon/z3_corridor_1
	name = "Z3Corridor1"
	id = "z3_corridor_1"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_1.dmm"

/datum/map_template/dungeon/z3_corridor_2
	name = "Z3Corridor2"
	id = "z3_corridor_2"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_2.dmm"

/datum/map_template/dungeon/z3_corridor_3
	name = "Z3Corridor3"
	id = "z3_corridor_3"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_3.dmm"

/datum/map_template/dungeon/z3_corridor_4
	name = "Z3Corridor4"
	id = "z3_corridor_4"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_4.dmm"

/datum/map_template/dungeon/z3_corridor_5
	name = "Z3Corridor5"
	id = "z3_corridor_5"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_5.dmm"

/datum/map_template/dungeon/z3_corridor_6
	name = "Z3Corridor6"
	id = "z3_corridor_6"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_6.dmm"

/datum/map_template/dungeon/z3_corridor_7
	name = "Z3Corridor7"
	id = "z3_corridor_7"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_7.dmm"

/datum/map_template/dungeon/z3_corridor_8
	name = "Z3Corridor8"
	id = "z3_corridor_8"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_8.dmm"

/datum/map_template/dungeon/z3_corridor_9
	name = "Z3Corridor9"
	id = "z3_corridor_9"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_9.dmm"

/datum/map_template/dungeon/z3_corridor_10
	name = "Z3Corridor10"
	id = "z3_corridor_10"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_10.dmm"

/datum/map_template/dungeon/z3_corridor_11
	name = "Z3Corridor11"
	id = "z3_corridor_11"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/corridor_11.dmm"

//small four tile size structures inside of the quarter pieces
//exists purely to break up monotonous procedural generation
/datum/map_template/dungeon/z3_pillar_1
	name = "Z3Pillar1"
	id = "z3_pillar_1"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_1.dmm"

/datum/map_template/dungeon/z3_pillar_2
	name = "Z3Pillar2"
	id = "z3_pillar_2"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_2.dmm"

/datum/map_template/dungeon/z3_pillar_3
	name = "Z3Pillar3"
	id = "z3_pillar_3"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_3.dmm"

/datum/map_template/dungeon/z3_pillar_4
	name = "Z3Pillar4"
	id = "z3_pillar_4"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_4.dmm"

/datum/map_template/dungeon/z3_pillar_5
	name = "Z3Pillar5"
	id = "z3_pillar_5"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_5.dmm"

/datum/map_template/dungeon/z3_pillar_6
	name = "Z3Pillar6"
	id = "z3_pillar_6"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_6.dmm"

/datum/map_template/dungeon/z3_pillar_7
	name = "Z3Pillar7"
	id = "z3_pillar_7"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_7.dmm"

/datum/map_template/dungeon/z3_pillar_8
	name = "Z3Pillar8"
	id = "z3_pillar_8"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_8.dmm"

/datum/map_template/dungeon/z3_pillar_9
	name = "Z3Pillar9"
	id = "z3_pillar_9"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_9.dmm"

/datum/map_template/dungeon/z3_pillar_10
	name = "Z3Pillar10"
	id = "z3_pillar_10"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_10.dmm"

/datum/map_template/dungeon/z3_pillar_11
	name = "Z3Pillar11"
	id = "z3_pillar_11"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_11.dmm"

/datum/map_template/dungeon/z3_pillar_12//empty 2 by 2
	name = "Z3Pillar12"
	id = "z3_pillar_12"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_12.dmm"

/datum/map_template/dungeon/z3_pillar_13//empty 4 by 4
	name = "Z3Pillar13"
	id = "z3_pillar_13"
	mappath = "_maps/domotan_necropolis/z3_dermus/corridor/pillar_13.dmm"
