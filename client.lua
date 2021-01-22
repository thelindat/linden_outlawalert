ESX = nil
local isPlayerWhitelisted
local speedlimitValues = {["Joshua Rd"]=90, ["East Joshua Road"]=90, ["Marina Dr"]=70, ["Alhambra Dr"]=70, ["Niland Ave"]=70, ["Zancudo Ave"]=70, ["Armadillo Ave"]=70, ["Algonquin Blvd"]=70, ["Mountain View Dr"]=70, ["Cholla Springs Ave"]=70, ["Panorama Dr"]=70, ["Lesbos Ln"]=70, ["Calafia Rd"]=70, ["North Calafia Way"]=70, ["Cassidy Trail"]=70, ["Seaview Rd"]=70, ["Grapeseed Main St"]=70, ["Grapeseed Ave"]=70, ["Joad Ln"]=70, ["Union Rd"]=70, ["O'Neil Way"]=70, ["Senora Fwy"]=120, ["Catfish View"]=70, ["Great Ocean Hwy"]=70, ["Paleto Blvd"]=70, ["Duluoz Ave"]=70, ["Procopio Dr"]=70, ["Cascabel Ave"]=70, ["Procopio Promenade"]=70, ["Pyrite Ave"]=70, ["Fort Zancudo Approach Rd"]=70, ["Barbareno Rd"]=70, ["Ineseno Road"]=70, ["West Eclipse Blvd"]=70, ["Playa Vista"]=70, ["Bay City Ave"]=70, ["Del Perro Fwy"]=120, ["Equality Way"]=70, ["Red Desert Ave"]=70, ["Magellan Ave"]=70, ["Sandcastle Way"]=70, ["Vespucci Blvd"]=70, ["Prosperity St"]=70, ["San Andreas Ave"]=70, ["North Rockford Dr"]=70, ["South Rockford Dr"]=70, ["Marathon Ave"]=70, ["Boulevard Del Perro"]=70, ["Cougar Ave"]=70, ["Liberty St"]=70, ["Bay City Incline"]=70, ["Conquistador St"]=70, ["Cortes St"]=70, ["Vitus St"]=70, ["Aguja St"]=70, ["Goma St"]=70, ["Melanoma St"]=70, ["Palomino Ave"]=70, ["Invention Ct"]=70, ["Imagination Ct"]=70, ["Rub St"]=70, ["Tug St"]=70, ["Ginger St"]=70, ["Lindsay Circus"]=70, ["Calais Ave"]=70, ["Adam's Apple Blvd"]=70, ["Alta St"]=70, ["Integrity Way"]=70, ["Swiss St"]=70, ["Strawberry Ave"]=70, ["Capital Blvd"]=70, ["Crusade Rd"]=70, ["Innocence Blvd"]=70, ["Davis Ave"]=70, ["Little Bighorn Ave"]=70, ["Roy Lowenstein Blvd"]=70, ["Jamestown St"]=70, ["Carson Ave"]=45, ["Grove St"]=70, ["Brouge Ave"]=70, ["Covenant Ave"]=70, ["Dutch London St"]=70, ["Signal St"]=70, ["Elysian Fields Fwy"]=120, ["Plaice Pl"]=70, ["Chum St"]=70, ["Chupacabra St"]=70, ["Miriam Turner Overpass"]=70, ["Autopia Pkwy"]=70, ["Exceptionalists Way"]=70, ["La Puerta Fwy"]=120, ["New Empire Way"]=70, ["Runway1"]="--", ["Greenwich Pkwy"]=70, ["Kortz Dr"]=70, ["Banham Canyon Dr"]=70, ["Buen Vino Rd"]=70, ["Route 68"]=120, ["Zancudo Grande Valley"]=70, ["Zancudo Barranca"]=70, ["Galileo Rd"]=70, ["Mt Vinewood Dr"]=70, ["Marlowe Dr"]=70, ["Milton Rd"]=70, ["Kimble Hill Dr"]=70, ["Normandy Dr"]=70, ["Hillcrest Ave"]=70, ["Hillcrest Ridge Access Rd"]=70, ["North Sheldon Ave"]=70, ["Lake Vinewood Dr"]=70, ["Lake Vinewood Est"]=70, ["Baytree Canyon Rd"]=70, ["Peaceful St"]=70, ["North Conker Ave"]=70, ["Wild Oats Dr"]=70, ["Whispymound Dr"]=70, ["Didion Dr"]=70, ["Cox Way"]=70, ["Picture Perfect Drive"]=70, ["South Mo Milton Dr"]=70, ["Cockingend Dr"]=70, ["Mad Wayne Thunder Dr"]=70, ["Hangman Ave"]=70, ["Dunstable Ln"]=70, ["Dunstable Dr"]=70, ["Greenwich Way"]=70, ["Greenwich Pl"]=70, ["Hardy Way"]=70, ["Richman St"]=70, ["Ace Jones Dr"]=70, ["Los Santos Freeway"]=120, ["Senora Rd"]=70, ["Nowhere Rd"]=35, ["Smoke Tree Rd"]=70, ["Cholla Rd"]=70, ["Cat-Claw Ave"]=70, ["Senora Way"]=70, ["Palomino Fwy"]=120, ["Shank St"]=70, ["Macdonald St"]=70, ["Route 68 Approach"]=120, ["Vinewood Park Dr"]=70, ["Vinewood Blvd"]=70, ["Mirror Park Blvd"]=70, ["Glory Way"]=70, ["Bridge St"]=70, ["West Mirror Drive"]=70, ["Nikola Ave"]=70, ["East Mirror Dr"]=70, ["Nikola Pl"]=35, ["Mirror Pl"]=70, ["El Rancho Blvd"]=70, ["Olympic Fwy"]=120, ["Fudge Ln"]=70, ["Amarillo Vista"]=70, ["Labor Pl"]=70, ["El Burro Blvd"]=70, ["Sustancia Rd"]=55, ["South Shambles St"]=70, ["Hanger Way"]=70, ["Orchardville Ave"]=70, ["Popular St"]=70, ["Buccaneer Way"]=55, ["Abattoir Ave"]=70, ["Voodoo Place"]=40, ["Mutiny Rd"]=70, ["South Arsenal St"]=70, ["Forum Dr"]=70, ["Morningwood Blvd"]=70, ["Dorset Dr"]=70, ["Caesars Place"]=70, ["Spanish Ave"]=70, ["Portola Dr"]=70, ["Edwood Way"]=70, ["San Vitus Blvd"]=70, ["Eclipse Blvd"]=70, ["Gentry Lane"]=40, ["Las Lagunas Blvd"]=70, ["Power St"]=70, ["Mt Haan Rd"]=70, ["Elgin Ave"]=70, ["Hawick Ave"]=70, ["Meteor St"]=70, ["Alta Pl"]=70, ["Occupation Ave"]=70, ["Carcer Way"]=70, ["Eastbourne Way"]=70, ["Rockford Dr"]=70, ["Abe Milton Pkwy"]=70, ["Laguna Pl"]=70, ["Sinners Passage"]=70, ["Atlee St"]=70, ["Sinner St"]=70, ["Supply St"]=70, ["Amarillo Way"]=70, ["Tower Way"]=70, ["Decker St"]=70, ["Tackle St"]=70, ["Low Power St"]=70, ["Clinton Ave"]=70, ["Fenwell Pl"]=70, ["Utopia Gardens"]=70, ["Cavalry Blvd"]=70, ["South Boulevard Del Perro"]=70, ["Americano Way"]=70, ["Sam Austin Dr"]=70, ["East Galileo Ave"]=70, ["Galileo Park"]=70, ["West Galileo Ave"]=70, ["Tongva Dr"]=70, ["Zancudo Rd"]=70, ["Movie Star Way"]=70, ["Heritage Way"]=70, ["Perth St"]=70, ["Chianski Passage"]=70, ["Lolita Ave"]=70, ["Meringue Ln"]=70, ["Strangeways Dr"]=70}
local street, updateStreet, speedlimit = nil, 0, 0
local playerPed, playerCoords, rank, name, phone

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
    ESX.PlayerData = ESX.GetPlayerData()
    rank = ESX.PlayerData.job.grade_label
    isPlayerWhitelisted = refreshPlayerWhitelisted()

    ESX.TriggerServerCallback('mdt_outlawalert:getCharData', function(chardata)
        firstname = chardata.firstname
        lastname = chardata.lastname
        phone = chardata.phone_number
    end)

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData = ESX.GetPlayerData()
    ESX.PlayerData.job = job
    rank = ESX.PlayerData.job.grade_label
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

