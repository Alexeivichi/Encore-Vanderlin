/datum/attribute_holder/sheet/job/majordomo
	raw_attribute_list = list(
		STAT_STRENGTH = -2,
		STAT_INTELLIGENCE = 5,
		STAT_CONSTITUTION = -2,
		/datum/attribute/skill/combat/swords = 20,
		/datum/attribute/skill/misc/reading = 60,
		/datum/attribute/skill/misc/riding = 20,
		/datum/attribute/skill/misc/stealing = 20,
		/datum/attribute/skill/misc/sneaking = 20,
		/datum/attribute/skill/misc/lockpicking = 60,
		/datum/attribute/skill/labor/mathematics = 50,
		/datum/attribute/skill/combat/firearms = 20,
	)

/datum/job/majordomo
	title = JOB_MAJORDOMO
	tutorial = "The hopelessly-wealthy steward of the Etgard Treasury, and sole protector of the Divine Hoard. Stringently subservient to the Shirleighs, the royals who run Domotan Island."
	department_flag = NOBLEMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_MAJORDOMO
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	bypass_lastclass = TRUE
	is_quest_giver = TRUE
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	outfit = /datum/outfit/majordomo
	give_bank_account = 200
	noble_income = 16
	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'
	job_bitflag = BITFLAG_ROYALTY
	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_NOBLE)

	honorary = "Lord"
	honorary_f = "Lady"

	attribute_sheet = /datum/attribute_holder/sheet/job/majordomo

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_NOBLE_LOCAL,
	)

/datum/outfit/majordomo/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/shirt/dress/stewarddress
	else
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/trou/leathertights

/datum/job/majordomo/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.virginity = TRUE

/datum/outfit/majordomo
	name = JOB_MAJORDOMO
	shoes = /obj/item/clothing/shoes/simpleshoes/buckle
	shirt = /obj/item/clothing/shirt/dress/stewarddress
	head = /obj/item/clothing/head/stewardtophat
	neck = /obj/item/storage/keyring/steward
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	armor = /obj/item/clothing/armor/gambeson/steward
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/weapon/sword/rapier
	beltl = /obj/item/weapon/mace/cane/merchant
	ring = /obj/item/clothing/ring/gold/guild_mercator
	scabbards = list(/obj/item/weapon/scabbard/sword)
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/rich = 1,
		/obj/item/lockpickring/mundane = 1
	)

/datum/outfit/majordomo/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/trou/leathertights
