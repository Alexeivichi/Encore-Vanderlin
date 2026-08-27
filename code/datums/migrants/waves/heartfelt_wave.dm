/datum/migrant_role/dunmoon_tycoon
	name = "Dunnish Tycoon"
	greet_text = "You are an acclaimed and wealthy Dunnish tycoon, your island's authority is distant and out of reach. You have the privilege of good standing with the Shirleighs, and the exact reasons of your stay here are up to you."
	migrant_job = /datum/job/migrant/dunmoon_tycoon

/datum/attribute_holder/sheet/job/migrant/dunmoon_tycoon
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_INTELLIGENCE = 3,
		STAT_ENDURANCE = 2,
		STAT_PERCEPTION = 2,
		STAT_FORTUNE = 2,
		/datum/attribute/skill/craft/engineering = 20,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/riding = 30,
		/datum/attribute/skill/craft/cooking = 10,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/dunmoon_tycoon
	title = "Dunnish Tycoon"
	tutorial = "You are an acclaimed and wealthy Dunnish tycoon, your island's authority is distant and out of reach. You have the privilege of good standing with the Shirleighs, and the exact reasons of your stay here are up to you."
	outfit = /datum/outfit/dunmoon_tycoon
	allowed_sexes = list(MALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	is_recognized = TRUE
	honorary = "Executor"
	honorary_f = "Executor"


	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/dunmoon_tycoon

	traits = list(
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_NOSEGRAB,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
	)

	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'

/datum/outfit/dunmoon_tycoon
	name = "Dunnish Tycoon (Migrant Wave)"
	shirt = /obj/item/clothing/shirt/undershirt
	belt = /obj/item/storage/belt/leather/black
	neck = /obj/item/clothing/neck/gorget
	shoes = /obj/item/clothing/shoes/nobleboot
	pants = /obj/item/clothing/pants/tights/colored/black
	cloak = /obj/item/clothing/cloak/dunmoon
	armor = /obj/item/clothing/armor/medium/surcoat/dunmoon
	beltr = /obj/item/storage/belt/pouch/coins/rich
	ring = /obj/item/scomstone
	gloves = /obj/item/clothing/gloves/leather/black
	beltl = /obj/item/weapon/sword/long
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/waterskin/purifier)

/datum/migrant_role/dunmoon_lady
	name = "Lady of Dunmoon"
	greet_text = "You are a Lady of Dunmoon, once a respected businesswoman now isolated from your country. You are far from home, but likely in good standing with the Shirleighs. Perhaps business is in order."
	migrant_job = /datum/job/migrant/dunmoon_lady

/datum/attribute_holder/sheet/job/migrant/dunmoon_lady
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 3,
		STAT_ENDURANCE = 1,
		STAT_SPEED = 1,
		STAT_PERCEPTION = 2,
		STAT_FORTUNE = 2,
		/datum/attribute/skill/craft/engineering = 10,
		/datum/attribute/skill/misc/stealing = 40,
		/datum/attribute/skill/misc/sneaking = 30,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/medicine = 20,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/dunmoon_lady
	title = "Lady of Dunmoon"
	tutorial = "You are a Lady of Dunmoon, once a respected businesswoman now isolated from your country. You are far from home, but likely in good standing with the Shirleighs. Perhaps business is in order."
	outfit = /datum/outfit/dunmoon_lady
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	blacklisted_species = list(SPEC_ID_HALFLING)
	is_recognized = TRUE
	honorary = "Executor"
	honorary_f = "Executor"

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/dunmoon_lady

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_NUTCRACKER,
	)

	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'

/datum/outfit/dunmoon_lady
	name = "Lady of Dunmoon (Migrant Wave)"
	head = /obj/item/clothing/head/hennin
	neck = /obj/item/storage/belt/pouch/coins/rich
	cloak = /obj/item/clothing/cloak/dunmoon
	backr = /obj/item/gun/ballistic/bow
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black
	beltl = /obj/item/ammo_holder/quiver/arrows
	beltr = /obj/item/weapon/knife/dagger/steel/special
	ring = /obj/item/clothing/ring/silver
	shoes = /obj/item/clothing/shoes/shortboots
	pants = /obj/item/clothing/pants/tights/colored/random

/datum/outfit/dunmoon_lady/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	if(isdwarf(equipped_human))
		armor = /obj/item/clothing/shirt/dress
	else if(prob(66))
		armor = /obj/item/clothing/armor/gambeson/heavy/dress/alt
	else
		armor = /obj/item/clothing/armor/gambeson/heavy/dress

