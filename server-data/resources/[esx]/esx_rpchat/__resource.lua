--[[

  ESX RP Chat

--]]

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX RP Chat'

version '1.0.0'

client_script {
  'client/main.lua',
  'config.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}
