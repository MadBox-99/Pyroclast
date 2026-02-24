return {
    type = "technology",
    name = "pyroclast-mpf",
    icons = {
        {
            icon      = "__Pyroclast__/graphics/icons/mpf.png",
            icon_size = 64,
            scale     = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-mpf" },
    },
    prerequisites = { "pyroclast-assembly-3" },
    unit = {
        count = 800,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 60,
    },
    order = "c-a-i[pyroclast-mpf]",
}
