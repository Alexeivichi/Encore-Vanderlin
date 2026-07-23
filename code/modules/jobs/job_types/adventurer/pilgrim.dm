/datum/job/pilgrim
	title = JOB_PILGRIM
	tutorial = "As a Pilgrim, your ambitions lay beyond the walls of the town, or perhaps you are merely moving in. \
	Alternatively, you can build your own settlement and enjoy the terrible dangers nature has to offer."
	department_flag = OUTSIDERS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_PILGRIM
	faction = FACTION_FOREIGNERS
	total_positions = 99
	spawn_positions = 99
	banned_leprosy = FALSE
	bypass_lastclass = TRUE

	allowed_races = RACES_NON_ANTAG

	outfit = null
	outfit_female = null
	advclass_cat_rolls = list(CTAG_PILGRIM = 15)

	same_job_respawn_delay = 0

	is_foreigner = TRUE
	can_have_apprentices = TRUE
	can_be_apprentice = TRUE

	selection_color = "#a33096"

/datum/job/advclass/pilgrim
	abstract_type = /datum/job/advclass/pilgrim
	category_tags = list(CTAG_PILGRIM)
	spawn_with_torch = TRUE
	department_flag = OUTSIDERS

/datum/job/advclass/pilgrim/rare
	abstract_type = /datum/job/advclass/pilgrim/rare
	roll_chance = 30
