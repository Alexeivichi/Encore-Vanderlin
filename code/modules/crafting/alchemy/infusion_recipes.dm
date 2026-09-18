/datum/infusion_recipe
	abstract_type = /datum/infusion_recipe
	var/category = "Infusions"
	var/name = "infusion recipe"
	var/obj/item/target_type
	var/list/required_essences = list() // essence_type = amount
	var/infusion_time = 10 SECONDS
	var/obj/item/result_type

/datum/infusion_recipe/glass
	name = "Glass Transmutation"
	target_type  = /obj/item/natural/stone
	result_type = /obj/item/natural/glass
	required_essences = list(/datum/thaumaturgical_essence/crystal = 5)

/datum/infusion_recipe/heat_iron
	name = "Heat Iron"
	target_type  = /obj/item/ore/iron
	result_type = /obj/item/ingot/iron
	required_essences = list(/datum/thaumaturgical_essence/fire = 10)

/datum/infusion_recipe/thaumic_iron
	name = "Thaumic Iron"
	target_type  = /obj/item/ingot/iron
	result_type = /obj/item/ingot/thaumic
	required_essences = list(/datum/thaumaturgical_essence/fire = 10)

/datum/infusion_recipe/mana_crystal
	name = "Mana Crystal"
	target_type  = /obj/item/gem
	result_type = /obj/item/mana_battery/mana_crystal/standard
	required_essences = list(/datum/thaumaturgical_essence/magic = 10)

/datum/infusion_recipe/seed_random
	name = "Seed Transmutation"
	target_type  = /obj/item/neuFarm/seed
	result_type = /obj/item/neuFarm/seed/mixed_seed
	required_essences = list(/datum/thaumaturgical_essence/life = 5)

//quicksilver is mercury
//so we're literally transmuting silver into quicksilver
//hence the cost of magic, earth, and motion essence
//magic because... magic
//earth because we are turning one metal into another, heavier metal
//motion because QUICKsilver, get it?
/datum/infusion_recipe/cinnabar
	name = "Cinnabar Transmutation"
	target_type  = /obj/item/alch/silverdust
	result_type = /obj/item/ore/cinnabar
	required_essences = list(/datum/thaumaturgical_essence/magic = 20, /datum/thaumaturgical_essence/earth = 10, /datum/thaumaturgical_essence/motion = 10)

/datum/infusion_recipe/jar_two
	name = "Containment Enchantment"
	target_type  = /obj/item/essence_node_jar
	result_type = /obj/item/essence_node_jar/advanced
	required_essences = list(/datum/thaumaturgical_essence/magic = 20, /datum/thaumaturgical_essence/earth = 10)

/datum/infusion_recipe/combat_flask
	name = "Combat Flask Synthesis"
	target_type  = /obj/item/natural/glass
	result_type = /obj/item/essence_vial/combat
	required_essences = list(/datum/thaumaturgical_essence/magic = 20, /datum/thaumaturgical_essence/earth = 10)

// ---- HUMOUR TRANSFORMATION RECIPES ----
// humours can be found at code\datums\chimeric_organs
/datum/infusion_recipe/humour
	abstract_type = /datum/infusion_recipe/humour
	target_type = /obj/item/chimeric_node
	result_type = /obj/item/chimeric_node
	var/datum/chimeric_node/node_type // support specifying the humour type for humour transformation

// ---- INPUT type humours ----
// most of these are balanced around 20ish essence requirement

/datum/infusion_recipe/humour/heartbeat
	name = "Heartbeat Synced Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/cycle = 10, /datum/thaumaturgical_essence/motion = 5)
	node_type = /datum/chimeric_node/input/heartbeat

/datum/infusion_recipe/humour/wounded
	name = "Wounded Humour"
	required_essences = list(/datum/thaumaturgical_essence/fire = 10, /datum/thaumaturgical_essence/water = 10)
	node_type = /datum/chimeric_node/input/wounded

/datum/infusion_recipe/humour/sunlight
	name = "Sunblighted Humour"
	required_essences = list(/datum/thaumaturgical_essence/fire = 20)
	node_type = /datum/chimeric_node/input/sunlight

/datum/infusion_recipe/humour/stress
	name = "Stressed Humour"
	required_essences = list(/datum/thaumaturgical_essence/earth = 10, /datum/thaumaturgical_essence/poison = 10)
	node_type = /datum/chimeric_node/input/stress

/datum/infusion_recipe/humour/bleading
	name = "Wound Weeping Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/water = 10)
	node_type = /datum/chimeric_node/input/bleeding

// ideally paired with healing comatose humour
/datum/infusion_recipe/humour/accumlated_damage
	name = "Responsive Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/cycle = 5, /datum/thaumaturgical_essence/frost = 5)
	node_type = /datum/chimeric_node/input/accumlated_damage

// ---- OUTPUT type humours ----
// most of these are balanced around 40ish essence requirement

/datum/infusion_recipe/humour/clotting
	name = "Wound Clotting Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 20, /datum/thaumaturgical_essence/frost = 20)
	node_type = /datum/chimeric_node/output/clotting

// heals a specific randomly-chosen-on-humour-spawn damage type for like .5 per trigger
/datum/infusion_recipe/humour/healing
	name = "Restoring Humour"
	required_essences = list(/datum/thaumaturgical_essence/life = 40)
	node_type = /datum/chimeric_node/output/healing

/datum/infusion_recipe/humour/speed
	name = "Galewind Humour"
	required_essences = list(/datum/thaumaturgical_essence/motion = 20, /datum/thaumaturgical_essence/energia = 20)
	node_type = /datum/chimeric_node/output/speed

// ideally paired with responsive humour
/datum/infusion_recipe/humour/healing_coma
	name = "Comatose Humour"
	required_essences = list(/datum/thaumaturgical_essence/void = 10, /datum/thaumaturgical_essence/life = 10, /datum/thaumaturgical_essence/frost = 20)
	node_type = /datum/chimeric_node/output/healing_coma

// funny alcohol humour
/datum/infusion_recipe/humour/alcoholic
	name = "Distillery Humour"
	required_essences = list(/datum/thaumaturgical_essence/water = 20, /datum/thaumaturgical_essence/fire = 20)
	node_type = /datum/chimeric_node/output/alcoholic
