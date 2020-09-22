/obj/item/device/radio/headset
	name = "radio headset"
	desc = "An updated, modular intercom that fits over the head. Takes encryption keys"
	icon_state = "headset"
	item_state = "headset"
	g_amt = 0
	m_amt = 75
	subspace_transmission = 1
	canhear_range = 1 // can't hear headsets from very far away

	slot_flags = SLOT_EARS
	var/translate_binary = 0
	var/translate_hive = 0
	var/obj/item/device/encryptionkey/keyslot1 = null
	var/obj/item/device/encryptionkey/keyslot2 = null
	maxf = 1489

/obj/item/device/radio/headset/New()
	..()
	keyslot1 = new /obj/item/device/encryptionkey/
	recalculateChannels()

/obj/item/device/radio/headset/talk_into(mob/living/M as mob, message, channel)
	if (!listening)
		return
	..()

/obj/item/device/radio/headset/receive_range(freq, level)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.ears == src)
			return ..(freq, level)
	return 1

/obj/item/device/radio/headset/syndicate
	origin_tech = "syndicate=3"
/obj/item/device/radio/headset/syndicate/New()
	..()
	qdel(keyslot1)
	keyslot1 = new /obj/item/device/encryptionkey/syndicate
	syndie = 1
	recalculateChannels()

/obj/item/device/radio/headset/binary
	origin_tech = "syndicate=3"
/obj/item/device/radio/headset/binary/New()
	..()
	qdel(keyslot1)
	keyslot1 = new /obj/item/device/encryptionkey/binary
	recalculateChannels()

/obj/item/device/radio/headset/headset_sec
	name = "imperial guard headset"
	desc = "This is used by the imperial guard force. To access the imperial guard channel, use :s."
	icon_state = "sec_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_sec

/obj/item/device/radio/headset/headset_eng
	name = "mechanicus headset"
	desc = "When the Adeptus Mechanicus wish to confer on toaster designs. To access the engineering channel, use :e. "
	icon_state = "eng_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_rob
	name = "cybernetica headset"
	desc = "Made specifically for the cybernetica acolytes, who work with science but are part of the Adeptus Mechanicus. To access the engineering channel, use :e. For research, use :n."
	icon_state = "rob_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_rob

/obj/item/device/radio/headset/headset_med
	name = "medicus headset"
	desc = "A headset for the trained staff of the medbay. To access the medical channel, use :m."
	icon_state = "med_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_sci
	name = "research headset"
	desc = "A sciency headset. Like usual. To access the science channel, use :n."
	icon_state = "sci_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_sci

/obj/item/device/radio/headset/headset_medsci  //Only used by Genetor so safe to rename.
	name = "genetor radio headset"
	desc = "A headset for the genetor, an adeptus mechanicus closely tied to medical and science. Channels are as follows: : e - engineering, :m - medical, :n - science."
	icon_state = "medsci_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_medsci

/obj/item/device/radio/headset/headset_com
	name = "command radio headset"
	desc = "A headset with a commanding channel. To access the command channel, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_com

/obj/item/device/radio/headset/heads/captain
	name = "\proper Rogue Trader Headset"
	desc = "The headset of the boss. Channels are as follows: :c - command, :s - imperial guard, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/captain

/obj/item/device/radio/headset/heads/rd
	name = "\proper Lord Inquisitor Headset"
	desc = "Headset of the fellow who keeps society marching towards technological singularity. To access the science channel, use :n. For command, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/rd

/obj/item/device/radio/headset/heads/hos
	name = "\proper Commissar Headset"
	desc = "The headset of the man in charge of keeping order and protecting the station. To access the imperial guard channel, use :s. For command, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/hos

/obj/item/device/radio/headset/heads/ce
	name = "\proper Magos Headset"
	desc = "The headset of the tech-priest in charge of keeping the station powered and undamaged. To access the engineering channel, use :e. For command, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/ce

/obj/item/device/radio/headset/heads/cmo
	name = "\proper the Adeptus Soritas Headset"
	desc = "The headset of the highly trained medical chief. To access the medical channel, use :m. For command, use :c."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/cmo

/obj/item/device/radio/headset/heads/hop
	name = "\proper the Seneschal's headset"
	desc = "The headset of the guy who will one day be captain. Channels are as follows: :u - supply, :v - service, :c - command."
	icon_state = "com_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/hop

/obj/item/device/radio/headset/headset_cargo
	name = "munitorum headset"
	desc = "A headset used by the Munitorum. To access the supply channel, use :u."
	icon_state = "cargo_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_srv
	name = "service radio headset"
	desc = "Headset used by the service staff, tasked with keeping the station full, happy and clean. To access the service channel, use :v."
	icon_state = "srv_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/headset_service

/obj/item/device/radio/headset/headset_cent
	name = "centcom headset"
	desc = "A headset used by the upper echelons of the Imperium. Channels are as follows: :c - command, :s - imperial guard, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "cent_headset"
	item_state = "headset"
	keyslot2 = new /obj/item/device/encryptionkey/heads/captain

/obj/item/device/radio/headset/attackby(obj/item/weapon/W as obj, mob/user as mob)
//	..()
	user.set_machine(src)
	if (!( istype(W, /obj/item/weapon/screwdriver) || (istype(W, /obj/item/device/encryptionkey/ ))))
		return

	if(istype(W, /obj/item/weapon/screwdriver))
		if(keyslot1 || keyslot2)


			for(var/ch_name in channels)
				radio_controller.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot1)
				var/turf/T = get_turf(user)
				if(T)
					keyslot1.loc = T
					keyslot1 = null



			if(keyslot2)
				var/turf/T = get_turf(user)
				if(T)
					keyslot2.loc = T
					keyslot2 = null

			recalculateChannels()
			user << "You pop out the encryption keys in the headset!"

		else
			user << "This headset doesn't have any encryption keys!  How useless..."

	if(istype(W, /obj/item/device/encryptionkey/))
		if(keyslot1 && keyslot2)
			user << "The headset can't hold another key!"
			return

		if(!keyslot1)
			user.drop_item()
			W.loc = src
			keyslot1 = W

		else
			user.drop_item()
			W.loc = src
			keyslot2 = W


		recalculateChannels()

	return


/obj/item/device/radio/headset/proc/recalculateChannels()
	src.channels = list()
	src.translate_binary = 0
	src.translate_hive = 0
	src.syndie = 0

	if(keyslot1)
		for(var/ch_name in keyslot1.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot1.channels[ch_name]

		if(keyslot1.translate_binary)
			src.translate_binary = 1

		if(keyslot1.translate_hive)
			src.translate_hive = 1

		if(keyslot1.syndie)
			src.syndie = 1

	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			src.translate_binary = 1

		if(keyslot2.translate_hive)
			src.translate_hive = 1

		if(keyslot2.syndie)
			src.syndie = 1


	for (var/ch_name in channels)
		if(!radio_controller)
			sleep(30) // Waiting for the radio_controller to be created.
		if(!radio_controller)
			src.name = "broken radio headset"
			return

		secure_radio_connections[ch_name] = radio_controller.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	return
