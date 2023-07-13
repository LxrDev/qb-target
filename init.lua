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

    ["davismrpdoutfit"] = {
        name = "davismrpdoutfit",
        coords = vector3(360.42, -1592.95, 25.45),
        length = 3.2,
        width = 4.8,
        heading = 350,
        debugPoly = false,
        minZ = 24.43,
        maxZ = 26.63,
        options = {
            {
                type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-shield-alt",
                label = "PD Outfit",
                job = "police"
            },
            {
                type = "client",
                event = "nh-context:opendress2",
                icon = "fas fa-shield-alt",
                label = "PD Clothing",
                job = "police"
            },
        },
        distance = 2.5
    },
    ["davispdpersonalstash"] = {
        name = "DavisRowPersonalStash",
        coords = vector3(381.27, -1609.18, 30.2),
        length = 3.6,
        width = 2.0,
        heading = 340,
        debugPoly = false,
        minZ = 29.19,
        maxZ = 31.69,
        options = {
            {
              type = "client",
              event = "police:client:pstash",
              icon = "fas fa-sign-in-alt",
              label = "Open Personal Stash",
              job = "police",
            },
        },
        distance = 2.5
    },
    ["dfingerprint"] = {
        name = "dfingerprint",
        coords = vector3(363.57, -1602.54, 30.06),
        length = 2.6,
        width = 1.6,
        heading = 350,
        debugPoly = false,
        minZ = 29.03,
        maxZ = 31.03,
        options = {
            {
                type = "client",
                event = "police:client:fingerprint",
                icon = "fas fa-fingerprint",
                label = "Fingerprint Station",
                job = "police",
            },
        },
        distance = 1.5
    },
    ["dmcmugshot"] = {
        name = "dmcmugshot",
        coords = vector3(382.17, -1599.39, 25.45),
        length = 2.6,
        width =  0.6,
        heading = 350,
        debugPoly = false,
        minZ = 24.26,
        maxZ = 26.23,
        options = {
            {
                type = "client",
                event = "qb-mugshot:client:takemugshot",
                icon = "fas fa-camera",
                label = "Take Suspects Mugshots",
                job = "police",
            },
        },
        distance = 2.5
    },
    ["PDHeli"] = {
        name = "PDHeli",
        coords = vector3(463.28, -982.13, 43.69),
        length = 1.8,
        width = 0.6,
        heading = 330,
        debugPoly = false,
        minZ = 43.69,
        maxZ = 44.69,
        options = {
            {
                type = "client",
                event = "qb-policejob:yonatan:SpawnHeli",
                icon = "far fa-clipboard",
                label = "Spawn Heli",
                job = "police",
            },
        },
        distance = 1.5
    },
    --stash
    ["mrpdpersonalstash"] = {
        name = "MissionRowPersonalStash",
        coords = vector3(473.09, -1007.45, 26.27),
        length = 3.6,
        width = 2.0,
        heading = 340,
        debugPoly = false,
        minZ = 25.89,
        maxZ = 27.69,
        options = {
            {
              type = "client",
              event = "police:client:pstash",
              icon = "fas fa-sign-in-alt",
              label = "Open Personal Stash",
              job = "police",
            },
        },
        distance = 2.5
    },
    --fingerprint
    ["fingerprint"] = {
        name = "fingerprint",
        coords = vector3(473.68, -1013.4, 26.27),
        length = 2.6,
        width =  0.6,
        heading = 350,
        debugPoly = false,
        minZ = 25.63,
        maxZ = 27.03,
        options = {
            {
                type = "client",
                event = "police:client:fingerprint",
                icon = "fas fa-fingerprint",
                label = "Fingerprint Station",
                job = "police",
            },
        },
        distance = 1.5
    },

    --Outfit
	["mrpdoutfit"] = {
        name = "mrpdoutfit",
        coords = vector3(461.82, -995.87, 30.69),
        length = 3.2,
        width = 2.8,
        heading = 350,
        debugPoly = false,
        minZ = 29.43,
        maxZ = 31.63,
        options = {
            {
                type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-shield-alt",
                label = "PD Outfit",
                job = "police"
            },
            {
                type = "client",
                event = "nh-context:opendress2",
                icon = "fas fa-shield-alt",
                label = "PD Clothing",
                job = "police"
            },
        },
        distance = 2.5
    },


    --MugShot
    ["mcmugshot"] = {
        name = "mcmugshot",
        coords = vector3(473.1, -1011.2, 26.27),
        length = 2.6,
        width =  0.6,
        heading = 350,
        debugPoly = false,
        minZ = 25.26,
        maxZ = 27.23,
        options = {
            {
                type = "client",
                event = "qb-mugshot:client:takemugshot",
                icon = "fas fa-camera",
                label = "Take Suspects Mugshots",
                job = "police",
            },
        },
        distance = 2.5
    },

    --Diving Sell
    ["divingsell"] = {
        name = "divingsell",
        coords = vector3(-1684.69, -1069.01, 13.15),
        length = 2.6,
        width =  0.6,
        heading = 350,
        debugPoly = false,
        minZ = 11.15,
        maxZ = 15.15,
        options = {
            {
                type = "client",
                event = "qb-diving:sellfish",
                icon = "far fa-clipboard",
                label = "Sell your diving stuff",
            },
        },
        distance = 3.5
    },

    -- Rental
    -- ["NewRentalMenu"] = {
    --     name = "NewRentalMenu",
    --     coords = vector3(-199.8, -968.28, 29.3),
    --     length = 3.2,
    --     width = 2.8,
    --     heading = 350,
    --     debugPoly = false,
    --     minZ = 28.301415,
    --     maxZ = 30.301415,
    --     options = {
    --         {
    --             type = "client",
    --             event = "qb-rental:vehiclelist",
    --             icon = "fas fa-circle",
    --             label = "Rent vehicle",
    --         },
    --         {
    --             type = "client",
    --             event = "qb-rental:returnvehicle",
    --             icon = "fas fa-circle",
    --             label = "Return Vehicle (Receive Back 50% of original price)",
    --         },
    --     },
    --     distance = 2.5
    -- },

    -- ["NewRentalMenu2"] = {
    --     name = "NewRentalMenu2",
    --     coords = vector3(339.39, 36.79, 89.56),
    --     length = 3.2,
    --     width = 2.8,
    --     heading = 350,
    --     debugPoly = false,
    --     minZ = 88.301415,
    --     maxZ = 90.301415,
    --     options = {
    --         {
    --             type = "client",
    --             event = "qb-rental:vehiclelist",
    --             icon = "fas fa-circle",
    --             label = "Rent vehicle",
    --         },
    --         {
    --             type = "client",
    --             event = "qb-rental:returnvehicle",
    --             icon = "fas fa-circle",
    --             label = "Return Vehicle (Receive Back 50% of original price)",
    --         },
    --     },
    --     distance = 2.5
    -- },
    --bcso

    -- ["BCSODuty"] = {
    --     name = "BCSODuty",
    --     coords = vector3(1852.80, 3687.80, 34.22),
    --     length = 0.5,
    --     width = 0.4,
    --     heading = 20,
    --     debugPoly = false,
    --     minZ = 34.05,
    --     maxZ = 34.40,
    --     options = {
    --         {
    --             type = "client",
    --             event = "Toggle:Duty",
    --             icon = "far fa-clipboard",
    --             label = "Sign In / Out",
    --             job = "police",
    --         },
    --     },
    --     distance = 1.5
    -- },

    -- ["BCSOArmory"] = {
    --     name = "BCSOArmory",
    --     coords = vector3(1861.85, 3688.25, 34.22),
    --     length = 1.0,
    --     width = 1.8,
    --     heading = 30.0,
    --     debugPoly = false,
    --     minZ = 34.30,
    --     maxZ = 35.50,
    --     options = {
    --         {
    --             type = "client",
    --             event = "police:openPDArmory",
    --             icon = "fas fa-shield-alt",
    --             label = "Police Armory",
    --             job = "police"
    --         }
    --     },
    --     distance = 1.5
    -- }, 

    ["bcsopersonalstash"] = {
        name = "BlaneCountyPersonalStash",
        coords = vector3(1853.23, 3689.50, 29.82),
        length = 2.80,
        width = 0.50,
        heading = 120.0,
        debugPoly = false,
        minZ = 27.62,
        maxZ = 30.49,
        options = {
            {
              type = "client",
              event = "police:client:pstash",
              icon = "fas fa-sign-in-alt",
              label = "Open Personal Stash",
              job = "police",
            },
        },
        distance = 2.5
    },

    ["BCSOfingerprint"] = {
        name = "BCSOfingerprint",
        coords = vector3(1844.45, 3692.50, 34.19),
        length = 0.4,
        width = 0.4,
        heading = 30.00,
        debugPoly = false,
        minZ = 33.90,
        maxZ = 34.20,
        options = {
            {
                type = "client",
                event = "police:client:fingerprint",
                icon = "fas fa-fingerprint",
                label = "Fingerprint Station",
                job = "police",
            },
        },
        distance = 1.5
    },
 --------/ EMS Stash

    ["EMSstash"] = {
        name = "EMSstash",
        coords = vector3(306.18, -601.94, 43.28),
        length = 0.2,
        width = 1,
        heading = 340,
        debugPoly = false,
        minZ = 42.28,
        maxZ = 44.68,
        options = {
            {
                type = "client",
                event = "hospital:openEMSPersonal",
                icon = "fas fa-shopping-cart",
                label = "Open Personal Stash",
                job = "ambulance",
            }
        },
        distance = 2.5
    },
    -----------Bosmenu
    ["EMSBossMenu"] = {
        name = "EMS-BossMenu",
        coords = vector3(310.29, -597.49, 43.28),
        length = 0.6,
        width = 0.7,
        heading = 345,
        debugPoly = false,
        minZ=42.28,
        maxZ=46.28,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                job = {["ambulance"] = 10,}
            }
        },
        distance = 2.5
    },
     --Outfit
	["EMSpdoutfit"] = {
        name = "EMSpdoutfit",
        coords = vector3(300.2, -597.72, 43.28),
        length = 0.6,
        width = 0.4,
        heading = 5,
        debugPoly = false,
        minZ=42.68,
        maxZ=42.88,
        options = {
            {
                type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-shield-alt",
                label = "EMS Outfit",
                job = "ambulance"
            },
        },
        distance = 1.5
    },

    --Clothing
	["EMSClothing"] = {
        name = "EMSClothing",
        coords = vector3(302.84, -598.45, 43.28),
        length = 0.4,
        width = 0.4,
        heading = 340,
        debugPoly = false,
        minZ = 42.48,
        maxZ = 44.48,
        options = {
            {
                type = "client",
                event = "nh-context:opendress2",
                icon = "fas fa-shield-alt",
                label = "EMS Clothing",
                job = "ambulance"
            },
        },
        distance = 1.5
    },
    ----- Plastic Surgery

     ["surgery"] = {
        name = "surgery",
        coords = vector3(322.62, -572.57, 43.28),
        length = 2.6,
        width = 1,
        heading = 340,
        debugPoly = false,
        minZ = 42.28,
        maxZ = 44.48,
        options = {
            {
                type = "client",
                event = "qb-plastic:surgery",
                icon = "far fa-clipboard",
                label = "Plastic Surgery",
            }
        },
        distance = 1.5
    },
    ----- Checkin

     ["Checkin"] = {
        name = "Checkin",
        coords = vector3(307.54, -595.31, 43.28),
        length = 0.4,
        width = 0.5,
        heading = 65,
        debugPoly = false,
        minZ = 42.88,
        maxZ = 43.28,
        options = {
            {
                type = "client",
                event = "Hospital:CheckIn",
                icon = "far fa-clipboard",
                label = "📋Check In",
            }
        },
        distance = 1.5
    },

    ---hunting plus fishing
    ["fishing"] = {
        name = "fishing",
        coords = vector3(-1593.5, 5197.9, 4.36),
        length = 0.60,
        width = 0.60,
        heading = 55.0,
        debugPoly = false,
        minZ = 4.30,
        maxZ = 4.80,
        options = {
            {
              type = "client",
              event = "crfw:client:buyFishingGear",
              icon = "far fa-fish",
              label = "Fishing Gear",
            },
        },
        distance = 2.0
    },

    -- ["MechStash"] = {
    --     name = "MechStash",
    --     coords = vector3(128.62, -3014.69, 7.04),
    --     length = 1.6,
    --     width = 2.8,
    --     heading = 0,
    --     debugPoly = false,
	-- 	minZ = 6.04,
    --     maxZ = 9.24,
    --     options = {
    --         {
    --             type = "client",
    --             event = "MechStash",
    --             icon = "fas fa-archive",
    --             label = "Mechanic Stash",
    --             job = "mechanic",
    --         }
    --     },
    --     distance = 2.5
    -- },
    -- ["MechanicDuty"] = {
    --     name = "MechanicDuty",
    --     coords = vector3(123.59, -3007.86, 7.04),
    --     length = 0.4,
    --     width = 0.2,
    --     heading = 0,
    --     debugPoly = false,
	-- 	minZ = 7.44,
    --     maxZ = 7.84,
    --     options = {
    --         {
    --             type = "client",
    --             event = "Toggle:Duty",
    --             icon = "far fa-clipboard",
    --             label = "Sign In / Out",
    --             job = "mechanic",
    --         }
    --     },
    --     distance = 2.5
    -- },
    -- -----------Bosmenu
    -- ["MechanBossMenu"] = {
    --     name = "MechanBossMenu",
    --     coords = vector3(125.41, -3014.83, 7.04),
    --     length = 0.4,
    --     width = 0.4,
    --     heading = 355,
    --     debugPoly = false,
    --     minZ=6.84,
    --     maxZ=7.04,
    --     options = {
    --         {
    --             type = "client",
    --             event = "qb-bossmenu:client:openMenu",
    --             icon = "far fa-clipboard",
    --             label = "Boss Menu",
    --             job = {["mechanic"] = 4,}
    --         }
    --     },
    --     distance = 2.5
    -- },

    -- Mechanic
        ["MechanicCrafting"] = {
        name = "MechanicCrafting",
        coords = vector3(837.07, -819.4, 26.33),
        length = 2.2,
        width = 1.6,
        heading = 0,
        debugPoly = false,
        minZ=25.53,
        maxZ=26.63,
          options = {
            {
                type = "client",
                event = "qb-mechanic:client:Crafting:Menu",
                icon = "fas fa-cogs",
                label = "Mechanic Crafting",
                job = {["mechanic"] = 1,}
            }
        },
        distance = 2.5
    },
    -- ["MechanicShop"] = {
    --     name = "MechanicShop",
    --     coords = vector3(-572.79, -938.45, 23.89),
    --     length = 2.4,
    --     width = 2.4,
    --     heading = 175,
    --     debugPoly = false,
    --     minZ=22.84,
    --     maxZ=24.94,
    --     options = {
    --         {
    --             type = "client",
    --             event = "qb-mechanic:client:Store:Menu",
    --             icon = "fas fa-cogs",
    --             label = "Mechanic Shop",
    --             job = {["mechanic"] = 4,}
    --         }
    --     },
    --     distance = 2.5
    -- },
        ["MechanBossMenu"] = {
        name = "MechanBossMenu",
        coords = vector3(835.14, -827.35, 26.33),
        length = 0.35,
        width = 0.4,
        heading = 0,
        debugPoly = false,
        minZ=26.13,
        maxZ=26.53,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                job = {["tuner"] = 4,}
            }
        },
        distance = 2.5
    },
    ["mechaniccraft"] = {
        name = "Mechanic Toolbox",
        coords = vector3(837.02, -811.77, 26.33),
        length = 2.1,
        width = 1.35,
        heading = 0,
        debugPoly = false,
        minZ=25.33,
        maxZ=26.58,
        options = {
            {
                type = "client",
                event = "craft:mechanicparts", 
                icon = "fas fa-wrench",
                label = "Craft",
                job = "tuner",
            },
        },
        distance = 2.5
    },
    -- Boss Menu
    ------- Vanilla --------
    ["VanillaBossMenu"] = {
        name = "VanillaBossMenu",
        coords = vector3(95.17, -1295.25, 29.26),
        length = 2.4,
        width = 1.4,
        heading = 355,
        debugPoly = false,
        minZ=28.16,
        maxZ=30.04,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                job = {["vanilla"] = 4,}
            }
        },
        distance = 3.0
    },
    ------- Cat Cafe --------
        ["CatCafeBossMenu"] = {
            name = "CatCafeBossMenu",
            coords = vector3(-578.2, -1066.67, 26.61),
            length = 2.4,
            width = 1.4,
            heading = 355,
            debugPoly = false,
            minZ=25.16,
            maxZ=27.04,
            options = {
                {
                    type = "client",
                    event = "qb-bossmenu:client:OpenMenu",
                    icon = "fas fa-sign-in-alt",
                    label = "Boss Menu",
                    job = {["catcafe"] = 4,}
                }
            },
            distance = 3.0
        },
         ------- pizzathis --------
            ["PizzaThisBossMenu"] = {
                name = "PizzaThisBossMenu",
                coords = vector3(797.08, -751.48, 31.27),
                length = 0.6,
                width = 0.55,
                heading = 0,
                debugPoly = false,
                options = {
                    {
                        type = "client",
                        event = "qb-bossmenu:client:OpenMenu",
                        icon = "fas fa-sign-in-alt",
                        label = "Boss Menu",
                        job = {["pizzathis"] = 4,}
                    }
                },
                distance = 3.0
            },
            ------- BeanMachine --------
            ["BeanMachineBossMenu"] = {
                name = "BeanMachineBossMenu",
                coords = vector3(120.27, -1048.54, 29.28),
                length = 2.4,
                width = 1.4,
                heading = 355,
                debugPoly = false,
                minZ=28.2,
                maxZ=30.22,
                options = {
                    {
                        type = "client",
                        event = "qb-bossmenu:client:OpenMenu",
                        icon = "fas fa-sign-in-alt",
                        label = "Boss Menu",
                        job = {["beanmachine"] = 4,}
                    }
                },
                distance = 3.0
            },

         ------- PopsDiner --------
         ["PopsDinerBossMenu"] = {
            name = "PopsDinerBossMenu",
            coords = vector3(1596.12, 6454.48, 26.01),
            length = 1.4,
            width = 1.4,
            heading = 355,
            debugPoly = false,
            minZ=25.2,
            maxZ=27.22,
            options = {
                {
                    type = "client",
                    event = "qb-bossmenu:client:OpenMenu",
                    icon = "fas fa-sign-in-alt",
                    label = "Boss Menu",
                    job = {["popsdiner"] = 4,}
                }
            },
            distance = 3.0
        },
        ------- BurgerShot --------
         ["BurgerShotBossMenu"] = {
            name = "BurgserShotBossMenu",
            coords = vector3(-1177.67, -894.24, 13.97),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=12.2,
            maxZ=14.22,
            options = {
                {
                    type = "client",
                    event = "qb-bossmenu:client:OpenMenu",
                    icon = "fas fa-sign-in-alt",
                    label = "Boss Menu",
                    job = {["burgershot"] = 4,}
                }
            },
            distance = 3.0
        },
         ------- WhiteWidow --------
         ["WhiteWidowBossMenu"] = {
            name = "WhiteWidowBossMenu",
            coords = vector3(178.56, -251.79, 54.07),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=53.2,
            maxZ=55.22,
            options = {
                {
                    type = "client",
                    event = "qb-bossmenu:client:OpenMenu",
                    icon = "fas fa-sign-in-alt",
                    label = "Boss Menu",
                    job = {["whitewidow"] = 2,}
                }
            },
            distance = 3.0
        },

         ------ SkyDiving --------
         ["SkyDiving"] = {
            name = "SkyDiving",
            coords = vector3(1742.72, 3296.19, 41.11),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=40.2,
            maxZ=42.22,
			options = {
				{
					type = "server",
					event = "randol_skydive:server:payforgroup",
					icon = "fa-solid fa-user-group",
					label = "Group Skydive ($750)",
				},
				{
					type = "client",
					event = "randol_skydive:client:ridewithbuddy",
					icon = "fa-solid fa-user-group",
					label = "Join Friends",
				},
				{
					type = "server",
					event = "randol_skydive:server:solojump",
					icon = "fa-solid fa-parachute-box",
					label = "Solo Jump",
				}
			},
			distance = 2.5,
        },

        ------ cayo fly // boat --------
         ["CayoBoat"] = {
            name = "CayoBoat",
            coords = vector3(-293.63, -2769.49, 2.2),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=1.2,
            maxZ=3.2,
            options = {
                {
                    type = "server",
                    event = "randol_cayoboat:server:takeboat",
                    icon = "fa-solid fa-ship",
                    label = "Travel to Perico",
                },
            },
            distance = 2.5,
        },
        ["CayoBoatReturn"] = {
            name = "CayoBoatReturn",
            coords = vector3(4929.89, -5174.55, 2.48),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=1.4,
            maxZ=3.4,
            options = {
                {
                    type = "server",
                    event = "randol_cayoboat:server:return",
                    icon = "fa-solid fa-ship",
                    label = "Travel to LS",
                },
            },
            distance = 2.5,
        },
        ["CayoPlaneReturn"] = {
            name = "CayoPlaneReturn",
            coords = vector3(4436.98, -4482.86, 4.31),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=3.4,
            maxZ=5.4,
            options = {
                {
                    type = "server",
                    event = "randol_cayoplane:server:return",
                    icon = "fa-solid fa-plane-departure",
                    label = "Fly to LS",
                },
            },
            distance = 2.5,
        },
        ["CayoPlane"] = {
            name = "CayoPlane",
            coords = vector3(-1045.35, -2750.89, 21.36),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=20.4,
            maxZ=22.4,
            options = {
                {
                    type = "server",
                    event = "randol_cayoplane:server:takeplane",
                    icon = "fa-solid fa-plane-departure",
                    label = "Fly to Perico",
                },
            },
            distance = 2.5,
        },
        ------- RealEstate --------
         ["RealEstateBossMenu"] = {
            name = "RealEstateBossMenu",
            coords = vector3(111.08, -881.96, 31.15),
            length = 2.4,
            width = 2.4,
            heading = 355,
            debugPoly = false,
            minZ=30.2,
            maxZ=32.22,
            options = {
                {
                    type = "client",
                    event = "qb-bossmenu:client:OpenMenu",
                    icon = "fas fa-sign-in-alt",
                    label = "Boss Menu",
                    job = {["realestate"] = 4,}
                }
            },
            distance = 3.0
        },

        --  -- Crafting
        --  ["GunAttachmentsCrafting"] = {
        --     name = "GunAttachmentsCrafting",
        --     coords = vector3(-38.89, -614.68, 35.11),
        --     length = 2.4,
        --     width = 2.4,
        --     heading = 355,
        --     debugPoly = false,
        --     minZ=34.2,
        --     maxZ=36.22,
        --     options = {
        --         {
        --             type = "client",
        --             event = "inventory:client:Crafting",
        --             icon = "far fa-clipboard",
        --             label = "Attachments Crafting",
        --         }
        --     },
        --     distance = 3.0
        -- },

        -- -- Crafting
        --  ["illegalCrafting"] = {
        --     name = "illegalCrafting",
        --     coords = vector3(-534.06, -2216.37, 6.39),
        --     length = 1.6,
        --     width = 1.8,
        --     heading = 355,
        --     debugPoly = false,
        --     minZ=5.2,
        --     maxZ=7.22,
        --     options = {
        --         {
        --             type = "client",
        --             event = "inventory:client:SpecialCrafting",
        --             icon = "far fa-clipboard",
        --             label = "illegal Crafting",
        --         }
        --     },
        --     distance = 3.0
        -- },


