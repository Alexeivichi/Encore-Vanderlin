/datum/devotion/divine/centrist
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/make_gmtemplar()
	. = ..()
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/avert/templar,
		CLERIC_T2 = /datum/action/cooldown/spell/enchantment/holy_flame,
		CLERIC_T3 = /datum/action/cooldown/spell/status/divine_shield,
	)

/datum/devotion/divine/visires
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/projectile/fire_flare,
		CLERIC_T1 = /datum/action/cooldown/spell/sacred_flame,
		CLERIC_T2 = list(/datum/action/cooldown/spell/projectile/fireball, /datum/action/cooldown/spell/heat_metal, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/projectile/fireball/greater,
	)
	viable_tasks = list(
		/datum/devotion_task/visires_purge,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/akan
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/status/guidance,
		CLERIC_T2 = list(/datum/action/cooldown/spell/blindness/miracle, /datum/action/cooldown/spell/projectile/moonlit_dagger, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/status/invisibility,
	)
	viable_tasks = list(
		/datum/devotion_task/akan_teach,
		/datum/devotion_task/akan_write,
		/datum/devotion_task/akan_read,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/gani
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/undirected/bless_crops,
		CLERIC_T2 = list(/datum/action/cooldown/spell/undirected/beast_sense, /datum/action/cooldown/spell/healing/greater, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = list(/datum/action/cooldown/spell/beast_tame, /datum/action/cooldown/spell/undirected/troll_shape),

	)
	viable_tasks = list(
		/datum/devotion_task/gani_tend,
		/datum/devotion_task/gani_harvest,
		/datum/devotion_task/gani_bless,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/mjallidhorn
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/undirected/call_to_arms,
		CLERIC_T2 = list(/datum/action/cooldown/spell/undirected/divine_strike, /datum/action/cooldown/spell/undirected/blade_ward, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/persistence,
	)
	viable_tasks = list(
		/datum/devotion_task/mjallidhorn_sail,
		/datum/devotion_task/mjallidhorn_fish,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/valdala
	miracles = list(
		CLERIC_T0 = list(/datum/action/cooldown/spell/healing, /datum/action/cooldown/spell/avert),
		CLERIC_T1 = /datum/action/cooldown/spell/burial_rites,
		CLERIC_T2 = list(/datum/action/cooldown/spell/undirected/locate_dead, /datum/action/cooldown/spell/aoe/abrogation, /datum/action/cooldown/spell/undirected/soul_speak),
		CLERIC_T3 = /datum/action/cooldown/spell/aoe/churn_undead,
	)
	viable_tasks = list(
		/datum/devotion_task/valdala_bury,
		/datum/devotion_task/visires_purge,
	)
	traits = list(TRAIT_DIVINE_SERVANT, TRAIT_DEATHSIGHT)

/datum/devotion/divine/mordsol
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/projectile/swordfish,
		CLERIC_T2 = list(/datum/action/cooldown/spell/undirected/conjure_item/summon_trident/miracle, /datum/action/cooldown/spell/undirected/blade_ward, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/ocean_embrace,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/iliope
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/undirected/list_target/vicious_mimicry,
		CLERIC_T2 = list(/datum/action/cooldown/spell/status/wheel, /datum/action/cooldown/spell/vicious_mockery, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = list(/datum/action/cooldown/spell/undirected/jaunt/illusory_prop, /datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt),
	)
	viable_tasks = list(
		/datum/devotion_task/iliope_gamble,
		/datum/devotion_task/iliope_trick,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/erdl
	miracles = list(
		CLERIC_T0 = list(/datum/action/cooldown/spell/healing, /datum/action/cooldown/spell/undirected/conjure_item/summon_leech/erdl),
		CLERIC_T1 = /datum/action/cooldown/spell/diagnose/holy,
		CLERIC_T2 = list(/datum/action/cooldown/spell/attach_bodypart, /datum/action/cooldown/spell/healing/greater, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/cure_rot,
	)
	viable_tasks = list(
		/datum/devotion_task/erdl_heal,
		/datum/devotion_task/erdl_medicine,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/golerkanh
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/mend_item,
		CLERIC_T2 = list(/datum/action/cooldown/spell/hammer_fall, /datum/action/cooldown/spell/heat_metal, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/status/vigorous_craft,
	)
	viable_tasks = list(
		/datum/devotion_task/golerkanh_craft,
		/datum/devotion_task/golerkanh_smelt,
		/datum/devotion_task/golerkanh_forge,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/pomette
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing,
		CLERIC_T1 = /datum/action/cooldown/spell/instill_perfection,
		CLERIC_T2 = list(/datum/action/cooldown/spell/projectile/pomette_curse, /datum/action/cooldown/spell/healing/greater, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/pomettic_bloom,
	)
	favored_species = list(SPEC_ID_ELF, SPEC_ID_HALF_ELF, SPEC_ID_DROW, SPEC_ID_HALF_DROW)
	favored_miracles = list(
		CLERIC_T3 = /datum/action/cooldown/spell/charm/pomettic
	)
	viable_tasks = list(
		/datum/devotion_task/pomette_create,
		/datum/devotion_task/pomette_hug,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

/datum/devotion/divine/angros
	miracles = list(
		CLERIC_T0 = list(/datum/action/cooldown/spell/sacred_flame, /datum/action/cooldown/spell/undirected/angrosrespite),
		CLERIC_T1 = /datum/action/cooldown/spell/angrosendure,
		CLERIC_T2 = list(/datum/action/cooldown/spell/angroslux_tamper, /datum/action/cooldown/spell/aoe/abrogation),
		CLERIC_T3 = /datum/action/cooldown/spell/angrosabsolve,
	)
	traits = list(TRAIT_DIVINE_SERVANT)

// Inhumen
/datum/devotion/inhumen/make_cleric()
	. = ..()
	miracles_extra += list(
		/datum/action/cooldown/spell/healing/profane,
	)

/datum/devotion/inhumen/make_templar()
	. = ..()
	miracles_extra += list(
		/datum/action/cooldown/spell/healing/profane,
	)

/datum/devotion/inhumen/make_churchling()
	. = ..()
	miracles_extra += list(
		/datum/action/cooldown/spell/healing/profane,
	)

/datum/devotion/inhumen/make_acolyte()
	. = ..()
	miracles_extra += list(
		/datum/action/cooldown/spell/healing/profane,
	)

/datum/devotion/inhumen/envy
/* The One Envy considers those not of the Shirleigh dynasty to be beneath her notice,
beyond carrying out occasional acts of capciciousness for her own amusement. She does not grant miracles to those
not of Alyssandrine and Malryck's blood - only the Heirs and Regent roles have access to her spells.
Refer to _devotion.dm to tweak the spells Shirleighs have. */
	traits = list(TRAIT_DEATHSIGHT)

/datum/devotion/inhumen/archdevils
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/undirected/call_to_slaughter,
		CLERIC_T1 = /datum/action/cooldown/spell/projectile/blood_net,
		CLERIC_T2 = list(/datum/action/cooldown/spell/projectile/revel_in_slaughter, /datum/action/cooldown/spell/projectile/blood_bolt),
		CLERIC_T3 = /datum/action/cooldown/spell/undirected/bloodrage,
	)
	viable_tasks = list(
		/datum/devotion_task/archdevils_consume,
	)

/datum/devotion/inhumen/deceivers
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/appraise/holy,
		CLERIC_T1 = /datum/action/cooldown/spell/transact,
		CLERIC_T2 = /datum/action/cooldown/spell/beam/equalize,
		CLERIC_T3 = /datum/action/cooldown/spell/churn_wealthy,
	)
	viable_tasks = list(
		/datum/devotion_task/deceivers_steal,
	)

/datum/devotion/inhumen/hertannea
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/find_flaw,
		CLERIC_T1 = /datum/action/cooldown/spell/hertanneablessings,
		CLERIC_T2 = /datum/action/cooldown/spell/projectile/blowingdust,
		CLERIC_T3 = /datum/action/cooldown/spell/painkiller,
	)
	viable_tasks = list(
		/datum/devotion_task/hertannea_indulge,
	)

/datum/devotion/inhumen/angros
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing/profane,
		CLERIC_T1 = /datum/action/cooldown/spell/projectile/fireball,
		CLERIC_T2 = list(/datum/action/cooldown/spell/projectile/revel_in_slaughter, /datum/action/cooldown/spell/projectile/blood_bolt),
		CLERIC_T3 = /datum/action/cooldown/spell/projectile/fireball/greater,
	)

// Alternate faiths

/datum/devotion/alternate/great_hunt
	miracles = list(
		CLERIC_T0 = /datum/action/cooldown/spell/healing/hunt,
		CLERIC_T1 = list(/datum/action/cooldown/spell/conjure/hunters_trick, /datum/action/cooldown/spell/undirected/hunters_grace),
		CLERIC_T2 = list(/datum/action/cooldown/spell/undirected/call_to_hunt, /datum/action/cooldown/spell/conjure/will_of_woods)
	)
	traits = list(TRAIT_BRUSHWALK)
