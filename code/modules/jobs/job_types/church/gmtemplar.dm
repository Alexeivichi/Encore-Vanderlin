/datum/attribute_holder/sheet/job/gmtemplar
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_CONSTITUTION = 4,
		STAT_ENDURANCE = 2,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/swords = 40, // Its easier just to give them all three, it'd be a pain to try and manage this in the ult component
		/datum/attribute/skill/combat/polearms = 40,
		/datum/attribute/skill/combat/axesmaces = 40,
		/datum/attribute/skill/combat/wrestling = 40,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/magic/holy = 20,
		/datum/attribute/skill/misc/medicine = 10,
		/datum/attribute/skill/misc/sewing = 20
	)

/datum/job/gmtemplar
	title = JOB_GRANDMASTER_TEMPLAR
	tutorial = "Sent from the Worldflame Island, a faithful of Angros, an ashen Templar; you are a Martyr. You do not lead the Templars, that task falls to the Bishop. Nae; your task is to safeguard the Church and its people therein, sacrificing your very life for them if need be. Embody your dying god, and burn yourself up for the sake of others 'til naught but ash remains."
	department_flag = CHURCHMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_GMTEMPLAR
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	bypass_lastclass = TRUE
	cmode_music = 'sound/music/cmode/church/CombatRavox.ogg'

	allowed_races = RACES_LESS_DISCRIMINATED
	allowed_patrons = list(/datum/patron/angros)

	outfit = /datum/outfit/gmtemplar
	give_bank_account = 0

	job_bitflag = BITFLAG_CHURCH

	exp_type = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT)
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_CHURCH = 900,
		EXP_TYPE_COMBAT = 900
	)
	honorary = "Martyr"

	attribute_sheet = /datum/attribute_holder/sheet/job/gmtemplar

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_STEELHEARTED,
	)
	mind_traits = list(TRAIT_KNOWBANDITS)

	languages = list(/datum/language/celestial)


/datum/job/gmtemplar/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_gmtemplar()
		devotion.grant_to(spawned)

/datum/job/gmtemplar/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/static/list/selectableweapon = list(
		"Longsword" = /obj/item/weapon/sword/long/grandmaster,
		"Trident" = /obj/item/weapon/polearm/spear/grandmaster,
		"Axe" = /obj/item/weapon/greataxe/steel/grandmaster,
		"Mace" = /obj/item/weapon/mace/goden/steel/grandmaster,
	)

	spawned.select_equippable(player_client, selectableweapon, message = "Choose thy blade", title = "MARTYR")

	var/static/list/selectablehelm = list(
		"Armet" = /obj/item/clothing/head/helmet/visored/silver/armet,
		"Bascinet" = /obj/item/clothing/head/helmet/visored/silver,
	)

	spawned.select_equippable(player_client, selectablehelm, message = "Choose thy helm", title = "MARTYR")

	var/static/list/selectablecloak = list(
		"Cloak" = /obj/item/clothing/cloak/pantheon,
		"Tabard" = /obj/item/clothing/cloak/templar/undivided,
		"Jupon" = /obj/item/clothing/cloak/silktabard
	)

	spawned.select_equippable(player_client, selectablecloak, message = "Choose thy overcoat", title = "MARTYR")

/datum/outfit/gmtemplar
	name = JOB_GRANDMASTER_TEMPLAR
	neck = /obj/item/clothing/neck/chaincoif
	armor = /obj/item/clothing/armor/plate/full/silver
	shirt = /obj/item/clothing/armor/chainmail
	pants = /obj/item/clothing/pants/platelegs/silver
	shoes = /obj/item/clothing/shoes/boots/armor/silver
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/keyring/priest = 1,  /obj/item/storage/belt/pouch/coins/rich = 1)
	belt = /obj/item/storage/belt/leather/black
	ring = /obj/item/clothing/ring/silver/rontz
	gloves = /obj/item/clothing/gloves/plate/silver
	wrists = /obj/item/clothing/neck/psycross/gold






