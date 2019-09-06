Citizen.CreateThread(function()
    local players = {}

	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(619244124234711061)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('pixelated2')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Visit pixelatedrp.com for more info')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('pixelatedrp1')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Visit pixelatedrp.com for more info')

        players = GetActivePlayers()
        SetRichPresence(GetPlayerName(PlayerId()) .. " - " .. #players .. "/" .. GetConvarInt('sv_maxclients', 32))

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)