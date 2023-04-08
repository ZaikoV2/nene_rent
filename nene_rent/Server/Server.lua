local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nene_spawner:payCar')
AddEventHandler('nene_spawner:payCar', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    
    player.Functions.RemoveMoney('cash', Config.Price, 'Pago de alquiler de vehiculo')
end)

RegisterNetEvent('nene_spawner:getMoney')
AddEventHandler('nene_spawner:getMoney', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    player.Functions.AddMoney('cash', Config.Price-100, 'Alquiler de vehiculo')
end)