function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end
-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

Config.menu = 'qb-menu'
Config.Shortname = 'qb-'

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = true

-- The default distance to draw the Sprite
Config.DrawDistance = 6.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
-- police


["vextugr"] = {
    name = "vextugr",
    coords = vector3(930.29730224609, -1807.6740722656, 31.3814868927),
    length = 4,
    width = 4,
    heading = 0,
    debugPoly = false,
    options = {
        {
            event = "OpenTruckerMenu",
            icon = "fas fa-circle",
            label = "Open Menu",
            job = "all",
         },
    },
    distance = 1.5
},

["policebadge1"] = {
    name = "Police Badage",
    coords = vector3(451.96, -973.66, 35.08),
    length = 1.5,
    width = 1.5,
    heading = 180.64,
    debugPoly = false,
    options = {
        {
            event = "qb-pdbadge:client:openMenu",
            icon = "fa-solid fa-shield-halved",
            label = "Create Badage",
            job = "police",
         },
    },
    distance = 1.5
},

["policeclothing1"] = {
    name = "clothing",
    coords = vector3(444.94, -997.12, 35.07),
    length = 4,
    width = 4,
    heading = 90.69,
    debugPoly = false,
    options = {
        {
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-circle",
            label = "PD Outfit",
            job = "police",
         },
    },
    distance = 1.5
},


["policeclothing2"] = {
    name = "clothing",
    coords = vector3(930.29730224609, -1807.6740722656, 31.3814868927),
    length = 4,
    width = 4,
    heading = 0,
    debugPoly = false,
    options = {
        {
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-circle",
            label = "PD Outfit",
            job = "police",
         },
    },
    distance = 1.5
},

["printer2"] = {
    name = "printer2",
    coords = vector3(450.14, -989.94, 30.69),
    length = 4,
    width = 4,
    heading = 0,
    debugPoly = false,
    options = {
        {
            icon = "fas fa-tools",
            event = "qb-printer:client:Start",
            label = "Printer",
            job = "all",
         },
    },
    distance = 1.5
},

--["phone12"] = {
--    name = "phone12",
--    coords = vector3(442.54, -983.48, 30.69),
--    length = 4,
--    width = 4,
--    heading = 0,
--    debugPoly = false,
--    options = {
--        {
--            event = "stx-phone:client:publocphoneopen",
--            icon = "fas fa-phone-alt",
--            label = "هاتف ",
--            job = "all",
--         },
--    },
--    distance = 1.5
--},
--
--["phone123"] = {
--    name = "phone123",
--    coords = vector3(443.59, -979.0, 30.69),
--    length = 4,
--    width = 4,
--    heading = 0,
--    debugPoly = false,
--    options = {
--        {
--            event = "stx-phone:client:publocphoneopen",
--            icon = "fas fa-phone-alt",
--            label = "هاتف ",
--            job = "police",
--         },
--    },
--    distance = 1.5
--},
--
--
--["phone1234"] = {
--    name = "phone1234",
--    coords = vector3(462.27, -986.65, 30.69),
--    length = 4,
--    width = 4,
--    heading = 0,
--    debugPoly = false,
--    options = {
--        {
--            event = "stx-phone:client:publocphoneopen",
--            icon = "fas fa-phone-alt",
--            label = "هاتف ",
--            job = "police",
--         },
--    },
--    distance = 1.5
--},
----
--["poicenew1"] = {
--    name = "poicenew1",
--    coords = vector3(460.1, -986.49, 24.69),
--    length = 4,
--    width = 4,
--    heading = 0,
--    debugPoly = false,
--    options = {
--        {
--            event = 'qb-poicenew:poicenew',
--            icon = 'fas fa-circle',
--            label = 'كراج القوات الخاصة',
--            job = "police",
--         },
--    },
--    distance = 1.5
--},

