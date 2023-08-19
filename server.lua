ESX = exports.es_extended:getSharedObject()

RegisterServerEvent('SnkNoleggioVeicoli:rimuoviItem')
AddEventHandler('SnkNoleggioVeicoli:rimuoviItem',  function(account, money)
 local xPlayer = ESX.GetPlayerFromId(source) 
    xPlayer.removeAccountMoney(account, money)

end)