------/ Jewel Heist  

    -- ["jewelheist"] = {
    --     name = "jewelheist",
    --     coords = vector3(-595.8919, -283.6023, 50.3237),
    --     length = 1.00,
    --     width = 1.00,
    --     heading = 302.7994,
    --     debugPoly = false,
    --     minZ = 50.00,
    --     maxZ = 51.40,
    --     options = {
    --         {
    --           type = "client",
    --           event = "qb-jewellery:client:startheist",
    --           icon = "fas fa-gem",
    --           label = "Disable Cameras",
    --         },
    --     },
    --     distance = 5.0
    -- },
    -- ["jewelheistdoor"] = {
    --     name = "jewelheistdoor",
    --     coords = vector3(-619.9963, -223.90, 38.3175),
    --     length = 0.30,
    --     width = 0.40,
    --     heading = 38.5005,
    --     debugPoly = false,
    --     minZ = 38.50,
    --     maxZ = 38.80,
    --     options = {
    --         {
    --           type = "client",
    --           event = "qb-jewellery:client:UsePinkCard",
    --           icon = "fas fa-id-card-alt",
    --           label = "Disable Doors",
    --         },
    --     },
    --     distance = 5.0
    -- },
    -----------GarbageJob
    ["Garbagebus-Return"] = {
        name = "Garbagebus-Return",
        coords = vector3(-334.11, -1565.61, 24.95),
        length = 4.4,
        width = 11.4,
        heading = 330,
        debugPoly = false,
        minZ = 24.15,
        maxZ = 28.15,
        options = {
            {
              type = "client",
              event = "garbage:returnTruck",
              icon = "fas fa-shopping-cart",
              label = "Return GarbageBus",
            },
        },
        distance = 5.0
    },
    ---------Trucker
    ["Trucker"] = {
        name = "Trucker",
        coords = vector3(-553.03, 5348.65, 74.74),
        length = 1.6,
        width = 1.2,
        heading = 340,
        debugPoly = false,
        minZ=73.74,
        maxZ=75.74,
        options = {
            {
              type = "client",
              event = "GG:Trucker",
              icon = "fas fa-shopping-cart",
              label = "Start Tracker",
              job = "trucker",
            },
        },
        distance = 3.0
    },
    ---------RepairStation
    ["RepairStation"] = {
        name = "RepairStation",
        coords = vector3(532.4, -176.82, 54.22),
        length = 6.4,
        width = 9.2,
        heading = 5,
        debugPoly = false,
        minZ=53.22,
        maxZ=57.22,
        options = {
            {
              type = "client",
              event = "khrp:fixCarS",
              icon = "fas fa-car",
              label = "Repair Vehicle",
            },
        },
        distance = 5.0
    },
    ---------HotDogStartJob
    ["HotDogStartJob"] = {
        name = "HotDogStartJob",
        coords = vector3(49.22, -1000.63, 29.34),
        length = 0.8,
        width = 1.4,
        heading = 340,
        debugPoly = false,
        minZ=28.34,
        maxZ=30.94,
        options = {
            {
              type = "client",
              event = "GG-Hotdog:Start",
              icon = "fas fa-car",
              label = "Start Hotdog",
              job = 'hotdog'
            },
            {
                type = "client",
                event = "GG-Hotdog:stop",
                icon = "fas fa-car",
                label = "Stop Hotdog",
                job = 'hotdog'
            },
        },
        distance = 5.0
    },
	
    ["weedpro"] = {
        name = 'weedpro',
        coords = vector3(2328.57, 2570.7, 46.68),
        length = 1.6,
        width = 1,
        heading = 60,
        debugPoly = false,
      minZ=43.08,
      maxZ=47.08,
              options = {
                {
                    type = "client",
                    event = "weed:process",
                    icon = "fas fa-leaf",
                    label = "Processing Weed",
                },
            },	
        distance = 2.5,	 
    },

   
    ["qb-tracker"] = {
        name = "1",
        coords = vector3(460.98, -986.47, 34.97),
        length = 1,
        width = 1,
        heading = 1,
        debugPoly=false,
        minZ=31.37,
        maxZ=35.37,
        options = {
            {
                label = "start tracking",
                event = "f17:tracking:use", 
                icon = "fas fa-broadcast-tower",
                job = "police",
            },
        },
        distance = 2.5
    },
    


    ["mechaniccraft"] = {
        name = "Mechanic Toolbox",
        coords = vector3(-327.28, -136.38, 39.01),
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
                label = "Craft",
                job = "tuner",
            },
        },
        distance = 2.5
    },

}

