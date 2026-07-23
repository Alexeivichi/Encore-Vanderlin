/datum/attribute_holder/sheet/job/crusader
	raw_attribute_list = list(
		STAT_ENDURANCE = 2,
		STAT_CONSTITUTION = 2,
		STAT_STRENGTH = 1,
		/datum/attribute/skill/combat/crossbows = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/swords = 20,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/combat/shields = 20,
		/datum/attribute/skill/misc/swimming = 10,
		/datum/attribute/skill/misc/climbing = 20,
		/datum/attribute/skill/misc/riding = 40,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/reading = 20,
		/datum/attribute/skill/misc/sewing = 10,
		/datum/attribute/skill/craft/cooking = 10
	)

/datum/job/advclass/pilgrim/rare/crusader
	title = "Katholikon Emissary"
	tutorial = "The Crusaders are knights who have pledged their wealth and lands to the church, \
	taking up the banner of the Katholikon dedicated to retaking the Firmament against the forces of Hell. \
	Three sects provide knights for the Church: one each for Visires, Valdala and Mordsol. \
	You were sent to Domotan by the Church to get any and all assistance from the faithful for the Crusade."
	allowed_races = RACES_PLAYER_NONHERETICAL
	allowed_patrons = list(/datum/patron/divine/visires, /datum/patron/divine/valdala, /datum/patron/divine/mordsol)
	outfit = /datum/outfit/adventurer/crusader
	category_tags = list(CTAG_ADVENTURER)
	total_positions = -1
	spawn_positions = -1
	is_recognized = TRUE

	attribute_sheet = /datum/attribute_holder/sheet/job/crusader

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_HEAVYARMOR
	)

	languages = list(/datum/language/oldunsundered)

/datum/job/advclass/pilgrim/rare/crusader/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	switch(spawned.patron?.type)
		if(/datum/patron/divine/visires)
			spawned.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
		if(/datum/patron/divine/valdala)
			spawned.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
		else
			spawned.cmode_music = 'sound/music/cmode/adventurer/CombatIntense.ogg'

	if(spawned.gender == FEMALE)
		spawned.adjust_skill_level(/datum/attribute/skill/combat/crossbows, 10)
		spawned.adjust_skill_level(/datum/attribute/skill/combat/knives, 10)
	else
		spawned.adjust_skill_level(/datum/attribute/skill/combat/swords, 10)
		spawned.adjust_skill_level(/datum/attribute/skill/combat/shields, 10)

	if(spawned.dna?.species?.id == SPEC_ID_HUMEN && spawned.gender == MALE)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	to_chat(spawned, "<br><br><font color='#bdc34a'><span class='bold'>You have been sent from the Katholikon on a mission to aid your struggle against the Archdevils somehow. The details of your mission may vary, perhaps to find allies, funding, or a agent of the enemy...</span></font><br><br>")

/datum/outfit/adventurer/crusader
	name = "Katholikon Emissary (Adventurer)"
	head = /obj/item/clothing/head/helmet/heavy/crusader
	neck = /obj/item/clothing/neck/coif/cloth
	armor = /obj/item/clothing/armor/chainmail/hauberk
	cloak = /obj/item/clothing/cloak/cape/crusader
	gloves = /obj/item/clothing/gloves/chain
	shirt = /obj/item/clothing/shirt/tunic/colored/random
	pants = /obj/item/clothing/pants/chainlegs
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backr = /obj/item/weapon/shield/tower/metal
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/sword/silver

/datum/outfit/adventurer/crusader/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	switch(equipped_human.patron?.type)
		if(/datum/patron/divine/visires)
			cloak = /obj/item/clothing/cloak/stabard/templar/visires
			wrists = /obj/item/clothing/neck/psycross/silver/divine/visires
		if(/datum/patron/divine/valdala)
			cloak = /obj/item/clothing/cloak/stabard/templar/valdala
			wrists = /obj/item/clothing/neck/psycross/silver/divine/valdala
		else
			cloak = /obj/item/clothing/cloak/stabard/templar/mordsol
			wrists = /obj/item/clothing/neck/psycross/silver/divine/mordsol

	if(equipped_human.gender == FEMALE)
		head = /obj/item/clothing/head/helmet/heavy/crusader/t
		backr = /obj/item/gun/ballistic/bow/cross
		beltl = /obj/item/weapon/knife/dagger/silver
		beltr = /obj/item/ammo_holder/quiver/bolts
		backl = /obj/item/storage/backpack/satchel/black
		backpack_contents = list(/obj/item/storage/belt/pouch/coins/rich = 1)
	else
		beltr = /obj/item/storage/belt/pouch/coins/rich

/obj/item/clothing/cloak/stabard/crusader
	name = "surcoat of the golden order"
	desc = "A surcoat drenched in charcoal water, golden thread stitched in the style of Angros's First Knights."
	icon_state = "crusader_surcoat"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/cloak/stabard/crusader/t
	name = "surcoat of the last angrosian order"
	desc = "A surcoat drenched in charcoal water, white cotton stitched in the symbol of Angros."
	icon_state = "crusader_surcoatt2"

/obj/item/clothing/cloak/cape/crusader
	name = "desert cape"
	desc = "The Qadirid is known for its legacies in tailoring, this particular cape is interwoven with fine stained silks and leather - a sand elf design, renowned for its style and durability."
	icon_state = "crusader_cloak"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/head/helmet/heavy/crusader
	name = "bucket helm"
	desc = "Proud knights of the Katholikon display their faith and their allegiance openly."
	icon_state = "totodhelm"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/helmet/heavy/crusader/t
	desc = "A silver gilded bucket helm, inscriptions in old Unsundered are found embezeled on every inch of silver. The Undermen specialize in these helmets, the Katholikos has been purchasing them en-masse."
	icon_state = "crusader_helmt2"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "itemblood"
	worn_x_dimension = 32
	worn_y_dimension = 32

/obj/item/clothing/cloak/cape/crusader/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/storage/concrete/grid/cloak/lord)

/obj/item/clothing/cloak/cape/crusader/dropped(mob/living/carbon/human/user)
	..()
	if(QDELETED(src))
		return
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
