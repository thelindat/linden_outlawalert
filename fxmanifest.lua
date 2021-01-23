fx_version 'cerulean'
game 'gta5'

version '2.2.0'
description 'https://github.com/thelindat/linden_outlawalert'

client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'client.lua',
}

shared_script 'config.lua'

server_scripts {
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'server.lua',
}

ui_page {
    'html/alerts.html',
}

files {
	'html/alerts.html',
	'html/main.js', 
	'html/style.css',
}

export "getSpeed"
export "getStreet"
export "zoneChance"