----------------------------------------

	["mechaniccraft"] = {
		name = "Mechanic Toolbox",
		coords = vector3(136.7, -3051.41, 7.04),
		length = 1,
		width = 1,
		heading = 0,
		debugPoly = false,
		minZ=3.44,
		maxZ=7.44,
		options = {
			{
				type = "client",
				event = "craft:mechanicparts", 
				icon = "fas fa-wrench",
				label = "Craft Mechanic",
				job = "mechanic",
			},
		},
		distance = 2.5
	},
    

}

Config.PolyZones = {

}



Config.TargetBones = {
	["mechanic"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r"
        },
        options = {
            {
                type = "client",
                event = "craft:vehmenu",
                icon = "fad fa-key",
                label = "Vehicle Menu",
                job = "mechanic",
            },
            {
                type = "client",
                event = "vehiclekeys:client:GiveKeysclose",
                icon = "fas fa-circle",
                label = "Give Keys",
            },
            {
                type = "client",
                event = "police:client:PutPlayerInVehicle",
                icon = "fas fa-chevron-circle-left",
                label = "In Vehicle",
            },
            {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-chevron-circle-right",
                label = "Out Vehicle",
            },
            {
                type = "client",
                event = "dynyx-impound:client:OpenImpoundMenu",
                icon = "fas fa-car",
                label = "Impound",
                job = 'police'
            },
			{
                type = "client",
                event = "qb-radialmenu:client:flipvehicle",
                icon = "fas fa-chevron-circle-right",
                label = "Flip Vehicle",
            },
            {
                event = "qb-vehicletracker:client:startPlacingTracker",
                icon = "fas fa-truck-loading",
                label = "Place tracker",
                item = "vehicle_tracker",
            },
        },
        distance = 3.0
    },
}

Config.TargetEntities = {

}

Config.TargetModels = {

    ["VehicleRental"] = {
        models = {
            `u_f_y_princess`,
        },
        options = {
            {
                type = "client",
                event = "qb-rental:openMenu",
                icon = "fas fa-car",
                label = "Rent Vehicle",
            },
        },
        distance = 4.0
    },

   -- ["atms"] = {
   --     models = {
   --         'prop_atm_01',
   --         'prop_atm_02',
   --         'prop_atm_03',
   --         'prop_fleeca_atm',
   --         'prop_atm_01'
   --     },
   --     options = {
   --         {
   --             type = "client",
   --             event = "aokokBanking:OpenATMtm",
   --             icon = "fas fa-credit-card",
   --             label = "أدخل البطاقة",
   --         },
   --     },
   --     distance = 1.0
   -- },
    ["printer"] = {
        models = {
            "prop_printer_01","prop_fax_01",
        },
        options = {
            {
                type = "command",
                event = "useprinter",
                icon = "fas fa-print",
                label = "Printer",
            },
        },
        distance = 1.5
    },
	
	
    ["spawncycexlx"] = {
        models = {
        GetHashKey('a_m_o_tramp_01'),
        },
        options = {
            {
                type = "client",
                event = "qb-sellitems:client:spawncycexlx",
                icon = "fas fa-circle",
                label = "Bike Rental",
               
            },
        },
        distance = 2.5
    },

    ["hardwershp"] = {
        models = {
        GetHashKey('csb_money'),
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-store",
                label = "Open Shop",
               
            },
        },
        distance = 2.5
    },

    ["gunshop"] = {
        models = {
        GetHashKey('s_m_y_ammucity_01'),
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-store",
                label = "Open Shop",
               
            },
        },
        distance = 2.5
    },


}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
	options = {
		{
			type = "client",
			event = "carry:command",
			icon = "fas fa-circle", 
			label = "Carry",
		},
        {
            type = "client",
            event = "qb-phone:client:GiveContactDetails",
            icon = "fas fa-address-book",
            label = "Give Contact",
        },
         {
            event = "police:client:RobPlayer",
            icon = "fas fa-user-secret",
            label = "Rob Player",
        },
        {
            type = "client",
            event = "police:client:CuffPlayer",
            icon = "fas fa-hands",
            label = "Cuffs",
            job = "police",
            item = 'handcuffs',
        },
        {
          type = "client",
          event = "police:client:EscortPlayer",
          icon = "fas fa-key",
          label = "Escort",
        },
		--[[{
            type = "client",
            event = "qb-stealshoes:client:stealshoes",
            icon = "fas fa-circle",
            label = "سرقة الجزمة",     443.8, -975.65, 42.69), h = 228.37                          443.8, -975.65, 42.69), h = 228.37
        },--]]
    }
}

