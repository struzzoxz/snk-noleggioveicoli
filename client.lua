ESX = exports.es_extended:getSharedObject()
local display = false
local MarkerPosition = {
    {x = -244.5425, y = -992.2106, z = 29.287834}, -- position for change the marker
}

RegisterNetEvent('SnkNoleggioVeicoli:spawnaveicolo')
AddEventHandler('SnkNoleggioVeicoli:spawnaveicolo', function(data)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)



    ESX.Game.SpawnVehicle(data, coords.xyz, heading, function(entity)       
        TaskWarpPedIntoVehicle(ped, entity, -1)
        SetVehicleNumberPlateText(entity, 'NOLEGGIO')
    end)
    TriggerEvent('SnkNoleggioVeicoli:setdisplay', false)
    TriggerServerEvent('SnkNoleggioVeicoli:rimuoviItem', 'bank', 10000) -- the price for the cars ( the prices are the same for every car)
    TriggerEvent('esx:showNotification', 'Hai noleggiato il veicolo correttamente')

end)



RegisterNUICallback("main", function(data)
    TriggerEvent("SnkNoleggioVeicoli:spawnaveicolo", data.data)

end)


RegisterNetEvent('SnkNoleggioVeicoli:setdisplay')
AddEventHandler('SnkNoleggioVeicoli:setdisplay', function(bool) 
    display = bool     
    SetNuiFocus(bool, bool)     
    SendNUIMessage({ type = "ui",  status = bool, })
end )


RegisterNUICallback('exit', function(data)
    TriggerEvent('SnkNoleggioVeicoli:setdisplay', false)
 end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for k, v in pairs(MarkerPosition) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'bici_'..v.x,
            pos = vector3(v.x, v.y, v.z),
            scale = vector3(0.8, 0.8, 0.8),
            msg = 'NOLEGGIO VEICOLI',
            texture = 'garage',
            type = -1,
            color = {r = 255, g = 255, b = 255},
            action = function()
                CreateThread(function()
                    TriggerEvent('SnkNoleggioVeicoli:setdisplay', true)
                    while display do 
                        DisableControlAction(0,1, display)
                        DisableControlAction(0,142, display)
                        DisableControlAction(0,18, display)
                        DisableControlAction(0,322, display)
                        DisableControlAction(0,2, display)
                        DisableControlAction(0,106, display)
                        Wait(0)
                    end
                end)
            end
        })
    end
end)



Citizen.CreateThread(function()
    for k, v in pairs(MarkerPosition) do
        local Blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(Blip, 376)
        SetBlipDisplay(Blip, 4)
        SetBlipScale(Blip, 0.5)
        SetBlipColour(Blip, 37)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Noleggio Veicoli")
        EndTextCommandSetBlipName(Blip)
    end
end)
