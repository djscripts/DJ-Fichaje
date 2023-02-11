ESX	= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('fichar', function(source, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if args[1] == "entrada" then 
        if xPlayer.getJob().name == "police" then
          sendToDiscord(Config.WebPolice, Config.ColorPolice, Config.Entrada, ''..xPlayer.getName()..'', 'Hemos recibido un nuevo fichaje de entrada\n\n Nombre: '..xPlayer.getName().. "\nRango: " .. xPlayer.getJob().grade_label .. " (" .. xPlayer.getJob().grade .. ")")
          xPlayer.showNotification("Has fichado tu ~g~entrada ~w~de servicio")
        elseif xPlayer.getJob().name == "ambulance" then
          sendToDiscord(Config.WebAmbulance, Config.ColorAmbulance, Config.Salida, ''..xPlayer.getName()..'', 'Hemos recibido un nuevo fichaje de entrada\n\n Nombre: '..xPlayer.getName().. "\nRango: " .. xPlayer.getJob().grade_label .. " (" .. xPlayer.getJob().grade .. ")")
          xPlayer.showNotification("Has fichado tu ~r~entrada ~w~de servicio")
        else 
          xPlayer.showNotification("Tu trabajo ~r~no ~w~posee sistema de fichajes")
        end
    elseif args[1] == "salida" then 
        if xPlayer.getJob().name == "police" then
          sendToDiscord(Config.WebPolice, Config.ColorPolice, Config.Salida, ''..xPlayer.getName()..'', 'Hemos recibido un nuevo fichaje de salida\n\n Nombre: '..xPlayer.getName().. "\nRango: " .. xPlayer.getJob().grade_label .. " (" .. xPlayer.getJob().grade .. ")")
          xPlayer.showNotification("Has fichado tu ~r~salida ~w~de servicio")
        elseif xPlayer.getJob().name == "ambulance" then
          sendToDiscord(Config.WebAmbulance, Config.ColorAmbulance, Config.Salida, ''..xPlayer.getName()..'', 'Hemos recibido un nuevo fichaje de salida\n\n Nombre: '..xPlayer.getName().. "\nRango: " .. xPlayer.getJob().grade_label .. " (" .. xPlayer.getJob().grade .. ")")
          xPlayer.showNotification("Has fichado tu ~r~salida ~w~de servicio")
        else 
          xPlayer.showNotification("Tu trabajo ~r~no ~w~posee sistema de fichajes")
        end
    else
        xPlayer.showNotification('Introduce un valor ~g~válido')
    end
end)

function sendToDiscord(weebhook, color, username, title, msg)
    local discord = weebhook
    if discord~=nil then
        PerformHttpRequest(discord, function(a,b,c)end, "POST", json.encode({username = username , embeds={{title=title,description=msg,color=color,}}}), {["Content-Type"]="application/json"})
    end
end