function BlacklistedWeapon(playerPed)
    for i = 1, #Config.WeaponBlacklist do
        local weaponHash = GetHashKey(Config.WeaponBlacklist[i])
        if GetSelectedPedWeapon(playerPed) == weaponHash then
            return true -- Is a blacklisted weapon
        end
    end
    return false -- Is not a blacklisted weapon
end

RegisterNetEvent('mdt_outlawalert:SendAlert')
AddEventHandler('mdt_outlawalert:SendAlert', function(data)
    Citizen.Wait(1500)
    local callstreet = GetStreetNameFromHashKey(GetStreetNameAtCoord(data.loc.x, data.loc.y, data.loc.z))
    local callzone = GetLabelText(GetNameOfZone(data.loc.x, data.loc.y, data.loc.z))
    data.loc = ('%s %s'):format(callstreet, callzone)
    SendNUIMessage({action = 'display', info = data, length = data.length})
    PlaySound(-1, 'Event_Start_Text', 'GTAO_FM_Events_Soundset', 0, 0, 1)

    local alpha = 255
    local entId = NetworkGetEntityFromNetworkId(data.netid)
    local blipOne = AddBlipForEntity(entId)

    SetBlipSprite(blipOne,161)
    SetBlipHighDetail(blipOne, true)
    SetBlipScale(blipOne, 1.0)
    SetBlipColour(blipOne, 28)
    SetBlipAlpha(blipOne, alpha)
    SetBlipAsShortRange(blipOne, false)
    SetBlipCategory(blipOne, 2)

    Citizen.Wait(data.length)
    RemoveBlip(blipOne)
    local blipTwo = AddBlipForCoord(GetEntityCoords(entId))

    SetBlipSprite(blipTwo,161)
    SetBlipHighDetail(blipTwo, true)
    SetBlipScale(blipTwo, 1.0)
    SetBlipColour(blipTwo, 28)
    SetBlipAlpha(blipTwo, alpha)
    SetBlipAsShortRange(blipTwo, true)
    SetBlipCategory(blipTwo, 2)

    while alpha ~= 0 do
        Citizen.Wait((data.length / 1000) * 5)
        alpha = alpha - 1
        SetBlipAlpha(blipTwo, alpha)

        if alpha == 0 then
            RemoveBlip(blipTwo)
            return
        end
    end
end)

