data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
		data = call
end)


RegisterServerEvent("ambulancejob:CobrarRevivir")
AddEventHandler("ambulancejob:CobrarRevivir", function(price)
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
       local identifier = user.getIdentifier()
       local Character = user.getSessionVar("charid") 
	   local money = user.getMoney()
       local price = Config.costerevivir
       if money >= price then
          --TriggerClientEvent("redemrp_respawn:gotReviveCustom", _source, money, price)
          TriggerClientEvent('redem_roleplay:NotifyLeft', "~t6~Anda telah disembuhkan", "Biaya 50$.", "generic_textures", "tick", 8000)
          user.removeMoney(50)
       else
          TriggerClientEvent('redem_roleplay:NotifyLeft', "~t6~Anda tidak cukup uang", "Biaya 50$.", "generic_textures", "tick", 8000)
       end
    end)
 end)

RegisterServerEvent("redemrp_npc:doctor")
AddEventHandler("redemrp_npc:doctor", function()
    local _source = source
    local doctor = 0

    local players = GetPlayers()
       for i,k in pairs(players) do
            TriggerEvent('redemrp:getPlayerFromId', tonumber(k), function(user)

                if user.getJob() == "doctor" then
                    doctor = doctor + 1
                end

            end)
        end
        if doctor >= Config.Doctor then
            TriggerClientEvent("redemrp_respawn:gotReviveCustom", _source, doctor)
            --TriggerClientEvent('redem_roleplay:NotifyLeft', "Anda bisa di sembuhkan", "Biaya 50$", "generic_textures", "tick", 8000)

        else
			TriggerClientEvent('redem_roleplay:NotifyLeft', "~e~ada dokter didesa, anda tidak bisa di sembuhkan", "Maaf", "generic_textures", "tick", 8000)
        end
    --end
end)

--[[
RegisterServerEvent("redemrp_npc:doctor2")
AddEventHandler("redemrp_npc:doctor2", function()
    local _source = source
    local doctor = 0

    local players = GetPlayers()
       for i,k in pairs(players) do
            TriggerEvent('redemrp:getPlayerFromId', tonumber(k), function(user)

                if user.getJob() == "doctor" then
                    doctor = doctor + 1
                end

            end)
        end
        if doctor >= Config.Doctor then
            TriggerClientEvent("redemrp_respawn:gotReviveCustom", _source, doctor)
            --TriggerClientEvent('redem_roleplay:NotifyLeft', "Anda bisa di sembuhkan", "Biaya 50$", "generic_textures", "tick", 8000)

        else
			TriggerClientEvent('redem_roleplay:NotifyLeft', "~e~ada dokter didesa, anda tidak bisa di sembuhkan", "Maaf", "generic_textures", "tick", 8000)
        end
    --end

    --]]