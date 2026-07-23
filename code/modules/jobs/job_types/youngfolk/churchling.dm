/datum/attribute_holder/sheet/job/churchling
	raw_attribute_list = list(
		STATKEY_PER = 1,
		STAT_SPEED = 2,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/sneaking = 40,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/magic/holy = 20,
		/datum/attribute/skill/misc/sewing = 20,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/craft/crafting = 10,
		/datum/attribute/skill/craft/cooking = 10
	)

/datum/job/churchling
	title = JOB_CHURCHLING
	tutorial = "Your family were zealots. \
	They scolded you with a studded belt and prayed like sinners \
	every waking hour of the day they weren’t toiling in the fields. \
	You escaped them by becoming a churchling-- and a guaranteed education isn't so bad."
	department_flag = YOUNGFOLK
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_CHURCHLING
	faction = FACTION_TOWN
	total_positions = -1
	spawn_positions = -1
	bypass_lastclass = TRUE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = RACES_LESS_DISCRIMINATED
	allowed_patrons = UNDIVIDED_TEMPLE_PATRONS

	outfit = /datum/outfit/churchling
	give_bank_account = TRUE
	can_have_apprentices = FALSE
	can_be_apprentice = TRUE
	cmode_music = 'sound/music/cmode/towner/CombatTowner.ogg'
	job_bitflag = BITFLAG_CHURCH
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_CLERIC)

	attribute_sheet = /datum/attribute_holder/sheet/job/churchling

	languages = list(/datum/language/celestial)

/datum/job/churchling/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_churchling()
		devotion.grant_to(spawned)

/datum/outfit/churchling
	name = JOB_CHURCHLING
	neck = /obj/item/clothing/neck/psycross/silver/divine
	armor = /obj/item/clothing/shirt/robe
	shirt = /obj/item/clothing/shirt/undershirt
	pants = /obj/item/clothing/pants/tights
	belt = /obj/item/storage/belt/leather/rope
	shoes = /obj/item/clothing/shoes/simpleshoes
	beltl = /obj/item/key/church

/datum/outfit/churchling/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == FEMALE)
		head = /obj/item/clothing/head/armingcap
		armor = /obj/item/clothing/shirt/dress/gen/colored/random
		shirt = /obj/item/clothing/shirt/undershirt

	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/visires)
			neck = /obj/item/clothing/neck/psycross/silver/divine/visires
		if(/datum/patron/divine/valdala)
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
