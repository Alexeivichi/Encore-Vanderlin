///how many tiles out from a client we still bother processing dungeon mobs
#define DECEIVERS_PROCESSING_TILE_RANGE 15

SUBSYSTEM_DEF(deceivers_mobs)
	name = "Deceivers Mobs"
	priority = FIRE_PRIORITY_MOBS - 2
	flags = SS_KEEP_TIMING | SS_NO_INIT
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 2 SECONDS
	var/list/currentrun = list()
	var/list/deceivers_mobs = list()

	var/list/dungeon_z = list()
	var/looked = FALSE
	var/list/active_mobs = list()

/datum/controller/subsystem/deceivers_mobs/stat_entry()
	..("MM:[deceivers_mobs.len]")

/datum/controller/subsystem/deceivers_mobs/fire(resumed = 0)
	var/seconds = wait * 0.1
	if(!length(dungeon_z) && !looked)
		dungeon_z = SSmapping.levels_by_trait(ZTRAIT_DECEIVERS_DUNGEON)
		looked = TRUE
	if(!length(dungeon_z))
		return

	var/should = FALSE

	for(var/level in dungeon_z)
		if(length(SSmobs.clients_by_zlevel[level]))
			for(var/mob/living/mob as anything in SSmobs.clients_by_zlevel[level])
				if(isliving(mob))
					should = TRUE
					break
			if(should)
				break

	if(!should)
		return

	if (!resumed)
		src.currentrun = deceivers_mobs.Copy()

	if(!length(active_mobs))
		return

	var/list/currentrun = src.currentrun
	var/times_fired = src.times_fired
	while(currentrun.len)
		var/mob/living/L = currentrun[currentrun.len]
		currentrun.len--
		if(!L || QDELETED(L))
			deceivers_mobs -= L
			GLOB.mob_living_list -= L
			continue

		if(!active_mobs[L])
			continue

		if(L.stat == DEAD)
			L.DeadLife(seconds, times_fired)
		else
			L.Life(seconds, times_fired)
		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/deceivers_mobs/proc/register_mob(mob/living/L)
	if(!L)
		return FALSE

	deceivers_mobs |= L
	return TRUE

/datum/controller/subsystem/deceivers_mobs/proc/unregister_mob(mob/living/L)
	if(!L)
		return

	deceivers_mobs -= L
