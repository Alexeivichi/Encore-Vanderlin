/datum/attribute_holder/sheet/job/swordmaster
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_ENDURANCE = 2,
		STAT_CONSTITUTION = 2,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 20,
	)

/datum/job/advclass/combat/swordmaster
	title = "Hedge Knight"
	tutorial = "You spent years serving Aelondan lords, and now you spend your days as a travelling hedge knight. Upon this island, you like to increase the fame of your sword skills, as well as your honor."
	allowed_sexes = list(MALE)
	allowed_races = list(SPEC_ID_HUMEN, SPEC_ID_AASIMAR) // not RACES_PLAYER_GERAMOR because dwarves don't have a sprite for this armor
	outfit = /datum/outfit/folkhero/swordmaster
	total_positions = 99
	spawn_positions = 99
	category_tags = list(CTAG_FOLKHEROES)
	cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'
	honorary = "Ser"
	honorary_f = "Dame"

	attribute_sheet = /datum/attribute_holder/sheet/job/swordmaster


	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
	)

	languages = list(/datum/language/newunsundered)

/datum/job/advclass/combat/swordmaster/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/datum/species/species = spawned.dna?.species
	if(species && species.id == SPEC_ID_HUMEN)
		species.native_language = "Unsundered"
		species.accent_language = species.get_accent(species.native_language)
		species.soundpack_m = new /datum/voicepack/male/knight()

/datum/outfit/folkhero/swordmaster
	name = "Hedge Knight (Folkhero)"
	pants = /obj/item/clothing/pants/trou/leather/splint
	backr = /obj/item/weapon/sword/long/greatsword/flamberge
	beltl = /obj/item/storage/belt/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	gloves = /obj/item/clothing/gloves/chain/iron
	belt = /obj/item/storage/belt/leather
	shirt = /obj/item/clothing/armor/gambeson/heavy
	armor = /obj/item/clothing/armor/cuirass/iron
	backl = /obj/item/storage/backpack/satchel
	head = /obj/item/clothing/head/rare/bastardsplate
	wrists = /obj/item/clothing/wrists/bracers/ironjackchain
	neck = /obj/item/clothing/neck/chaincoif/iron