Config.PolyZones = {
    -- ["weazel01"] = {
    --     name = "weazel01",
    --     coords = vector3(-592.364, -929.826, 23.869),
    --     length = 1.00,
    --     width = 1.00,
    --     heading = 92.42,
    --     debugPoly = true,
    --     minZ = 23.00,
    --     maxZ = 25.00,
    --     options = {
    --         {
    --             type = "client",
    --             event = "qb-newsjob:client:menu",
    --             parameters = {},
    --             icon = "fas fa-newspaper",
    --             label = "Open Job Menu",
    --             --job = {"all"},
    --         },
    --     },
    --     distance = 2.5
    -- },

}

Config.TargetBones = {
    ["Vehicle"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r",
            "wheel_lr"
        },
        options = {
			{
				type = "client",
                event = "vehiclekeys:client:GiveKeys",
                icon = "fas fa-key",
                label = "GIVE KEYS",
			},
			{	
				type = "client",
                event = "police:client:PutPlayerInVehicle",
                icon = "fas fa-chevron-circle-left",
                label = "PLACE IN VEHICLE",
                job = {["police"] = 1, ["police"] = 2, ["police"] = 3, ["ambulance"] = 1, ["ambulance"] = 2, ["ambulance"] = 3},
			 },
			 {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-chevron-circle-right",
                label = "TAKE OUT OF VEHICLE",
                job = {["police"] = 1, ["ambulance"] = 2},
            },
            {
                type = "client",
                event = "police:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = 'police',
            },
            {
                type = "client",
                event = "mechanic:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "craft:vehmenu2",
                icon = "fas fa-wrench",
                label = "Examine Vehicle",
                job = 'mechanic',
            },
	        {
                type = "client",
                event = "qb-vehicleshop:client:showVehOptions",
                icon = "fas fa-car",
                label = "Vehicle Interaction",
                job = 'cardealer',
            },
            {
                type = "client",
                event = "qb-vehiclefailure:client:RepairVehicleFull",
                icon = "fas fa-wrench",
                label = "REPAIR VEHICLE",
                job = 'mechanic',
                item = "advancedrepairkit",
            },
            {
                type = "client",
                event = "repair:mechanic",
                icon = "fas fa-hand-sparkles",
                label = "CLEAN VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "qb-trunk:client:GetIn",
                icon = "fas fa-user-secret",
                label = "GET IN TRUNK",
            },
        
		},
		distance = 2.5,
	},
	-- ["bones"] = {
	-- 		bones = {
	-- 			'wheel_lr',
	-- 		},
	-- 		options = {
	-- 	  {
	-- 		type = "client",
	-- 		event = "lj-fuel:client:RefuelVehicle2",
	-- 		icon = "fas fa-gas-pump",
    --         --item = "weapon_petrolcan",
	-- 		label = "Refuel Vehicle 2",
	-- 	  },
	-- 		},
	-- 		  distance = 1.0
	-- 	},	
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
                    icon = "fas fa-key",
                    label = "Vehicle Menu",
                    job = "mechanic",
                },
            },
            distance = 3.0
        },
}

