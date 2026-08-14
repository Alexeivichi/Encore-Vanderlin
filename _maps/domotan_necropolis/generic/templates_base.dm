// Maximum sizes here
// Micro 7x7
// Small 14x14
// Medium 20x20
// Large 30x30
// Do not place template spawners in a location that will cause these sizes to go beyond map edge
// Generic templates are found on every part of the island except old doma and the necropolis itself
#define GENERIC_SMALL_TEMPLATES list("small_generic_tile_1z_coal", "small_generic_tile_1z_shrine_fire", "small_generic_tile_1z_shrine_angros", "small_generic_tile_1z_shrine_earth", "small_generic_tile_1z_shrine_air", "small_generic_tile_1z_shrine_frost", "small_generic_tile_1z_flowerfield", "small_generic_tile_1z_flowerfield_2", "small_generic_tile_1z_manabloom", "small_generic_tile_1z_ruin", "small_generic_tile_1z_ruin_2", "small_generic_tile_1z_ruin_3", "small_generic_tile_1z_ruin_4", "small_generic_tile_1z_ruin_5", "small_generic_tile_1z_ruin_6", "small_generic_tile_1z_ruin_7", "small_generic_tile_1z_ruin_8", "small_generic_tile_1z_ruin_9", "small_generic_tile_1z_ruin_10", "small_generic_tile_1z_pond", "small_generic_tile_1z_goblincamp", "small_generic_tile_1z_goblincamp_2", "small_generic_tile_1z_goblincamp_3", "small_generic_tile_1z_goblincamp_4", "small_generic_tile_1z_shack", "small_generic_tile_1z_shack_2", "small_generic_tile_1z_shack_3")
#define GENERIC_SMALL_TEMPLATES_2Z list("small_generic_2z_ruin", "small_generic_2z_ruin_2", "small_generic_2z_tower","small_generic_2z_tower_2", "small_generic_2z_tower_3", "small_generic_2z_tower_4", "small_generic_2z_shrine", "small_generic_2z_shrine_earth")
#define NATURAL_MEDIUM_TEMPLATES list("medium_emptycave", "medium_emptypool")

/obj/effect/landmark/map_load_mark/generic_tile
	name = "Small Generic 1Z Random Tile"
	templates = GENERIC_SMALL_TEMPLATES

/obj/effect/landmark/map_load_mark/generic_tile/2z
	name = "Small Generic 2Z Random Tile"
	templates = GENERIC_SMALL_TEMPLATES_2Z

