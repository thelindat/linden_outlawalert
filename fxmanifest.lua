fx_version 'cerulean'
game 'gta5'

version '2.6.4'
description 'https://github.com/thelindat/linden_outlawalert'

client_scripts {
    'locales/en.lua',
    'client/main.lua',
}

shared_script 'config.lua'

server_scripts {
    'locales/en.lua',
    'server/main.lua',
}

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
