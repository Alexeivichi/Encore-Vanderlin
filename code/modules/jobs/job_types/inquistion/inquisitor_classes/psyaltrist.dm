/datum/attribute_holder/sheet/job/psyaltrist
	raw_attribute_list = list(
		STAT_ENDURANCE = 1,
		STAT_SPEED = 3,
		/datum/attribute/skill/misc/music = 50,
		/datum/attribute/skill/magic/holy = 40,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/misc/swimming = 30,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/athletics = 40,
		/datum/attribute/skill/misc/reading = 30,
		/datum/attribute/skill/misc/medicine = 20
	)

/datum/job/advclass/sacrestant/psyaltrist
	title = "Precentor"
	tutorial = "A Bard who found a higher calling among the faithful; you've joined the Katholikon's Inquisition to help further spread the good word through song. Off the books though, you gather intelligence, much as the Confessor does. While they do their work in the shadows with blades, you do yours with a quick tongue and charming smile. Do your best to make the Inquisition look good."
	allowed_races = RACES_LESS_DISCRIMINATED
	category_tags = list(CTAG_INQUISITION)
	outfit = /datum/outfit/psyaltrist

	attribute_sheet = /datum/attribute_holder/sheet/job/psyaltrist

	languages = list(
		/datum/language/elvish,
		/datum/language/celestial,
		/datum/language/hellspeak,
		/datum/language/orcish
	)

	traits = list(	TRAIT_DODGEEXPERT,
		TRAIT_EMPATH,
		TRAIT_INQUISITION,
		TRAIT_SILVER_BLESSED,
		TRAIT_ANGROSIAN_GRIT,
		TRAIT_ANGROSIAN,
		TRAIT_FOREIGNER,
		)

	spells = list(/datum/action/cooldown/spell/projectile/vicious_mockery)

	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander3.ogg'

/datum/job/advclass/sacrestant/psyaltrist/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	GLOB.inquisition.add_member_to_school(spawned, "Shadow Chapter", 0, "Precentor")
	spawned.grant_inspiration()

/datum/job/advclass/sacrestant/psyaltrist/on_roundstart(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/instruments = list(
		"Harp" = /obj/item/instrument/harp,
		"Lute" = /obj/item/instrument/lute,
		"Accordion" = /obj/item/instrument/accord,
		"Guitar" = /obj/item/instrument/guitar,
		"Hurdy-Gurdy" = /obj/item/instrument/hurdygurdy,
		"Viola" = /obj/item/instrument/viola,
		"Vocal Talisman" = /obj/item/instrument/vocals,
		"Psyaltery" = /obj/item/instrument/psyaltery,
		"Flute" = /obj/item/instrument/flute,
	)

	spawned.select_equippable(player_client, instruments)

/datum/outfit/psyaltrist
	name = "Precentor (Sacrestants)"
	armor = /obj/item/clothing/armor/leather/studded/psyaltrist
	backl = /obj/item/storage/backpack/satchel/otavan
	cloak = /obj/item/clothing/cloak/psyaltrist
	shirt = /obj/item/clothing/armor/gambeson/heavy/inq
	gloves = /obj/item/clothing/gloves/leather/otavan
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/angrosboots
	belt = /obj/item/storage/belt/leather/knifebelt/black/angros
	beltr = /obj/item/weapon/knife/dagger/silver/angros
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = /obj/item/clothing/ring/signet/silver
	backpack_contents = list(
		/obj/item/storage/keyring/inquisitor = 1,
		/obj/item/paper/inqslip/arrival/ortho = 1,
		/obj/item/collar_detonator = 1,
	)

/datum/outfit/psyaltrist/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/centrist)
			wrists = /obj/item/clothing/neck/psycross/silver/divine
		if(/datum/patron/angros)
			wrists = /obj/item/clothing/neck/psycross/silver
