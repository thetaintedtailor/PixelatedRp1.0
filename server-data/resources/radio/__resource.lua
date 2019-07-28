resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLASS_ROCK" {url = "http://webradio.antennevorarlberg.at/classicrock", volume = 0.2}
supersede_radio "RADIO_02_POP" { url = "http://webradio.antennevorarlberg.at/hits", volume = 0.2 }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://stream.radioreklama.bg/nrj.ogg", volume = 0.2 }

supersede_radio "RADIO_17_FUNK" { url = "http://s01.diazol.hu:35000/live.ogg", volume = 0.2 }
supersede_radio "RADIO_13_JAZZ" { url = "http://webradio.antennevorarlberg.at/partymix", volume = 0.2}


files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