function getSpeed()
    return speedlimit
end
function getStreet()
    return street
end

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs({'police'}) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

function zoneChance(type, playerCoords, street)    
    local zoneMod, zone, zoneid, sendit = 0, GetLabelText(GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)), GetZoneAtCoords(playerCoords.x, playerCoords.y, playerCoords.z), false
    if Config.DebugChance then print('Sending it') return true else

        if zoneMod == 0 then zoneMod = 3 end
        if type == speeding then zoneMod = zoneMod * 2 end
        local zoneScum = GetZoneScumminess(zoneid)
        if zoneScum == 1 then zoneMod = zoneMod * 5
        elseif zoneScum == 2 then zoneMod = zoneMod * 4
        elseif zoneScum == 3 then zoneMod = zoneMod * 3
        elseif zoneScum == 4 then zoneMod = zoneMod * 2
        elseif zoneScum == 5 then zoneMod = zoneMod * 1
        end
        if (street == 'Great Ocean Hwy') then zoneMod = zoneMod / 2
        elseif (street == 'Palomino Fwy') then zoneMod = zoneMod / 2
        elseif (street == 'Del Perro Fwy') then zoneMod = zoneMod / 2
        elseif (street == 'Elysian Fields Fwy') then zoneMod = zoneMod / 2
        elseif (street == 'La Puerta Fwy') then zoneMod = zoneMod / 2
        elseif (street == 'Olympic Fwy') then zoneMod = zoneMod / 2
        elseif (street == 'Senora Fwy') then zoneMod = zoneMod / 2
        elseif (street == 'Los Santos Freeway') then zoneMod = zoneMod / 2 end
        zoneMod = (math.floor(zoneMod + 0.5))
        local hour = GetClockHours()
        if hour >= 21 or hour <= 4 then
            zoneMod = zoneMod * 1.6
            zoneMod = math.ceil(zoneMod+0.5)
        end

        local sum = math.random(1, zoneMod)
        if sum > 1 then
            if Config.Debug then print('No report sent') end
            sendit = false
        else
            if Config.Debug then print(zoneMod.. ' ' ..zone.. ' ' ..type) end
            sendit = true
        end
        return sendit
    end
end


