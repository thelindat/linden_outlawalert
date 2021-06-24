-- Framework Stuff ---------------------------------------------------------------
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('linden_outlawalert:isVehicleOwned', function(source, cb, plate)
	QBCore.Functions.ExecuteSql(true, 'SELECT plate FROM player_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(true)
		else
			cb(false)
		end
	end)
end)

-- Framework Stuff ---------------------------------------------------------------

-- Locales
function _U(entry)
	return Locales[ Config.Locale ][entry] 
end

local dispatchCodes = {

    melee = { displayCode = '242', description = _U('melee'), isImportant = 0, recipientList = {'police', 'ambulance'},
    blipSprite = 652, blipColour = 84, blipScale = 1.5 },

    officerdown = {displayCode = '11-99', description = _U('officerdown'), isImportant = 1, recipientList = {'police', 'ambulance'},
    blipSprite = 653, blipColour = 84, blipScale = 1.5, infoM = 'fa-portrait'},

    persondown = {displayCode = '10-53', description = _U('persondown'), isImportant = 0, recipientList = {'police', 'ambulance'},
    blipSprite = 153, blipColour = 84, blipScale = 1.5, infoM = 'fa-portrait'},

    autotheft = {displayCode = '503', description = _U('autotheft'), isImportant = 0, recipientList = {'police'},
    blipSprite = 651, blipColour = 84, blipScale = 1.5, infoM = 'fa-car', infoM2 = 'fa-palette' },

    speeding = {displayCode = '505', description = _U('speeding'), isImportant = 0, recipientList = {'police'},
    blipSprite = 650, blipColour = 84, blipScale = 1.5, infoM = 'fa-car', infoM2 = 'fa-palette' },

    shooting = { displayCode = '10-71', description = _U('shooting'), isImportant = 0, recipientList = {'police', 'ambulance'},
    blipSprite = 648, blipColour = 84, blipScale = 1.5 },

    driveby = { displayCode = '10-71b', description = _U('driveby'), isImportant = 0, recipientList = {'police', 'ambulance'},
    blipSprite = 649, blipColour = 84, blipScale = 1.5, infoM = 'fa-car', infoM2 = 'fa-palette' },
}


--[[ Example custom alert
RegisterCommand('testvangelico', function(playerId, args, rawCommand)
    local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Vangelico Jewelry Store'}
    local dispatchData = {dispatchData = data, caller = 'Alarm', coords = vector3(-633.9, -241.7, 38.1)}
    TriggerEvent('wf-alerts:svNotify', dispatchData)
end, false)
--]]


RegisterServerEvent('wf-alerts:svNotify')
AddEventHandler('wf-alerts:svNotify', function(pData)
    local dispatchData
    if not pData.dispatchCode then dispatchData = pData.dispatchData elseif dispatchCodes[pData.dispatchCode] ~= nil then dispatchData = dispatchCodes[pData.dispatchCode] end
    if not pData.info then pData.info = dispatchData.info end
    if not pData.info2 then pData.info2 = dispatchData.info2 end
    if not pData.length then pData.length = dispatchData.length end
    pData.displayCode = dispatchData.displayCode
    pData.dispatchMessage = dispatchData.description
    pData.isImportant = dispatchData.isImportant
    pData.recipientList = dispatchData.recipientList
    pData.infoM = dispatchData.infoM
    pData.infoM2 = dispatchData.infoM2
    pData.sprite = dispatchData.blipSprite
    pData.colour = dispatchData.blipColour
    pData.scale = dispatchData.blipScale
--[[local xPlayers = ESX.GetPlayers()
	for i= 1, #xPlayers do
        local source = xPlayers[i]
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.job.name == pData.recipientList[1] or xPlayer.job.name == pData.recipientList[2] then
            TriggerClientEvent('wf-alerts:clNotify', source, pData)
        end
    end]]
	TriggerClientEvent('wf-alerts:clNotify', -1, pData) -- Send to all clients then check auth clientside?
    local n = [[

]]
    local details = pData.dispatchMessage
    if pData.info then details = details .. n .. pData.info end
    if pData.info2 then details = details .. n .. pData.info2 end
    if pData.recipientList[1] == 'police' then TriggerEvent('mdt:newCall', details, pData.caller, vector3(pData.coords.x, pData.coords.y, pData.coords.z), false) end
end)


RegisterServerEvent('wf-alerts:svNotify911')
AddEventHandler('wf-alerts:svNotify911', function(message, caller, coords)
    if message ~= nil then
        local pData = {}
        pData.displayCode = '911'
        if caller == _U('caller_unknown') then pData.dispatchMessage = _U('unknown_caller') else
        pData.dispatchMessage = _U('call_from') .. caller end
        pData.recipientList = {'police', 'ambulance'}
        pData.length = 6000
        pData.infoM = 'fa-phone'
        pData.info = message
        pData.coords = vector3(coords.x, coords.y, coords.z)
        pData.sprite, pData.colour, pData.scale =  480, 84, 2.0 -- radar_vip, blue
--[[	local xPlayers = ESX.GetPlayers()
		for i= 1, #xPlayers do
            local source = xPlayers[i]
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
                TriggerClientEvent('wf-alerts:clNotify', source, pData)
            end
        end]]
		TriggerClientEvent('wf-alerts:clNotify', -1, pData) -- Send to all clients then check auth clientside?
        TriggerEvent('mdt:newCall', message, caller, vector3(coords.x, coords.y, coords.z), false)
    end
end)