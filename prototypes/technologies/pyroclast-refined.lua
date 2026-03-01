data:extend({{
    type = "technology",
    name = "pyroclast-refined",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/rmat.png",
            icon_size = 64,
            scale = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "rmat" },
    },
    prerequisites = { "pyroclast-materials" },
    unit = {
        count = 400,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
        },
        time = 30
    },
    order = "c-a-f[pyroclast-refined]"
}})
