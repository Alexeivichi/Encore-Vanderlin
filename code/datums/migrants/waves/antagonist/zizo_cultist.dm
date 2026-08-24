/datum/migrant_role/archdevil_cultist
	name = "Hell's Ascendant"
	migrant_job = /datum/job/migrant/archdevil_cultist

/datum/attribute_holder/sheet/job/migrant/archdevil_cultist
	raw_attribute_list = list(
		STAT_STRENGTH = 3,
		STAT_PERCEPTION = 1,
		STAT_INTELLIGENCE = 3,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/combat/whipsflails = 40,
		/datum/attribute/skill/combat/axesmaces = 30,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/crossbows = 30,
		/datum/attribute/skill/combat/bows = 30,
		/datum/attribute/skill/misc/riding = 40,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/labor/mathematics = 30,
		/datum/attribute/skill/misc/climbing = 30,
	)

/datum/job/migrant/archdevil_cultist
	title = "Hell's Ascendant"
	outfit = /datum/outfit/archdevil_cultist
	antag_role = /datum/antagonist/archdevilcultist/leader
	allowed_sexes = list(FEMALE)
	allowed_races = list(SPEC_ID_DROW)
	honorary_f = "Madame"

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/archdevil_cultist

	traits = list(TRAIT_NOBLE_BLOOD, TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED)
	languages = list(/datum/language/undead)
	cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
	default_patron = /datum/patron/inhumen/archdevils

/datum/outfit/archdevil_cultist
	name = "Hell's Ascendant"
	head = /obj/item/clothing/head/helmet/skullcap/cult
	mask = /obj/item/clothing/face/shepherd/shadowmask
	neck = /obj/item/clothing/neck/chaincoif
	shirt = /obj/item/clothing/shirt/shadowshirt
	armor = /obj/item/clothing/armor/plate/full/archdevils
	cloak = /obj/item/clothing/cloak/half/shadowcloak/cult
	wrists = /obj/item/clothing/neck/psycross/heretical
	gloves = /obj/item/clothing/gloves/plate/archdevils
	pants = /obj/item/clothing/pants/platelegs/archdevils
	shoes = /obj/item/clothing/shoes/boots/armor/archdevils
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/whip/spiderwhip
	beltr = /obj/item/weapon/knife/dagger/steel/dirk
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/weapon/sword/long/greatsword/flamberge
	scabbards = list(/obj/item/weapon/scabbard/knife)

/datum/migrant_role/archdevil_cultist_lesser
	name = "Ascendant Follower"
	greet_text = "You are the apostle of your madame. Should you see their ascension through, you will be rewarded in kind."
	migrant_job = /datum/job/migrant/archdevil_cultist_lesser

/datum/attribute_holder/sheet/job/migrant/archdevil_cultist_lesser
	raw_attribute_list = list(
		STAT_STRENGTH = 1,
		STAT_CONSTITUTION = 1,
		STAT_ENDURANCE = 1,
		STAT_SPEED = 1,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/whipsflails = 30,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/riding = 10,
	)

/datum/job/migrant/archdevil_cultist_lesser
	title = "Ascendant Follower"
	tutorial = "You are the apostle of your madame. Should you see their ascension through, you will be rewarded in kind."
	outfit = /datum/outfit/archdevil_cultist_lesser
	antag_role = /datum/antagonist/archdevilcultist
	allowed_races = list(SPEC_ID_DROW, SPEC_ID_HALF_DROW)

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/archdevil_cultist_lesser

	traits = list(TRAIT_MEDIUMARMOR, TRAIT_DUALWIELDER)
	languages = list(/datum/language/undead)
	cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
	default_patron = /datum/patron/inhumen/archdevils

/datum/outfit/archdevil_cultist_lesser
	name = "Ascendant Follower"
	head = /obj/item/clothing/head/helmet/skullcap/cult
	mask = /obj/item/clothing/face/shepherd/shadowmask
	neck = /obj/item/clothing/neck/highcollier
	shirt = /obj/item/clothing/armor/chainmail
	armor = /obj/item/clothing/armor/cuirass/iron/shadowplate
	cloak = /obj/item/clothing/shirt/undershirt/sash/colored/violet
	wrists = /obj/item/clothing/neck/psycross/heretical
	gloves = /obj/item/clothing/gloves/fingerless/shadowgloves
	pants = /obj/item/clothing/pants/trou/leather/splint
	shoes = /obj/item/clothing/shoes/boots/darkboots
	belt = /obj/item/storage/belt/leather/black
	beltl = /obj/item/weapon/sword/sabre/stalker
	beltr = /obj/item/weapon/sword/sabre/stalker
	backr = /obj/item/clothing/cloak/half/shadowcloak/cult
	backl = /obj/item/storage/backpack/satchel
	scabbards = list(/obj/item/weapon/scabbard/sword, /obj/item/weapon/scabbard/sword)

	backpack_contents = list(
		/obj/item/weapon/knife/dagger/steel/dirk = 1,
	)
