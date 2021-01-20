ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

ESX.RegisterServerCallback('mdt_outlawalert:getCharData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end

	MySQL.Async.fetchAll('SELECT firstname, lastname, phone_number FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(results)
		cb(results[1])
	end)
end)
