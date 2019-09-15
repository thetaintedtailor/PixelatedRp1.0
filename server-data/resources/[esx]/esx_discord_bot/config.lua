Config                        = {}
Config.Locale 				  = 'en'
Config.green 				  = 56108
Config.grey 				  = 8421504
Config.red 					  = 16711680
Config.orange 				  = 16744192
Config.blue 				  = 2061822
Config.purple 				  = 11750815
Config.theftHook              = "https://discordapp.com/api/webhooks/582630624976699425/c85nvVzuBXVDPWIEmeZcBgtBjx7_cXk6-hmjrzNDg3dnl4yJO9dqsbFDzOn2pDw2BH_f"
Config.deathHook			  = "https://discordapp.com/api/webhooks/609561864325693440/a4CxtGUPKKozu4Y5YfrMoYIYKrMnl77vdOsF6ntKTEAKBGrZNnlbc0VN3Z3yUP745KWE"
Config.chatHook               = "https://discordapp.com/api/webhooks/609562386839633921/dsWSOXNjLgU2T8RGLgN1Ol2GVr1Oz5nWhkb_gdLC3XIer2hWN1cRBL62zD6QZfAtREy0"
Config.moneyHook              = "https://discordapp.com/api/webhooks/609562475100110860/DHi3XOQ_l_WgmX1BIviT5XNexJWH4ARzkq_g_mgrVFX8G4XG1NGo9Mxs4NaKbQJMcrR-"
Config.serverHook             = "https://discordapp.com/api/webhooks/609577475558866944/HO2njpG3N7A7nJEcEXicZg7D1nOk7KxKAXksMRpEDpKVsjPazfTrWZObmV_vqzZfImax"

settings = {
	LogKills = true, -- Log when a player kill an other player.
	LogEnterPoliceVehicle = true, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = false, -- Log when a player enter in a blacklisted vehicle.
	LogPedJacking = false, -- Log when a player is jacking a car
	LogChatServer = true, -- Log when a player is talking in the chat , /command works too.
	LogLoginServer = false, -- Log when a player is connecting/disconnecting to the server.
	LogItemTransfer = true, -- Log when a player is giving an item.
	LogWeaponTransfer = true, -- Log when a player is giving a weapon.
	LogMoneyTransfer = true, -- Log when a player is giving money
	LogMoneyBankTransfert = true, -- Log when a player is giving money from bankaccount
	LogAnonymousTwitter = true, -- Logs anonyous tweets
	LogItemSelling = true, --Logs the sale of items to NPCs
	LogDroppedNotes = true, --Logs the notes players can drop
	LogLocalDoctors = true --Logs when a player uses the local doctos to heal or revive
}

blacklistedModels = {
	"APC",
	"BARRACKS",
	"BARRACKS2",
	"RHINO",
	"CRUSADER",
	"CARGOBOB",
	"SAVAGE",
	"TITAN",
	"LAZER",
}
