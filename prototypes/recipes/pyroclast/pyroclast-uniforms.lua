data:extend({
    -- Pyroclast Modular Armor
    {
        type = "recipe",
        name = "pyroclast-modular-armor",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 25,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "modular-armor", amount = 1 },
            { type = "item",  name = "rmat",          amount = 8 },
            { type = "item",  name = "assmat2",       amount = 5 },
            { type = "fluid", name = "lava",          amount = 500 },
        },
        results = {
            { type = "item", name = "pyroclast-modular-armor", amount = 1 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Power Armor
    {
        type = "recipe",
        name = "pyroclast-power-armor",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 40,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "power-armor", amount = 1 },
            { type = "item",  name = "rmat",        amount = 15 },
            { type = "item",  name = "assmat3",     amount = 5 },
            { type = "fluid", name = "lava",        amount = 1000 },
        },
        results = {
            { type = "item", name = "pyroclast-power-armor", amount = 1 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Power Armor MK2
    {
        type = "recipe",
        name = "pyroclast-power-armor-mk2",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 60,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "power-armor-mk2", amount = 1 },
            { type = "item",  name = "hemat",            amount = 10 },
            { type = "item",  name = "assmat4",          amount = 5 },
            { type = "fluid", name = "lava",             amount = 2000 },
        },
        results = {
            { type = "item", name = "pyroclast-power-armor-mk2", amount = 1 },
        },
        allow_productivity = true,
    },
    -- Pyroclast Mech Armor
    {
        type = "recipe",
        name = "pyroclast-mech-armor",
        category = "pyroclast-manufacturing",
        enabled = false,
        energy_required = 60,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item",  name = "mech-armor", amount = 1 },
            { type = "item",  name = "hemat",      amount = 10 },
            { type = "item",  name = "assmat4",    amount = 8 },
            { type = "fluid", name = "lava",       amount = 2000 },
        },
        results = {
            { type = "item", name = "pyroclast-mech-armor", amount = 1 },
        },
        allow_productivity = true,
    },
})
