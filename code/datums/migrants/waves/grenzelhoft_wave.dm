/datum/migrant_role/aelondan_count
	name = "Aelondan Count"
	greet_text = "A Count hailing from the Emeraldine Court, here on an official visit to Domotan Island alongside his beloved convoy and spouse."
	migrant_job = /datum/job/migrant/aelondan_count

/datum/attribute_holder/sheet/job/migrant/aelondan_count
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/riding = 30,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/music = 10,
		/datum/attribute/skill/craft/cooking = 20,
		/datum/attribute/skill/combat/bows = 10,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/labor/mathematics = 30,
	)

/datum/job/migrant/aelondan_count
	title = "Aelondan Count"
	tutorial = "A Count hailing from the Emeraldine Court, here on an official visit to Domotan Island alongside his beloved convoy and spouse."
	outfit = /datum/outfit/aelondan_count
	allowed_sexes = list(MALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	is_recognized = TRUE
	honorary = "Count"
	honorary_f = "Countess"

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/aelondan_count

	spells = list(
		/datum/action/cooldown/spell/undirected/call_bird/aelonda
	)

	traits = list(TRAIT_HEAVYARMOR, TRAIT_MEDIUMARMOR, TRAIT_NOBLE_BLOOD, TRAIT_NOBLE_POWER)
	languages = list(/datum/language/newunsundered)
	cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/job/migrant/aelondan_count/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(!spawned.dna?.species)
		return
	var/datum/species/species = spawned.dna.species
	species.native_language = "Old Unsundered"
	species.accent_language = species.get_accent(species.native_language)

/datum/outfit/aelondan_count
	name = "Aelondan Count (Migrant Wave)"
	shoes = /obj/item/clothing/shoes/rare/sterkenstadten
	gloves = /obj/item/clothing/gloves/angle/sterkenstadten
	wrists = /obj/item/clothing/neck/psycross/gold
	head = /obj/item/clothing/head/helmet/skullcap/sterkenstadten
	armor = /obj/item/clothing/armor/brigandine
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/sword/sabre/dec
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/satchel
	ring = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/shirt/sterkenstadten
	pants = /obj/item/clothing/pants/sterkenstadten
	neck = /obj/item/clothing/neck/gorget
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich)

/datum/migrant_role/aelondan_countess
	name = "Aelondan Countess"
	greet_text = "A Countess hailing from the Emeraldine Court, here on an official visit to Domotan Island alongside her beloved convoy and husband."
	migrant_job = /datum/job/migrant/aelondan_countess

/datum/attribute_holder/sheet/job/migrant/aelondan_countess
	raw_attribute_list = list(
		STAT_INTELLIGENCE = 1,
		STAT_ENDURANCE = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/riding = 30,
		/datum/attribute/skill/misc/reading = 40,
		/datum/attribute/skill/misc/music = 10,
		/datum/attribute/skill/craft/cooking = 20,
		/datum/attribute/skill/combat/bows = 10,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 10,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/combat/knives = 20,
	)

/datum/job/migrant/aelondan_countess
	title = "Aelondan Countess"
	tutorial = "A Countess hailing from the Emeraldine Court, here on an official visit to Domotan Island alongside her beloved convoy and husband."
	outfit = /datum/outfit/aelondan_countess
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	is_recognized = TRUE
	honorary = "Count"
	honorary_f = "Countess"


	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/aelondan_countess

	spells = list(
		/datum/action/cooldown/spell/undirected/call_bird/aelonda
	)

	traits = list(TRAIT_MEDIUMARMOR, TRAIT_NOBLE_BLOOD, TRAIT_NOBLE_POWER)
	languages = list(/datum/language/newunsundered)
	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'

/datum/job/migrant/aelondan_countess/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(!spawned.dna?.species)
		return
	var/datum/species/species = spawned.dna.species
	species.native_language = "Old Unsundered"
	species.accent_language = species.get_accent(species.native_language)

/datum/outfit/aelondan_countess
	name = "Aelondan Countess (Migrant Wave)"
	shoes = /obj/item/clothing/shoes/rare/sterkenstadten
	gloves = /obj/item/clothing/gloves/angle/sterkenstadten
	wrists = /obj/item/clothing/neck/psycross/gold
	head = /obj/item/clothing/head/helmet/skullcap/sterkenstadten
	armor = /obj/item/clothing/armor/gambeson/heavy/dress/alt
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/sword/rapier/dec
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/satchel
	ring = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/shirt/sterkenstadten
	pants = /obj/item/clothing/pants/sterkenstadten
	neck = /obj/item/clothing/neck/gorget
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich)

/datum/migrant_role/sterkenstadten_knight
	name = "Sterkenstadten Knight"
	greet_text = "Your liege, the count and the countess have both took the duty given by the council to voyage to Domotan, ensure their survival and obey their orders."
	migrant_job = /datum/job/migrant/sterkenstadten_knight

/datum/attribute_holder/sheet/job/migrant/sterkenstadten_knight
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_ENDURANCE = 2,
		STAT_CONSTITUTION = 2,
		STAT_SPEED = -1,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/swords = 40,
		/datum/attribute/skill/misc/climbing = 10,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 20,
	)

