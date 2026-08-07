/datum/attribute_holder/sheet/job/angrosiantemplar
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 2,
		STAT_ENDURANCE = 2,
		STAT_SPEED = -2,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/axesmaces = 30,
		/datum/attribute/skill/combat/whipsflails = 30,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/bows = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/combat/shields = 30,
		/datum/attribute/skill/misc/medicine = 10
	)

/datum/job/advclass/sacrestant/angrosiantemplar // A templar, but for the Inquisition
	title = "Adjudicator"
	tutorial = "You are among the strongest students of the Inquisition's Knightly Chapter. Top of your classes in both physical skill and intellectual matters, you’re here to prove you’re worthy of becoming an Inquisitor. One simple step, before your skill is recognized."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_LESS_DISCRIMINATED
	outfit = /datum/outfit/angrosiantemplar
	category_tags = list(CTAG_INQUISITION)

	attribute_sheet = /datum/attribute_holder/sheet/job/angrosiantemplar

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_STEELHEARTED,
		TRAIT_INQUISITION,
		TRAIT_SILVER_BLESSED,
		TRAIT_ANGROSIAN_GRIT,
		TRAIT_ANGROSIAN,
		TRAIT_FOREIGNER,
	)

	voicepack_m = /datum/voicepack/male/knight

/datum/job/advclass/sacrestant/angrosiantemplar/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	GLOB.inquisition.add_member_to_school(spawned, "Knightly Chapter", 0, "Adjudicator")

/datum/job/advclass/sacrestant/angrosiantemplar/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/static/list/helmets = list(
		"Barbute" = /obj/item/clothing/head/helmet/heavy/angrosbarbute,
		"Sallet" = /obj/item/clothing/head/helmet/heavy/psysallet,
		"Armet" = /obj/item/clothing/head/helmet/heavy/angroshelm,
		"Bucket Helm" = /obj/item/clothing/head/helmet/heavy/psybucket,
	)
	spawned.select_equippable(player_client, helmets, message = "Choose your HELMET.", title = "TAKE UP THE KATHOLIKON'S HELMS.")

	var/static/list/armors = list(
		"Hauberk" = /obj/item/clothing/armor/chainmail/hauberk/fluted,
		"Cuirass" = /obj/item/clothing/armor/cuirass/fluted,
	)
	spawned.select_equippable(player_client, armors, message = "Choose your ARMOR.", title = "TAKE UP THE KATHOLIKON'S MANTLE.")

	var/static/list/weapons = list(
		"Katholikon Longsword" = list(/obj/item/weapon/scabbard/sword, /obj/item/weapon/sword/long/angros),
		"Katholikon War Axe" = /obj/item/weapon/axe/angros,
		"Katholikon Whip" = /obj/item/weapon/whip/angros,
		"Katholikon Flail" = /obj/item/weapon/flail/angros,
		"Katholikon Mace" = /obj/item/weapon/mace/goden/angros,
		"Katholikon Spear + Handmace" = list(/obj/item/weapon/polearm/spear/angros, /obj/item/weapon/mace/cudgel/psy),
		"Katholikon Poleaxe + Shortsword" = list(/obj/item/weapon/greataxe/psy, /obj/item/weapon/sword/short/psy),
	)
	var/weapon_choice = spawned.select_equippable(player_client, weapons, message = "Choose your WEAPON.", title = "TAKE UP THE KATHOLIKON'S ARMS.")
	switch(weapon_choice)
		if("Katholikon Longsword")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/swords, 30, 30, TRUE)
		if("Katholikon War Axe", "Katholikon Mace", "Katholikon Poleaxe + Shortsword")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/axesmaces, 30, 30, TRUE)
		if("Katholikon Whip", "Katholikon Flail")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/whipsflails, 30, 30, TRUE)
		if("Katholikon Spear + Handmace")
			spawned.clamped_adjust_skill_level(/datum/attribute/skill/combat/polearms, 30, 30, TRUE)

/datum/outfit/angrosiantemplar
	name = "Adjudicator (Sacrestants)"
	cloak = /obj/item/clothing/cloak/angrostabard
	backr = /obj/item/weapon/shield/tower/metal
	gloves = /obj/item/clothing/gloves/chain/angros
	neck = /obj/item/clothing/neck/chaincoif
	pants = /obj/item/clothing/pants/chainlegs
	backl = /obj/item/storage/backpack/satchel/otavan
	shirt = /obj/item/clothing/armor/gambeson/heavy/inq
	shoes = /obj/item/clothing/shoes/angrosboots
	belt = /obj/item/storage/belt/leather/black
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = /obj/item/clothing/ring/signet/silver
	backpack_contents = list(
		/obj/item/storage/keyring/inquisitor = 1,
		/obj/item/paper/inqslip/arrival/ortho = 1,
		/obj/item/collar_detonator = 1,
	)

/datum/outfit/angrosiantemplar/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/centrist)
			wrists = /obj/item/clothing/neck/psycross/silver/divine
		if(/datum/patron/angros)
			wrists = /obj/item/clothing/neck/psycross/silver
