ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	local mdt = GetResourceState('mdt')
	if GetResourceState('mdt') == 'started' or GetResourceState('mdt') == 'starting' then
		RegisterCommand('911', function(playerId, args, rawCommand)
			if playerId ~= 0 then
				args = table.concat(args, ' ')
				local xPlayer = ESX.GetPlayerFromId(playerId)
				local coords = xPlayer.getCoords()
				if config.phone_number then caller = getNumberPhone(xPlayer.identifier) else caller = xPlayer.getName() end
				TriggerEvent('mdt:newCall', args, caller, vector3(coords.x, coords.y, coords.z))
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
	else
		print("Resource 'MDT' is "..mdt)
	end
end)

RegisterServerEvent("mdt:newCall")
AddEventHandler("mdt:newCall", function(details, caller, coords, data)
	if data then
		local xPlayers = ESX.GetPlayers()
		for i= 1, #xPlayers do
			local source = xPlayers[i]
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.job.name == 'police' then
				TriggerClientEvent("mdt_outlawalert:SendAlert", source, data)
			end
		end
	end
end)

-- Get phone number
function getNumberPhone(identifier)
    local result = MySQL.Sync.fetchAll("SELECT users.phone_number FROM users WHERE users.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].phone_number
    end
    return nil
end
------------------------------------------------------------------------