/datum/attribute_holder/sheet/job/sekketianshinobi
	raw_attribute_list = list(
		STAT_ENDURANCE = 1,
		STAT_SPEED = 2, //they're basically ninjas.
		STAT_STRENGTH = 1, //because they're mainly supposed to use blunt weapons.
		STATKET_INT = -1,
		STAT_PERCEPTION = -1,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 40,
		/datum/attribute/skill/combat/axesmaces = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/sneaking = 30,
		/datum/attribute/skill/misc/climbing = 50,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/medicine = 20,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/labor/mathematics = 10,
		/datum/attribute/skill/misc/lockpicking = 20, //these guys free slaves, they probably know how to disarm traps and unlock things
		/datum/attribute/skill/misc/stealing = 20,
		/datum/attribute/skill/craft/crafting = 10,
	)

/datum/job/advclass/combat/sekketianshinobi
	title = "Cudese Shinobi"
	tutorial = "You belong to the Shinobis of Yinshi. An elusive order of Akanite freedom fighters originating from the long-dead Old Kui. You have dedicated yourself to uplifting the enslaved and oppressed, and hope to continue doing so in the lands you travel."
	allowed_patrons = list(/datum/patron/divine/iliope)
	total_positions = -1
	spawn_positions = -1
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
	outfit = /datum/outfit/adventurer/sekketianshinobi

	attribute_sheet = /datum/attribute_holder/sheet/job/sekketianshinobi

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_MEDIUMARMOR, // so they can dodge wearing their mask, these guys dont actually spawn with medium armor, they have to EARN it.

	)

/datum/outfit/adventurer/sekketianshinobi
	name = "Cudese Shinobi (Adventurer)"
	head = /obj/item/clothing/head/helmet/leather/headscarf/colored/red
	neck = /obj/item/clothing/neck/coif/cloth/colored/berryblue
	mask = /obj/item/clothing/face/shellmask
	armor = /obj/item/clothing/shirt/clothvest/colored/red
	cloak = /obj/item/clothing/shirt/undershirt/sash/colored/white
	gloves = /obj/item/clothing/gloves/angle
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/dark
	pants = /obj/item/clothing/pants/trou/shadowpants
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/weapon/mace/rungu
	beltl = /obj/item/storage/belt/pouch //broke as hell!
	wrists = /obj/item/clothing/wrists/gem/shellbracelet