/datum/job/migrant/sterkenstadten_knight
	title = "Sterkenstadten Knight"
	tutorial = "Your liege, the count and the countess have both took the duty given by the council to voyage to Domotan, ensure their survival and obey their orders."
	outfit = /datum/outfit/sterkenstadten_knight
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	is_recognized = TRUE
	exp_types_granted  = list(EXP_TYPE_COMBAT)

	honorary = "Ritter"
	honorary_f = "Ritterin"

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/sterkenstadten_knight

	traits = list(TRAIT_HEAVYARMOR)
	languages = list(/datum/language/newunsundered)
	cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/job/migrant/sterkenstadten_knight/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(!spawned.dna?.species)
		return
	var/datum/species/species = spawned.dna.species
	species.native_language = "Old Unsundered"
	species.accent_language = species.get_accent(species.native_language)

/datum/outfit/sterkenstadten_knight
	name = "Sterkenstadten Knight (Migrant Wave)"
	pants = /obj/item/clothing/pants/tights/colored/black
	backr = /obj/item/weapon/sword/long/greatsword/flamberge
	beltl = /obj/item/storage/belt/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/boots/rare/bastardsplate
	gloves = /obj/item/clothing/gloves/rare/bastardsplate
	belt = /obj/item/storage/belt/leather
	shirt = /obj/item/clothing/armor/gambeson
	armor = /obj/item/clothing/armor/rare/bastardsplate
	backl = /obj/item/storage/backpack/satchel
	head = /obj/item/clothing/head/rare/bastardsplate
	wrists = /obj/item/clothing/wrists/bracers
	neck = /obj/item/clothing/neck/chaincoif

/datum/migrant_role/sterkenstadten_man_at_arms
	name = "Sterkenstadten Man-at-Arms"
	greet_text = "You and your fellows are men at arms from Feathercap Free Company, escorting an Aelondan count with pride. Obey the count and make sure the nobles you arrived with survive."
	migrant_job = /datum/job/migrant/sterkenstadten_man_at_arms

/datum/attribute_holder/sheet/job/migrant/sterkenstadten_man_at_arms
	attribute_variance = list(
		/datum/attribute/skill/combat/whipsflails = list(10, 20),
		/datum/attribute/skill/combat/axesmaces = list(20, 30),
		/datum/attribute/skill/combat/shields = list(0, 10),
	)
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_ENDURANCE = 1,
		STAT_CONSTITUTION = 2,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/sneaking = 30,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/misc/reading = 10,
		/datum/attribute/skill/craft/cooking = 10,
	)

/datum/job/migrant/sterkenstadten_man_at_arms
	title = "Sterkenstadten Man-at-Arms"
	tutorial = "You and your fellows are men at arms from the Feathercap Free Company, escorting an Aelondan count with pride. Obey the count and make sure the nobles you arrived with survive."
	outfit = /datum/outfit/sterkenstadten_man_at_arms
	allowed_races = RACES_LESS_DISCRIMINATED
	exp_types_granted  = list(EXP_TYPE_COMBAT)

	attribute_sheet = /datum/attribute_holder/sheet/job/migrant/sterkenstadten_man_at_arms

	traits = list(TRAIT_MEDIUMARMOR)
	languages = list(/datum/language/newunsundered)
	cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/job/migrant/sterkenstadten_man_at_arms/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	if(!spawned.dna?.species)
		return
	var/datum/species/species = spawned.dna.species
	species.native_language = "Old Unsundered"
	species.accent_language = species.get_accent(species.native_language)

/datum/outfit/sterkenstadten_man_at_arms
	name = "Sterkenstadten Man-at-Arms (Migrant Wave)"
	beltr = /obj/item/storage/belt/pouch/coins/poor
	neck = /obj/item/clothing/neck/chaincoif
	pants = /obj/item/clothing/pants/sterkenstadten
	shoes = /obj/item/clothing/shoes/rare/sterkenstadten
	gloves = /obj/item/clothing/gloves/angle/sterkenstadten
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/mace/cudgel
	shirt = /obj/item/clothing/shirt/sterkenstadten
	head = /obj/item/clothing/head/helmet/skullcap/sterkenstadten
	armor = /obj/item/clothing/armor/cuirass/sterkenstadten
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/weapon/sword/long/greatsword/zwei

/datum/outfit/sterkenstadten_man_at_arms/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	if(equipped_human.gender == FEMALE)
		equipped_human.underwear = "Femleotard"
		equipped_human.underwear_color = CLOTHING_SOOT_BLACK

/datum/migrant_wave/aelondan_visit
	name = "The Aelondan visit"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	weight = 25
	downgrade_wave = /datum/migrant_wave/aelondan_visit_down
	roles = list(
		/datum/migrant_role/aelondan_count = 1,
		/datum/migrant_role/aelondan_countess = 1,
		/datum/migrant_role/sterkenstadten_knight = 1,
		/datum/migrant_role/sterkenstadten_man_at_arms = 2)
	greet_text = "The council of the Emeraldine Court has sent a diplomatic envoy to engage into diplomacy within the County of Etgard."

/datum/migrant_wave/aelondan_visit_down
	name = "The Aelondan visit"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/aelondan_visit,/datum/migrant_wave/qadirid_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/dunmoon)
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/aelondan_count = 1,
		/datum/migrant_role/aelondan_countess = 1,
		/datum/migrant_role/sterkenstadten_knight = 1)
	greet_text = "The council of the Emeraldine Court has sent a diplomatic envoy to engage into diplomacy within the County of Etgard."
