# mdt_calls (for use with Hypaste MDT)
<img src="https://i.imgur.com/kxdCVOB.png"></img>
### Instructions
  Download and setup Hypaste RP's MDT (link in credits)  
  Open mdt/sv_mdt.lua and locate RegisterServerEvent("mdt:newCall"), replace with:  
  ```
RegisterServerEvent("mdt:newCall")
AddEventHandler("mdt:newCall", function(details, caller, coords, data)
  call_index = call_index + 1
  local xPlayers = ESX.GetPlayers()
  for i= 1, #xPlayers do
  	local source = xPlayers[i]
  	local xPlayer = ESX.GetPlayerFromId(source)
  	if xPlayer.job.name == 'police' then
  		TriggerClientEvent("InteractSound_CL:PlayOnOne", source, 'demo', 1.0)
  		if not data then
  			TriggerClientEvent("mythic_notify:client:SendAlert", source, {type="inform", text="You have received a new call.", 5000, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' }})
  		end
  		if data and data.desc then TriggerClientEvent("mdt:newCall", source, details..' '..data.desc, caller, coords, call_index) else TriggerClientEvent("mdt:newCall", source, details, caller, coords, call_index) end
  	end
  end
end)
```  
### Send a custom alert
```
local data = {['code'] = '211', ['name'] = 'Robbery', ['style'] = 'police', ['desc'] = 'Vangelico Jewelry Store', ['netid'] = nil, ['loc'] = coords, ['length'] = '5000', ['caller'] = 'Alarm'}
TriggerEvent('mdt:newCall', data.name, data.caller, vector3(data.loc.x, data.loc.y, data.loc.z), data)
```


# Credits:

  Jager_bom for his esx_outlawalert  
  Stroudy for WF_Alerts https://forum.cfx.re/t/dev-release-standalone-wf-alerts/1029331  
  danny3 for outlawalert with integrated WF_Alerts https://github.com/Stunn9/danny3_outlawalert/tree/master/danny3_outlawalert  
  distritic for Hypaste RP's MDT https://forum.cfx.re/t/esx-hypaste-rps-mobile-data-terminal-reports-warrants-calls-searches-more/1701472/1 
