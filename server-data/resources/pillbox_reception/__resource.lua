resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Allow players to revive themselves if someone takes them to PB with no EMS on"

server_scripts {
	"config.lua",
	"server/main.lua"
}

client_scripts {
	"config.lua",
	"client/main.lua"
}