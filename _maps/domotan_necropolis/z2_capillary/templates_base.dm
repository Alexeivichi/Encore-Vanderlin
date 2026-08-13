//The second lowest level of the Necropolis
//Generic spawns do not spawn this far down
#define NECROPOLIS_Z2_TEMPLATES list("z2_corridor_base")
#define NECROPOLIS_Z2_CORRIDORS list("z2_corridor_1", "z2_corridor_2", "z2_corridor_3")
#define NECROPOLIS_Z2_PILLARS list("z2_pillar_1")

/obj/effect/landmark/map_load_mark/necropolis/z2
	name = "Necropolis Z2 Template Spawner"
	templates = NECROPOLIS_Z2_TEMPLATES

/obj/effect/landmark/map_load_mark/necropolis/z2_corridors
	name = "Necropolis Z2 Corridor Spawner"
	templates = NECROPOLIS_Z2_CORRIDORS

/obj/effect/landmark/map_load_mark/necropolis/z2_pillars
	name = "Necropolis Z2 Pillar Spawner"
	templates = NECROPOLIS_Z2_PILLARS

//base 25 tile size corridor
//Separated into 4 quarters
//This is the generic hall tileset
/datum/map_template/dungeon/z2_corridor_base
	name = "Z2CorridorBase"
	id = "z2_corridor_base"
	mappath = "_maps/domotan_necropolis/z2_capillary/corridor/corridor_base.dmm"

//corridor quarters are 12 tile size here
/datum/map_template/dungeon/z2_corridor_1
	name = "Z2Corridor1"
	id = "z2_corridor_1"
	mappath = "_maps/domotan_necropolis/z2_capillary/corridor/corridor_1.dmm"

/datum/map_template/dungeon/z2_corridor_2
	name = "Z2Corridor2"
	id = "z2_corridor_2"
	mappath = "_maps/domotan_necropolis/z2_capillary/corridor/corridor_2.dmm"

/datum/map_template/dungeon/z2_corridor_3
	name = "Z2Corridor3"
	id = "z2_corridor_3"
	mappath = "_maps/domotan_necropolis/z2_capillary/corridor/corridor_3.dmm"

//small four tile size structures inside of the quarter pieces
//exists purely to break up monotonous procedural generation
/datum/map_template/dungeon/z2_pillar_1
	name = "Z2Pillar1"
	id = "z2_pillar_1"
	mappath = "_maps/domotan_necropolis/z2_capillary/corridor/pillar_1.dmm"

// Respite camp
// same on every level, exactly what it sounds like
// These only really vary by area type and loot spawn
/datum/map_template/dungeon/z2_respite_camp
	name = "Z2RespiteCamp"
	id = "z2_respite_camp"
	mappath = "_maps/domotan_necropolis/z2_capillary/z2_respite_camp.dmm"
	rarity = 1