Config.Peds = {

      ["pawnshop"] = {
       model = "s_m_m_ammucountry",
       coords = vector4(2194.03, 5594.07, 53.76, 338.41),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-pawnshop:client:openMenu",
                   icon = "fas fa-circle",
                   label = "Open Pawn Shop"
               }
           }, 
           distnace = 1.5
       },
   },
   
         ["amb"] = {
       model = "s_m_m_doctor_01",
       coords = vector4(-1852.92, -335.56, 49.45, 97.27),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-blackmarket:shop2",
                   icon = "fas fa-circle",
                   label = "Open Shop",
                   job = 'ambulance'
               }
           }, 
           distnace = 1.5
       },
   },

   ["policeimpu11nd1"] = {
       model = "s_m_m_pilot_02",
       coords = vector4(443.8, -975.65, 43.69, 228.37),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "garage:policemenu",
                   icon = "fas fa-circle",
                   label = "Helicopter ",
                   job = 'police'
               }
           }, 
           distnace = 1.5
       },
   },
   
      ["doxgarage"] = {
       model = "cs_fbisuit_01",
       coords = vector4(-1841.94, -374.09, 40.76, 230.51),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "garage:menu",
                   icon = "fas fa-circle",
                   label = "Open Garage ",
                   job = 'ambulance'
               }
           }, 
           distnace = 1.5
       },
   },
   
         ["AMB4"] = {
       model = "s_m_m_scientist_01",
       coords = vector4(70.9, -813.89, 31.33, 245.8),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-blackmarket:shop4",
                   icon = "fas fa-circle",
                   label = "Open Shop"
               }
           }, 
           distnace = 1.5
       },
   },
   
            ["AMB5"] = {
       model = "s_m_m_doctor_01",
       coords = vector4(-508.91, 292.55, 83.39, 173.49),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-blackmarket:shop4",
                   icon = "fas fa-circle",
                   label = "Open Shop"
               }
           }, 
           distnace = 1.5
       },
   },
   
               ["AMB6"] = {
       model = "s_m_m_doctor_01",
       coords = vector4(-177.46, 6384.52, 31.5, 226.16),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-blackmarket:shop4",
                   icon = "fas fa-circle",
                   label = "Open Shop"
               }
           }, 
           distnace = 1.5
       },
   },
   
                  ["AMB7"] = {
       model = "s_m_m_doctor_01",
       coords = vector4(-1829.81, -380.37, 49.41, 46.76),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-blackmarket:shop4",
                   icon = "fas fa-circle",
                   label = "Open Shop"
               }
           }, 
           distnace = 1.5
       },
   },
   
                     ["1"] = {
       model = "a_m_y_business_02",
       coords = vector4(-281.15, -990.07, 31.08, 336.88),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       scenario = 'WORLD_HUMAN_CLIPBOARD',
       target = {
           options = {
               {
                   event = "qb-rental:openMenu",
                   icon = "fas fa-car",
                   label = "Rent Vehicle"
               }
           }, 
           distnace = 1.5
       },
   },
   
   
   



}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	if not Config.Standalone then
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local firstSpawn = false
		AddEventHandler('playerSpawned', function()
			if not firstSpawn then
				SpawnPeds()
				firstSpawn = true
			end
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end
