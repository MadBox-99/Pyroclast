return {
    type = "technology",
    name = "pyroclast-ammo-facility",
    icons = {
        {
            icon      = "__Pyroclast__/graphics/icons/ammo-facility.png",
            icon_size = 64,
            scale     = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-ammo-facility" },
    },
    prerequisites = { "pyroclast-materials" },
    unit = {
        count = 400,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "military-science-pack",    1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 45,
    },
    order = "c-a-h[pyroclast-ammo-facility]",
}
