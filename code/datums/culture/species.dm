//Aelondan species specific cultures
//commoners
/datum/culture/species/aelonda
	name = "Aelondan commonfolk"
	description = "The most common of commonfolk in the realm, shielded from heartache in the deep countryside of Aelonda. \
	A typical upbringing in the Sanct is a mundane tale, working the land and toiling for a heritage of inscrutable age."
	species = RACES_NON_ANTAG
	pre_append = "the "

//cityfolk
/datum/culture/species/aelonda/city
	name = "Aelondan cityfolk"
	description = "The most common of commonfolk in the real, shielded from heartache in the deep countryside of Aelonda. \
	A typical upbringing in the Sanct is a mundane tale, working the land and toiling for a heritage of inscrutable age."
	species = RACES_PLAYER_NONDISCRIMINATED//People in cities here are generally more uppity about monstrous humanoids

//nobility
/datum/culture/species/aelonda/noble
	name = "Aelondan highbornes"
	description = "Those born with the crest of the Emeraldine Court, the nobility of Aelonda and everything adjacent. \
	Most here paint an idyllic picture of serene nobility, but for most, going stir crazy pushes them to adventure overseas."
	species = RACES_PLAYER_NONDISCRIMINATED//No monstrous nobility here

//havel sectus
/datum/culture/species/havelsectus
	name = "Havel Sectus"
	description = "Devout warrior-castes of Havel Sectus who occupy the bridges to Nortmidst and dwell within its mighty walls. \
	Invariably hardened, combat-trained and stubborn to a fault. Most often, these are immigrants seeking to do some good with otherwise dangerous skills."
	species = RACES_LESS_DISCRIMINATED//Only thing that matters is your ability to fight here honestly, kobolds are the only ones actually exempt

//Nortmidst species specific cultures
//commoners
/datum/culture/species/nortmidst
	name = "Nortic wanderers"
	description = "Nomads, exiles and generally hardy folk who have somehow found themselves traversing Nortmidst free of any tribe. \
	A typical upbringing in Nortmidst is not a fun one, and very few who choose to brave the colds survive long."
	species = RACES_PLAYER_ALL//It is Nortmidst, nobody cares what you are
	pre_append = "the "

//cityfolk
/datum/culture/species/nortmidst/city
	name = "Nortic tribesfolk"
	description = "The majority of Norts seek refuge together, and build their lives in rather confined spaces to fend off the brutal wilds. \
	Life here is never lacking for things to do, with the cityfolk trained from a very early age to join in communal labor for the betterment of their tribe. \
	The rigidity of their lives invite feelings of being in a prison for many. It is easy to justify why one would inevitably seek to flee south, damned be the consequences."
	species = RACES_PLAYER_ALL//It is Nortmidst, nobody cares what you are

//Cudao species specific cultures
//commoners
/datum/culture/species/cudao
	name = "Cudese underclass"
	description = "A sharp wit and a sharper knife are the most keen indicators of Cudao's working class. \
	These folk are solely responsible for the back-breaking labor involved in maintaining the nation's billowing industrial works. \
	Most of the downtrodden types yearn to seek more amenable lifestyles but are held back by crime, poverty or discrimination. \
	Hope for their future can usually be found overseas, or playing a role in the Skyways themselves in an airship's employ."
	species = RACES_PLAYER_ALL//It is Cudao, nobody cares what you are as long as you can work. Capitalism baby
	pre_append = "the "

//cityfolk
/datum/culture/species/cudao/city
	name = "Cudese cityfolk"
	description = "The middle class of Cudao which lives invariably above street level across its industrialized islands. \
	Paper-pushers, taxmen, office workers and human calculators only scratch the surface of the many complex roles found here. \
	The almighty coin rules these folk almost more than the Gods themselves, partly in thanks to their close ties to Noman economic innovation."
	species = RACES_PLAYER_ALL//It is Cudao, nobody cares what you are as long as you can work. Capitalism baby
	pre_append = "the "

//tycoons
/datum/culture/species/cudao/tycoon
	name = "Dunnish tycoons"
	description = "The most capable engineers, business owners and leaders of the Cudao peoples. \
	Their less-than-flattering depictions to virtually every lower class is thanks to a brilliant usage of machinery to expand their own little empires. \
	In their pursuit of wealth, Dunmoon and Cudao as a whole has turned into an explosively growing- if morally dubious- machine of its own."
	species = RACES_PLAYER_NONDISCRIMINATED//Again, it is Cudao, except it would be strange to see a monstrous tycoon
	pre_append = "the "

//tycoon underlings
/datum/culture/species/cudao/tycoon/underclass
	name = "Dunnish underclass"
	description = "The working class of Dunmoon, your run of the mill factory worker who keeps the gears turning. \
	Backbreaking labour and long hours are hallmarks of such an upbringing, assuming one isn't left even deeper in the holes of crime and poverty. \
	Dunmoon would cease to function without these people, yet life is hard for them, leading to many seeking out a better life overseas."
	species = RACES_PLAYER_ALL//It is Cudao, nobody cares what you are as long as you can work. Capitalism baby
	pre_append = "the "

//Sultans specific species cultures
//commoners
/datum/culture/species/sultanate
	name = "Qadirid commonfolk"
	description = "Natives of Milhun and its loyalist states within the Sultanate's grasp. \
	Despite an abhorrent reputation with their neighbor Geramor, these folk are internally a deeply storied and culturally rich folk. \
	Their history is defined by unending strife and the pursuit of pride, so much that they would spite their very patron god Visires to see it through. \
	Though they are racially diverse and their peoples many, the commonfolk of the Qadirid are made up of countless conquered peoples who now culturally fall in-line with the Sultanate. \
	They are among the few still-divine groups which have been stricken of their ability to channel their Thauma's power, due to their wrongs against Visires. \
	CAUTION! QADIRID NATIVES CAN NOT PRACTICE MAGIC OUTSIDE OF DIVINE MIRACLES. You will have to utilize Thaumatech if you plan to use magic!"
	species = RACES_NON_ANTAG//The commonfolk, made up of a myriad of countless conquered people. Diverse, but not necessarily treated well by the Sunmen.
	pre_append = "the "

