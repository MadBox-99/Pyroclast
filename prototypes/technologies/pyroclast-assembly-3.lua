data:extend({{
    type = "technology",
    name = "pyroclast-assembly-3",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/assmat3.png",
            icon_size = 64,
            scale = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "assmat3" },
    },
    prerequisites = { "pyroclast-assembly-2", "pyroclast-refined" },
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
    upgrade = true,
    order = "c-a-h[pyroclast-assembly-3]"
}})
