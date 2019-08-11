resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Allow players to drop notes for others to read'

client_script {
    "client/main.lua",
    "config.lua"
}

server_script {
    "server/main.lua",
    "config.lua"
}