data:extend({{
    type = "technology",
    name = "pyroclast-radar-tech",
    icons = {
        {
            icon = "__base__/graphics/icons/radar.png",
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
        { type = "unlock-recipe", recipe = "pyroclast-radar" },
    },
    prerequisites = { "pyroclast-assembly-1", "pyroclast-refined" },
    unit = {
        count = 400,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 30,
    },
    order = "c-a-l[pyroclast-radar-tech]",
}})
