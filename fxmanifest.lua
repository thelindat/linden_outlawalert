fx_version 'cerulean'
game 'gta5'

version '1.0.4'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
}


client_script 'client.lua'

shared_script 'config.lua'

ui_page {
    'html/alerts.html',
}

files {
	'html/alerts.html',
	'html/main.js', 
	'html/style.css',
}
