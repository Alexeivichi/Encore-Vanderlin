/datum/attribute_holder/sheet/job/chainbreaker
	raw_attribute_list = list(
		STAT_ENDURANCE = 3,
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/sneaking = 20,
		/datum/attribute/skill/combat/bows = 10,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/axesmaces = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/combat/whipsflails = 30,
		/datum/attribute/skill/combat/polearms = 30,
		/datum/attribute/skill/combat/shields = 40,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/misc/riding = 10,
		/datum/attribute/skill/craft/cooking = 10,
	)

/datum/attribute_holder/sheet/job/chainbreaker/warhammer
	raw_attribute_list = list(
		/datum/attribute/skill/combat/axesmaces = 10,
	)

/datum/attribute_holder/sheet/job/chainbreaker/warpick
	raw_attribute_list = list(
		/datum/attribute/skill/combat/axesmaces = 10,
	)

/datum/attribute_holder/sheet/job/chainbreaker/waraxe
	raw_attribute_list = list(
		/datum/attribute/skill/combat/axesmaces = 10,
	)

/datum/attribute_holder/sheet/job/chainbreaker/cutlass
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 10,
		traits = list(TRAIT_DUALWIELDER)
	)

/datum/attribute_holder/sheet/job/chainbreaker/maciejowski
	raw_attribute_list = list(
		/datum/attribute/skill/combat/swords = 10,
	)

/datum/attribute_holder/sheet/job/chainbreaker/warflail
	raw_attribute_list = list(
		/datum/attribute/skill/combat/whipsflails = 10,
	)

/datum/attribute_holder/sheet/job/chainbreaker/spear
	raw_attribute_list = list(
		/datum/attribute/skill/combat/polearms = 10,
	)

/datum/job/advclass/mercenary/chainbreaker
	title = "Chainbreaker"
	tutorial = "The Chainbreaker Company, a mercenary group formed a decade ago following a slave revolt in the Qadirid. \
	Though the revolt was crushed in short order, a number of former slaves made it to the Port of Stars and fled the Sultanate by sea. \
	They found their liberation upon reaching Freeport, and from there the Chainbreakers were formed; former-slaves now turned-mercenary, taking up arms \
	to break the chains of yet more enslaved. They serve all over the Goblet, amassing funds and resources to outfit and train \
	their members, while periodically carrying out clandestine raids on the Qadirid Sultanate to free more from the horror of servitude."
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/mercenary/chainbreaker

	attribute_sheet = /datum/attribute_holder/sheet/job/chainbreaker

	traits = list(TRAIT_NOPAINSTUN, TRAIT_CRITICAL_RESISTANCE)
	languages = list(/datum/language/qadirid)
	category_tags = list(CTAG_MERCENARY)
	total_positions = 99
	spawn_positions = 99

	cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/outfit/mercenary/chainbreaker
	name = "Chainbreaker (Mercenary)"
	neck = /obj/item/clothing/neck/gorget/chainbreaker
	wrists = /obj/item/clothing/wrists/bracers/splintarms
	pants = /obj/item/clothing/pants/chainlegs/splint
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	gloves = /obj/item/clothing/gloves/leather/advanced
	belt = /obj/item/storage/belt/leather/mercenary
	shirt = /obj/item/clothing/armor/gambeson/arming
	head = /obj/item/clothing/head/helmet/heavy/volfplate
	armor = /obj/item/clothing/armor/brigandine/light
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/weapon/scabbard/knife = 1,
	)

/datum/job/advclass/mercenary/chainbreaker/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/weapons = list("Militia Steel Warpick", "Militia Spear", "Militia War Axe", "Militia Thresher", "Dual Cutlasses", "Maciejowski", "Warhammer")
	var/weapon_choice = tgui_input_list(player_client,"CHOOSE YOUR WEAPON.", "ARMS TO SLAY THE OPPRESSORS", weapons)
	switch(weapon_choice)
		if("Militia Steel Warpick")
			spawned.equip_to_slot_or_del(new /obj/item/weapon/pick/warpick/steel, ITEM_SLOT_BELT_L, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/weapon/shield/heater, ITEM_SLOT_BACK_L, TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/warpick)
		if("Militia Spear")
			spawned.put_in_hands(new /obj/item/weapon/polearm/spear/militia)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/spear)
		if("Militia War Axe")
			spawned.put_in_hands(new /obj/item/weapon/greataxe/militia)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/waraxe)
		if("Militia Thresher")
			spawned.put_in_hands(new /obj/item/weapon/flail/peasantwarflail)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/warflail)
		if("Dual Cutlasses")
			spawned.equip_to_slot_or_del(new /obj/item/weapon/sword/sabre/cutlass, ITEM_SLOT_BELT_L, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/weapon/sword/sabre/cutlass, ITEM_SLOT_BELT_R, TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/cutlass)
		if("Maciejowski")
			spawned.equip_to_slot_or_del(new /obj/item/weapon/sword/scimitar/falchion/militia, ITEM_SLOT_BELT_L, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/weapon/shield/heater, ITEM_SLOT_BACK_L, TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/maciejowski)
		if("Warhammer")
			spawned.equip_to_slot_or_del(new /obj/item/weapon/mace/warhammer/steel, ITEM_SLOT_BELT_L, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/weapon/shield/heater, ITEM_SLOT_BACK_L, TRUE)
			spawned.attributes?.add_sheet(/datum/attribute_holder/sheet/job/chainbreaker/warhammer)
