/datum/attribute_holder/sheet/job/profanepaladin
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_PERCEPTION = 2,
		STAT_INTELLIGENCE = 2,
		STAT_CONSTITUTION = 1,
		STAT_ENDURANCE = 1,
		STAT_SPEED = -2,
		/datum/attribute/skill/combat/axesmaces = 20,
		/datum/attribute/skill/combat/wrestling = 30,
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

/datum/job/advclass/combat/profanepaladin
	title = "False Paladin"
	tutorial = "There are those who are so dedicated to the worship and service of their heretical god, that they have become famous amongst their followers, and infamous amongst the common men and women. These False Paladins bear the armour and marks of their respective god, travelling across the lands to preach and slay in their name. Naturally, they are branded a heretic by the Katholikos. Expect no quarter."
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/adventurer/profanepaladin
	total_positions = -1
	spawn_positions = -1
	category_tags = list(CTAG_ADVENTURER)
	allowed_patrons = ALL_PROFANE_PATRONS
	exp_type = list(EXP_TYPE_ADVENTURER, EXP_TYPE_LIVING, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)

	attribute_sheet = /datum/attribute_holder/sheet/job/profanepaladin

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_STEELHEARTED,
	)

/datum/job/advclass/combat/profanepaladin/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.dna?.species.id == SPEC_ID_HUMEN)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_templar()
		devotion.grant_to(spawned)

	switch(spawned.patron?.type)
		if(/datum/patron/inhumen/archdevils)
			spawned.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
		if(/datum/patron/inhumen/sages)
			spawned.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
		if(/datum/patron/inhumen/envy)
			spawned.cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
			if(!spawned.has_language(/datum/language/undead))
				spawned.grant_language(/datum/language/undead)
		if(/datum/patron/inhumen/deceivers)
			spawned.cmode_music = 'sound/music/cmode/antag/CombatBandit1.ogg'
		if(/datum/patron/inhumen/hertannea)
			spawned.cmode_music = 'sound/music/cmode/antag/CombatBaotha.ogg'
		else
			spawned.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'

	GLOB.heretical_players += spawned.real_name

/datum/outfit/adventurer/profanepaladin
	name = "False Paladin (Adventurer)"

	shirt = /obj/item/clothing/armor/chainmail
	belt = /obj/item/storage/belt/leather/steel
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = /obj/item/clothing/ring/silver/toper
	neck = /obj/item/clothing/neck/chaincoif
	backl = /obj/item/weapon/sword/long/judgement/evil

	head = /obj/item/clothing/head/helmet/heavy/bucket
	armor = /obj/item/clothing/armor/plate
	gloves = /obj/item/clothing/gloves/plate
	pants = /obj/item/clothing/pants/platelegs
	shoes = /obj/item/clothing/shoes/boots/armor

/datum/outfit/adventurer/profanepaladin/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	switch(H.patron?.type)
		if(/datum/patron/inhumen/archdevils)
			head = /obj/item/clothing/head/helmet/heavy/archdevils
			armor = /obj/item/clothing/armor/plate/full/archdevils
			gloves = /obj/item/clothing/gloves/plate/archdevils
			pants = /obj/item/clothing/pants/platelegs/archdevils
			shoes = /obj/item/clothing/shoes/boots/armor/archdevils
			cloak = /obj/item/clothing/cloak/archdevils
		if(/datum/patron/inhumen/sages)
			head = /obj/item/clothing/head/helmet/heavy/archdevils
			armor = /obj/item/clothing/armor/plate/full/archdevils
			gloves = /obj/item/clothing/gloves/plate/archdevils
			pants = /obj/item/clothing/pants/platelegs/archdevils
			shoes = /obj/item/clothing/shoes/boots/armor/archdevils
			cloak = /obj/item/clothing/cloak/archdevils
			H.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
		if(/datum/patron/inhumen/envy)
			head = /obj/item/clothing/head/helmet/visored/envy
			armor = /obj/item/clothing/armor/plate/full/envy
			gloves = /obj/item/clothing/gloves/plate/envy
			pants = /obj/item/clothing/pants/platelegs/envy
			shoes = /obj/item/clothing/shoes/boots/armor/envy
		if(/datum/patron/inhumen/deceivers)
			head = /obj/item/clothing/head/helmet/heavy/deceivers
			armor = /obj/item/clothing/armor/plate/full/deceivers
			gloves = /obj/item/clothing/gloves/plate/deceivers
			pants = /obj/item/clothing/pants/platelegs/deceivers
			shoes = /obj/item/clothing/shoes/boots/armor/deceivers
		if(/datum/patron/inhumen/hertannea)
			head = /obj/item/clothing/head/helmet/heavy/hertannea
			mask = /obj/item/clothing/face/spectacles/sglasses
			armor = /obj/item/clothing/armor/plate
			gloves = /obj/item/clothing/gloves/plate
			pants = /obj/item/clothing/pants/platelegs
			shoes = /obj/item/clothing/shoes/boots/armor
