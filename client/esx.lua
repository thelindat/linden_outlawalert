ESX = nil
notLoaded, currentStreetName, intersectStreetName, lastStreet, speedlimit, nearbyPeds, isPlayerWhitelisted, playerPed, playerCoords, job, rank, firstname, lastname, phone = true
playerIsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
	GetPlayerInfo()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
	ESX.PlayerData = playerData
	GetPlayerInfo()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData = ESX.GetPlayerData()
    job = ESX.PlayerData.job.name
    rank = ESX.PlayerData.job.grade_label
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

function GetPlayerInfo()
	ESX.TriggerServerCallback('linden_outlawalert:getCharData', function(chardata)
        firstname = chardata.firstname
        lastname = chardata.lastname
        phone = chardata.phone_number
        if firstname == nil then Citizen.Wait(1000) end
    end)
	job = ESX.PlayerData.job.name
    rank = ESX.PlayerData.job.grade_label
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end

AddEventHandler('esx:onPlayerDeath', function(data)
	playerIsDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(data)
	playerIsDead = false
end)

AddEventHandler('playerSpawned', function(data)
	playerIsDead = false
end)
