return {
    type = "technology",
    name = "pyroclast-heavy-explosives",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/hemat.png",
            icon_size = 64,
            scale = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "hemat" },
    },
    prerequisites = { "pyroclast-explosives", "pyroclast-refined" },
    unit = {
        count = 500,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 45
    },
    order = "c-a-g[pyroclast-heavy-explosives]"
}
