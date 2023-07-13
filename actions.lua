
local QBCore = exports['qb-core']:GetCoreObject()

local hostageAllowedWeapons = {
    "weapon_pistol",
    "weapon_combatpistol",
    "weapon_pistol50",
    "weapon_snspistol",
    "weapon_vintagepistol",
    "vweapon_heavypistol",
    "weapon_revolver",
    "weapon_ceramicpistol",
    "weapon_navyrevolver",
    "weapon_marksmanpistol",
    "weapon_snspistol_mk2",
    "weapon_pistol_mk2",
    "weapon_dp9",
    "weapon_glock",
    "weapon_browning",
    "weapon_machinepistol",
}



if Config.Debug then Load('debug') end
RegisterNetEvent('qb-target:givecash')
AddEventHandler('qb-target:givecash', function(playerid)
	
	local keyboard = exports['qb-keyboard']:KeyboardInput({
		header = "Give Cash", 
		rows = {
			{
				id = 0, 
				txt = "Enter the required amount, Current Cash: "..QBCore.Functions.GetPlayerData().money.cash.. "$"
			},
		}
	})
	if keyboard ~= nil then
		if keyboard[1].input == nil then QBCore.Functions.Notify("error", "error", 3500) return end
		if tonumber(keyboard[1].input) > 0 then 
			amount = tonumber(keyboard[1].input)
			TriggerServerEvent('qb-target:server:givemoneytoanuotherplayer', amount, playerid)

		else
			QBCore.Functions.Notify("The number is greater than 0", "error", 3500)
		end
	end
end)

RegisterNetEvent("inventory:client:Giveitemanim")
AddEventHandler("inventory:client:Giveitemanim", function()
	LoadAnimDict("mp_common")
	TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 3.0, 3.0, -1, 0, 0, false, false, false)
end)

RegisterNetEvent("inventory:client:Reciveitemanim")
AddEventHandler("inventory:client:Reciveitemanim", function()
	Citizen.Wait(600)
	LoadAnimDict("mp_common")
	TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake2_a", 3.0, 3.0, -1, 0, 0, false, false, false)
end)

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

