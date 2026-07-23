/datum/attribute_holder/sheet/job/paladin
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_PERCEPTION = 2,
		STAT_INTELLIGENCE = 2,
		STAT_CONSTITUTION = 1,
		STAT_ENDURANCE = 1,
		STAT_SPEED = -2,
		STAT_FORTUNE = 1,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/shields = 30,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/magic/holy = 20,
		/datum/attribute/skill/craft/cooking = 10,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/attribute_holder/sheet/job/paladin/extremist
	raw_attribute_list = list(
		STAT_CONSTITUTION = 1,
		STAT_PERCEPTION = 1,
		/datum/attribute/skill/combat/swords = 10,
	)

/datum/job/advclass/combat/paladin
	title = "Paladin"
	tutorial = "Paladins are former noblemen and clerics who have dedicated themselves to great combat prowess. Often, they were promised redemption for past sins if they crusaded in the name of the gods."
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	outfit = /datum/outfit/folkhero/paladin
	allowed_patrons = ALL_PALADIN_PATRONS
	total_positions = -1
	spawn_positions = -1
	category_tags = list(CTAG_FOLKHEROES)

	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)

	attribute_sheet = /datum/attribute_holder/sheet/job/paladin

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_NOBLE_BLOOD,
	)

/datum/job/advclass/combat/paladin/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	spawned.virginity = TRUE

	switch(spawned.patron?.type)
		if(/datum/patron/angros, /datum/patron/angros/extremist)
			spawned.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/paladin/extremist)
			spawned.grant_language(/datum/language/newunsundered)
			ADD_TRAIT(spawned, TRAIT_ANGROSIAN_GRIT, JOB_TRAIT)
		if(/datum/patron/divine/visires)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
		if(/datum/patron/divine/akan)
			spawned.cmode_music = 'sound/music/cmode/church/CombatNoc.ogg'
		if(/datum/patron/divine/gani)
			spawned.cmode_music = 'sound/music/cmode/garrison/CombatForestGarrison2.ogg'
		if(/datum/patron/divine/mjallidhorn)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAbyssor.ogg'
		if(/datum/patron/divine/valdala)
			spawned.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
			ADD_TRAIT(spawned, TRAIT_GRAVEROBBER, JOB_TRAIT)
		if(/datum/patron/divine/mordsol)
			spawned.cmode_music = 'sound/music/cmode/church/CombatRavox.ogg'
		if(/datum/patron/divine/iliope)
			spawned.cmode_music = 'sound/music/cmode/church/CombatXylix.ogg'
		if(/datum/patron/divine/erdl)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/golerkanh)
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
		if(/datum/patron/divine/pomette)
			spawned.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
			spawned.virginity = FALSE
			ADD_TRAIT(spawned, TRAIT_BEAUTIFUL, JOB_TRAIT)
		else
			spawned.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'

	if(!spawned.has_language(/datum/language/celestial) && (spawned.patron?.type in ALL_TEMPLE_PATRONS))
		spawned.grant_language(/datum/language/celestial)
		to_chat(spawned, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")

	if(spawned.dna?.species.id == SPEC_ID_HUMEN)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_templar()
		devotion.grant_to(spawned)

/datum/outfit/folkhero/paladin
	name = "Paladin (Folkhero)"

	armor = /obj/item/clothing/armor/plate
	shirt = /obj/item/clothing/armor/chainmail
	pants = /obj/item/clothing/pants/platelegs
	shoes = /obj/item/clothing/shoes/boots/armor
	belt = /obj/item/storage/belt/leather/steel
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = /obj/item/clothing/ring/silver/toper
	cloak = /obj/item/clothing/cloak/tabard/crusader
	neck = /obj/item/clothing/neck/chaincoif
	gloves = /obj/item/clothing/gloves/plate
	backl = /obj/item/weapon/sword/long/judgement
	head = /obj/item/clothing/head/helmet/heavy/bucket
	wrists = /obj/item/clothing/neck/psycross/silver

/datum/outfit/folkhero/paladin/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()

	switch(H.patron?.type)
		if(/datum/patron/angros, /datum/patron/angros/extremist)
			head = /obj/item/clothing/head/helmet/heavy/bucket/gold
			wrists = /obj/item/clothing/neck/psycross/gold
		if(/datum/patron/divine/visires)
			head = /obj/item/clothing/head/helmet/heavy/necked/visires
			wrists = /obj/item/clothing/neck/psycross/silver/divine/visires
		if(/datum/patron/divine/akan)
			head = /obj/item/clothing/head/helmet/heavy/necked/akan
			wrists = /obj/item/clothing/neck/psycross/silver/divine/akan
		if(/datum/patron/divine/gani)
			head = /obj/item/clothing/head/helmet/heavy/necked/ganihelm
			wrists = /obj/item/clothing/neck/psycross/silver/divine/gani
		if(/datum/patron/divine/mjallidhorn)
			head = /obj/item/clothing/head/helmet/heavy/necked/mjallidhorn
			wrists = /obj/item/clothing/neck/psycross/silver/divine/mjallidhorn
		if(/datum/patron/divine/valdala)
			head = /obj/item/clothing/head/helmet/heavy/necked/valdala
			wrists = /obj/item/clothing/neck/psycross/silver/divine/valdala
		if(/datum/patron/divine/mordsol)
			head = /obj/item/clothing/head/helmet/heavy/necked/mordsol
			wrists = /obj/item/clothing/neck/psycross/silver/divine/mordsol
		if(/datum/patron/divine/iliope)
			head = /obj/item/clothing/head/helmet/heavy/necked/iliope
			wrists = /obj/item/clothing/neck/psycross/silver/divine/iliope
		if(/datum/patron/divine/erdl)
			head = /obj/item/clothing/head/helmet/heavy/necked/erdlhelm
			wrists = /obj/item/clothing/neck/psycross/silver/divine/erdl
		if(/datum/patron/divine/golerkanh)
			head = /obj/item/clothing/head/helmet/heavy/necked/golerkanhhelm
			wrists = /obj/item/clothing/neck/psycross/silver/divine/golerkanh
		if(/datum/patron/divine/pomette)
			head = /obj/item/clothing/head/helmet/sallet/pomettic
			wrists = /obj/item/clothing/neck/psycross/silver/divine/pomette
