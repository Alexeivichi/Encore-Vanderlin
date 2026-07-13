// Maximum sizes here
// Micro 7x7
// Small 14x14
// Medium 20x20
// Large 30x30
// Do not place template spawners in a location that will cause these sizes to go beyond map edge
// Generic templates are found on every part of the island except old doma and the necropolis itself
#define GENERIC_SMALL_TEMPLATES list("small_generic_tile_1z_coal", "small_generic_tile_1z_shrine_fire", "small_generic_tile_1z_shrine_earth", "small_generic_tile_1z_shrine_air", "small_generic_tile_1z_shrine_frost", "small_generic_tile_1z_flowerfield", "small_generic_tile_1z_flowerfield_2", "small_generic_tile_1z_manabloom")
#define NATURAL_MEDIUM_TEMPLATES list("medium_emptycave", "medium_emptypool")

/obj/effect/landmark/map_load_mark/generic_tile
	name = "Small Generic 1Z Random Tile"
	templates = GENERIC_SMALL_TEMPLATES

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

/datum/map_template/dungeon/medium_emptycave
	name = "Medium Empty Cave"
	id = "medium_emptycave"
	mappath = "_maps/domotan_necropolis/generic/natural/medium_emptycave.dmm"

/datum/map_template/dungeon/medium_emptypool
	name = "Medium Empty Pool"
	id = "medium_emptypool"
	mappath = "_maps/domotan_necropolis/generic/natural/medium_emptypool.dmm"
