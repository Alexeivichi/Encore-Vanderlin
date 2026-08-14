/obj/item/organ/stomach
	name = "stomach"
	icon_state = "stomach"
	w_class = WEIGHT_CLASS_SMALL
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_STOMACH
	organ_efficiency = list(ORGAN_SLOT_STOMACH = 100)
	attack_verb = list("gored", "squished", "slapped", "digested")
	desc = ""

	organ_volume = 1
	max_blood_storage = 20
	current_blood = 20
	blood_req = 2
	oxygen_req = 4
	nutriment_req = 1.5
	hydration_req = 1.2

	low_threshold_passed = "<span class='info'>My stomach flashes with pain before subsiding. Food doesn't seem like a good idea right now.</span>"
	high_threshold_passed = "<span class='warning'>My stomach flares up with constant pain. I can hardly stomach the idea of food right now!</span>"
	high_threshold_cleared = "<span class='info'>The pain in my stomach dies down for now, but food still seems unappealing.</span>"
	low_threshold_cleared = "<span class='info'>The last bouts of pain in my stomach have died out.</span>"

	var/disgust_metabolism = 1
	var/metabolism_efficiency = 0.1 // the lowest we should go is 0.05

/obj/item/organ/stomach/Initialize()
	. = ..()
	create_reagents(1000)

/obj/item/organ/stomach/on_owner_examine(datum/source, mob/user, list/examine_list)
	if(!ishuman(owner))
		return
	if(is_failing())
		examine_list += span_danger("<b>[owner]</b>'s abdomen is visibly distended, with a sickly sheen of sweat across [owner.p_their()] skin.")
	else if(damage >= high_threshold)
		examine_list += span_warning("<b>[owner]</b> has a distinctly greenish, nauseated cast to [owner.p_their()] complexion.")
	else if(damage >= low_threshold)
		examine_list += span_notice("<b>[owner]</b> looks a little peaky.")

	//We are checking if we have nutriment in a damaged stomach.
	var/datum/reagent/nutri = locate(/datum/reagent/consumable/nutriment) in reagents.reagent_list
	//No nutriment found lets exit out
	if(!nutri)
		return

	//The stomach is damage has nutriment but low on theshhold, lo prob of vomit
	if(prob(damage * 0.025 * nutri.volume * nutri.volume))
		body.vomit(damage)
		to_chat(body, "<span class='warning'>Your stomach reels in pain as you're incapable of holding down all that food!</span>")
		return

	// the change of vomit is now high
	if(damage > high_threshold && prob(damage * 0.1 * nutri.volume * nutri.volume))
		body.vomit(damage)
		to_chat(body, "<span class='warning'>Your stomach reels in pain as you're incapable of holding down all that food!</span>")

/obj/item/organ/stomach/proc/handle_disgust(mob/living/carbon/human/H)
	if(H.disgust)
		var/stutterprob = 5 + 0.05 * H.disgust
		if(H.disgust >= DISGUST_LEVEL_GROSS)
			if(prob(10))
				H.stuttering += 1
				H.adjust_confusion(4 SECONDS)
			if(prob(10) && !H.stat)
				to_chat(H, "<span class='warning'>I feel kind of iffy...</span>")
			H.adjust_jitter(-6 SECONDS)
		if(H.disgust >= DISGUST_LEVEL_VERYGROSS)
			if(prob(stutterprob)) //this doesnt make you vomit anymore
				H.adjust_confusion(5 SECONDS)
				H.stuttering += 1
			H.set_dizzy(10 SECONDS)
		if(H.disgust >= DISGUST_LEVEL_DISGUSTED)
			if(prob(25))
				H.set_eye_blur_if_lower(6 SECONDS)

		H.adjust_disgust(-0.5 * disgust_metabolism)
	switch(H.disgust)
		if(0 to DISGUST_LEVEL_GROSS)
			H.clear_alert("disgust")
			H.remove_stress(/datum/stress_event/disgust)
		if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
			H.throw_alert("disgust", /atom/movable/screen/alert/gross)
			H.add_stress(/datum/stress_event/gross)
		if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
			H.throw_alert("disgust", /atom/movable/screen/alert/verygross)
			H.add_stress(/datum/stress_event/verygross)
		if(DISGUST_LEVEL_DISGUSTED to INFINITY)
			H.throw_alert("disgust", /atom/movable/screen/alert/disgusted)
			H.add_stress(/datum/stress_event/disgusted)

/obj/item/organ/stomach/Remove(mob/living/carbon/M, special = 0)
	var/mob/living/carbon/human/H = owner
	if(istype(H))
		H.clear_alert("disgust")
		H.remove_stress(/datum/stress_event/disgust)
	..()

/obj/item/organ/stomach/fly
	name = "insectoid stomach"
	icon_state = "stomach-x" //xenomorph liver? It's just a black liver so it fits.
	desc = ""

/obj/item/organ/stomach/plasmaman
	name = "digestive crystal"
	icon_state = "stomach-p"
	desc = ""

/obj/item/organ/stomach/acid_spit
	var/datum/action/cooldown/spell/projectile/acid_splash/organ/spit

/obj/item/organ/stomach/acid_spit/Destroy(force)
	if(spit)
		QDEL_NULL(spit)
	return ..()

/obj/item/organ/stomach/acid_spit/Insert(mob/living/carbon/M, special, drop_if_replaced, new_zone = null)
	. = ..()
	if(QDELETED(spit))
		spit = new(src)
	spit.Grant(M)

/obj/item/organ/stomach/acid_spit/Remove(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(QDELETED(spit))
		return
	spit.Remove(M)

/obj/item/organ/guts // relatively unimportant, just fluff :)
	name = "guts"
	icon_state = "guts"
	w_class = WEIGHT_CLASS_SMALL
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_GUTS
	attack_verb = list("gored", "squished", "slapped", "digested")
	desc = ""
	organ_efficiency = list(ORGAN_SLOT_GUTS = 100)
	low_threshold_passed = "<span class='info'>My guts flashes with pain before subsiding.</span>"
	high_threshold_passed = "<span class='warning'>My guts flares up with constant pain.</span>"
	high_threshold_cleared = "<span class='info'>The pain in my guts die down for now.</span>"
	low_threshold_cleared = "<span class='info'>The last bouts of pain in my guts have died out.</span>"

/obj/item/organ/guts/on_owner_examine(datum/source, mob/user, list/examine_list)
	if(!ishuman(owner))
		return
	if(is_failing())
		examine_list += span_danger("<b>[owner]</b>'s abdomen looks rigid and board-like.")
	else if(damage >= high_threshold)
		examine_list += span_warning("<b>[owner]</b>'s midsection looks somewhat tense and swollen.")
	else if(damage >= low_threshold)
		examine_list += span_notice("<b>[owner]</b>'s abdomen looks mildly bloated.")
