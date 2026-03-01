data:extend({{
    type = "technology",
    name = "pyroclast-coal-generator",
    icons = {
        {
            icon      = "__Pyroclast__/graphics/icons/coal-generator.png",
            icon_size = 64,
            scale     = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-coal-generator" },
    },
    prerequisites = { "planet-discovery-pyroclast" },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 30,
    },
    order = "c-a-g[pyroclast-coal-generator]",
}})