//nobility
/datum/culture/species/sultanate/noble
	name = "Qadirid Sunmen"
	description = "The first unified grand noble houses in history were called the Sunmen- an ancient and once-disparate union between the Kingdoms taken by Maruhadar I. \
	In modern time, their descendents enjoy lavish lives distant from the perpetual wars their peoples face. \
	There is scarce opportunity to see them beyond the gilded palaces of Milhun, and those Sunmen who wander are generally a good indicator of trouble on the horizon. \
	CAUTION! QADIRID NATIVES CAN NOT PRACTICE MAGIC OUTSIDE OF DIVINE MIRACLES. You will have to utilize Thaumatech if you plan to use magic!"
	species = RACES_PLAYER_SULTANS//no monstrous races, the sultans are not exactly a welcoming culture
	pre_append = "the "

/datum/culture/species/sultanate/djannam
	name = "Djannam"
	description = "Nomads and travelers who for whatever reason embark into and beyond the Djannam. \
	Their goals are more often than not criminal in nature, or are the result of some form of exile. \
	The exploration of the eastern deserts is nigh pointlessly dangerous, and so the mutations and Herteannean symbolism beyond is well known to the Sultanate. \
	CAUTION! QADIRID NATIVES CAN NOT PRACTICE MAGIC OUTSIDE OF DIVINE MIRACLES. You will have to utilize Thaumatech if you plan to use magic!"
	species = RACES_PLAYER_ALL//nobody really wants to go here so its not like anyones keeping track
	pre_append = "the "

//geramor
//commoners
/datum/culture/species/geramor
	name = "Geramorean Undermen"
	description = "Commonfolk who originate from the security of Gernhollow, distinct in their keen control of magic and stone. \
	The majority of these people are dwarven, though other humanoids find a difficult life in the harsh sanctum carved out of the regolith here."
	species = RACES_PLAYER_GERAMOR//dwarf, human, elf, aasimar
	pre_append = "the "

//landschnekt gooner containment culture
/datum/culture/species/geramor/sterkenstadt
	name = "Tor Sterkenstadt"
	description = "Tor Sterkenstadt is known the world over for the boisterous festivities that ever fill its streets in brazen defiance of the darkness that threatens to swallow it whole from all sides. \
	It is an ostentatious beacon of flashy excess, with most of the world regarding it as the sole origin of the holiday seasons. \
	The glamorous Feathercap Free Company originates from here and serves as a component of Angus the Fifth's own personal guard."

//obligatory trench veterans
/datum/culture/species/geramor/scars
	name = "Scarred"
	description = "Aptly honored with the title after any extended tenure within the Scars region, the Scarred are respected and often grievously wounded warriors from the wastes in southern Geramor. \
	Survivors of the trenches are few and far between and the accolades they collect are usually seen in vain, but they are sought nonetheless for their potent magical capacity. \
	With their service comes an unrelenting disdain for the Sultans and the product of their wars without reason."
	pre_append = "the "

//Nidhogg spawn
/datum/culture/species/geramor/nidhogg
	name = "Wormbloods"
	description = "Loyal or formerly loyal dwarves to the demonic Nidhogg who festers still beneath Gernhollow. \
	Those who shook free the blood of the vile Betrayer were still permanently altered, given monstrous and drained features. \
	They are obviously difficult to be trusted, suffering exile at best for their malformed state. \
	That is, assuming they aren't still loyal to the Worm all along..."
	species = RACES_PLAYER_DWARVES_ONLY//Only dwarves
	pre_append = "the "

//ocean people
/datum/culture/species/aquatic
	name = "Shallowfolk"
	description = "Inhabitants of coastal, shallow waters which commonly exist in distant and wild places. \
	Often Tritonians or adjacent beastfolk are the only ones who make true civilization in these areas."
	pre_append = "the "

/datum/culture/species/aquatic/deep
	name = "Deep Ones"
	description = "Twisted, pale and solitary aquatic peoples live deep beyond the edge of easily-traversed waters. \
	Beyond the continental shelves of the Goblet, the fearsome depths are found to be a Godless place. \
	Few things survive here and nothing is known to survive beyond a certain point. \
	One could surmise that only truly alien monsters dwell in these parts."
	species = RACES_PLAYER_AQUATIC//generic options
	pre_append = "the "

/datum/culture/species/hellspawn
	name = "Fiend-kin"
	description = "Thauma-less, unnaturally formed life- usually the result of some meddling by daemons. \
	These range from anything between monstrous greenskins to Tieflings, which can sometimes be indistinguishable from Humans. \
	Fiends have no recollection or greater understanding of the workings of Hell beyond their own lacking of Thauma. \
	Invariably, they are discriminated in all parts of the world, only seeing anything close to impartial on Domotan Island."
	species = RACES_PLAYER_HERETICAL_RACE
	pre_append = "the "

/datum/culture/species/aasimar
	name = "Divine origin"
	description = "Genies, mortal divines and generally anything which has ethereal form are considered spirits. \
	They are the most ancient and inscrutable forms of life which inhabit Gaia. \
	The gravitas of their elder origins gives them a rather displaced spot in the modern world. \
	In the times after the Big Burn, the memories of old have been lost with no clear way of continuing their eternal lineages."
	abstract_type = /datum/culture/species/aasimar
	species = list(
		SPEC_ID_AASIMAR
	)

