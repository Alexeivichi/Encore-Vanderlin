/datum/job/templar
	title = JOB_TEMPLAR
	unique_alt_honororary = TRUE
	alt_honorary = list("Brother")
	alt_honorary_female = list("Sister")
	tutorial = "Templars are warriors who have forsaken wealth and station in the service of the church, either from fervent zeal or remorse for past sins.\
	They are vigilant sentinels, guarding priest and altar, steadfast against heresy and shadow-beasts that creep in darkness. \
	But in the quiet of troubled sleep, there is a question left. Does the blood they spill sanctify them, or stain them forever? If service ever demanded it, whose blood would be the price?"
	department_flag = CHURCHMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_TEMPLAR
	factions = list(FACTION_TOWN)
	total_positions = 99
	spawn_positions = 99
	bypass_lastclass = TRUE

	allowed_races = RACES_LESS_DISCRIMINATED
	allowed_patrons = ALL_TEMPLAR_PATRONS

	outfit = /datum/outfit/templar
	advclass_cat_rolls = list(CTAG_TEMPLAR = 20)
	give_bank_account = 15
	knows_the_town = TRUE
	known_by_the_town = TRUE

	job_bitflag = BITFLAG_CHURCH
	mind_traits = list(TRAIT_KNOWBANDITS)
	languages = list(/datum/language/newunsundered)
	exp_type = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT)
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)
	exp_requirements = list(
		EXP_TYPE_CHURCH = 900,
		EXP_TYPE_COMBAT = 900
	)

/datum/outfit/templar //Base outfit for Templars, before subclasses and loadouts.
	name = JOB_TEMPLAR
	ring = /obj/item/clothing/ring/silver
	belt = /obj/item/storage/belt/leather/black
	backl = /obj/item/storage/backpack/satchel/otavan
	backpack_contents = list(/obj/item/storage/keyring/priest = 1,  /obj/item/storage/belt/pouch/coins/mid = 1)

/datum/outfit/templar/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/visires)
			cloak = /obj/item/clothing/cloak/stabard/templar/visires
		if(/datum/patron/divine/akan)
			cloak = /obj/item/clothing/cloak/stabard/templar/akan
			backpack_contents += /obj/item/chalk
		if(/datum/patron/divine/gani)
			cloak = /obj/item/clothing/cloak/stabard/templar/gani
		if(/datum/patron/divine/valdala)
			cloak = /obj/item/clothing/cloak/stabard/templar/valdala
		if(/datum/patron/divine/erdl)
			cloak = /obj/item/clothing/cloak/stabard/templar/erdl
			backpack_contents += /obj/item/reagent_containers/glass/bottle/poison
		if(/datum/patron/divine/pomette)
			cloak = /obj/item/clothing/cloak/stabard/templar/pomette
		if(/datum/patron/divine/mordsol)
			cloak = /obj/item/clothing/cloak/stabard/templar/mordsol
		if(/datum/patron/divine/golerkanh)
			cloak = /obj/item/clothing/cloak/stabard/templar/golerkanh
		if(/datum/patron/divine/mjallidhorn)
			cloak = /obj/item/clothing/cloak/stabard/templar/mjallidhorn
		if(/datum/patron/divine/iliope)
			cloak = /obj/item/clothing/cloak/stabard/templar/iliope

/datum/job/advclass/templar/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_templar()
		devotion.grant_to(spawned)

	if(spawned.dna?.species?.id == SPEC_ID_HUMEN && spawned.gender == MALE)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

/datum/job/advclass/templar
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)
	factions = list(FACTION_TOWN)
