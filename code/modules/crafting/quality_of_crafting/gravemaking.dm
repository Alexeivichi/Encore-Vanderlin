/datum/repeatable_crafting_recipe/gravemaking
	abstract_type = /datum/repeatable_crafting_recipe/gravemaking
	skillcraft = /datum/attribute/skill/craft/masonry
	category = "Headstones"
	subtypes_allowed = TRUE

// Headstones

/datum/repeatable_crafting_recipe/gravemaking/peaked_headstone
	name = "peaked headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone
	craftdiff = 2

/datum/repeatable_crafting_recipe/gravemaking/obelisk_headstone
	name = "headstone obelisk"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
		/obj/item/ingot/iron = 1,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/obelisk
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/angrosian_headstone
	name = "angrosian headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/angros
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/erdite_headstone
	name = "erdite headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/erdl
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/mjallidhorn_headstone
	name = "mjallidhorn headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/mjallidhorn
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/valdala_headstone
	name = "valdalan headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
		/obj/item/natural/glass = 1,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/valdala
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/golerkanh_headstone
	name = "goler kanh headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
		/obj/item/ingot/iron = 1,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/golerkanh
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/pomette_headstone
	name = "pomettic headstone"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/headstone/pomette
	craftdiff = 3

/datum/repeatable_crafting_recipe/gravemaking/hunt_headstone
	name = "skull headstone"
	allow_inverse_start = TRUE
	requirements = list(
		/obj/item/skull = 1,
		/obj/item/grown/log/tree/stake = 1,
	)
	attacked_atom = /obj/item/skull
	starting_atom  = /obj/item/grown/log/tree/stake
	output = /obj/item/gravedecor/headstone/hunt
	skillcraft = /datum/attribute/skill/craft/crafting
	craftdiff = 2

// Gravefences
/datum/repeatable_crafting_recipe/gravemaking/crude_gravefence
	name = "crude gravefence"
	category = "Gravefences"
	requirements = list(
		/obj/item/natural/stone = 2,
		/obj/item/rope = 1,
	)
	attacked_atom = /obj/item/natural/stone
	starting_atom  = /obj/item/rope
	output = /obj/item/gravedecor/gravefence
	craftdiff = 1

/datum/repeatable_crafting_recipe/gravemaking/chiseled_gravefence
	name = "chiseled gravefence"
	category = "Gravefences"
	requirements = list(
		/obj/item/natural/stoneblock = 2,
	)
	attacked_atom = /obj/item/natural/stoneblock
	starting_atom  = /obj/item/weapon/chisel
	output = /obj/item/gravedecor/gravefence/block
	craftdiff = 3
