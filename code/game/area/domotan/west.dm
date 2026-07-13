//Weeping Wood and western side of the map
/area/outdoors/woods/west
	name = "wilderness"
	icon_state = "woods"
	soundenv = 15
	ambush_times = list("night","dawn","dusk")
	ambush_types = list(
				/turf/open/floor/dirt,
				/turf/open/floor/grass,
				/turf/open/floor/sand,
				/turf/open/water/ocean,
				/turf/open/water/ocean/abyss)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/bigrat = 20,
				/mob/living/simple_animal/hostile/retaliate/spider = 80,
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 50,
				/mob/living/simple_animal/hostile/retaliate/troll/bog = 35)
	first_time_text = "THE WEEPING WOOD"
	threat_region = THREAT_REGION_NORTHERN_GROVE

/area/outdoors/woods/west/thornbed
	name = "thornbed"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/troll/bog = 45)
	first_time_text = "THORNBED"
	threat_region = THREAT_REGION_TERRORBOG

/area/outdoors/woods/west/crescent
	name = "crescent"
	ambush_mobs = list(
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 35)
	first_time_text = "CRESCENT OF REBIRTH"

/area/outdoors/woods/west/crags
	name = "crags"
	ambush_mobs = list(
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 95)
	first_time_text = "GOBLIN CRAGS"//No one would suspect an ambush here, right?

//swampweed and booze here, not much danger
/area/outdoors/woods/west/lonelyeerie
	name = "lonelyeerie"
	ambush_mobs = null//very lonely
	first_time_text = "LONELY EERIE"

//old fort
/area/under/cave/oldfort
	name = "oldfort_lower"
	icon_state = "under"
	first_time_text = "KILN OF CLAIMS"
	converted_type = /area/outdoors/oldfort

/area/outdoors/oldfort
	name = "oldfort_outdoors"
	icon_state = "castlemalum"
	first_time_text = "INVADER'S GRAVE"

//old town ruins
/area/under/cave/oldtown
	name = "oldtown_lower"
	icon_state = "under"
	first_time_text = "OLD SHIRLEIGH"
	converted_type = /area/outdoors/oldtown

/area/indoors/oldtown
	name = "oldtown_indoors"
	converted_type = /area/outdoors/oldtown

/area/outdoors/oldtown
	name = "oldtown_outdoors"
	icon_state = "ruins"
	first_time_text = "ANCIENT DOMA"

//lost keep
/area/under/cave/lostkeep
	name = "lostkeep_lower"
	icon_state = "under"
	first_time_text = "CRADLE OF SIN"
	converted_type = /area/outdoors/lostkeep

/area/indoors/lostkeep
	name = "lostkeep_indoors"
	converted_type = /area/outdoors/lostkeep

/area/outdoors/lostkeep
	name = "lostkeep_outdoors"
	icon_state = "castlemalum"
	first_time_text = "MONUMENT TO SIN"

//hotel paradise
/area/under/cave/paradise
	name = "paradise_lower"
	icon_state = "under"
	converted_type = /area/outdoors/paradise

/area/indoors/paradise
	name = "paradise_indoors"
	converted_type = /area/outdoors/paradise

/area/outdoors/paradise
	name = "paradise_outdoors"
	icon_state = "ruins"
	first_time_text = "THE BLUE HOPE"

//lighthouse
/area/under/cave/lighthouse
	name = "lighthouse_lower"
	icon_state = "under"
	converted_type = /area/outdoors/lighthouse

/area/indoors/lighthouse
	name = "lighthouse_indoors"
	first_time_text = "HOUSE OF LIGHT"
	converted_type = /area/outdoors/lighthouse

/area/outdoors/lighthouse
	name = "lighthouse_outdoors"
	icon_state = "outpost"
	first_time_text = "THE BATTLEMENTS"

//lodge berkleigh
/area/outdoors/woods/berkleigh
	name = "lodge berkleigh"
	icon_state = "under"
	first_time_text = "LODGE BERKLEIGH"
	ambush_times = null
	ambush_types = null
	ambush_mobs = null
