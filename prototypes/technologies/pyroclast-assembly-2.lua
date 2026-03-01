data:extend({{
    type = "technology",
    name = "pyroclast-assembly-2",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/assmat2.png",
            icon_size = 64,
            scale = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "assmat2" },
    },
    prerequisites = { "pyroclast-assembly-1" },
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
    upgrade = true,
    order = "c-a-h[pyroclast-assembly-2]"
}})
