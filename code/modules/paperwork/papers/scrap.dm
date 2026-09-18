/obj/item/paper/bsmith
	info = "It's easy to smith. Put ores in the smelter. Put ingots on the anvil. Use your tongs to handle ingots. Hit them with the hammer. Quench hot ingots in the barrel (there must be water in it). Steel is an alloy from iron and coal, find the golden ratio"

/obj/item/paper/sunlord
	info = "Hello cave-dwellers, this item has been claimed by the Sunlord, it suits my abode better."

/obj/item/paper/feldsher
	info = "Hail, good Feldsher, and good tidings from all the way from our headquarters in Dunmoon. The illustrious Medicine Guild wishes you good health, and reminds you that you are contractually obligated to charge all prospective patients for your services and medical aid rendered. Your institution is required to pay its Guild dues at the foreclosure of each month, and should it be found that the business has insufficient revenue, you will be required to make up the difference out of your own pockets. May Erdl guide your scalpel hand.  <br> Additonally, be aware that we've entered into a recent partnership with the Doma Magick Institute and the Katholikos Church - their number also have access to the Apothecarium, and the Erdites may occasionally wish to make usage of the Stitchery."

/obj/item/paper/apothecary
	info = "Hail, good Apothecary, and good tidings from all the way from our headquarters in Dunmoon. The illustrious Medicine Guild wishes you good health, and reminds you that you are contractually obligated to charge all prospective patients for your services and concoctions. Your institution is required to pay its Guild dues at the foreclosure of each month, and should it be found that the business has insufficient revenue, you will be required to make up the difference out of your own pockets. May Erdl guide your practiced hand. <br> Additonally, be aware that we've entered into a recent partnership with the Doma Magick Institute and the Katholikos Church - their number also have access to the Apothecarium, and the Erdites may occasionally wish to make usage of the Stitchery."

/obj/item/paper/dunmoon/Initialize()
	var/static/list/info = list(
		"Negotiate trade agreements with merchants on Domotan to facilitate the exchange of goods and resources between the two realms.",
		"Explore the mysteries of Domotan, uncovering its secrets and hidden treasures.",
		"Establish a diplomatic agreement with the Monarch of Etgard to strengthen the relationship between Dunmoon and Domotan Island.",
		"Our lands have long been dry of Thauma, Our fields are failing and the famine is causing unrest in our realm. Seek royal largesse",
	)
	src.info = pick(info)
	return ..()
