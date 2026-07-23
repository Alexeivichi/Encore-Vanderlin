/datum/attribute_holder/sheet/job/templar
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/shields = 30,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/magic/holy = 20,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/misc/sewing = 20,
	)

/datum/attribute_holder/sheet/job/templar/patron/visires
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/akan
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/labor/mathematics = 20
	)

/datum/attribute_holder/sheet/job/templar/patron/gani
	raw_attribute_list = list(
		/datum/attribute/skill/combat/polearms = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/valdala
	raw_attribute_list = list(
		/datum/attribute/skill/combat/whipsflails = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/erdl
	raw_attribute_list = list(
		/datum/attribute/skill/combat/knives = 40,
		/datum/attribute/skill/craft/alchemy = 20
	)

/datum/attribute_holder/sheet/job/templar/patron/mordsol
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/golerkanh
	raw_attribute_list = list(
		/datum/attribute/skill/combat/axesmaces = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/mjallidhorn
	raw_attribute_list = list(
		/datum/attribute/skill/labor/fishing = 20
	)

/datum/attribute_holder/sheet/job/templar/patron/iliope
	raw_attribute_list = list(
		/datum/attribute/skill/combat/whipsflails = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/pomette/rapier
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/pomette/knuckles
	raw_attribute_list = list(
		/datum/attribute/skill/combat/unarmed = 20
	)

/datum/attribute_holder/sheet/job/templar/patron/mjallidhorn/spear
	raw_attribute_list = list(
		/datum/attribute/skill/combat/polearms = 40
	)

/datum/attribute_holder/sheet/job/templar/patron/mjallidhorn/katars
	raw_attribute_list = list(
		/datum/attribute/skill/combat/unarmed = 20
	)

/datum/job/templar
	title = JOB_TEMPLAR
	tutorial = "Templars are warriors who have forsaken wealth and station in the service of the church, either from fervent zeal or remorse for past sins.\
	They are vigilant sentinels, guarding priest and altar, steadfast against heresy and shadow-beasts that creep in darkness. \
	But in the quiet of troubled sleep, there is a question left. Does the blood they spill sanctify them, or stain them forever? If service ever demanded it, whose blood would be the price?"
	department_flag = CHURCHMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_TEMPLAR
	faction = FACTION_TOWN
	total_positions = 99
	spawn_positions = 99
	bypass_lastclass = TRUE

	allowed_races = RACES_LESS_DISCRIMINATED
	allowed_patrons = ALL_TEMPLAR_PATRONS

	outfit = /datum/outfit/templar
	give_bank_account = 0

	job_bitflag = BITFLAG_CHURCH

	exp_type = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT)
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)
	exp_requirements = list(
		EXP_TYPE_CHURCH = 900,
		EXP_TYPE_COMBAT = 900
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/templar

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_STEELHEARTED,
	)
	mind_traits = list(TRAIT_KNOWBANDITS)

	languages = list(/datum/language/celestial)

/datum/job/templar/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_templar()
		devotion.grant_to(spawned)

	if(spawned.dna?.species?.id == SPEC_ID_HUMEN && spawned.gender == MALE)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

/datum/job/templar/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	switch(spawned.patron?.type)
		if(/datum/patron/divine/visires)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/visires)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
		if(/datum/patron/divine/akan)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/akan)
			ADD_TRAIT(spawned, TRAIT_DUALWIELDER, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/church/CombatNoc.ogg'
		if(/datum/patron/divine/gani)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/gani)
			spawned.cmode_music = 'sound/music/cmode/church/CombatDendor.ogg'
		if(/datum/patron/divine/valdala)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/valdala)
			ADD_TRAIT(spawned, TRAIT_DEADNOSE, TRAIT_GENERIC)
			ADD_TRAIT(spawned, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
		if(/datum/patron/divine/erdl)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/erdl)
			ADD_TRAIT(spawned, TRAIT_DUALWIELDER, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/pomette)
			spawned.virginity = FALSE
			ADD_TRAIT(spawned, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
			var/static/list/selectable = list(
				"Heartstring (Rapier)" = /obj/item/weapon/sword/rapier/pomette,
				"Close Caress (Knuckles)" = /obj/item/weapon/knuckles/pomette,
			)
			var/choice = spawned.select_equippable(player_client, selectable, message = "Choose Your Specialisation", title = "TEMPLAR")
			if(!choice)
				return
			switch(choice)
				if("Heartstring (Rapier)")
					spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/pomette/rapier)
				if("Close Caress (Knuckles)")
					spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/pomette/knuckles)
		if(/datum/patron/divine/mordsol)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/mordsol)
			spawned.cmode_music = 'sound/music/cmode/church/CombatRavox.ogg'
		if(/datum/patron/divine/golerkanh)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/golerkanh)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
		if(/datum/patron/divine/mjallidhorn)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/mjallidhorn)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAbyssor.ogg'
			var/static/list/selectable = list(
				"DepthSeeker (Spear)" = /obj/item/weapon/polearm/spear/mjallidhorn,
				"Barotrauma (Katars)" = /obj/item/weapon/katar/mjallidhorn,
			)
			var/choice = spawned.select_equippable(player_client, selectable, message = "Choose Your Specialisation", title = "TEMPLAR")
			if(!choice)
				return
			switch(choice)
				if("DepthSeeker (Spear)")
					spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/mjallidhorn/spear)
				if("Barotrauma (Katars)")
					spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/mjallidhorn/katars)
		if(/datum/patron/divine/iliope)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/templar/patron/iliope)
			spawned.cmode_music = 'sound/music/cmode/church/CombatXylix.ogg'

