local QBCore = exports['qb-core']:GetCoreObject()

local rentcar = false
local rentedplate = nil

CreateThread(function()
    while true do
        local wait = 1200
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        local currentCoords = vector3(150.68, -1036.44, 29.34)
        local currentCoords2 = vector3(159.6, -1035.71, 28.78)

        local distance = Vdist2(currentCoords, pedCoords)
        local distance2 = Vdist2(currentCoords2, pedCoords)

        if distance < 15 then
            wait = 4
            DrawMarker(27, 150.68, -1036.44, 29.34-0.97, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 10, 10, 10, 150, false, true, false, false, false, false, false)
            if distance < 2.5 then
                exports['qb-core']:DrawText(Lang:t('text.get_veh'), 'left')
                if IsControlJustPressed(0, 38) then
                    if QBCore.Functions.GetPlayerData().money.cash >= Config.Price then
                        QBCore.Functions.Notify(Lang:t("success.spawned"), "success")
                        QBCore.Functions.SpawnVehicle('t20', function(veh)
                            TaskWarpPedIntoVehicle(ped, veh, -1)
                            SetVehicleNumberPlateText(veh, Config.Plate)
                            rentcar = true
                            rentedplate = Config.Plate
                        end, vector4(159.6, -1035.72, 28.78, 338.94), false)
                        TriggerServerEvent('nene_spawner:payCar')
                    else
                        QBCore.Functions.Notify(Lang:t("error.no_enough_money"), "error")
                    end
                end
            else
                exports['qb-core']:HideText()
            end
        end

        if distance2 < 50 and rentcar == true then
            wait = 4
            DrawMarker(27, 159.88, -1035.4, 29.2-0.97, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 10, 10, 10, 150, false, true, false, false, false, false, false)
            if distance2 < 5 then
                exports['qb-core']:DrawText(Lang:t('text.press_save'))
                
                if IsControlJustPressed(0, 38) then
                    if rentcar == true then
                        QBCore.Functions.Notify(Lang:t("success.get_money"), "success")
                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                        TriggerServerEvent('nene_spawner:getMoney')
                        rentcar = false
                    else
                        QBCore.Functions.Notify(Lang:t("error.no_rent"), "error")
                    end
                end
            else
                exports['qb-core']:HideText()
            end
        end

        Wait(wait)
    end
end)