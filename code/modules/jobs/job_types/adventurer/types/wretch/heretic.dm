/datum/attribute_holder/sheet/job/heretic
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/shields = 30,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/magic/holy = 30,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/misc/sewing = 20
	)

/datum/job/advclass/wretch/heretic
	title = "Iconoclast"
	tutorial = "You are either a heretic or a fanatic, spurned by the church, cast out from society - frowned upon by the tens for your type of faith."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	allowed_patrons = ALL_ICONOCLAST_PATRONS
	outfit = /datum/outfit/wretch/heretic
	total_positions = 5
	exp_type = list(EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)
	exp_types_granted = list(EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)

	attribute_sheet = /datum/attribute_holder/sheet/job/heretic

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_HEAVYARMOR,
		TRAIT_FANATICAL,
	)

/datum/job/advclass/wretch/heretic/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	switch(spawned.patron?.type)
		if(/datum/patron/divine/visires)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
		if(/datum/patron/divine/akan)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			ADD_TRAIT(spawned, TRAIT_DUALWIELDER, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/church/CombatNoc.ogg'
		if(/datum/patron/divine/gani)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/polearms, 40)
			spawned.cmode_music = 'sound/music/cmode/garrison/CombatForestGarrison.ogg'
		if(/datum/patron/divine/valdala)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/whipsflails, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
			ADD_TRAIT(spawned, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
		if(/datum/patron/divine/erdl)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/knives, 40)
			spawned.adjust_skill_level(/datum/attribute/skill/craft/alchemy, 20)
			ADD_TRAIT(spawned, TRAIT_DUALWIELDER, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/pomette)
			spawned.virginity = FALSE
			ADD_TRAIT(spawned, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
		if(/datum/patron/divine/mordsol)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatRavox.ogg'
		if(/datum/patron/divine/golerkanh)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/axesmaces, 40)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
		if(/datum/patron/divine/mjallidhorn)
			spawned.adjust_skill_level(/datum/attribute/skill/labor/fishing, 10)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/polearms, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAbyssor.ogg'
		if(/datum/patron/divine/iliope)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/whipsflails, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatXylix.ogg'
		if(/datum/patron/inhumen/archdevils)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/axesmaces, 40)
			ADD_TRAIT(spawned, TRAIT_STRONGBITE, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
			ADD_TRAIT(spawned, TRAIT_STRONGBITE, TRAIT_GENERIC)
		if(/datum/patron/inhumen/sages)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/axesmaces, 40)
			spawned.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
		if(/datum/patron/inhumen/envy)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			spawned.cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
			spawned.grant_language(/datum/language/undead)
		if(/datum/patron/inhumen/deceivers)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/whipsflails, 40)
			spawned.cmode_music = 'sound/music/cmode/antag/CombatBandit1.ogg'
		if(/datum/patron/inhumen/hertannea)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/knives, 40)
			spawned.adjust_skill_level(/datum/attribute/skill/craft/alchemy, 20)
			ADD_TRAIT(spawned, TRAIT_DUALWIELDER, TRAIT_GENERIC)
			spawned.cmode_music = 'sound/music/cmode/antag/CombatBaotha.ogg'
		if(/datum/patron/angros,  /datum/patron/angros/extremist)
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
			spawned.grant_language(/datum/language/newunsundered)
		else
			spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 40)
			spawned.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'

	if(!spawned.has_language(/datum/language/celestial) && (spawned.patron?.type in ALL_TEMPLE_PATRONS))
		spawned.grant_language(/datum/language/celestial)

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_acolyte()
		devotion.grant_to(spawned)

	if(spawned.dna?.species?.id == SPEC_ID_HUMEN && spawned.gender == MALE)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

/datum/outfit/wretch/heretic
	name = "Iconoclast (Wretch)"
	head = /obj/item/clothing/head/helmet/heavy/necked
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	armor = /obj/item/clothing/armor/brigandine
	shirt = /obj/item/clothing/armor/chainmail
	pants = /obj/item/clothing/pants/chainlegs
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/rope/chain = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)
	belt = /obj/item/storage/belt/leather/black
	ring = /obj/item/clothing/ring/silver
	gloves = /obj/item/clothing/gloves/chain
	l_hand =  /obj/item/weapon/shield/tower/metal