/datum/outfit/templar
	name = JOB_TEMPLAR
	head = /obj/item/clothing/head/helmet/heavy/necked
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	armor = /obj/item/clothing/armor/plate
	shirt = /obj/item/clothing/armor/chainmail
	pants = /obj/item/clothing/pants/chainlegs
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/keyring/priest = 1,  /obj/item/storage/belt/pouch/coins/poor = 1)
	belt = /obj/item/storage/belt/leather/black
	ring = /obj/item/clothing/ring/silver
	gloves = /obj/item/clothing/gloves/chain
	l_hand = /obj/item/weapon/shield/tower/metal

/datum/outfit/templar/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/visires)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/visires
			head = /obj/item/clothing/head/helmet/heavy/necked/visires
			cloak = /obj/item/clothing/cloak/stabard/templar/visires
			backr = /obj/item/weapon/sword/long/exe/visires
		if(/datum/patron/divine/akan)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/akan
			head = /obj/item/clothing/head/helmet/heavy/necked/akan
			cloak = /obj/item/clothing/cloak/stabard/templar/akan
			beltl = /obj/item/weapon/sword/sabre/akan
		if(/datum/patron/divine/gani)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/gani
			head = /obj/item/clothing/head/helmet/heavy/necked/ganihelm
			cloak = /obj/item/clothing/cloak/stabard/templar/gani
			backr = /obj/item/weapon/polearm/halberd/bardiche/gani
		if(/datum/patron/divine/valdala)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/valdala
			head = /obj/item/clothing/head/helmet/heavy/necked/valdala
			cloak = /obj/item/clothing/cloak/stabard/templar/valdala
			beltl = /obj/item/weapon/flail/sflail/valdalaflail
		if(/datum/patron/divine/erdl)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/erdl
			head = /obj/item/clothing/head/helmet/heavy/necked/erdlhelm
			cloak = /obj/item/clothing/cloak/stabard/templar/erdl
			backpack_contents += /obj/item/reagent_containers/glass/bottle/poison
			beltr = /obj/item/weapon/knife/dagger/steel/erdlsickle
			beltl = /obj/item/weapon/knife/dagger/steel/erdlsickle
		if(/datum/patron/divine/pomette)
			head = /obj/item/clothing/head/helmet/sallet/pomettic
			wrists = /obj/item/clothing/neck/psycross/silver/divine/pomette
			cloak = /obj/item/clothing/cloak/stabard/templar/pomette
		if(/datum/patron/divine/mordsol)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/mordsol
			head = /obj/item/clothing/head/helmet/heavy/necked/mordsol
			cloak = /obj/item/clothing/cloak/stabard/templar/mordsol
			backr = /obj/item/weapon/sword/long/mordsol
		if(/datum/patron/divine/golerkanh)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/golerkanh
			head = /obj/item/clothing/head/helmet/heavy/necked/golerkanhhelm
			cloak = /obj/item/clothing/cloak/stabard/templar/golerkanh
			backr = /obj/item/weapon/hammer/sledgehammer/war/golerkanh
		if(/datum/patron/divine/mjallidhorn)
			head = /obj/item/clothing/head/helmet/heavy/necked/mjallidhorn
			armor = /obj/item/clothing/armor/brigandine/mjallidhorn
			wrists = /obj/item/clothing/neck/psycross/silver/divine/mjallidhorn
			cloak = /obj/item/clothing/cloak/stabard/templar/mjallidhorn
		if(/datum/patron/divine/iliope)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/iliope
			head = /obj/item/clothing/head/helmet/heavy/necked/iliope
			cloak = /obj/item/clothing/cloak/stabard/templar/iliope
			beltl = /obj/item/weapon/whip/iliope