/datum/map_template/dungeon/small_generic_tile_1z_coal
	name = "Small Generic Tile (Coal)"
	id = "small_generic_tile_1z_coal"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_coal.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shrine_fire
	name = "Small Generic Tile (Fire Shrine)"
	id = "small_generic_tile_1z_shrine_fire"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shrine_fire.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shrine_earth
	name = "Small Generic Tile (Earth Shrine)"
	id = "small_generic_tile_1z_shrine_earth"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shrine_earth.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shrine_air
	name = "Small Generic Tile (Air Shrine)"
	id = "small_generic_tile_1z_shrine_air"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shrine_air.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shrine_frost
	name = "Small Generic Tile (Frost Shrine)"
	id = "small_generic_tile_1z_shrine_frost"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shrine_frost.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shrine_angros
	name = "Small Generic Tile (Angrosian Shrine)"
	id = "small_generic_tile_1z_shrine_angros"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shrine_angros.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_flowerfield
	name = "Small Generic Tile (Flower Field)"
	id = "small_generic_tile_1z_flowerfield"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_flowerfield.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_flowerfield_2
	name = "Small Generic Tile (Flower Field 2)"
	id = "small_generic_tile_1z_flowerfield_2"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_flowerfield_2.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_manabloom
	name = "Small Generic Tile (Manabloom)"
	id = "small_generic_tile_1z_manabloom"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_manabloom.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin
	name = "Small Generic Tile (Ruin 1)"
	id = "small_generic_tile_1z_ruin"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_2
	name = "Small Generic Tile (Ruin 2)"
	id = "small_generic_tile_1z_ruin_2"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_2.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_3
	name = "Small Generic Tile (Ruin 3)"
	id = "small_generic_tile_1z_ruin_3"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_3.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_4
	name = "Small Generic Tile (Ruin 4)"
	id = "small_generic_tile_1z_ruin_4"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_4.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_5
	name = "Small Generic Tile (Ruin 5)"
	id = "small_generic_tile_1z_ruin_5"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_5.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_6
	name = "Small Generic Tile (Ruin 6)"
	id = "small_generic_tile_1z_ruin_6"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_6.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_7
	name = "Small Generic Tile (Ruin 7)"
	id = "small_generic_tile_1z_ruin_7"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_7.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_8
	name = "Small Generic Tile (Ruin 8)"
	id = "small_generic_tile_1z_ruin_8"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_8.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_9
	name = "Small Generic Tile (Ruin 9)"
	id = "small_generic_tile_1z_ruin_9"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_9.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_ruin_10
	name = "Small Generic Tile (Ruin 10)"
	id = "small_generic_tile_1z_ruin_10"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_ruin_10.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_pond
	name = "Small Generic Tile (Pond)"
	id = "small_generic_tile_1z_pond"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_pond.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_goblincamp
	name = "Small Generic Tile (Goblin Camp 1)"
	id = "small_generic_tile_1z_goblincamp"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_goblincamp.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_goblincamp_2
	name = "Small Generic Tile (Goblin Camp 2)"
	id = "small_generic_tile_1z_goblincamp_2"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_goblincamp_2.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_goblincamp_3
	name = "Small Generic Tile (Goblin Camp 3)"
	id = "small_generic_tile_1z_goblincamp_3"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_goblincamp_3.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_goblincamp_4
	name = "Small Generic Tile (Goblin Camp 4)"
	id = "small_generic_tile_1z_goblincamp_4"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_goblincamp_4.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shack
	name = "Small Generic Tile (Shack)"
	id = "small_generic_tile_1z_shack"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shack.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shack_2
	name = "Small Generic Tile (Shack 2)"
	id = "small_generic_tile_1z_shack_2"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shack_2.dmm"

/datum/map_template/dungeon/small_generic_tile_1z_shack_3
	name = "Small Generic Tile (Shack 3)"
	id = "small_generic_tile_1z_shack_3"
	mappath = "_maps/domotan_necropolis/generic/small_generic_tile_1z_shack_3.dmm"

/datum/map_template/dungeon/small_generic_2z_ruin
	name = "Small Generic Tile (2Z Ruin 1)"
	id = "small_generic_2z_ruin"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_ruin.dmm"

/datum/map_template/dungeon/small_generic_2z_ruin_2
	name = "Small Generic Tile (2Z Ruin 2)"
	id = "small_generic_2z_ruin_2"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_ruin_2.dmm"

/datum/map_template/dungeon/small_generic_2z_tower
	name = "Small Generic Tile (2Z Tower 1)"
	id = "small_generic_2z_tower"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_tower.dmm"

/datum/map_template/dungeon/small_generic_2z_tower_2
	name = "Small Generic Tile (2Z Tower 2)"
	id = "small_generic_2z_tower_2"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_tower_2.dmm"

/datum/map_template/dungeon/small_generic_2z_tower_3
	name = "Small Generic Tile (2Z Tower 3)"
	id = "small_generic_2z_tower_3"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_tower_3.dmm"

/datum/map_template/dungeon/small_generic_2z_tower_4
	name = "Small Generic Tile (2Z Tower 4)"
	id = "small_generic_2z_tower_4"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_tower_4.dmm"

/datum/map_template/dungeon/small_generic_2z_shrine
	name = "Small Generic Tile (2Z Shrine)"
	id = "small_generic_2z_shrine"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_shrine.dmm"

/datum/map_template/dungeon/small_generic_2z_shrine_earth
	name = "Small Generic Tile (2Z Earth Shrine)"
	id = "small_generic_2z_shrine_earth"
	mappath = "_maps/domotan_necropolis/generic/small_generic_2z_shrine_earth.dmm"

/datum/map_template/dungeon/medium_emptycave
	name = "Medium Empty Cave"
	id = "medium_emptycave"
	mappath = "_maps/domotan_necropolis/generic/natural/medium_emptycave.dmm"

/datum/map_template/dungeon/medium_emptypool
	name = "Medium Empty Pool"
	id = "medium_emptypool"
	mappath = "_maps/domotan_necropolis/generic/natural/medium_emptypool.dmm"
