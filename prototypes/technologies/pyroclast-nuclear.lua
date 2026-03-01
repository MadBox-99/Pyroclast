data:extend({{
    type = "technology",
    name = "pyroclast-nuclear",
    icons = {
        {
            icon = "__base__/graphics/icons/atomic-bomb.png",
            icon_size = 64,
            scale = 2,
        },
        {
            icon = "__Pyroclast__/graphics/icons/hemat.png",
            icon_size = 64,
            scale = 0.5,
            shift = {-16, 16},
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-atomic-bomb" },
    },
    prerequisites = { "pyroclast-heavy-explosives", "pyroclast-munitions", "atomic-bomb" },
    unit = {
        count = 800,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "military-science-pack",    1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 60,
    },
    order = "c-a-j[pyroclast-nuclear]",
}})
