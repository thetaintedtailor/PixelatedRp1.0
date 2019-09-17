resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Sell vehicles to another player"

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"config.lua",
	"server/main.lua"
}

client_scripts {
	"config.lua",
	"client/main.lua"
}