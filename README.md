<p align="center"><img src="https://i.imgur.com/Ome5KDF.png"/><br>
<hr>



# Instructions
Download either the latest release or the latest repo. Just drag and drop.  
Ensure you set Config.Debug to false so cops don't trigger a bunch of warnings, and to disable debug information printing into the console.  
If you want 100% report chance then leave Config.DebugChance, though I recommend disabling it.  
[Share any feedback on the thread](https://forum.cfx.re/t/esx-outlawalert-wildfire-alerts-and-hypaste-mdt-integration/)

### Optional
<a href='https://github.com/thelindat/mdt'>Download my Hypaste mdt fork</a> or modify the original release (read below).  

<a href='https://github.com/distritic/mdt/'>Hypaste mdt original git</a>  
Open mdt/sv_mdt.lua and locate RegisterServerEvent("mdt:newCall"), replace with:  
  ```
RegisterServerEvent("mdt:newCall")
AddEventHandler("mdt:newCall", function(details, caller, coords, sendNotification)
  call_index = call_index + 1
  local xPlayers = ESX.GetPlayers()
  for i= 1, #xPlayers do
  	local source = xPlayers[i]
  	local xPlayer = ESX.GetPlayerFromId(source)
  	if xPlayer.job.name == 'police' then
		if sendNotification ~= false then
			TriggerClientEvent("InteractSound_CL:PlayOnOne", source, 'demo', 1.0)
			TriggerClientEvent("mythic_notify:client:SendAlert", source, {type="inform", text="You have received a new call.", 5000, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' }})
		end
  		TriggerClientEvent("mdt:newCall", source, details, caller, coords, call_index)
  	end
  end
end)
```  

## Custom alerts  
Check the ![https://github.com/thelindat/linden_outlawalert/wiki](wiki) for existing examples.  
For example, if we were to edit one of the jewelry heist scripts, you can replace the default method for alerting the police with the following
```
local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Vangelico Jewelry Store'}
local dispatchData = {dispatchData = data, caller = 'Alarm', coords = vector3(-633.9, -241.7, 38.1)}
TriggerEvent('wf-alerts:svNotify', dispatchData)
```
You can define infoM2 and info2 for an additional line of text. If you are triggering the event from a client make sure you use TriggerServerEvent.

You can use the below code to use the report chance export. Setting the last number higher will reduce the likelihood of a notification being sent.
```
if exports['linden_outlawalert']:zoneChance('Custom', 2) then
	do stuff
end
```


### gcphone 911 support
Locate `function notifyAlertSMS` in `esxaddonsgcphone-s.lua`. Below `local messText = alert.message` add
```
    if number == 'police' or number == 'ambulance' then
      TriggerEvent('wf-alerts:svNotify911', messText, alert.numero, GetEntityCoords(GetPlayerPed(alert.source)))
    end
```


# Credits:

  Jager_bom for esx_outlawalert  
  Stroudy for WF_Alerts https://forum.cfx.re/t/dev-release-standalone-wf-alerts/1029331  
  distritic for Hypaste RP's MDT https://forum.cfx.re/t/esx-hypaste-rps-mobile-data-terminal-reports-warrants-calls-searches-more/1701472/1 
