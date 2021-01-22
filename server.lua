-- ESX Framework Stuff ---------------------------------------------------------------
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('linden_outlawalert:getCharData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then return end

	local PrimaryIdentifier = 'fivem'
	for k,v in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(v, PrimaryIdentifier) then
            local identifier = v
            MySQL.Async.fetchAll('SELECT firstname, lastname, phone_number FROM users WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(results)
				cb(results[1])
			end)
        end
    end
end)

ESX.RegisterServerCallback('linden_outlawalert:isVehicleOwned', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(true)
		else
			cb(false)
		end
	end)
end)
-- ESX Framework Stuff ---------------------------------------------------------------

local dispatchCodes = {
    fight = { displayCode = '10-10', description = 'Fight in progress', isImportant = 0, recipientList = {'police', 'ambulance'} },
    officerdown = {displayCode = '10-69', description = 'Officer is down', isImportant = 1, recipientList = {'police', 'ambulance'}},
    autotheft = {displayCode = '503', description = 'Theft of a motor vehicle', isImportant = 0, recipientList = {'police'}},
    speeding = {displayCode = '505', description = 'Reckless driving', isImportant = 0, recipientList = {'police'} },
    shooting = { displayCode = '10-71', description = 'Discharge of a firearm', isImportant = 0, recipientList = {'police', 'ambulance'} },
    driveby = { displayCode = '10-71b', description = 'Drive-by shooting', isImportant = 0, recipientList = {'police', 'ambulance'} },
}


RegisterServerEvent('wf-alerts:svNotify')
AddEventHandler('wf-alerts:svNotify', function(pData)
    if pData ~= nil then
        if dispatchCodes[pData.dispatchCode] ~= nil then
            local dispatchData = dispatchCodes[pData.dispatchCode]
            pData.displayCode = dispatchData.displayCode
            pData.dispatchMessage = dispatchData.description
            pData.isImportant = dispatchData.isImportant
            pData.recipientList = dispatchData.recipientList

            local xPlayers = ESX.GetPlayers()
		    for i= 1, #xPlayers do
                local source = xPlayers[i]
                local xPlayer = ESX.GetPlayerFromId(source)
                if xPlayer.job.name == pData.recipientList[1] or xPlayer.job.name == pData.recipientList[2] then
                    TriggerClientEvent('wf-alerts:clNotify', source, pData)
                end
            end
            if pData.recipientList[1] == 'police' then TriggerEvent('mdt:newCall', pData.dispatchMessage, pData.caller, vector3(pData.coords.x, pData.coords.y, pData.coords.z), false) end
        end
    end
end)