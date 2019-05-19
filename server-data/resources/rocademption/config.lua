Config = {}

----------------------------------------------------
-------- Intervalles en secondes -------------------
----------------------------------------------------

-- Waiting time for antispam
Config.AntiSpamTimer = 8

-- Vérification et attribution d'une place libre / Verification and allocation of a free place
Config.TimerCheckPlaces = 3

-- Update of the message (emojis) and access to the free place for the lucky one
Config.TimerRefreshClient = 3

-- Number of points updating
Config.TimerUpdatePoints = 6

----------------------------------------------------
------------ Nombres de points ---------------------
----------------------------------------------------

-- Number of points earned for those who are waiting
Config.AddPoints = 1

-- Number of points lost for those who entered the server
Config.RemovePoints = 1

-- Number of points earned for those who have 3 identical emojis (lottery)
Config.LoterieBonusPoints = 25

-- Priority access
Config.Points = {
	-- {'steamID', points},
	-- {'steam:0123456789', 1000}
	{'steam:110000104f88629', 1000},
	{'steam:110000104D64509', 1000},
	{'steam:110000134C6DE86', 500},
	{'steam:1100001184DB220', 500},
	{'steam:110000104F1466F', 500},
	{'steam:110000112C1D3B6', 500},
	{'steam:110000106293560', 500},
	{'steam:11000010DD6175D', 1000},
	{'steam:11000013b44adb1', 1000},
	{'steam:1100001052bd9b2', 1000},
	{'steam:11000011149AF20', 1000},
}

----------------------------------------------------
------------- Textes des messages ------------------
----------------------------------------------------

-- If steam is not detected
--Config.NoSteam = "Steam n'a pas été détecté. Veuillez (re)lancer Steam et FiveM, puis réessayer."
  Config.NoSteam = "Steam was not detected. Please (re)launch Steam and FiveM, and try again."

-- Message d'attente / Waiting text
--Config.EnRoute = "Vous êtes en route. Vous avez déjà parcouru"
Config.EnRoute = "You are on the road. You have already traveled"

-- "points" traduits en langage RP / "points" for RP purpose
--Config.PointsRP = "kilomètres"
Config.PointsRP = "kilometers"

-- Position dans la file / position in the queue
--Config.Position = "Vous êtes en position "
Config.Position = "You are in position "

-- Text before emojis
--Config.EmojiMsg = "Si les emojis sont figés, relancez votre client : "
Config.EmojiMsg = "If the emojis are frozen, restart your client: "

-- When the player win the lottery
--Config.EmojiBoost = "!!! Youpi, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " gagnés !!!"
Config.EmojiBoost = "!!! Yippee, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " won !!!"

-- Anti-spam message / anti-spam text
--Config.PleaseWait_1 = "Veuillez patienter "
--Config.PleaseWait_2 = " secondes. La connexion se lancera automatiquement !"
Config.PleaseWait_1 = "Please wait "
Config.PleaseWait_2 = " seconds. The connection will start automatically!"

-- Me devrait jamais s'afficher / Should never be displayed
--Config.Accident = "Oups, vous venez d'avoir un accident... Si cela se reproduit, vous pouvez en informer le support :)"
Config.Accident = "Oops, you just had an accident ... If it happens again, you can inform the support :)"

-- En cas de points négatifs / In case of negative points
--Config.Error = " ERREUR : RELANCEZ LA ROCADE ET CONTACTEZ LE SUPPORT DU SERVEUR "
Config.Error = " ERROR : RESTART THE QUEUE SYSTEM AND CONTACT THE SUPPORT "


Config.EmojiList = {
	'🐌', 
	'🐍',
	'🐎', 
	'🐑', 
	'🐒',
	'🐘', 
	'🐙', 
	'🐛',
	'🐜',
	'🐝',
	'🐞',
	'🐟',
	'🐠',
	'🐡',
	'🐢',
	'🐤',
	'🐦',
	'🐧',
	'🐩',
	'🐫',
	'🐬',
	'🐲',
	'🐳',
	'🐴',
	'🐅',
	'🐈',
	'🐉',
	'🐋',
	'🐀',
	'🐇',
	'🐏',
	'🐐',
	'🐓',
	'🐕',
	'🐖',
	'🐪',
	'🐆',
	'🐄',
	'🐃',
	'🐂',
	'🐁',
	'🔥'
}
