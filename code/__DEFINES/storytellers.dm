/// Could be bitflags, but that would require a good amount of translations, which eh, either way works for me
/// When the event is combat oriented (spawning monsters, inherently hostile antags)

#define TAG_VISIRES "Visires"
#define TAG_AKAN "Akan"
#define TAG_MORDSOL "Mordsol"
#define TAG_MJALLIDHORN "Mjallidhorn"
#define TAG_ILIOPE "Iliope"
#define TAG_VALDALA "Valdala"
#define TAG_ERDL "Erdl"
#define TAG_GOLERKANH "Goler Kanh"
#define TAG_POMETTE "Pomette"
#define TAG_GANI "Gani"
#define TAG_ENVY "The One Envy"
#define TAG_HERTANNEA "Hertannea"
#define TAG_ARCHDEVILS "The Archdevils"
#define TAG_DECEIVERS "The Deceivers"

/// Base tag for god-related logic and identification
#define TAG_GOD "God"

/// Tag used for blessings granted by Pomette
#define TAG_BOON "Boon"

/// Tag reserved for curse mechanics (unused by gods)
#define TAG_CURSE "Curse"

/// Tag associated with hauntings, used by Akan and Valdala
#define TAG_HAUNTED "Haunted"

/// Tag reserved for combat logic (unused by gods)
#define TAG_COMBAT "Combat"

/// Tag used for raid events, associated with Mordsol
#define TAG_RAID "Raid"

/// Tag representing trade interactions, used by Mjallidhorn and Deceivers
#define TAG_TRADE "Trade"

/// Tag denoting widespread effects, utilized by Pomette
#define TAG_WIDESPREAD "Widespread"

/// Tag reserved for villain roles or actions (unused by gods)
#define TAG_VILLAIN "Villain"

/// Tag representing medical influences, tied to Erdl
#define TAG_MEDICAL "Medical"

/// Tag for alchemy-related actions or systems, belonging to Erdl
#define TAG_ALCHEMY "Alchemy"

/// Tag for nature-related events, tied to Erdl and Gani
#define TAG_NATURE "Nature"

/// Tag representing work-related actions or influence, used by Goler Kanh
#define TAG_WORK "Work"

/// Tag for water-related actions or effects, used by Mjallidhorn
#define TAG_WATER "Water"

/// Tag representing magical influence or events, used by Akan and the One Envy
#define TAG_MAGICAL "Magical"

/// Tag denoting battle-related effects, associated with Archdevils
#define TAG_BATTLE "Battle"

/// Tag symbolizing blood-related actions, belonging to Archdevils
#define TAG_BLOOD "Blood"

/// Tag representing war-like influence, tied to Archdevils
#define TAG_WAR "War"

/// Tag for gambling-related systems or events, used by Iliope
#define TAG_GAMBLE "Gamble"

/// Tag symbolizing trickery, mischief, or deception, belonging to the One Envy and Iliope
#define TAG_TRICKERY "Trickery"

/// Tag representing unexpected outcomes or randomness, tied to the One Envy and Iliope
#define TAG_UNEXPECTED "Unexpected"

/// Tag representing insanity-related mechanics, used by Hertannea and Dendor
#define TAG_INSANITY "Insanity"

/// Tag denoting disaster-related events or effects, tied to Hertannea
#define TAG_DISASTER "Disaster"

/// Tag representing corruption, used by Deceivers
#define TAG_CORRUPTION "Corruption"

/// Tag for loot-related events, effects, or systems, used by Deceivers
#define TAG_LOOT "Loot"

#define EVENT_TRACK_MUNDANE "Mundane"
#define EVENT_TRACK_PERSONAL "Personal"
#define EVENT_TRACK_MODERATE "Moderate"
#define EVENT_TRACK_INTERVENTION "God Intervention"
#define EVENT_TRACK_CHARACTER_INJECTION "Character Injection"
#define EVENT_TRACK_OMENS "Omen"
#define EVENT_TRACK_RAIDS "Raids"

#define ALL_EVENTS "All"
#define UNCATEGORIZED_EVENTS "Uncategorized"

#define STORYTELLER_WAIT_TIME 5 SECONDS

#define EVENT_POINT_GAINED_PER_SECOND 0.09

#define TRACK_FAIL_POINT_PENALTY_MULTIPLIER 0.8

#define GAMEMODE_PANEL_MAIN "Main"
#define GAMEMODE_PANEL_VARIABLES "Variables"

/// The concrete number for what is considered "lowpop" on Vanderlin
#define LOWPOP_THRESHOLD 5
/// The difference between highpop and lowpop
#define MIDPOP_THRESHOLD 10
/// What is high pop on Vanderlin?
#define HIGHPOP_THRESHOLD 20

/// Data yielded from a poll on player behavior regarding when they queue up for a round. This is used to tweak storyteller values for roundstart event checks
#define READYUP_AVG 0.66

#define MUNDANE_POINT_THRESHOLD 20
#define MODERATE_POINT_THRESHOLD 35
#define MAJOR_POINT_THRESHOLD 70
#define ROLESET_POINT_THRESHOLD 75
#define OBJECTIVES_POINT_THRESHOLD 80

#define MUNDANE_MIN_POP 5
#define MODERATE_MIN_POP 8
#define MAJOR_MIN_POP 20
#define CHARACTER_INJECTION_MIN_POP 0
#define OBJECTIVES_MIN_POP 20

