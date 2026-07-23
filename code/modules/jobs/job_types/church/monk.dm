/datum/attribute_holder/sheet/job/acolyte
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		STAT_PERCEPTION = -1,
		/datum/attribute/skill/misc/sewing = 20,
		/datum/attribute/skill/misc/medicine = 30,
		/datum/attribute/skill/combat/polearms = 20,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/axesmaces = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/magic/holy = 30,
		/datum/attribute/skill/craft/cooking = 20
	)

/datum/attribute_holder/sheet/job/acolyte/old
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		STAT_PERCEPTION = -1,
		/datum/attribute/skill/misc/sewing = 20,
		/datum/attribute/skill/misc/medicine = 30,
		/datum/attribute/skill/combat/polearms = 20,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/axesmaces = 10,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/magic/holy = 40,
		/datum/attribute/skill/craft/cooking = 20
	)

/datum/attribute_holder/sheet/job/acolyte/patron/pomette
	raw_attribute_list = list(
		/datum/attribute/skill/misc/music = 20
	)

/datum/attribute_holder/sheet/job/acolyte/patron/akan
	raw_attribute_list = list(
		/datum/attribute/skill/labor/mathematics = 20
	)

/datum/attribute_holder/sheet/job/acolyte/patron/erdl
	raw_attribute_list = list(
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/craft/alchemy = 10
	)

/datum/attribute_holder/sheet/job/acolyte/patron/gani
	raw_attribute_list = list(
		/datum/attribute/skill/labor/farming = 20,
		/datum/attribute/skill/labor/taming = 10
	)

/datum/attribute_holder/sheet/job/acolyte/patron/mjallidhorn
	raw_attribute_list = list(
		/datum/attribute/skill/labor/fishing = 20,
		/datum/attribute/skill/misc/swimming = 20
	)

/datum/attribute_holder/sheet/job/acolyte/patron/mordsol
	raw_attribute_list = list(
		/datum/attribute/skill/combat/polearms = 10
	)
	attribute_variance = list(
		/datum/attribute/skill/combat/swords = list(10, 20),
		/datum/attribute/skill/combat/whipsflails = list(10, 20),
		/datum/attribute/skill/combat/axesmaces = list(0, 10)
	)

/datum/attribute_holder/sheet/job/acolyte/patron/iliope
	raw_attribute_list = list(
		/datum/attribute/skill/misc/stealing = 20,
		/datum/attribute/skill/misc/music = 30
	)

/datum/attribute_holder/sheet/job/acolyte/patron/golerkanh
	raw_attribute_list = list(
		/datum/attribute/skill/craft/blacksmithing = 20,
		/datum/attribute/skill/craft/smelting = 20,
		/datum/attribute/skill/craft/armorsmithing = 10,
		/datum/attribute/skill/craft/weaponsmithing = 10,
		/datum/attribute/skill/craft/engineering = 10,
		/datum/attribute/skill/craft/carpentry = 10,
		/datum/attribute/skill/craft/masonry = 10,
		/datum/attribute/skill/craft/crafting = 10
	)

/datum/job/monk
	title = JOB_ACOLYTE
	tutorial = "Chores, exercise, prayer... and more chores. \
	You are a humble acolyte at the temple on Domotan Island, \
	not yet a trained guardian or an ordained priest. \
	But who else would keep the fires lit and the floors clean?"
	department_flag = CHURCHMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_MONK
	faction = FACTION_TOWN
	total_positions = 99
	spawn_positions = 99
	bypass_lastclass = TRUE

	allowed_races = RACES_LESS_DISCRIMINATED
	allowed_patrons = ALL_TEMPLE_PATRONS

	outfit = /datum/outfit/monk
	give_bank_account = TRUE
	job_bitflag = BITFLAG_CHURCH

	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_CLERIC)

	attribute_sheet = /datum/attribute_holder/sheet/job/acolyte
	attribute_sheet_old = /datum/attribute_holder/sheet/job/acolyte/old

	languages = list(/datum/language/celestial)

