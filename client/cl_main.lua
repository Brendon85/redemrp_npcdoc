local healing = false

local locations = {
    {x = 1459.05,y =   306.05,z = 90.54, h = 177.25},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for k, v in pairs(locations) do
            if not DoesEntityExist(samueljackson) then
                RequestModel(GetHashKey("CS_EagleFlies"))

                while not HasModelLoaded(GetHashKey("CS_EagleFlies")) do
                    Wait(100)
                end

                samueljackson = CreatePed("CS_EagleFlies", v.x, v.y, v.z, v.h, false, true)
                SetPedRandomComponentVariation(samueljackson, 0)
                SetBlockingOfNonTemporaryEvents(samueljackson, true)
                SetEntityInvincible(samueljackson, true)
                SetPedCanBeTargettedByPlayer(samueljackson, PlayerPedId(), false)
                FreezeEntityPosition(samueljackson, true)
            end
        end
        for i = 1, #locations do

            if IsPlayerNearCoords(locations[i].x, locations[i].y, locations[i].z, 1.5) then
                if not healing then
                    DisplayNPCText("Sacagawea", 0.40, 0.40, 0.5, 0.85, 164, 0, 20, 1)
                    DisplayNPCText("Tekan [C] Untuk di revive oleh suku indian?", 0.35, 0.35, 0.5, 0.88, 255, 255, 255, 0)
                    if IsControlJustReleased(0, 0x9959A6F0) then
                        if IsEntityDead(PlayerPedId()) then
                            TriggerServerEvent("redemrp_npc:doctor")
                            TriggerServerEvent('ambulancejob:CobrarRevivir')
                            --TriggerServerEvent("redemrp_npc:doctor2")
                            --TriggerEvent("redemrp_respawn:gotReviveCustom")
                        end
                    end
                end
            end
        end
    end
end)


function IsPlayerNearCoords(x, y, z, radius)
    local playerx, playery, playerz = table.unpack(GetEntityCoords(PlayerPedId(), 0))
    local distance = GetDistanceBetweenCoords(playerx, playery, playerz, x, y, z, true)

    if distance < radius then
        return true
    end
end

function DisplayNPCText(text, s1, s2, x, y, r, g, b, font)
    SetTextScale(s1, s2)
    SetTextColor(r, g, b, 255)--r,g,b,a
    SetTextCentre(true)--true,false
    SetTextDropshadow(1, 0, 0, 0, 200)--distance,r,g,b,a
    SetTextFontForCurrentCommand(font)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end
