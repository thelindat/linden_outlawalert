fx_version 'cerulean'
game 'gta5'

version '2.7.1'
description 'https://github.com/thelindat/linden_outlawalert'
versioncheck 'https://raw.githubusercontent.com/thelindat/linden_outlawalert/master/fxmanifest.lua'

shared_scripts {
    'config.lua',
    'locales/locales.lua',
    '@qb-core/import.lua'
}

client_script 'client/main.lua'
server_script 'server.lua'

ui_page {
    'html/alerts.html',
}

files {
	'html/alerts.html',
	'html/main.js', 
	'html/style.css',
}

export "getSpeed"           -- exports['linden_outlawalert']:getSpeed
export "getStreet"          -- exports['linden_outlawalert']:getStreet
export "zoneChance"         -- exports['linden_outlawalert']:zoneChance('Custom', 2)