CreateThread(function()
    exports['qb-target']:AddGlobalPlayer({
        options = {
            ["Police"] = {
                icon = 'fas fa-fist-raised',
                label = 'Police Actions',
                action = function(Enty)
                    local playerid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty))
                    local hashandcuff = false
                    for k, item in pairs(QBCore.Functions.GetPlayerData().items) do 
                        if item.name == "handcuffs" then
                            hashandcuff = true
                            break
                        end
                    end
                    QBCore.Functions.TriggerCallback('qb-target:GetPlayerInfo', function(PlayerIsCuffed, isDead, isVeryDead, PlayerCitizenId)
                        local playermenu = { 
                            {
                                id = 1,
                                header = "Police Actions",
                                isMenuHeader = true,
                                icon = "fas fa-circle",
                                -- txt = "التحكم بإنذار السجن",
                            },
                            {
                                id = 2,
                                header = "Jail",
                                txt = "Send him To prison ",
                                icon = "fas fa-user",
                                params = {
                                    event = "police:client:JailPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "Send him To prison ",
                                }
                            },
                            {
                                id = 3,
                                header = "Bail",
                                txt = "Give him a fine",
                                icon = "fas fa-file-invoice-dollar",
                                params = {
                                    event = "police:client:BillPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "Give him a fine",
                                }
                            },
                            {
                                id = 4,
                                header = "Search",
                                txt = "Check his inventory",
                                icon = "fas fa-search",
                                params = {
                                    event = "police:client:SearchPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                        }
                        if PlayerIsCuffed then
                            playermenu[#playermenu+1] = { 
                                header = "Take Off Mask",
                                txt = "Remove Mask",
                                icon = "fas fa-mask",
                                params = {
                                    event = "police:client:takeoffmask",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
    
    
                        if hashandcuff  then
                            playermenu[#playermenu+1] = { 
                                header = "Use Cuffs",
                                txt = "Cuff/Uncuff the citizen",
                                icon = "fas fa-handcuffs",
                                params = {
                                    event = "police:client:CuffPlayerSoft",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        local vehicle = QBCore.Functions.GetClosestVehicle()
                        if vehicle ~= 0 and vehicle then
                            local ped = PlayerPedId()
                            local pos = GetEntityCoords(ped)
                            local vehpos = GetEntityCoords(vehicle)
                            if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) and PlayerIsCuffed or isDead then
                                playermenu[#playermenu+1] = { 
                                    header = "Put In Vehicle",
                                    txt = "Put it inside the vehicle",
                                    icon = "fas fa-arrow-right-from-bracket",
                                    params = {
                                        event = "qb-target:client:PutPlayerInVehicle",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
                                playermenu[#playermenu+1] = { 
                                    header = "Put Out Vehicle",
                                    txt = "Put it outside the vehicle",
                                    icon = "fas fa-arrow-right-from-bracket",
                                    params = {
                                        event = "qb-target:client:SetPlayerOutVehicle",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
    
                            end
                        end
                        if PlayerIsCuffed or isDead then
                            playermenu[#playermenu+1] = { 
                                header = "Escort",
                                txt = "Escort him",
                                icon = "fas fa-user",
                                params = {
                                    event = "police:client:EscortPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        exports[Config.menu]:openMenu(playermenu)
                    end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)))
    
                    
                end,
                canInteract = function(Enty, distance, data)
                    if IsPedAPlayer(Enty) and not QBCore.Functions.GetPlayerData().metadata["isdead"] and not QBCore.Functions.GetPlayerData().metadata["inlaststand"] and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then return true end 
                    return false
                end,
                job = 'police',
            },
            ["Ambulance"] = {
                icon = 'fas fa-briefcase-medical',
                label = 'Medical Actions',
    
                action = function(Enty)
                    local playerid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty))
                    local bandage = false
                    for k, item in pairs(QBCore.Functions.GetPlayerData().items) do 
                        if item.name == "bandage" then
                            bandage = true
                            break
                        end
                    end
                    local firstaid = false
                    for k, item in pairs(QBCore.Functions.GetPlayerData().items) do 
                        if item.name == "firstaid" then
                            firstaid = true
                            break
                        end
                    end
    
                    QBCore.Functions.TriggerCallback('qb-target:GetPlayerInfo', function(PlayerIsCuffed, isDead, isVeryDead, PlayerCitizenId)
                        local playermenu = { 
                            {
                                id = 1,
                                header = "Medical Actions",
                                isMenuHeader = true,
                                icon = "fas fa-circle",
                                -- txt = "التحكم بإنذار السجن",
                            },
                            {
                                id = 2,
                                header = "Check Status",
                                txt = "Check his Status",
                                icon = "fas fa-user",
                                params = {
                                    event = "police:client:CheckStatus",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                            {
                                id = 2,
                                header = "Take Blood Sample",
                                txt = "Take a blood sample from the citizen",
                                icon = "fas fa-tint",
                                params = {
                                    event = "qb-target:client:TakeBlood",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                        }
                        if isDead and firstaid then
                            playermenu[#playermenu+1] = { 
                                header = "Revive",
                                txt = "Help the citizen",
                                icon = "fas fa-band-aid",
                                params = {
                                    event = "qb-target:client:RevivePlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        if not isDead and bandage or firstaid then
                            playermenu[#playermenu+1] = { 
                                id = 3,
                                header = "Treat Wounds",
                                txt = "Treat the wounds of the citizen",
                                icon = "fas fa-syringe",
                                params = {
                                    event = "qb-target:client:TreatWounds",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        if PlayerIsCuffed or isDead then
                            playermenu[#playermenu+1] = { 
                                header = "Escort",
                                txt = "Escort him",
                                icon = "fas fa-user",
                                params = {
                                    event = "police:client:EscortPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        if isDead and exports['qb-ambulancejob']:NearSomehing()  then
                            playermenu[#playermenu+1] = { 
                                header = "Put in Stretcher",
                                txt = "Put him in the Stretcher",
                                icon = "fas fa-user",
                                params = {
                                    isServer = true,
                                    event = "hospital:server:LayOnStretcher",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        -- and exports['qb-ambulancejob']:NearSomehing()
                        
                        local vehicle = QBCore.Functions.GetClosestVehicle()
                        if vehicle ~= 0 and vehicle then
                            local ped = PlayerPedId()
                            local pos = GetEntityCoords(ped)
                            local vehpos = GetEntityCoords(vehicle)
                            if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) and PlayerIsCuffed or isDead then
                                playermenu[#playermenu+1] = { 
                                    header = "Put In Vehicle",
                                    txt = "",
                                    icon = "fas fa-arrow-right-from-bracket",
                                    params = {
                                        event = "qb-target:client:PutPlayerInVehicle",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
                                playermenu[#playermenu+1] = { 
                                    header = "Put Out Vehicle",
                                    txt = "",
                                    icon = "fas fa-arrow-right-from-bracket",
                                    params = {
                                        event = "qb-target:client:SetPlayerOutVehicle",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
    
                            end
                        end
                        exports[Config.menu]:openMenu(playermenu)
                    end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)))
    
                    
                end,
                canInteract = function(Enty, distance, data)
                    if IsPedAPlayer(Enty) and not QBCore.Functions.GetPlayerData().metadata["isdead"] and not QBCore.Functions.GetPlayerData().metadata["inlaststand"] and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                        return true
                    end 
                    return false
                end,
                job = 'ambulance',
            },
            ["Citizen"] = {
                icon = 'fas fa-id-badge',
                label = 'Interaction',
                action = function(Enty)
                    local hashandcuff = false
                    local HasHeadBag = false
                    for k, item in pairs(QBCore.Functions.GetPlayerData().items) do 
                        if item.name == "handcuffs"  then
                            hashandcuff = true
                            break
                        end
                    end
                    for k, item in pairs(QBCore.Functions.GetPlayerData().items) do 
                        if item.name == "headbag"  then
                            HasHeadBag = true
                            break
                        end
                    end
                    QBCore.Functions.TriggerCallback('qb-target:GetPlayerInfo', function(PlayerIsCuffed, isDead, isVeryDead, PlayerCitizenId)
                        local playermenu = { 
                                {
                                header = "Give Phone Number",
                                txt = "Give him your phone number",
                                icon = "fas fa-phone",
                                params = {
                                    event = "qb-phone:client:GiveContactDetails",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                            {
                                header = "Give Cash",
                                txt = "Your Current Cash: "..QBCore.Functions.GetPlayerData().money.cash.. '$',
                                icon = "fas fa-dollar-sign",
                                params = {
                                    event = 'qb-target:givecash',
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                            {
                                header = "Give Keys",
                                txt = "Give him your vehicle keys",
                                icon = "fas fa-key",
                                params = {
                                    event = "vehiclekeys:client:GiveKeys2",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                            {
                                header = "Steal Shoes",
                                txt = "Steal his shoes",
                                icon = "fas fa-socks",
                                params = {
                                    event = "shoestealing:client:stealshoes",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                            {
                                header = "Carry",
                                txt = "Carry Him",
                                icon = "fas fa-people-carry",
                                params = {
                                    event = "qb-target:carry:command",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            },
                        }
                        if exports['qb-headbag']:GetisHeadBagged(PlayerCitizenId) then
                            playermenu[#playermenu+1] = { 
                                header = "Remove Headbag",
                                txt = "Remove the headbag from him",
                                icon = "fas fa-mask",
                                params = {
                                    event = "qb-headbag:server:BagOff",
                                    isServer = true,
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        if HasHeadBag and PlayerIsCuffed or isDead then
                            if not exports['qb-headbag']:GetisHeadBagged(PlayerCitizenId) then
                                playermenu[#playermenu+1] = { 
                                    header = "Use Headbag",
                                    txt = "Put the Headbag on his head",
                                    icon = "fas fa-mask",
                                    params = {
                                        event = "qb-target:puton",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
                            end
                        end
                        if hashandcuff  then
                            playermenu[#playermenu+1] = { 
                                header = "Use Cuff",
                                txt = "Cuff/Uncuff the citizen",
                                icon = "fas fa-handcuffs",
                                params = {
                                    event = "qb-target:client:CuffPlayerSoft",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        local vehicle = QBCore.Functions.GetClosestVehicle()
                        if vehicle ~= 0 and vehicle then
                            local ped = PlayerPedId()
                            local pos = GetEntityCoords(ped)
                            local vehpos = GetEntityCoords(vehicle)
                            if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) and PlayerIsCuffed or isDead then
                                playermenu[#playermenu+1] = { 
                                    header = "Put Out Vehicle",
                                    txt = "Put it inside the vehicle",
                                    icon = "fas fa-arrow-right-from-bracket",
                                    params = {
                                        event = "qb-target:client:PutPlayerInVehicle",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
                                playermenu[#playermenu+1] = { 
                                    header = "Put In Vehicle",
                                    txt = "Put it outside the vehicle",
                                    icon = "fas fa-arrow-right-from-bracket",
                                    params = {
                                        event = "qb-target:client:SetPlayerOutVehicle",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
    
                            end
                        end
                        if PlayerIsCuffed or isDead then
                            playermenu[#playermenu+1] = { 
                                header = "Escort",
                                txt = "Escort him",
                                icon = "fas fa-user",
                                params = {
                                    event = "police:client:EscortPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
    
    
                        if  QBCore.Functions.GetPlayerData().job.name == 'tunner' or QBCore.Functions.GetPlayerData().job.name == 'hayesauto' or QBCore.Functions.GetPlayerData().job.name == 'ottos' then
                            playermenu[#playermenu+1] = { 
                                header = "Create Invoice",
                                txt = "Give him a Invoice to pay",
                                icon = "fas fa-file-invoice-dollar",
                                params = {
                                    event = "qb-phone:client:sendbail",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                },
                            }
                        end
    
                        if isVeryDead or IsEntityPlayingAnim(GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)))), "missminuteman_1ig_2", "handsup_base", 3) or IsEntityPlayingAnim(GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)))), "mp_arresting", "idle", 3) then
                            playermenu[#playermenu+1] = { 
                                header = "Rob",
                                txt = "Rob him",
                                icon = "fas fa-people-robbery",
                                params = {
                                    event = "qb-target:client:RobPlayer",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        if isVeryDead  then
                            playermenu[#playermenu+1] = { 
                                header = "Drag",
                                txt = "Drag him",
                                icon = "fas fa-people-robbery",
                                params = {
                                    event = "qb-DragPeople:START",
                                    args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                    txt = "",
                                }
                            }
                        end
                        for i=1, #hostageAllowedWeapons do
                            if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(hostageAllowedWeapons[i]), false) then
                                foundWeapon = GetHashKey(hostageAllowedWeapons[i])
                                playermenu[#playermenu+1] = { 
                                    header = "Take Hostage",
                                    txt = "Take him hostage",
                                    icon = "fas fa-gun",
                                    params = {
                                        event = "qb-target:client:TakeHostage",
                                        args = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)),
                                        txt = "",
                                    }
                                }
                                NoWeapon = false
                                break
                            end
                        end
    
                        exports[Config.menu]:openMenu(playermenu)
                    end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(Enty)))
                end,
                canInteract = function(Enty, distance, data)
                if IsPedAPlayer(Enty) and not QBCore.Functions.GetPlayerData().metadata["isdead"] and not QBCore.Functions.GetPlayerData().metadata["inlaststand"] and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    return true
                end 
                return false
                end,
            },
        },
        distance = 1.5, 
        })
    end)