/// Defines for how much pop do we need to stop applying a pop scalling penalty to event frequency.
#define MUNDANE_POP_SCALE_THRESHOLD 20
#define MODERATE_POP_SCALE_THRESHOLD 30
#define MAJOR_POP_SCALE_THRESHOLD 40
#define ROLESET_POP_SCALE_THRESHOLD 45
#define OBJECTIVES_POP_SCALE_THRESHOLD 45
#define RAID_POP_SCALE_THRESHOLD 55

/// The maximum penalty coming from pop scalling, when we're at the most minimum point, easing into 0 as we reach the SCALE_THRESHOLD. This is treated as a percentage.
#define MUNDANE_POP_SCALE_PENALTY 35
#define MODERATE_POP_SCALE_PENALTY 35
#define MAJOR_POP_SCALE_PENALTY 35
#define ROLESET_POP_SCALE_PENALTY 35
#define OBJECTIVES_POP_SCALE_PENALTY 35
#define RAID_POP_SCALE_PENALTY 55

#define STORYTELLER_VOTE "storyteller"

#define EVENT_TRACKS list(EVENT_TRACK_MUNDANE, EVENT_TRACK_PERSONAL, EVENT_TRACK_MODERATE, EVENT_TRACK_INTERVENTION, EVENT_TRACK_CHARACTER_INJECTION, EVENT_TRACK_OMENS, EVENT_TRACK_RAIDS)
#define EVENT_PANEL_TRACKS list(EVENT_TRACK_MUNDANE, EVENT_TRACK_PERSONAL, EVENT_TRACK_MODERATE, EVENT_TRACK_INTERVENTION, EVENT_TRACK_CHARACTER_INJECTION, EVENT_TRACK_OMENS, EVENT_TRACK_RAIDS, UNCATEGORIZED_EVENTS, ALL_EVENTS)

/// Defines for the antag cap to prevent midround injections.
#define ANTAG_CAP_FLAT 3
#define ANTAG_CAP_DENOMINATOR 30

///Below are defines for roundstart point pool. The GAIN ones are multiplied by ready population
#define ROUNDSTART_MUNDANE_BASE 10
#define ROUNDSTART_MUNDANE_GAIN 0.5

#define ROUNDSTART_PERSONAL_BASE 10
#define ROUNDSTART_PERSONAL_GAIN 0.8

#define ROUNDSTART_MODERATE_BASE 15
#define ROUNDSTART_MODERATE_GAIN 1.2

#define ROUNDSTART_MAJOR_BASE 35
#define ROUNDSTART_MAJOR_GAIN 1.5

#define ROUNDSTART_ROLESET_BASE 50
#define ROUNDSTART_ROLESET_GAIN 2.5

#define ROUNDSTART_OBJECTIVES_BASE 40
#define ROUNDSTART_OBJECTIVES_GAIN 2

#define SHARED_HIGH_THREAT	"high threat event"
#define SHARED_MINOR_THREAT "minor event"

/// Divine pantheon storytellers
#define DIVINE_STORYTELLERS list( \
	/datum/storyteller/visires, \
	/datum/storyteller/akan, \
	/datum/storyteller/mordsol, \
	/datum/storyteller/mjallidhorn, \
	/datum/storyteller/iliope, \
	/datum/storyteller/valdala, \
	/datum/storyteller/erdl, \
	/datum/storyteller/golerkanh, \
	/datum/storyteller/pomette, \
	/datum/storyteller/gani, \
)

/// Inhumen pantheon storytellers
#define INHUMEN_STORYTELLERS list( \
	/datum/storyteller/envy, \
	/datum/storyteller/hertannea, \
	/datum/storyteller/archdevils, \
	/datum/storyteller/deceivers, \
)

/// All storytellers
#define STORYTELLERS_ALL (DIVINE_STORYTELLERS + INHUMEN_STORYTELLERS)

// Divine pantheon
#define VISIRES "Visires"
#define AKAN "Akan"
#define MORDSOL "Mordsol"
#define MJALLIDHORN "Mjallidhorn"
#define ILIOPE "Iliope"
#define VALDALA "Valdala"
#define ERDL "Erdl"
#define GOLERKANH "Goler Kanh"
#define POMETTE "Pomette"
#define GANI "Gani"
#define DIVINE_CENTRIST "Elementalist"

// Inhumen pantheon
#define ENVY "One Envy"
#define HERTANNEA "Hertannea"
#define ARCHDEVILS "Archdevils"
#define DECEIVERS "Deceivers"

// Devotion Classes
#define DEVOTION_CLASS_PRIEST "Priest"
#define DEVOTION_CLASS_GRANDMASTER "Grandmaster"
#define DEVOTION_CLASS_TEMPLAR "Templar"
#define DEVOTION_CLASS_ACOLYTE "Acolyte"
#define DEVOTION_CLASS_ABSOLVER "Absolver"
#define DEVOTION_CLASS_CLERIC "Cleric"
#define DEVOTION_CLASS_CHURCHLING "Churchling"
#define DEVOTION_CLASS_SHIRLEIGH_WEAK "Unawakened"
#define DEVOTION_CLASS_SHIRLEIGH_STRONG "Awakened"