Config.TargetEntities = {

}

Config.TargetModels = {
    ---MaskShop
	
    ["MaskShop"] = {
        models = {
            `s_m_y_clown_01`,
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-mask",
                label = "Buy Masks",
            },
        },
        distance = 4.0
    },

    ["mesa_craft"] = {
        models = {
            "prop_tool_bench02_ld",
        },
        options = {
            {
                type = "client",
                event = "qb-crafting:client:AbrirMenuCraft",
                icon = "fas fa-table", 
                label = "Craft Things",
            },
            {
                type = "client",
                action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                    if IsPedAPlayer(entity) then return false end -- This will return false if the entity interacted with is a player and otherwise returns true
                    TriggerEvent('qb-crafting:client:EliminarMesa', entity) -- Triggers
                end,
                icon = "fas fa-table", 
                label = "Delete Table",
            },
                        {
                type = "client",
                event = "qb-crafting:client:VerificarPontos",
                icon = "fas fa-coins", 
                label = "Check Points",
            }
        },
        distance = 2.5,
    },
  
--   -- jewellery rob
--   --[[["jewelboxes"] = {
-- 	models = {
-- 		`des_jewel_cab3_start`,
-- 		`des_jewel_cab2_start`,
-- 		`des_jewel_cab_start`,
-- 		`des_jewel_cab4_start`,

-- 	},
-- 	options = {
-- 		{
-- 			type = "client",
-- 			event = "qb-jewellery:client:startbreakinglass",
-- 			icon = "fas fa-gem",
-- 			label = "Break Glass",
-- 		},
-- 	},
-- 	distance = 4.0
-- },]]

