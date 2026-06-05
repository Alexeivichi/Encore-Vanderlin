/datum/repeatable_crafting_recipe/gani
	abstract_type = /datum/repeatable_crafting_recipe/gani
	subtypes_allowed = TRUE
	category = "Gani"

/datum/repeatable_crafting_recipe/gani/sacrifice_growing
	name = "green sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_gote
	starting_atom = /obj/item/natural/worms/grub_silk
	requirements = list(/obj/item/natural/worms/grub_silk = 1,
				/obj/item/reagent_containers/food/snacks/produce/swampweed = 1,
				/obj/item/reagent_containers/food/snacks/produce/poppy = 1)
	output = /obj/item/gani_blessing/growing
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_tending
	name = "viridian sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_gote
	starting_atom = /obj/item/alch/herb/euphorbia
	requirements = list(/obj/item/alch/herb/euphorbia = 1,
				/obj/item/reagent_containers/food/snacks/produce/swampweed = 1,
				/obj/item/natural/thorn = 2)
	output = /obj/item/gani_blessing/tending
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_stinging
	name = "yellow sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_saiga
	starting_atom = /obj/item/reagent_containers/food/snacks/fish/eel
	requirements = list(/obj/item/reagent_containers/food/snacks/fish/eel = 1,
				/obj/item/reagent_containers/food/snacks/produce/westleach = 1,
				/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry = 1)
	output = /obj/item/gani_blessing/stinging
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_hiding
	name = "citrine sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_saiga
	starting_atom = /obj/item/alch/herb/calendula
	requirements = list(/obj/item/alch/herb/calendula = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry = 1)
	output = /obj/item/gani_blessing/hiding
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_devouring
	name = "red sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_volf
	starting_atom = /obj/item/bait/bloody
	requirements = list(/obj/item/bait/bloody = 2)
	output = /obj/item/gani_blessing/devouring
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_falconing
	name = "crimson sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_volf
	starting_atom = /obj/item/reagent_containers/food/snacks/egg
	requirements = list(/obj/item/reagent_containers/food/snacks/egg = 1,
				/obj/item/natural/feather = 2)
	output = /obj/item/gani_blessing/falconing
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_lording
	name = "purple sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_troll
	starting_atom = /obj/item/alch/horn
	requirements = list(/obj/item/alch/horn = 2)
	output = /obj/item/gani_blessing/lording
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/sacrifice_shaping
	name = "indigo sacrifice to Gani (unique)"
	attacked_atom = /obj/structure/fluff/psycross/crafted/shrine/gani_troll
	starting_atom = /obj/item/alch/sinew
	requirements = list(/obj/item/alch/sinew = 2,
				/obj/item/reagent_containers/food/snacks/meat/strange = 1)
	output = /obj/item/gani_blessing/shaping
	crafting_sound = 'sound/foley/burning_sacrifice.ogg'

/datum/repeatable_crafting_recipe/gani/shillelagh
	name = "Shillelagh (unique)"
	output = /obj/item/weapon/mace/goden/shillelagh
	attacked_atom = /obj/item/grown/log/tree/small
	starting_atom = /obj/item/reagent_containers/food/snacks/fat
	requirements = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/fertilizer/ash = 1,
				/obj/item/reagent_containers/food/snacks/fat = 1)
	subtypes_allowed = TRUE

/datum/repeatable_crafting_recipe/gani/forestdelight
	name = "forest guardian offering (unique)"
	starting_atom = /obj/item/bait/bloody
	attacked_atom = /obj/item/reagent_containers/food/snacks/produce/swampweed_dried
	requirements = list(/obj/item/bait/bloody = 1,
				/obj/item/reagent_containers/food/snacks/produce/swampweed_dried = 1,
				/obj/item/reagent_containers/food/snacks/raisins = 1 )
	output = /obj/item/bait/forestdelight
	subtypes_allowed = TRUE

/datum/repeatable_crafting_recipe/gani/visage
	name = "druids mask (unique)"
	attacked_atom = /obj/item/grown/log/tree/small
	starting_atom = /obj/item/weapon/knife
	tool_usage = list(
		/obj/item/weapon/knife = list(span_notice("starts to whittle"), span_notice("start to whittle"), 'sound/items/wood_sharpen.ogg'),
	)
	requirements = list(/obj/item/grown/log/tree/small = 1)
	output = /obj/item/clothing/face/druid
	subtypes_allowed = TRUE
