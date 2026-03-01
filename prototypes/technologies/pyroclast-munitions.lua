data:extend({{
    type = "technology",
    name = "pyroclast-munitions",
    icons = {
        {
            icon = "__base__/graphics/icons/artillery-shell.png",
            icon_size = 64,
            scale = 2,
        },
        {
            icon = "__Pyroclast__/graphics/icons/emat.png",
            icon_size = 64,
            scale = 0.5,
            shift = {-16, 16},
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-artillery-shell" },
        { type = "unlock-recipe", recipe = "pyroclast-rocket" },
    },
    prerequisites = { "pyroclast-explosives", "pyroclast-ammo-facility", "artillery", "rocketry" },
    unit = {
        count = 500,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "military-science-pack",    1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 45,
    },
    order = "c-a-i[pyroclast-munitions]",
}})