/datum/job/monk/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	spawned.virginity = TRUE
	switch(spawned.patron?.type)
		if(/datum/patron/divine/visires)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/valdala)
			spawned.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
			ADD_TRAIT(spawned, TRAIT_DEADNOSE, TRAIT_GENERIC)
			ADD_TRAIT(spawned, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
		if(/datum/patron/divine/pomette)
			ADD_TRAIT(spawned, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
			ADD_TRAIT(spawned, TRAIT_EMPATH, TRAIT_GENERIC)
			spawned.virginity = FALSE
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/pomette)
			spawned.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
		if(/datum/patron/divine/akan)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/akan)
			var/language = pickweight(list("Dwarvish" = 1, "Elvish" = 1, "Hellspeak" = 1, "Qadirid" = 1, "Orcish" = 1,))
			switch(language)
				if("Dwarvish")
					spawned.grant_language(/datum/language/dwarvish)
					to_chat(spawned,span_info("\
					I learned the tongue of the mountain dwellers.")
					)
				if("Elvish")
					spawned.grant_language(/datum/language/elvish)
					to_chat(spawned,span_info("\
					I learned the tongue of the primordial species.")
					)
				if("Hellspeak")
					spawned.grant_language(/datum/language/hellspeak)
					to_chat(spawned,span_info("\
					I learned the tongue of the hellspawn.")
					)
				if("Qadirid")
					spawned.grant_language(/datum/language/qadirid)
					to_chat(spawned,span_info("\
					I learned the tongue of the Sultanate.")
					)
				if("Orcish")
					spawned.grant_language(/datum/language/orcish)
					to_chat(spawned,span_info("\
					I learned the tongue of the savages in my time.")
					)
			spawned.cmode_music = 'sound/music/cmode/church/CombatNoc.ogg'
		if(/datum/patron/divine/erdl)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/erdl)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/gani)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/gani)
			ADD_TRAIT(spawned, TRAIT_SEEDKNOW, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/church/CombatDendor.ogg'
		if(/datum/patron/divine/mjallidhorn)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/mjallidhorn)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAbyssor.ogg'
		if(/datum/patron/divine/mordsol)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/mordsol)
			spawned.cmode_music = 'sound/music/cmode/church/CombatRavox.ogg'
		if(/datum/patron/divine/iliope)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/iliope)
			spawned.cmode_music = 'sound/music/cmode/church/CombatXylix.ogg'
		if(/datum/patron/divine/golerkanh)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/acolyte/patron/golerkanh)
			ADD_TRAIT(spawned, TRAIT_GOLERKANHFIRE, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_acolyte()
		devotion.grant_to(spawned)

/datum/outfit/monk
	name = JOB_ACOLYTE
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/key/church
	backl = /obj/item/weapon/polearm/woodstaff/quarterstaff
	backpack_contents = list(
		/obj/item/needle = 1
	)

/datum/outfit/monk/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/visires)
			head = /obj/item/clothing/head/roguehood/visires
			neck = /obj/item/clothing/neck/psycross/silver/divine/visires
			wrists = /obj/item/clothing/wrists/wrappings
			shoes = /obj/item/clothing/shoes/sandals
			armor = /obj/item/clothing/shirt/robe/visires
		if(/datum/patron/divine/valdala)
			head = /obj/item/clothing/head/padded/deathshroud
			neck = /obj/item/clothing/neck/psycross/silver/divine/valdala
			shoes = /obj/item/clothing/shoes/boots
			pants = /obj/item/clothing/pants/trou/leather/mourning
			armor = /obj/item/clothing/shirt/robe/valdala
			backpack_contents = list(/obj/item/inqarticles/tallowpot, /obj/item/reagent_containers/food/snacks/tallow/red) // Needed for coffin sanctification, they get enough for one, the rest they must source themselves.
			if(equipped_human.age == AGE_OLD)
				l_hand = /obj/item/weapon/mace/cane/valdalan
			else
				backl = /obj/item/weapon/polearm/woodstaff/quarterstaff
		if(/datum/patron/divine/pomette)
			mask = /obj/item/clothing/face/operavisage
			neck = /obj/item/clothing/neck/psycross/silver/divine/pomette
			shoes = /obj/item/clothing/shoes/sandals
			armor = /obj/item/clothing/shirt/robe/pomette
		if(/datum/patron/divine/akan)
			head = /obj/item/clothing/head/roguehood/nochood
			neck = /obj/item/clothing/neck/psycross/silver/divine/akan
			wrists = /obj/item/clothing/wrists/nocwrappings
			shoes = /obj/item/clothing/shoes/sandals
			armor = /obj/item/clothing/shirt/robe/akan
		if(/datum/patron/divine/erdl)
			head = /obj/item/clothing/head/padded/erdl
			neck = /obj/item/clothing/neck/psycross/silver/divine/erdl
			shoes = /obj/item/clothing/shoes/sandals
			armor = /obj/item/clothing/shirt/robe/erdl
			backpack_contents += /obj/item/needle/blessed
		if(/datum/patron/divine/gani)
			head = /obj/item/clothing/head/padded/briarthorns
			neck = /obj/item/clothing/neck/psycross/silver/divine/gani
			shoes = /obj/item/clothing/shoes/sandals
			armor = /obj/item/clothing/shirt/robe/gani
		if(/datum/patron/divine/mjallidhorn)
			head = /obj/item/clothing/head/padded/mjallidhorn
			neck = /obj/item/clothing/neck/psycross/silver/divine/mjallidhorn
			shoes = /obj/item/clothing/shoes/boots
			armor = /obj/item/clothing/shirt/robe/mjallidhorn
		if(/datum/patron/divine/mordsol)
			head = /obj/item/clothing/head/helmet/leather/headscarf
			neck = /obj/item/clothing/neck/psycross/silver/divine/mordsol
			shoes = /obj/item/clothing/shoes/boots
			shirt = /obj/item/clothing/armor/gambeson/light
			armor = /obj/item/clothing/armor/leather
			cloak = /obj/item/clothing/cloak/stabard/templar/mordsol
		if(/datum/patron/divine/iliope)
			head = /obj/item/clothing/head/roguehood/colored/random
			neck = /obj/item/clothing/neck/psycross/silver/divine/iliope
			shoes = /obj/item/clothing/shoes/boots
			armor = /obj/item/clothing/shirt/robe/colored/purple
		if(/datum/patron/divine/golerkanh)
			head = /obj/item/clothing/head/headband/colored/red
			neck = /obj/item/clothing/neck/psycross/silver/divine/golerkanh
			shoes = /obj/item/clothing/shoes/boots
			armor = /obj/item/clothing/shirt/robe/colored/red
			backl = /obj/item/weapon/polearm/woodstaff/quarterstaff
			backpack_contents += /obj/item/weapon/hammer/iron
		else
			head = /obj/item/clothing/head/roguehood/colored/random
			neck = /obj/item/clothing/neck/psycross/silver
			shoes = /obj/item/clothing/shoes/boots
			armor = /obj/item/clothing/shirt/robe/colored/plain
