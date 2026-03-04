data:extend({
    -- Pyroclast Firearm Magazine
    {
        type = "recipe",
        name = "pyroclast-firearm-magazine",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 5,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "firearm-magazine", amount = 5 },
            { type = "item",  name = "bmat",             amount = 3 },
            { type = "fluid", name = "lava",             amount = 50 },
        },
        results = {
            { type = "item", name = "pyroclast-firearm-magazine", amount = 5 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Piercing Rounds Magazine
    {
        type = "recipe",
        name = "pyroclast-piercing-rounds-magazine",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 8,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "piercing-rounds-magazine", amount = 5 },
            { type = "item",  name = "emat",                     amount = 5 },
            { type = "item",  name = "bmat",                     amount = 2 },
            { type = "fluid", name = "lava",                     amount = 100 },
        },
        results = {
            { type = "item", name = "pyroclast-piercing-rounds-magazine", amount = 5 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Uranium Rounds Magazine
    {
        type = "recipe",
        name = "pyroclast-uranium-rounds-magazine",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 12,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "uranium-rounds-magazine", amount = 5 },
            { type = "item",  name = "hemat",                   amount = 3 },
            { type = "item",  name = "emat",                    amount = 5 },
            { type = "fluid", name = "lava",                    amount = 200 },
        },
        results = {
            { type = "item", name = "pyroclast-uranium-rounds-magazine", amount = 5 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Shotgun Shell
    {
        type = "recipe",
        name = "pyroclast-shotgun-shell",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 5,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "shotgun-shell", amount = 5 },
            { type = "item",  name = "bmat",          amount = 4 },
            { type = "fluid", name = "lava",          amount = 50 },
        },
        results = {
            { type = "item", name = "pyroclast-shotgun-shell", amount = 5 },
        },
        allow_productivity = true,
    },
})
