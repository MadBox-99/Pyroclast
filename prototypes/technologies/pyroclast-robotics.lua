data:extend({{
    type = "technology",
    name = "pyroclast-robotics",
    icons = {
        {
            icon = "__base__/graphics/icons/construction-robot.png",
            icon_size = 64,
            scale = 2,
        },
        {
            icon = "__Pyroclast__/graphics/icons/rmat.png",
            icon_size = 64,
            scale = 0.5,
            shift = {-16, 16},
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-construction-robot" },
        { type = "unlock-recipe", recipe = "pyroclast-logistic-robot" },
    },
    prerequisites = { "pyroclast-assembly-2", "pyroclast-refined", "construction-robotics", "logistic-robotics" },
    unit = {
        count = 600,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 45,
    },
    order = "c-a-k[pyroclast-robotics]",
}})