----- ATM Menu

-- ["atms"] = {        
-- 	models = {            
-- 		'prop_atm_01',            
-- 		'prop_atm_02',            
-- 		'prop_atm_03',            
-- 		'prop_fleeca_atm',        
-- 	},        
-- 	options = {            
-- 		{                
--             type = "client",
--             event = "qb-banking:client:atm:openUI",
--             icon = "fas fa-money-check",
--             label = "Access ATM",
-- 		},        
-- 	},        
-- 	distance = 1.0    
-- },


    --------- Blackmarket
    ["blackmarket"] = {
        models = {
            "g_m_m_chicold_01",
        },
        options = {
            {
                type = "client",
                event = "market:client:SellMenu",
                icon = "fas fa-theater-masks",
                label = "blackmarket",
            },
        },
        distance = 2.0
    },

    --degitalden
    ["degitalden"] = {
        models = {
            'ig_lifeinvad_01',
        },
        options = {
            {
                type = "client", 
                event = "qb-shops:marketshop",
                icon = 'fas fa-laptop', 
                label = 'Want to be a tech expart?',

            },
        },
        distance = 2.0
    },
	
    ['weedpick'] = {
        models = `prop_weed_02`,
        options = {
            {
                type = "client",
                event = "weee:pick", 
                icon = "fas fa-cannabis",
                label = "Picking Weed",
                --price = 5,
            },
        },
        distance = 2.5
    },
	
	    ["weedrunsped"] = {
        models = {
            "s_m_y_dealer_01",
        },
        options = {
            {
                type = "client",
                event = "qb-weedruns:client:PedirEntrega",
                icon = "fas fa-cannabis", 
                label = "طلب التسليم",
            },
            {
                type = "client",
                event = "qb-weedruns:client:ReceberPagamento",
                icon = "fas fa-dolar-sign", 
                label = "تحصيل الراتب",
                item = "weed_recive",
            }
        },
        distance = 2.5,
    },

    ["weedsell"] = {
        models = {
            "g_m_y_mexgang_01", 
        },
        options = {
            {
                type = "client",
                event = "weed:sell",
                icon = "fas fa-cannabis",
                label = "Sell WeedBag",
            },
        },
        distance = 2.5,
    },
	
		    ["weedsell2"] = {
        models = {
            "p_cs_laptop_02_w", 
        },
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-circle",
                label = "Boss Menu",
				job = "police"
            },
        },
        distance = 2.5,
    },

    ["burgershotgarage"] = {
        models = {
            "ig_floyd"
        },
        options = {
            {
                type = "client",
                event = "garage:BurgerShotGarage",
                icon = "fas fa-car",
                label = "BurgerShot Garage",
                job = "burgershot",
            }
        },
        distance = 2.5,
    },

	["trashsearch"] = {
        models = {
			-1096777189,--normal small
			666561306,--big
			1437508529,--small circle
			-1426008804,--small open circle
			-228596739,--open small circle
			161465839,--werid blue small circle
			651101403,--open medium circle
			218085040,
			682791951,
			1511880420,

        },
        options = {
            {
                type = "client",
                event = "qb-trashsearch:client:searchtrash",
                icon = "fas fa-pencil-ruler",
                label = "Search Trash",
            },
        },
        distance = 2.1
    },

    ["pesca-compra"] = {
        models = {
            "a_m_m_eastsa_01",

        },
        options = {
            {
                type = "client",
                event = "mt-fishing:client:AbrirLoja",
                icon = "fas fa-fish", 
                label = "Talk to emplyee",
            }
        },
        distance = 2.5,
    },
    ["pesca-venda"] = {
        models = {
            "a_f_m_fatbla_01",

        },
        options = {
            {
                type = "client",
                event = "mt-fishing:client:MenuVendas",
                icon = "fas fa-fish", 
                label = "Talk to girl",
            }
        },
        distance = 2.5,
    },

	["atm"] = {
		models = {-870868698, -1126237515, -1364697528, 506770882, 150237004, -239124254},
		options = {
			{
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-pencil-ruler",
                label = "Open ATM",
            },
		},
		distance = 2.1
	  },
	
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

    


    ["emsgarage"] = {
		models = {
			`s_m_y_pilot_01`
		},
		options = {
			{
				event = "garage:menu",
				icon = "fas fa-shopping-cart",
				label = "Take out EMS vehicle",
				job = "ambulance",
				
			},
		},
		distance = 4.5,
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
            event = "police:client:EscortPlayer", 
            icon = 'fas fa-circle', 
            label = 'Escort',
        },
        { 
            type = "client", 
            event = "police:client:RobPlayer", 
            icon = 'fas fa-circle', 
            label = 'Rob Player',
        },
        { 
            type = "client", 
            event = "A5:Client:TakeHostage", 
            icon = 'fas fa-circle', 
            label = 'Kidnap Player',
        },
    },
      distance = 2.5,

}




