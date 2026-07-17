//domotan_north map areas
//tutorial island
/area/outdoors/woods/tutorial
	name = "Tutorial Island"
	icon_state = "beach"
	droning_index = DRONING_RIVER_DAY
	droning_index_night = DRONING_RIVER_NIGHT
	ambient_index = AMBIENCE_FROG
	ambient_index_night = AMBIENCE_FOREST
	background_track = 'sound/music/area/townstreets.ogg'
	background_track_dusk = 'sound/music/area/septimus.ogg'
	background_track_night = 'sound/music/area/sleeping.ogg'
	soundenv = 15
	ambush_times = null
	ambush_types = null
	ambush_mobs = null
	first_time_text = "Tutorial Island"
	custom_area_sound = 'sound/misc/stings/RosewoodSting.ogg'
	converted_type = /area/indoors/shelter/woods

/area/indoors/tutorial
	name = "Tutorial Island Indoors"
	icon_state = "beach"
	first_time_text = "Tutorial Island"

//county of etgard
/area/outdoors/woods/etgard
	name = "County of Etgard"
	icon_state = "woods"
	droning_index = DRONING_LAKE
	droning_index_night = DRONING_LAKE
	background_track = 'sound/music/area/forest.ogg'
	background_track_dusk = 'sound/music/area/septimus.ogg'
	background_track_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	ambush_times = list("night")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 10)
	first_time_text = "County of Etgard"
	threat_region = THREAT_REGION_BASIN

/area/outdoors/woods/lakeside
	name = "Hamlet of Lakeside"
	droning_index = DRONING_LAKE
	droning_index_night = DRONING_LAKE
	soundenv = 15
	ambush_times = list("night")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf = 10,
				/mob/living/carbon/human/species/rousman/ambush = 10)
	first_time_text = "Hamlet of Lakeside"
	threat_region = THREAT_REGION_BASIN

//For the OOC spawn area
/area/latejoin_area
	name = "latespawn"
	icon_state = "underworld"
	background_track = 'sound/music/area/prismatic_bridge.ogg'
	background_track_dusk = null
	background_track_night = null
	first_time_text = "The Prismatic Bridge"
	custom_area_sound = 'sound/misc/stings/prismatic_sting.ogg'
