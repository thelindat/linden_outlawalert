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

    fight = { displayCode = '10-10', description = _U('fight'), isImportant = 0, recipientList = {'police', 'ambulance'} },

    officerdown = {displayCode = '10-69', description = _U('officerdown'), isImportant = 1, recipientList = {'police', 'ambulance'},
    infoM = 'fa-portrait'},

    autotheft = {displayCode = '503', description = _U('autotheft'), isImportant = 0, recipientList = {'police'},
    infoM = 'fa-car', infoM2 = 'fa-palette' },

    speeding = {displayCode = '505', description = _U('speeding'), isImportant = 0, recipientList = {'police'},
    infoM = 'fa-car', infoM2 = 'fa-palette' },

    shooting = { displayCode = '10-71', description = _U('shooting'), isImportant = 0, recipientList = {'police', 'ambulance'} },

    driveby = { displayCode = '10-71b', description = _U('driveby'), isImportant = 0, recipientList = {'police', 'ambulance'},
    infoM = 'fa-car', infoM2 = 'fa-palette' },
}


--[[ Example custom alert
RegisterCommand('testvangelico', function(playerId, args, rawCommand)
    local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Vangelico Jewelry Store'}
    local dispatchData = {dispatchData = data, caller = 'Alarm', street = 'Portola Dr, Rockford Hills', coords = vector3(-633.9, -241.7, 38.1)}
    TriggerEvent('wf-alerts:svNotify', dispatchData)
end, false)
--]]


RegisterServerEvent('wf-alerts:svNotify')
AddEventHandler('wf-alerts:svNotify', function(pData)
    local dispatchData
    if not pData.dispatchCode then dispatchData = pData.dispatchData elseif dispatchCodes[pData.dispatchCode] ~= nil then dispatchData = dispatchCodes[pData.dispatchCode] end
    pData.displayCode = dispatchData.displayCode
    pData.dispatchMessage = dispatchData.description
    pData.isImportant = dispatchData.isImportant
    pData.recipientList = dispatchData.recipientList
    if not pData.info then pData.info = dispatchData.info end
    if not pData.info2 then pData.info2 = dispatchData.info2 end
    pData.infoM = dispatchData.infoM
    pData.infoM2 = dispatchData.infoM2
    pData.length = dispatchData.length
    Citizen.Wait(1500)
    local xPlayers = ESX.GetPlayers()
	for i= 1, #xPlayers do
        local source = xPlayers[i]
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.job.name == pData.recipientList[1] or xPlayer.job.name == pData.recipientList[2] then
            TriggerClientEvent('wf-alerts:clNotify', source, pData)
        end
    end
    local n = [[

]]
    local details = pData.dispatchMessage
    if pData.info then details = details .. n .. pData.info end
    if pData.info2 then details = details .. n .. pData.info2 end
    if pData.recipientList[1] == 'police' then TriggerEvent('mdt:newCall', details, pData.caller, vector3(pData.coords.x, pData.coords.y, pData.coords.z), false) end
end)


RegisterServerEvent('wf-alerts:svNotify911')
AddEventHandler('wf-alerts:svNotify911', function(message, caller, street, coords)
    if message ~= nil then
        local pData = {}
        pData.displayCode = '911'
        if caller == _U('caller_unknown') then pData.dispatchMessage = _U('unknown_caller') else
        pData.dispatchMessage = _U('call_from') .. caller end
        pData.recipientList = {'police', 'ambulance'}
        pData.length = 6000
        pData.street = street
        pData.infoM = 'fa-phone'
        pData.info = message
        pData.coords = coords
        local xPlayers = ESX.GetPlayers()
		for i= 1, #xPlayers do
            local source = xPlayers[i]
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
                TriggerClientEvent('wf-alerts:clNotify', source, pData)
            end
        end
        TriggerEvent('mdt:newCall', message, caller, vector3(coords.x, coords.y, coords.z), false)
    end
end)