Config.Peds = {

    -- ['tuner'] =  { 
    --     model = 's_m_y_xmech_01',
    --     coords = vector4(149.0, -3050.15, 6.04, 56.86),
    --     gender = 'male',
    --     freeze = true,
    --     invincible = true,
    --     blockevents = true,
    --     scenario = "WORLD_HUMAN_CLIPBOARD",
    -- },
        
    
    ---Grandma 
   ["grandma"] = {
       model = "ig_mrs_thornhill",
       coords = vector4(1443.43, 6333.52, 23.88, 83.82),
       minusOne = true,
       freeze = true,
       invincible = true,
       blockevents = true,
       target = {
           options = {
               {
                   type = "client",
                   event = "grandma:client:healing",
                   icon = "fas fa-band-aid",
                   label = "Request Healing For 1200$",
               },
           },
           distance = 1.5,
       },
       currentpednumber = 0,
   },
   --GarbageJob Ped
   ["GarbagePed"] = {
       model = 's_m_y_garbage', 
       coords = vector4(-349.96, -1569.92, 25.22, 296.46),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       target = { 
           options = {
              {
                type = "server",
                event = "garbage:server:getGarbageJob",
                icon = "fas fa-sign-in-alt",
                label = "Get Garbage Job",
               },
              {
                type = "client",
                event = "garbage:getTruck",
                icon = "fas fa-sign-in-alt",
                label = "Get Garbage Truck",
               },
              {
                type = "server",
                event = "garbagejob:server:PayShift",
                icon = "fas fa-sign-in-alt",
                label = "Collect Pay Check",
               },
           },
           distance = 1.5,
       },
   },
   --Hunting
   ["Hunting"] = {
       model = "cs_hunter",
       coords = vector4(-679.72, 5839.01, 17.33, 226.23),
       minusOne = true, 
       freeze = true, 
       invincible = true, 
       blockevents = true,
       target = {
           options = {
               {
                   event = "qb-hunting:client:interactionEvent",
                   icon = "fas fa-circle",
                   label = "Buy Gear"
               },
               {
                   event = "qb-HuntingSell",
                   icon = "fas fa-circle",
                   label = "Sell meats"
               }
           }, 
           distnace = 2.0
       },
   },

    ["OxyPed"] = {
		model = 'a_m_m_og_boss_01', 
		coords = vector4(-1563.44, -441.36, 36.96, 97.07),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		scenario = 'WORLD_HUMAN_DRUG_DEALER',
		target = { 
			options = {
				{
					type="client",
					event = "oxyrun:client:sendToOxy",
					icon = "fas fa-user-secret",
					label = "Start Oxy"
				}
			},
		 distance = 3,
	 	}
	},

    ["Pharmacy"] = {
		model = 'g_m_y_lost_03', 
		coords = vector4(2885.22, 1519.04, 24.97, 1.08),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		scenario = 'WORLD_HUMAN_DRUG_DEALER',
		target = { 
			options = {
				{
					type="client",
					event = "openweaponshop",
					icon = "fas fa-user-secret",
					label = "Open Pharmacy"
				}
			},
		 distance = 3,
	 	}
	},
	
    [143] = {
        model = 's_m_y_dealer_01',
        coords = vector4(865.9, -3203.48, 4.98, 181.49),
        gender = 'male',
        freeze = true,
        invincible = false,
        blockevents = false,
    },

	["OxyBoxPed"] = {
		model = 'a_m_m_salton_03', 
		coords = vector4(-2981.43, 1586.23, 23.69, 13.68),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = {
			options = {
				{
					type="client",
					event = "oxyrun:client:getBox",
					icon = "fas fa-user-secret",
					label = "Grab Package"
				}
			},
		 distance = 3,
	 	}
	},
   
    

    [123] = {
        model = 's_m_m_doctor_01',
        coords = vector4(328.67, -590.88, 28.8, 334.36),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },


    
    [659] = { 
        model = `g_m_y_mexgang_01`, 
        coords = vector4(-1164.92, -1566.67, 3.45, 307.22),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },

    -- [4] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-47.87234, -1759.253, 29.420993, 59.485439),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    -- [5] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(2676.0439, 3280.5568, 55.24113, 336.40908),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- }, [7] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(2554.8686, 380.92068, 108.62292, 357.84951),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    -- [9] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(373.14135, 328.63272, 103.56636, 255.98464),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    -- [11] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-3041.194, 583.81359, 7.9089279, 19.277315),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [126] = {

        ---tunershop----
        model = 's_m_y_xmech_01',
	    coords = vector4(149.0, -3050.15, 6.04, 56.86),
	    gender = 'male',
        target = {

           
			options = {
                {
					event = "openweaponshop",
					icon = 'fas fa-circle',
					label = 'Open Shop',
                    job = 'tuner'
				}
			},
			distance = 2.0
        },
	    freeze = true,
	    invincible = true,
	    blockevents = true,
        scenario = "WORLD_HUMAN_CLIPBOARD",
    },
    -- [21] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-3244.653, 1000.1612, 12.830703, 356.74475),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },

    [639] = {
        model = `a_f_y_business_02`, -- Model name as a hash.
        coords = vector4(-592.364, -929.826, 23.869, 92.42), -- (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_CLIPBOARD', -- Task Scenario
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },

    -- [634] = {
    --     model = 'a_f_y_business_02',
    --     coords = vector4(-592.364, -929.826, 23.869, 92.42),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
        
    -- },
	[30] = {
        model = 'a_m_y_business_02',
        coords = vector4(-555.81, -185.86, 38.22, 209.5),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "mtc-cityhall:client:open",
					icon = 'fas fa-circle',
					label = 'City Hall',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
			    },

    [31] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(112.93, -747.05, 258.15, 337.15),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "cr-blackmarket:hmenu",
					icon = 'fas fa-circle',
					label = 'Black Market 💀',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
	    },
    [32] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(113.98, -747.47, 258.15, 341.14),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "gifmarket:openshop",
					icon = 'fas fa-circle',
					label = 'Black Market 💀',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
			    },
    [34] = {
        model = 's_m_m_doctor_01',
        coords = vector4(-506.84, 292.38, 83.39, 172.08),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "cr-mada:client:pharmacy",
					icon = 'fas fa-prescription-bottle',
					label = 'Pharmacy',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
					    },
    [35] = {
        model = 's_m_y_xmech_01',
        coords = vector4(948.52, -965.45, 39.75, 96.34),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "openmarket",
					icon = 'fas fa-circle',
					label = 'Mechanic',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
							    },
    [36] = {
        model = 'csb_trafficwarden',
        coords = vector4(444.41, -976.22, 43.69, 224.89),  
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "garage:menu",
					icon = 'fas fa-circle',
					label = 'Open Garage',
					job = 'police'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
									    },
    [37] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-1887.89, 2068.5, 145.54, 341.02),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-gangs:godfatherStash",
					icon = 'fas fa-circle',
					label = 'Stash',
					gang = 'godfather'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
											    },
    [38] = {
        model = 's_m_y_xmech_01',
        coords = vector4(566.86, -2775.57, 5.84, 331.16),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-gangs:natoStash",
					icon = 'fas fa-circle',
					label = 'Stash',
					gang = 'nato'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
													    },
    [39] = {
        model = 's_m_y_xmech_01',
        coords = vector4(426.98, -806.19, 29.49, 89.13),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
															    },
    [41] = {
        model = 's_m_y_xmech_01',
        coords = vector4(73.96, -1392.95, 29.38, 269.24),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																	    },
    [42] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-823.2, -1072.36, 11.33, 210.01),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																			    },
    [43] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-1193.82, -766.96, 17.32, 216.5),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																					    },
    [44] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-1448.63, -237.68, 49.81, 49.3),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																							    },
    [45] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-709.16, -151.45, 37.42, 118.63),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																									    },
    [46] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-165.05, -303.36, 39.73, 248.79),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																											    },
    [47] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-165.05, -303.36, 39.73, 248.79),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																													    },
    [411] = {
        model = 's_m_y_xmech_01',
        coords = vector4(126.93, -224.17, 54.56, 71.33),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																															    },
    [48] = {
        model = 's_m_y_xmech_01',
        coords = vector4(5.81, 6511.37, 31.88, 45.7),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																																	    },
    [49] = {
        model = 's_m_y_xmech_01',
        coords = vector4(612.96, 2762.74, 42.09, 278.78),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																																			    },
    [50] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-1102.41, 2711.58, 19.11, 219.17),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
															    },
    [51] = {
        model = 's_m_y_xmech_01',
        coords = vector4(1695.3, 4822.99, 42.06, 93.39),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																				    },
    [52] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-1568.23, -403.26, 48.01, 318.99),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-gangs:bloodsStash",
					icon = 'fas fa-circle',
					label = 'Stash',
					gang = 'bloods'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																																									    },
    [53] = {
        model = 's_m_y_xmech_01',
        coords = vector4(-77.69, 1009.86, 233.94, 231.31),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-gangs:badboysStash",
					icon = 'fas fa-circle',
					label = 'Stash',
					gang = 'badboys'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																																											    },
    [54] = {
        model = 's_m_y_xmech_01',
        coords = vector4(1250.6, 1883.23, 91.86, 352.91),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "cr-blackmarket:hmenu",
					icon = 'fas fa-circle',
					label = 'Talk',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																						    },
    [55] = {
        model = 's_m_y_xmech_01',
        coords = vector4(359.83, -1593.76, 25.45, 283.44),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-clothing:client:openMenu",
					icon = 'fas fa-circle',
					label = 'Change Of Clothes',
					job = 'swat'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																								    },
    [56] = {
        model = 's_m_y_cop_01',
        coords = vector4(377.68, -1606.16, 30.2, 47.84),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-policejob:ToggleDuty",
					icon = 'fas fa-circle',
					label = 'Duty',
					job = 'swat'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
																										    },
    [57] = {
        model = 's_m_y_cop_01',
        coords = vector4(377.83, -1633.4, 29.29, 320.19),
        currentpednumber = 0,
				target = {
			options = {
				{
					event = "qb-policegarage:client:OpenMenu",
					icon = 'fas fa-circle',
					label = 'Open Garage',
					job = 'swat'
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
	 
    },
	-- 377.83, y = -1633.4, z = 28.29, h = 320.19
	-- 	vector4(-77.69, 1009.86, 233.94, 231.31)
	-- 	coords = vector4(309.64569, -593.7731, 43.284057, 25.065393),              vector4(113.98, -747.47, 258.15, 34s
	-- },
    -- [33] = {
    --     model = "csb_trafficwarden",
    --     coords = vector4(-193.4324, -1162.354, 23.67136, 268.79577),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = "xz-garagqb-ido:client:requestOutOfImpound",
    --                 icon = "fas fa-circle",
    --                 label = "Impound"
    --             }
    --         }, 
    --         distnace = 2.0
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true, 
    --     minusOne = true,
    -- },
    -- [34] = {
    --     model = "cs_hunter",
    --     coords = vector4(-679.8368, 5838.8764, 17.331438, 222.90434),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = "starthunting",
    --                 icon = "fas fa-circle",
    --                 label = "Start Hunting"
    --             },
    --             {
    --                 event = "xz-hunting:server:sellMeat",
    --                 icon = "fas fa-circle",
    --                 label = "Sell meats"
    --             }
    --         }, 
    --         distnace = 2.0
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [35] = {
    --     model = 'cs_movpremmale',
    --     coords = vector4(-7.754626, 468.1943, 145.86357, 343.79757),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-pawnshop:client:trySell',
    --                 icon = 'fas fa-dollar-sign',
    --                 label = 'Sell Valuables'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(-7.754626, 468.1943, 145.86357)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [36] = {
    --     model = 'ig_lifeinvad_01',
    --     coords = vector4(48.492279, -1594.352, 29.59778, 49.147617),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-pawnshop:client:trySell',
    --                 icon = 'fas fa-dollar-sign',
    --                 label = 'Sell Hardware'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(48.492279, -1594.352, 29.59778)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [37] = {
    --     model = 'cs_old_man2',
    --     coords = vector4(-732.3901, -1312.173, 5.000379, 48.43991),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-phone:client:boatMenu',
    --                 icon = 'fas fa-key',
    --                 label = 'Rent a Boat'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(-732.3901, -1312.173, 5.000379)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [38] = {
    --     model = 'cs_old_man2',
    --     coords = vector4(3854.6093, 4458.9965, 1.8497662, 358.31735),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-phone:client:boatMenu',
    --                 icon = 'fas fa-key',
    --                 label = 'Rent a Boat'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(3854.6093, 4458.9965, 1.8497662)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [39] = {
    --     model = 'cs_old_man2',
    --     coords = vector4(-3425.839, 952.20977, 8.3466939, 356.87887),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-phone:client:boatMenu',
    --                 icon = 'fas fa-key',
    --                 label = 'Rent a Boat'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(-3425.839, 952.20977, 8.3466939)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },

    ["Bankpad2"] = {
		model = 'ig_bankman', 
		coords = vector4(-112.24, 6471.07, 31.63, 131.64),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },


    ["Huntingshop"] = {
		model = 'ig_hunter', 
		coords = vector4(-674.43, 5837.75, 17.34, 137.24),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "openweaponshop",
                icon = "fas fa-sign-in-alt",
                label = "Hunting Shop",
            },
		 },
		 distance = 1.5,
	 },

    },

    

    ["Bankpad3"] = {
		model = 'ig_bankman', 
		coords = vector4(1174.94, 2708.31, 38.09, 177.22),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },

    
    
    ["Bankpad4"] = {
		model = 'ig_bankman', 
		coords = vector4(-1212.03, -332.08, 37.78, 22.7),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },
    
    ["Bankpad5"] = {
		model = 'ig_bankman', 
		coords = vector4(-351.36, -51.34, 49.04, 343.25),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },

    
    ["Bankpad6"] = {
		model = 'ig_bankman', 
		coords = vector4(313.75, -280.52, 54.16, 341.44),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },


    
    ["Bankpad13"] = {
		model = 'ig_bankman', 
		coords = vector4(254.16, 222.42, 106.29, 157.98),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },
    ["Bankpad12"] = {
		model = 'ig_bankman', 
		coords = vector4(252.15, 223.17, 106.29, 163.41),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },

    ["Bankpad11"] = {
		model = 'ig_bankman', 
		coords = vector4(248.9, 224.39, 106.29, 161.93),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },
    
    ["Bankpad10"] = {
		model = 'ig_bankman', 
		coords = vector4(247.18, 225.08, 106.29, 156.86),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },
    ["Bankpad9"] = {
		model = 'ig_bankman', 
		coords = vector4(243.75, 226.24, 106.29, 154.25),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },

    ["Bankpad8"] = {
		model = 'ig_bankman', 
		coords = vector4(241.93, 226.88, 106.29, 162.03),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },

    ["Bankpad7"] = {
		model = 'ig_bankman', 
		coords = vector4(-2961.08, 483.04, 15.7, 83.94),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },
    ["GarbagePed"] = {
		model = 's_m_y_garbage', 
		coords = vector4(-349.96, -1569.92, 25.22, 296.46),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
			 {
				 type = "server",
				 event = "garbage:server:getGarbageJob",
				 icon = "fas fa-sign-in-alt",
				 label = "Get Garbage Job",
			 },
			 {
				 type = "client",
				 event = "garbage:getTruck",
				 icon = "fas fa-sign-in-alt",
				 label = "Get Garbage Truck",
			 },
			 {
				 type = "server",
				 event = "garbagejob:server:PayShift",
				 icon = "fas fa-sign-in-alt",
				 label = "Collect Pay Check",
			 },
		 },
		 distance = 1.5,
	 },
 },

 ["bankped"] = {
	model = `ig_bankman`,
	coords = vector4(149.46, -1042.09, 29.37, 335.43),
	minusOne = true, 
	freeze = true, 
	invincible = true, 
	blockevents = true,
	target = { 
	  options = {
		 {
			 type = "client",
			 event = "qb-banking:openBankScreen",
			 icon = "fas fa-sign-in-alt",
			 label = "Open Bank",
		 },
	 },
	 distance = 1.5,
    },
},

}


-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = function(items)
			local isTable = type(items) == 'table'
			local isArray = isTable and table.type(items) == 'array' or false
			local finalcount = 0
			local count = 0
			if isTable then for _ in pairs(items) do finalcount += 1 end end
			for _, v in pairs(PlayerData.items) do
				if isTable then
					if isArray then -- Table expected in this format {'itemName1', 'itemName2', 'etc'}
						for _, item in pairs(items) do
							if v and v.name == item then
								count += 1
							end
						end
					else -- Table expected in this format {['itemName'] = amount}
						local itemAmount = items[v.name]
						if itemAmount and v and v.amount >= itemAmount then
							count += 1
						end
					end
					if count == finalcount then -- This is to make sure it checks all items in the table instead of only one of the items
						return true
					end
				else -- When items is a string
					if v and v.name == items then
						return true
					end
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
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end