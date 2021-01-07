ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterCommand('911', 'user', function(xPlayer, args, showError)
	local coords = xPlayer.getCoords()
	TriggerEvent('mdt:newCall', args.message, xPlayer.getName(), vector3(coords.x, coords.y, coords.z))
end, false, {help = 'Send a message to the police', validate = true, arguments = {
	{name = 'message', help = 'message', type = 'string'}
}})

ESX.RegisterCommand('911a', 'user', function(xPlayer, args, showError)
	local coords = xPlayer.getCoords()
	TriggerEvent('mdt:newCall', args.message, 'Unknown', vector3(coords.x, coords.y, coords.z))
end, false, {help = 'Send an anonymous message to the police', validate = true, arguments = {
	{name = 'message', help = 'message', type = 'string'}
}})