/datum/migrant_role/dunmoon_hand
	name = "Hand of Dunmoon"
	greet_text = "You served your business as right-hand-man to the Tycoon, taking care of diplomatic actions within your company. You now ride by their side in an effort to carry out your duties wherever they may need you."
	migrant_job = /datum/job/migrant/dunmoon_hand

/datum/attribute_holder/sheet/job/migrant/dunmoon_hand
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_PERCEPTION = 2,
		STAT_INTELLIGENCE = 3,
		/datum/attribute/skill/craft/engineering = 10,
		/datum/attribute/skill/combat/axesmaces = 10,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/craft/crafting = 10,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/craft/cooking = 10,
	)


/datum/job/migrant/dunmoon_hand
	title = "Hand of Dunmoon"
	tutorial = "You served your business as right-hand-man to the Tycoon, taking care of diplomatic actions within your company. You now ride by their side in an effort to carry out your duties wherever they may need you."
	outfit = /datum/outfit/dunmoon_hand
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	blacklisted_species = list(SPEC_ID_HALFLING)
	is_recognized = TRUE
	honorary = "Good Sir"
	honorary_f = "Madam"


	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/dunmoon_hand

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_SEEPRICES,
	)

	cmode_music = 'sound/music/cmode/adventurer/CombatDream.ogg'

/datum/outfit/dunmoon_hand
	name = "Hand of Dunmoon (Migrant Wave)"
	shirt = /obj/item/clothing/shirt/undershirt
	belt = /obj/item/storage/belt/leather/black
	shoes = /obj/item/clothing/shoes/nobleboot
	pants = /obj/item/clothing/pants/tights/colored/black
	neck = /obj/item/clothing/neck/gorget
	armor = /obj/item/clothing/armor/medium/surcoat/dunmoon
	beltr = /obj/item/storage/belt/pouch/coins/rich
	gloves = /obj/item/clothing/gloves/leather/black
	beltl = /obj/item/weapon/sword/decorated
	ring = /obj/item/scomstone
	backr = /obj/item/storage/backpack/satchel
	mask = /obj/item/clothing/face/spectacles/monocle

/datum/migrant_role/dunmoon_knight
	name = "Dunnish Warden"
	greet_text = "You are a Dunnish warden, a loyal and handsomely-paid bodyguard for your Tycoon's business."
	migrant_job = /datum/job/migrant/dunmoon_knight

/datum/attribute_holder/sheet/job/migrant/dunmoon_knight
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_PERCEPTION = 1,
		STAT_CONSTITUTION = 1,
		STAT_ENDURANCE = 1,
		STAT_SPEED = -1,
		STAT_INTELLIGENCE = 2,
		/datum/attribute/skill/craft/engineering = 30,
		/datum/attribute/skill/combat/polearms = 40,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/combat/whipsflails = 40,
		/datum/attribute/skill/combat/axesmaces = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/bows = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/misc/riding = 40,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/dunmoon_knight
	title = "Dunnish Warden"
	tutorial = "You are a Dunnish warden, a loyal and handsomely-paid bodyguard for your Tycoon's business."
	outfit = /datum/outfit/dunmoon_knight
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	blacklisted_species = list(SPEC_ID_HALFLING)
	is_recognized = TRUE
	exp_types_granted  = list(EXP_TYPE_COMBAT)

	honorary = "Sir"
	honorary_f = "Dame"

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/dunmoon_knight

	traits = list(
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_STEELHEARTED,
	)

	cmode_music = 'sound/music/cmode/nobility/CombatKnight.ogg'
	voicepack_m = /datum/voicepack/male/knight

/datum/job/migrant/dunmoon_knight/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	if(istype(spawned.cloak, /obj/item/clothing/cloak/tabard/knight/guard))
		var/obj/item/clothing/S = spawned.cloak
		var/index = findtext(spawned.real_name, " ")
		if(index)
			index = copytext(spawned.real_name, 1,index)
		if(!index)
			index = spawned.real_name
		S.name = "knight tabard ([index])"

	var/obj/item/clothing/cloak/boiler/boiler = locate() in spawned.get_all_gear()
	if(boiler)
		SEND_SIGNAL(boiler, COMSIG_ATOM_STEAM_INCREASE, rand(500, 900))

/datum/outfit/dunmoon_knight
	name = "Dunnish Warden (Migrant Wave)"
	backl = /obj/item/clothing/cloak/boiler
	armor = /obj/item/clothing/armor/steam
	shoes = /obj/item/clothing/shoes/boots/armor/steam
	gloves = /obj/item/clothing/gloves/plate/steam
	head = /obj/item/clothing/head/helmet/heavy/steam
	pants = /obj/item/clothing/pants/trou/artipants
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	neck = /obj/item/clothing/neck/bevor
	shirt = /obj/item/clothing/shirt/undershirt/artificer
	beltr = /obj/item/weapon/sword/long
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/leather/steel
	backr = /obj/item/storage/backpack/satchel/black

