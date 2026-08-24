/datum/forecast/domotan_summer//hot summer
	day_weather = list(/datum/particle_weather/rain/rain_gentle = 10)
	dawn_weather = list(/datum/particle_weather/rain/rain_gentle = 10)
	dusk_weather = list(/datum/particle_weather/rain/rain_gentle = 25, /datum/particle_weather/rain/rain_storm = 15, /datum/particle_weather/fog = 8)
	night_weather = list(/datum/particle_weather/rain/rain_gentle = 20, /datum/particle_weather/rain/rain_storm = 12, /datum/particle_weather/fog = 4)

	temp_ranges = list(
		DAWN = list(10, 20),      // Cool morning
		DAY = list(26, 38),       // Warm day
		DUSK = list(21, 27),      // Warm evening
		NIGHT = list(8, 15),      // Cool night
	)

/datum/forecast/domotan_fall//cozy autumn
	day_weather = list(/datum/particle_weather/fall_leaves = 10, /datum/particle_weather/rain/rain_gentle = 15)
	dawn_weather = list(/datum/particle_weather/rain/rain_gentle = 10, /datum/particle_weather/fog = 25)
	dusk_weather = list(/datum/particle_weather/fall_leaves = 10, /datum/particle_weather/rain/rain_storm = 10, /datum/particle_weather/fog = 5)
	night_weather = list(/datum/particle_weather/rain/rain_gentle = 20, /datum/particle_weather/snow_gentle = 25, /datum/particle_weather/snow_storm= 5)

	temp_ranges = list(
		DAWN = list(8, 16),      // Cool morning
		DAY = list(14, 25),       // Warm day
		DUSK = list(11, 21),      // Warm evening
		NIGHT = list(6, 13),      // Cool night
	)

/datum/forecast/domotan_spring//foggy spring
	day_weather = list(/datum/particle_weather/fall_leaves = 10, /datum/particle_weather/rain/rain_gentle = 15)
	dawn_weather = list(/datum/particle_weather/rain/rain_gentle = 10, /datum/particle_weather/fog = 25)
	dusk_weather = list(/datum/particle_weather/rain/rain_storm = 10, /datum/particle_weather/fog = 15)
	night_weather = list(/datum/particle_weather/rain/rain_gentle = 25, /datum/particle_weather/fog = 15)

	temp_ranges = list(
		DAWN = list(10, 20),      // Cool morning
		DAY = list(20, 30),       // Warm day
		DUSK = list(15, 25),      // Warm evening
		NIGHT = list(8, 15),      // Cool night
	)

/datum/forecast/domotan_winter//frostpunk
	day_weather = list(/datum/particle_weather/snow_gentle = 15, /datum/particle_weather/snow_storm= 5)
	dawn_weather = list(/datum/particle_weather/snow_gentle = 15, /datum/particle_weather/snow_storm= 15)
	dusk_weather = list(/datum/particle_weather/snow_gentle = 45, /datum/particle_weather/snow_storm= 15)
	night_weather = list(/datum/particle_weather/snow_gentle = 25, /datum/particle_weather/snow_storm= 15)

	temp_ranges = list(
		DAWN = list(4, 8),      // Cool morning
		DAY = list(8, 14),       // Warm day
		DUSK = list(5, 11),      // Warm evening
		NIGHT = list(2, 6),      // Cool night
	)