/datum/outfit/wretch/heretic/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
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
			backpack_contents += /obj/item/reagent_containers/glass/bottle/strongpoison
			beltr = /obj/item/weapon/knife/dagger/steel/erdlsickle
			beltl = /obj/item/weapon/knife/dagger/steel/erdlsickle
		if(/datum/patron/divine/pomette)
			head = /obj/item/clothing/head/helmet/sallet/pomettic
			wrists = /obj/item/clothing/neck/psycross/silver/divine/pomette
			cloak = /obj/item/clothing/cloak/stabard/templar/pomette
			beltr = /obj/item/weapon/sword/rapier/pomette
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
			backr = /obj/item/weapon/polearm/spear/mjallidhorn
		if(/datum/patron/divine/iliope)
			wrists = /obj/item/clothing/neck/psycross/silver/divine/iliope
			head = /obj/item/clothing/head/helmet/heavy/necked/iliope
			cloak = /obj/item/clothing/cloak/stabard/templar/iliope
			beltl = /obj/item/weapon/whip/iliope
		if(/datum/patron/inhumen/archdevils)
			head = /obj/item/clothing/head/helmet/heavy/archdevils
			armor = /obj/item/clothing/armor/plate/full/archdevils
			neck = /obj/item/clothing/neck/gorget
			gloves = /obj/item/clothing/gloves/plate/archdevils
			pants = /obj/item/clothing/pants/platelegs/archdevils
			shoes = /obj/item/clothing/shoes/boots/armor/archdevils
			cloak = /obj/item/clothing/cloak/archdevils
			backr = /obj/item/weapon/greataxe/steel/doublehead/archdevils
		if(/datum/patron/inhumen/sages)
			head = /obj/item/clothing/head/helmet/heavy/archdevils
			armor = /obj/item/clothing/armor/plate/full/archdevils
			neck = /obj/item/clothing/neck/gorget
			gloves = /obj/item/clothing/gloves/plate/archdevils
			pants = /obj/item/clothing/pants/platelegs/archdevils
			shoes = /obj/item/clothing/shoes/boots/armor/archdevils
			cloak = /obj/item/clothing/cloak/archdevils
			backr = /obj/item/weapon/greataxe/steel/doublehead/archdevils
		if(/datum/patron/inhumen/envy)
			head = /obj/item/clothing/head/helmet/visored/envy
			armor = /obj/item/clothing/armor/plate/full/envy
			neck = /obj/item/clothing/neck/gorget
			gloves = /obj/item/clothing/gloves/plate/envy
			pants = /obj/item/clothing/pants/platelegs/envy
			shoes = /obj/item/clothing/shoes/boots/armor/envy
			backr = /obj/item/weapon/sword/long/greatsword/envy
		if(/datum/patron/inhumen/deceivers)
			head = /obj/item/clothing/head/helmet/heavy/deceivers
			armor = /obj/item/clothing/armor/plate/full/deceivers
			neck = /obj/item/clothing/neck/gorget
			gloves = /obj/item/clothing/gloves/plate/deceivers
			pants = /obj/item/clothing/pants/platelegs/deceivers
			shoes = /obj/item/clothing/shoes/boots/armor/deceivers
			backr = /obj/item/weapon/flail/peasantwarflail/deceivers
		if(/datum/patron/inhumen/hertannea)
			head = /obj/item/clothing/head/helmet/heavy/hertannea
			mask = /obj/item/clothing/face/spectacles/sglasses
			neck = /obj/item/clothing/neck/gorget
			armor = /obj/item/clothing/armor/plate
			gloves = /obj/item/clothing/gloves/plate
			pants = /obj/item/clothing/pants/platelegs
			shoes = /obj/item/clothing/shoes/boots/armor
			beltr = /obj/item/weapon/knife/dagger/steel/dirk/hertannea
			beltl = /obj/item/weapon/knife/dagger/steel/dirk/hertannea
		if(/datum/patron/angros,  /datum/patron/angros/extremist)
			wrists = /obj/item/clothing/neck/psycross/gold
			armor = /obj/item/clothing/armor/cuirass/fluted
			cloak = /obj/item/clothing/cloak/angrostabard
			gloves = /obj/item/clothing/gloves/chain/angros
			shoes = /obj/item/clothing/shoes/angrosboots
			head = /obj/item/clothing/head/helmet/heavy/angroshelm
			beltr = /obj/item/weapon/sword/long/angros
			beltl = /obj/item/weapon/scabbard/sword
		else
			head = /obj/item/clothing/head/helmet/heavy/bucket
			wrists = /obj/item/clothing/neck/psycross/silver/divine
			cloak = /obj/item/clothing/cloak/templar/undivided
			beltr = /obj/item/weapon/sword/long/decorated