Citizen.CreateThread(function()
    local sleep = 100
	while true do
        Citizen.Wait(0)
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        if (not isPlayerWhitelisted or Config.Debug) then
            for k, v in pairs(Config.Timer) do
                if v > 0 then Config.Timer[k] = v - 1 end
            end
            if Config.Timer['shooting'] == 0 and IsPedArmed(playerPed, 4) then sleep = 20 else sleep = 100 end
            if updateStreet == 0 then street = GetStreetNameFromHashKey(GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)) end
            if updateStreet == 3 then lastStreet = street updateStreet = 0 else updateStreet = updateStreet + 1 end

            if not IsPedInAnyVehicle(playerPed, 1) then
                if Config.Timer['shooting'] == 0 and IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) and not BlacklistedWeapon(playerPed) then
                    if zoneChance('shooting', playerCoords, street) then
                        local netid = NetworkGetNetworkIdFromEntity(playerPed)
                        local data = {['code'] = '10-71', ['name'] = 'Discharge of a firearm', ['style'] = 'police', ['desc'] = nil, ['netid'] = netid, ['loc'] = playerCoords, ['length'] = '8000', ['caller'] = 'Local'}
                        TriggerServerEvent('mdt:newCall', data.name, data.caller, vector3(data.loc.x, data.loc.y, data.loc.z), data)
                        Config.Timer['shooting'] = Config.Shooting.Success
                    else
                        Config.Timer['shooting'] = Config.Shooting.Fail
                    end
                    Citizen.Wait(0)
                end
            elseif IsPedInAnyVehicle(playerPed, 1) and not IsPedInAnyHeli(playerPed) and not IsPedInAnyPlane(playerPed) and not IsPedInAnyTrain(playerPed) and not IsPedInAnyBoat(playerPed) then
                local vehicle = GetVehiclePedIsUsing(playerPed)
                local vehicleClass = GetVehicleClass(vehicle)
                if vehicleClass == 0 then vehicleClass = 'Compact'
                elseif vehicleClass == 1 then vehicleClass = 'Sedan'
                elseif vehicleClass == 2 then vehicleClass = 'SUV'
                elseif vehicleClass == 3 then vehicleClass = 'Coupe'
                elseif vehicleClass == 4 then vehicleClass = 'Muscle car'
                elseif vehicleClass == 5 then vehicleClass = 'Sports Classic'
                elseif vehicleClass == 6 then vehicleClass = 'Sports car'
                elseif vehicleClass == 7 then vehicleClass = 'Super car'
                elseif vehicleClass == 8 then vehicleClass = 'Motorcycle'
                elseif vehicleClass == 9 then vehicleClass = 'Off-road'
                elseif vehicleClass == 10 then vehicleClass = 'Industrial Vehicle'
                elseif vehicleClass == 11 then vehicleClass = 'Utility Vehicle'
                elseif vehicleClass == 12 then vehicleClass = 'Van'
                elseif vehicleClass == 13 then vehicleClass = 'dnr' -- bicycle
                elseif vehicleClass == 17 then vehicleClass = 'Service Vehicle'
                elseif vehicleClass == 18 then vehicleClass = 'dnr' -- emergency
                elseif vehicleClass == 19 then vehicleClass = 'Military Vehicle'
                elseif vehicleClass == 20 then vehicleClass = 'Truck'
                end
                if vehicleClass ~= 'dnr' then
                    local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
                    local vehicleColour1, vehicleColour2 = GetVehicleColours(vehicle)

                    if vehicleColour1 then
                        if colours[tostring(vehicleColour2)] and colours[tostring(vehicleColour1)] then
                            vehicleColour = colours[tostring(vehicleColour2)] .. " on " .. colours[tostring(vehicleColour1)]
                        elseif colours[tostring(vehicleColour1)] then
                            vehicleColour = colours[tostring(vehicleColour1)]
                        elseif colours[tostring(vehicleColour2)] then
                            vehicleColour = colours[tostring(vehicleColour2)]
                        else
                            vehicleColour = "Unknown"
                        end
                    end

                    if street ~= lastStreet then speedlimit = speedlimitValues[street] end
                    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                    vehicleLabel = GetLabelText(vehicleLabel)
                    local vehicleDoors = GetVehicleModelNumberOfSeats(GetEntityModel(vehicle))
                    if vehicleClass == 'Motorcycle' then vehicleDoors = ''
                    elseif vehicleDoors == 2 then vehicleDoors = 'Two-door'
                    elseif vehicleDoors == 3 then vehicleDoors = 'Three-door'
                    elseif vehicleDoors == 4 then vehicleDoors = 'Four-door' end


                    if Config.Timer['shooting'] == 0 then
                        if IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) and BlacklistedWeapon(playerPed) then
                            if zoneChance('shooting', playerCoords, street) then
                                local netid = NetworkGetNetworkIdFromEntity(vehicle)
                                local data = {['code'] = '10-71b', ['name'] = 'Drive-by shooting', ['style'] = 'police', ['desc'] = ('[%s] %s %s'):format(plate, vehicleDoors, vehicleClass), ['netid'] = netid, ['loc'] = playerCoords, ['length'] = '8000', ['caller'] = 'Local'}
                                TriggerServerEvent('mdt:newCall', data.name, data.caller, vector3(data.loc.x, data.loc.y, data.loc.z), data)
                                Config.Timer['shooting'] = Config.Shooting.Success
                                sleep = 100
                            else
                                Config.Timer['shooting'] = Config.Shooting.Fail
                                sleep = 100
                            end
                            Citizen.Wait(0)
                        end
                    end
                        
                    if Config.Timer['speeding'] == 0 and ((GetEntitySpeed(vehicle) * 3.6) >= (speedlimit + (math.random(40,80)))) then
                        if zoneChance('speeding', playerCoords, street) then
                            local netid = NetworkGetNetworkIdFromEntity(vehicle)
                            if IsPedInAnyVehicle(playerPed, 1) and ((GetEntitySpeed(vehicle) * 3.6) >= (speedlimit + (math.random(30,60)))) then
                                playerCoords = GetEntityCoords(playerPed)
                                local data = {['code'] = '505', ['name'] = 'Reckless driving', ['style'] = 'police', ['desc'] = ('[%s] %s %s'):format(plate, vehicleDoors, vehicleClass), ['desc2'] = ('%s%s'):format('<i class="fas fa-palette"></i>', vehicleColour), ['netid'] = netid, ['loc'] = playerCoords, ['length'] = '5000', ['caller'] = 'Local'}
                                TriggerServerEvent('mdt:newCall', data.name, data.caller, vector3(data.loc.x, data.loc.y, data.loc.z), data)
                                Config.Timer['speeding'] = Config.Speeding.Success
                            end
                        else
                            Config.Timer['speeding'] = Config.Speeding.Fail
                        end
                        Citizen.Wait(0)
                    end
                    if Config.Timer['Autotheft'] == 0 and (IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed)) then
                        local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                        ESX.TriggerServerCallback('mdt_outlawalert:isVehicleOwned', function(hasowner)
                            if not hasowner then
                                if zoneChance('Autotheft', playerCoords, street) then
                                    local netid = NetworkGetNetworkIdFromEntity(vehicle)
                                    local data = {['code'] = '503', ['name'] = 'Theft of a motor vehicle', ['style'] = 'police', ['desc'] = ('[%s] %s'):format(plate, vehicleName), ['desc2'] = ('%s%s'):format('<i class="fas fa-palette"></i>', vehicleColour), ['netid'] = netid, ['loc'] = playerCoords, ['length'] = '5000', ['caller'] = 'Local'}
                                        TriggerServerEvent('mdt:newCall', data.name, data.caller, vector3(data.loc.x, data.loc.y, data.loc.z), data)
                                    Config.Timer['Autotheft'] = Config.Autotheft.Success
                                else
                                    Config.Timer['Autotheft'] = Config.Autotheft.Fail
                                end
                            end
                        end, plate)
                        Citizen.Wait(0)
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

