
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-target:server:givemoneytoanuotherplayer', function(money, playerid)
    local src = source
	local id = playerid
	local amount = money
	if id and amount then
		local xPlayer = QBCore.Functions.GetPlayer(src)
		local xReciv = QBCore.Functions.GetPlayer(id)
		if xReciv and xPlayer then
			if src == id then
				TriggerClientEvent('QBCore:Notify', src, 'Sorry you can not give yourself', "error")
			else
                if xPlayer.Functions.RemoveMoney('cash', amount) then
                    if xReciv.Functions.AddMoney('cash', amount) then
                        TriggerClientEvent('QBCore:Notify', src, 'your give him'..' ' .. tostring(amount) .. '$.', "success")
                        TriggerClientEvent('QBCore:Notify', id, 'your received'..' ' .. tostring(amount) .. '$', "success")
                        TriggerClientEvent("inventory:client:Giveitemanim", src)
                        TriggerClientEvent("inventory:client:Reciveitemanim", id)
                    else
                        TriggerClientEvent('QBCore:Notify', src, 'there is a problem ', "error")
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You don't have enough money", "error")
                end
			end
		else
			TriggerClientEvent('QBCore:Notify', src, 'Verify the player id', "error")
		end
	end
end)

QBCore.Functions.CreateCallback("qb-target:GetPlayerInfo", function(source, cb, playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    cb(Player.PlayerData.metadata["ishandcuffed"], Player.PlayerData.metadata["isdead"] or Player.PlayerData.metadata["inlaststand"], Player.PlayerData.metadata["isdead"], Player.PlayerData.citizenid)
end)


