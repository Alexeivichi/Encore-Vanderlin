/datum/attribute_holder/sheet/job/clerk
	raw_attribute_list = list(
		STAT_SPEED = 1,
		STAT_INTELLIGENCE = 1,
		STAT_FORTUNE = 1,
		/datum/attribute/skill/misc/stealing = 40,
		/datum/attribute/skill/misc/sneaking = 20,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/misc/athletics = 10,
		/datum/attribute/skill/misc/lockpicking = 20,
		/datum/attribute/skill/labor/mathematics = 30
	)

/datum/attribute_holder/sheet/job/clerk/choice_three
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		/datum/attribute/skill/combat/swords = 10,
		/datum/attribute/skill/combat/axesmaces = 10,
	)

/datum/attribute_holder/sheet/job/clerk/choice_two
	raw_attribute_list = list(
		/datum/attribute/skill/combat/bows = 10,
	)

/datum/attribute_holder/sheet/job/clerk/choice_one
	raw_attribute_list = list(
		/datum/attribute/skill/combat/crossbows = 10,
	)

/datum/job/clerk
	title = JOB_CLERK
	tutorial = "You work under the employ of the Etgard Trading Guild and, by consequence, its Majordomo. \
	Tasked with handling customers, organizing shelves, and taking inventory, your work is mind-numbing and repetitive. \
	Despite its mundanity however, it keeps a roof over your head and teaches you the art of mercantilism. \
	With enough time, you will become more than a clerk and open a business that rivals all others."
	department_flag = APPRENTICES
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	factions = list(FACTION_TOWN)
	total_positions = 99
	spawn_positions = 99
	display_order = JDO_CLERK
	is_quest_giver = TRUE
	give_bank_account = 10
	bypass_lastclass = TRUE
	can_have_apprentices = FALSE

	allowed_races = RACES_NON_ANTAG
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	outfit = /datum/outfit/clerk
	display_order = JDO_CLERK
	give_bank_account = 10
	bypass_lastclass = TRUE
	can_have_apprentices = FALSE
	cmode_music = 'sound/music/cmode/towner/CombatTowner2.ogg'
	exp_types_granted = list(EXP_TYPE_MERCHANT_COMPANY)
	can_be_apprentice = TRUE

	exp_types_granted = list(EXP_TYPE_MERCHANT_COMPANY)

	attribute_sheet = /datum/attribute_holder/sheet/job/clerk

	traits = list(
		TRAIT_SEEPRICES
	)

/datum/job/clerk/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/random_roll = rand(1, 3)
	switch(random_roll)
		if(1)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/clerk/choice_one)
		if(2)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/clerk/choice_two)
		if(3)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/clerk/choice_three)

/datum/outfit/clerk
	name = "Clerk Base"
	head = /obj/item/clothing/head/chaperon
	pants = /obj/item/clothing/pants/tights
	shoes = /obj/item/clothing/shoes/simpleshoes
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/storage/keyring/stevedore
	backr = /obj/item/storage/backpack/satchel
	gloves = /obj/item/clothing/gloves/fingerless

/datum/outfit/clerk/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == FEMALE)
		shirt = /obj/item/clothing/shirt/dress/gen/colored/blue
	else
		shirt = /obj/item/clothing/shirt/undershirt/colored/blue
