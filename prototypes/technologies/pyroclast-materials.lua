data:extend({{
    type = "technology",
    name = "pyroclast-materials",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/bmat.png",
            icon_size = 64,
            scale = 2,
            shift = { -16, 0 },
        },
        {
            icon = "__Pyroclast__/graphics/icons/cmat.png",
            icon_size = 64,
            scale = 2,
            shift = { 16, 0 },
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "bmat" },
        { type = "unlock-recipe", recipe = "cmat" },
    },
    prerequisites = { "pyroclast-refinery" },
    unit = {
        count = 300,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
        },
        time = 30
    },
    order = "c-a-d[pyroclast-materials]"
}})
