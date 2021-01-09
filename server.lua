ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterCommand('911', function(playerId, args, rawCommand)
	if playerId ~= 0 then
		args = table.concat(args, ' ')
		local xPlayer = ESX.GetPlayerFromId(playerId)
		local coords = xPlayer.getCoords()
		TriggerEvent('mdt:newCall', args, xPlayer.getName(), vector3(coords.x, coords.y, coords.z))
	end
end, false)

RegisterCommand('911a', function(playerId, args, rawCommand)
	if playerId ~= 0 then
		args = table.concat(args, ' ')
		local xPlayer = ESX.GetPlayerFromId(playerId)
		local coords = xPlayer.getCoords()
		TriggerEvent('mdt:newCall', args, "Unknown", vector3(coords.x, coords.y, coords.z))
	end
end, false)