AddEventHandler('esx:onPlayerDeath', function(reason)
    if isPlayerWhitelisted or Config.Debug then
        local netid = NetworkGetNetworkIdFromEntity(playerPed)
        Citizen.Wait(2000)
        local data = {['code'] = '10-69', ['name'] = 'Officer is down', ['style'] = 'officer-down', ['desc'] = ('%s %s'):format(rank, lastname), ['netid'] = netid, ['loc'] = playerCoords, ['length'] = '15000', ['caller'] = name}
        TriggerServerEvent('mdt:newCall', data.name, data.caller, vector3(data.loc.x, data.loc.y, data.loc.z), data)
        Citizen.Wait(15000)
    end
end)

Citizen.CreateThread(function()
	local mdt = GetResourceState('mdt')
	if GetResourceState('mdt') == 'started' or GetResourceState('mdt') == 'starting' then
		RegisterCommand('911', function(playerId, args, rawCommand)
			args = table.concat(args, ' ')
			if Config.PhoneNumber then caller = phone else caller = ('%s %s'):format(firstname, lastname) end
			TriggerServerEvent('mdt:newCall', args, caller, vector3(playerCoords.x, playerCoords.y, playerCoords.z))
		end, false)

		RegisterCommand('911a', function(playerId, args, rawCommand)
			args = table.concat(args, ' ')
			TriggerServerEvent('mdt:newCall', args, "Unknown", vector3(playerCoords.x, playerCoords.y, playerCoords.z))
		end, false)
	else
		print("Resource 'mdt' is "..mdt)
	end
end)
