local Bones = {Options = {}, Vehicle = {'chassis', 'windscreen', 'seat_pside_r', 'seat_dside_r', 'bodyshell', 'suspension_lm', 'suspension_lr', 'platelight', 'attach_female', 'attach_male', 'bonnet', 'boot', 'chassis_dummy', 'chassis_Control', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'Gun_GripR', 'windscreen_f', 'platelight', 'VFX_Emitter', 'window_lf', 'window_lr', 'window_rf', 'window_rr', 'engine', 'gun_ammo', 'ROPE_ATTATCH', 'wheel_lf', 'wheel_lr', 'wheel_rf', 'wheel_rr', 'exhaust', 'overheat', 'seat_dside_f', 'seat_pside_f', 'Gun_Nuzzle', 'seat_r'}}
local QBCore = exports['qb-core']:GetCoreObject()

if Config.EnableDefaultOptions then
    local BackEngineVehicles = {
        [`ninef`] = true,
        [`adder`] = true,
        [`vagner`] = true,
        [`t20`] = true,
        [`infernus`] = true,
        [`zentorno`] = true,
        [`reaper`] = true,
        [`comet2`] = true,
        [`comet3`] = true,
        [`jester`] = true,
        [`jester2`] = true,
        [`cheetah`] = true,
        [`cheetah2`] = true,
        [`prototipo`] = true,
        [`turismor`] = true,
        [`pfister811`] = true,
        [`ardent`] = true,
        [`nero`] = true,
        [`nero2`] = true,
        [`tempesta`] = true,
        [`vacca`] = true,
        [`bullet`] = true,
        [`osiris`] = true,
        [`entityxf`] = true,
        [`turismo2`] = true,
        [`fmj`] = true,
        [`re7b`] = true,
        [`tyrus`] = true,
        [`italigtb`] = true,
        [`penetrator`] = true,
        [`monroe`] = true,
        [`ninef2`] = true,
        [`stingergt`] = true,
        [`surfer`] = true,
        [`surfer2`] = true,
        [`gp1`] = true,
        [`autarch`] = true,
        [`tyrant`] = true
    }

    local function ToggleDoor(vehicle, door)
        if GetVehicleDoorLockStatus(vehicle) ~= 2 then
            if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
                SetVehicleDoorShut(vehicle, door, false)
            else
                SetVehicleDoorOpen(vehicle, door, false)
            end
        end
    end

    Bones.Options['seat_dside_f'] = {
        ["Toggle Front Door"] = {
            icon = "fas fa-door-open",
            label = "Toggle Front Door",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
            end,
            action = function(entity)
                ToggleDoor(entity, 0)
            end,
            distance = 1.2
        }
    }

    Bones.Options['seat_pside_f'] = {
        ["Toggle Front Door"] = {
            icon = "fas fa-door-open",
            label = "Toggle Front Door",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
            end,
            action = function(entity)
                ToggleDoor(entity, 1)
            end,
            distance = 1.2
        }
    }

    Bones.Options['seat_dside_r'] = {
        ["Toggle Rear Door"] = {
            icon = "fas fa-door-open",
            label = "Toggle Rear Door",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
            end,
            action = function(entity)
                ToggleDoor(entity, 2)
            end,
            distance = 1.2
        }
    }

    Bones.Options['seat_pside_r'] = {
        ["Toggle Rear Door"] = {
            icon = "fas fa-door-open",
            label = "Toggle Rear Door",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
            end,
            action = function(entity)
                ToggleDoor(entity, 3)
            end,
            distance = 1.2
        }
    }


    Bones.Options['boot'] = {
        -- ["Toggle Trunk"] = {
        --     icon = "fas fa-truck-ramp-box",
        --     label = "Toggle Trunk",
        --     action = function(entity)
        --         ToggleDoor(entity, BackEngineVehicles[GetEntityModel(entity)] and 4 or 5)
        --     end,
        --     distance = 0.9
        -- },

        ["Close Trunk"] = {
            icon = "fas fa-door-closed",
            label = "Close Trunk",
            canInteract = function(entity)
                if GetVehicleDoorAngleRatio(entity, 5) > 0 then
                    return true
                else
                    return false
                end
            end,
            action = function(entity)
                ToggleDoor(entity, BackEngineVehicles[GetEntityModel(entity)] and 4 or 5)
            end,
            distance = 0.9
        },

        ["Open Trunk"] = {
            icon = "fas fa-door-open",
            label = "Open Trunk",
            canInteract = function(entity)
                if GetVehicleDoorAngleRatio(entity, 5) > 0 then
                    return false
                else
                    return true
                end
            end,
            action = function(entity)
                ToggleDoor(entity, BackEngineVehicles[GetEntityModel(entity)] and 4 or 5)
            end,
            distance = 0.9
        },



        ["Get In Trunk"] = {
            icon = "fas fa-arrow-right-to-bracket",
            canInteract = function(entity)
                if GetVehicleDoorAngleRatio(entity, 5) > 0 then
                    return true
                else
                    return false
                end
            end,
            label = "Get In Trunk",
            event = 'qb-trunk:client:GetIn',
            distance = 0.9
        },
        ["Change Clothes"] = {
            icon = "fas fa-shirt",
            canInteract = function(entity)
                if GetVehicleDoorAngleRatio(entity, 5) > 0 then
                    return true
                else
                    return false
                end
            end,
            label = "Change Clothes",
            distance = 0.9,
            action = function(entity)
                TriggerServerEvent('qb-outfits:server:openUI', QBCore.Functions.GetPlate(entity), true)
            end,

            
        },
        ["Impound Vehicle"] = {
			type = "client",
			icon = "fas fa-car",
			label = "Impound Vehicle",
			job = 'police',
			canInteract = function(pEntity)
				local stockade = GetHashKey('stockade')
				if (GetEntityModel(pEntity) ~= stockade) then
					return true
				end
			end,
            action = function(entity)
                TriggerEvent('police:client:SendImpound', entity)
            end,
            distance = 0.9,
		},
    }

end

return Bones