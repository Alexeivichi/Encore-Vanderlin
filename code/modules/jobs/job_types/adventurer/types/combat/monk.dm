/datum/attribute_holder/sheet/job/monk
	attribute_variance = list(
		/datum/attribute/skill/combat/polearms = list(10, 20),
		/datum/attribute/skill/misc/athletics = list(20, 30)
	)
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		STAT_PERCEPTION = -1,
		STAT_SPEED = 2,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/combat/unarmed = 40,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/misc/sewing = 20,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/misc/climbing = 40,
	)

/datum/attribute_holder/sheet/job/monk/kobold
	attribute_variance = list()
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_SPEED = -1,
	)
/datum/job/advclass/combat/monk
	title = "Monk"
	allowed_races = RACES_NON_ANTAG
	allowed_patrons = ALL_TEMPLE_PATRONS
	tutorial = "A traveling monk of the Aspects, unmatched in the unarmed arts, with an unwavering devotion to their patron God's Justice."
	total_positions = 99
	outfit = /datum/outfit/adventurer/monk

	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)
	allowed_patrons = ALL_TEMPLE_PATRONS  // randomize patron if not in ten

	attribute_sheet = /datum/attribute_holder/sheet/job/monk

	traits = list(
		TRAIT_DODGEEXPERT,
	)

/datum/job/advclass/combat/monk/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.dna?.species.id == "kobold")
		spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/monk/kobold)

/datum/outfit/adventurer/monk
	name = "Monk (Adventurer)"

	head = /obj/item/clothing/head/roguehood/colored/brown
	shoes = /obj/item/clothing/shoes/shortboots
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/shirt/robe/colored/plain
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/bandages/pugilist
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/backpack
	backr = /obj/item/weapon/polearm/woodstaff
	neck = /obj/item/clothing/cloak/templar/undivided

/datum/outfit/adventurer/monk/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()

	switch(H.patron?.type)
		if(/datum/patron/divine/visires)
			neck = /obj/item/clothing/neck/psycross/silver/divine/visires
		if(/datum/patron/divine/valdala) // Valdala acolytes are now gravetenders
			neck = /obj/item/clothing/neck/psycross/silver/divine/valdala
		if(/datum/patron/divine/pomette)
			neck = /obj/item/clothing/neck/psycross/silver/divine/pomette
		if(/datum/patron/divine/akan)
			neck = /obj/item/clothing/neck/psycross/silver/divine/akan
		if(/datum/patron/divine/erdl)
			neck = /obj/item/clothing/neck/psycross/silver/divine/erdl
		if(/datum/patron/divine/gani)
			neck = /obj/item/clothing/neck/psycross/silver/divine/gani
		if(/datum/patron/divine/mjallidhorn)
			neck = /obj/item/clothing/neck/psycross/silver/divine/mjallidhorn
		if(/datum/patron/divine/mordsol)
			neck = /obj/item/clothing/neck/psycross/silver/divine/mordsol
		if(/datum/patron/divine/iliope)
			neck = /obj/item/clothing/neck/psycross/silver/divine/iliope
		if(/datum/patron/divine/golerkanh)
			neck = /obj/item/clothing/neck/psycross/silver/divine/golerkanh
