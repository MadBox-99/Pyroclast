data:extend({
    -- Pyroclast Repair Pack
    {
        type = "recipe",
        name = "pyroclast-repair-pack",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 8,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "repair-pack", amount = 2 },
            { type = "item",  name = "cmat",        amount = 5 },
            { type = "item",  name = "bmat",        amount = 3 },
            { type = "fluid", name = "lava",        amount = 100 },
        },
        results = {
            { type = "item", name = "pyroclast-repair-pack", amount = 2 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Defender Capsule
    {
        type = "recipe",
        name = "pyroclast-defender-capsule",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 10,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "defender-capsule", amount = 3 },
            { type = "item",  name = "rmat",             amount = 4 },
            { type = "item",  name = "assmat1",          amount = 2 },
            { type = "fluid", name = "lava",             amount = 150 },
        },
        results = {
            { type = "item", name = "pyroclast-defender-capsule", amount = 3 },
        },
        allow_productivity = true,
    },
})
