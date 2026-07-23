/datum/attribute_holder/sheet/job/absolver
	raw_attribute_list = list(
		STAT_ENDURANCE = 3,
		STAT_SPEED = -2,
		STAT_CONSTITUTION = 7,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/climbing = 40,
		/datum/attribute/skill/misc/sewing = 30,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/combat/unarmed = 10,
		/datum/attribute/skill/misc/medicine = 30,
		/datum/attribute/skill/craft/cooking = 30,
		/datum/attribute/skill/labor/fishing = 30,
		/datum/attribute/skill/misc/swimming = 30,
		/datum/attribute/skill/craft/crafting = 30,
		/datum/attribute/skill/magic/holy = 20
	)

/datum/job/absolver
	title = JOB_ABSOLVER
	department_flag = INQUISITION
	faction = "Station"
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	total_positions = 1 // THE ONE.
	spawn_positions = 1
	allowed_races = RACES_LESS_DISCRIMINATED
	allowed_patrons = list(/datum/patron/divine/centrist)
	tutorial = "The Inquisitor's right hand, you serve as the orthidoxy's cleric, providing miracles to bolster "
	selection_color = JCOLOR_INQUISITION
	outfit = /datum/outfit/absolver
	bypass_lastclass = TRUE
	display_order = JDO_ABSOLVER
	give_bank_account = 15
	cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
	antag_role = /datum/antagonist/purishep

	job_bitflag = BITFLAG_CHURCH

	mind_traits = list(
		TRAIT_KNOW_INQUISITION_DOORS
	)
	traits = list(
		TRAIT_NOPAINSTUN,
		TRAIT_EMPATH,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_STEELHEARTED,
		TRAIT_INQUISITION,
		TRAIT_SILVER_BLESSED,
		TRAIT_FOREIGNER,
	)

	spells = list(
		/datum/action/cooldown/spell/angroslux_tamper,
		/datum/action/cooldown/spell/angrosabsolve,
		/datum/action/cooldown/spell/diagnose,
	)

	attribute_sheet = /datum/attribute_holder/sheet/job/absolver

	languages = list(/datum/language/oldunsundered, /datum/language/newunsundered)

	exp_type = list(EXP_TYPE_INQUISITION)
	exp_types_granted = list(EXP_TYPE_INQUISITION)
	exp_requirements = list(
		EXP_TYPE_INQUISITION = 600
	)


// REMEMBER FLAGELLANT? REMEMBER LASZLO? THIS IS HIM NOW. FEEL OLD YET?

/datum/job/absolver/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	GLOB.inquisition.add_member_to_school(spawned, "Sanctae", 0, "Absolver")

	add_verb(spawned, /mob/living/carbon/human/proc/view_inquisition)

	spawned.hud_used?.shutdown_bloodpool()
	spawned.hud_used?.initialize_bloodpool()
	spawned.hud_used?.bloodpool.set_fill_color("#dcdddb")
	spawned.hud_used?.bloodpool?.name = "Aspects' Grace: [spawned.bloodpool]"
	spawned.hud_used?.bloodpool?.desc = "Devotion: [spawned.bloodpool]/[spawned.maxbloodpool]"
	spawned.maxbloodpool = 1000

	var/datum/species/species = spawned.dna?.species
	if(!species)
		return
	species.native_language = "Old Unsundered"
	species.accent_language = species.get_accent(species.native_language)

/datum/outfit/absolver
	name = JOB_ABSOLVER
	wrists = /obj/item/clothing/wrists/bracers/psythorns
	gloves = /obj/item/clothing/gloves/leather/otavan/inqgloves
	beltr = /obj/item/flashlight/flare/torch/lantern/psycenser
	beltl = /obj/item/storage/belt/pouch/coins/rich
	neck = /obj/item/clothing/neck/psycross/silver
	cloak = /obj/item/clothing/cloak/absolutionistrobe
	backr = /obj/item/storage/backpack/satchel/otavan
	belt = /obj/item/storage/belt/leather
	pants = /obj/item/clothing/pants/trou/leather/advanced/colored/duelpants
	armor = /obj/item/clothing/armor/cuirass/angros
	shirt = /obj/item/clothing/armor/gambeson/heavy/inq
	shoes = /obj/item/clothing/shoes/angrosboots
	mask = /obj/item/clothing/head/helmet/blacksteel/psythorns
	head = /obj/item/clothing/head/helmet/heavy/absolver
	ring = /obj/item/clothing/ring/signet/silver
	backpack_contents = list(
		/obj/item/book/bibble/psy = 1,
		/obj/item/natural/bundle/cloth = 2,
		/obj/item/reagent_containers/glass/bottle/healthpot = 2,
		/obj/item/paper/inqslip/arrival/abso = 1,
		/obj/item/needle = 1,
		/obj/item/natural/worms/leech = 1,
		/obj/item/key/inquisition = 1,
		)
