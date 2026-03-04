data:extend({
    -- Pyroclast Grenade
    {
        type = "recipe",
        name = "pyroclast-grenade",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 6,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "grenade", amount = 5 },
            { type = "item",  name = "emat",    amount = 5 },
            { type = "item",  name = "bmat",    amount = 2 },
            { type = "fluid", name = "lava",    amount = 100 },
        },
        results = {
            { type = "item", name = "pyroclast-grenade", amount = 5 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Cluster Grenade
    {
        type = "recipe",
        name = "pyroclast-cluster-grenade",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 12,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "cluster-grenade", amount = 3 },
            { type = "item",  name = "hemat",           amount = 5 },
            { type = "item",  name = "emat",            amount = 8 },
            { type = "fluid", name = "lava",            amount = 300 },
        },
        results = {
            { type = "item", name = "pyroclast-cluster-grenade", amount = 3 },
        },
        allow_productivity = true,
    },
})