/datum/outfit/dunmoon_knight/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	if(prob(50))
		r_hand = /obj/item/weapon/polearm/eaglebeak/lucerne
	else
		r_hand = /obj/item/weapon/mace/goden/steel

/datum/migrant_role/dunmoon_artificer
	name = "Supreme Artificer"
	greet_text = "You are the Supreme Artificer, the foremost expert on anything brass and steam. Your knowledge has little equal across all the Goblet."
	migrant_job = /datum/job/migrant/dunmoon_artificer

/datum/attribute_holder/sheet/job/migrant/dunmoon_artificer
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_INTELLIGENCE = 2,
		STAT_ENDURANCE = 1,
		STAT_CONSTITUTION = 1,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/labor/lumberjacking = 20,
		/datum/attribute/skill/craft/masonry = 30,
		/datum/attribute/skill/craft/crafting = 40,
		/datum/attribute/skill/craft/engineering = 60,
		/datum/attribute/skill/misc/lockpicking = 30,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/labor/mining = 20,
		/datum/attribute/skill/craft/smelting = 40,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/craft/bombs= 40,
	)

/datum/job/migrant/dunmoon_artificer
	title = "Supreme Artificer"
	tutorial = "You are the Supreme Artificer, the foremost expert on anything brass and steam. Your knowledge has little equal across all the Goblet."
	outfit = /datum/outfit/dunmoon_artificer
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	is_recognized = TRUE

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/dunmoon_artificer

	traits = list(TRAIT_SEEPRICES)
	cmode_music = 'sound/music/cmode/adventurer/CombatDream.ogg'

/datum/outfit/dunmoon_artificer
	name = "Supreme Artificer (Migrant Wave)"
	head = /obj/item/clothing/head/articap
	armor = /obj/item/clothing/armor/leather/jacket/artijacket
	pants = /obj/item/clothing/pants/trou/artipants
	shirt = /obj/item/clothing/shirt/undershirt/artificer
	shoes = /obj/item/clothing/shoes/simpleshoes/buckle
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/belt/pouch/coins/mid
	mask = /obj/item/clothing/face/goggles
	backl = /obj/item/storage/backpack/backpack/artibackpack
	ring = /obj/item/clothing/ring/silver/makers_guild
	neck = /obj/item/reagent_containers/glass/bottle/waterskin/purifier
	backpack_contents = list(
		/obj/item/weapon/hammer/steel = 1,
		/obj/item/weapon/knife/villager = 1,
		/obj/item/weapon/chisel = 1,
	)

/datum/migrant_wave/dunmoon
	name = "The Roaming Tycoon"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	weight = 25
	downgrade_wave = /datum/migrant_wave/dunmoon_down
	roles = list(
		/datum/migrant_role/dunmoon_tycoon = 1,
		/datum/migrant_role/dunmoon_lady = 1,
		/datum/migrant_role/dunmoon_hand = 1,
		/datum/migrant_role/dunmoon_knight = 1,
		/datum/migrant_role/dunmoon_artificer = 1,
	)
	greet_text = "In search of profit, a Tycoon and their attachment of trustees have set course for Domotan Island. Hopefully for good business."

/datum/migrant_wave/dunmoon_down
	name = "The Roaming Tycoon"
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/dunmoon_down_one
	roles = list(
		/datum/migrant_role/dunmoon_tycoon = 1,
		/datum/migrant_role/dunmoon_lady = 1,
		/datum/migrant_role/dunmoon_hand = 1,
	)
	greet_text = "In search of profit, a Tycoon and their attachment of trustees have set course for Domotan Island. Hopefully for good business."

/datum/migrant_wave/dunmoon_down_one
	name = "The Roaming Tycoon"
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/dunmoon_down_two
	roles = list(
		/datum/migrant_role/dunmoon_tycoon = 1,
		/datum/migrant_role/dunmoon_hand = 1,
	)
	greet_text = "In search of profit, a Tycoon and their attachment of trustees have set course for Domotan Island. Hopefully for good business."

/datum/migrant_wave/dunmoon_down_two
	name = "The Roaming Tycoon"
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/dunmoon_tycoon = 1,
	)
	greet_text = "In search of profit, a Tycoon and their attachment of trustees have set course for Domotan Island. Hopefully for good business."
