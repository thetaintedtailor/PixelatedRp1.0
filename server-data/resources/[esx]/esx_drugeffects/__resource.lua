resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Drug Effects'

version '0.0.5'

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/drugs/narcotic.lua',
	'client/drugs/prescription.lua',
	'client/drugs/narcotics/weed.lua',
	'client/drugs/narcotics/opium.lua',
	'client/drugs/narcotics/meth.lua',
	'client/drugs/narcotics/coke.lua',
	'client/drugs/narcotics/crack.lua',
	'client/drugs/prescriptions/k3v.lua',
	'client/drugs/prescriptions/xanax.lua',
	'client/drugs/prescriptions/vicodin.lua',
	'client/drugs/prescriptions/amoxicillin.lua',
	'client/drugs/prescriptions/ibuprofen.lua',
	'client/main.lua'
}
