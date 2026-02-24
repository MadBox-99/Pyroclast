return {
    type = "technology",
    name = "pyroclast-refinery",
    icons = {
        {
            icon      = "__base__/graphics/icons/chemical-plant.png",
            icon_size = 64,
            tint      = { r = 0.70, g = 0.35, b = 0.10, a = 1 },
            scale     = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-refinery" },
    },
    prerequisites = { "planet-discovery-pyroclast" },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
        },
        time = 30,
    },
    order = "c-a-c[pyroclast-refinery]",
}
