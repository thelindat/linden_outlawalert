fx_version 'cerulean'
game 'gta5'

version '2.0.2'
description 'https://github.com/thelindat/linden_outlawalert'

client_scripts {
   'client.lua'
}

shared_script 'config.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
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