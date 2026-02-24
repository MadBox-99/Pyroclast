return {
    type = "technology",
    name = "pyroclast-assembly-1",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/assmat1.png",
            icon_size = 64,
            scale = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "assmat1" },
    },
    prerequisites = { "pyroclast-materials" },
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
    upgrade = true,
    order = "c-a-h[pyroclast-assembly-1]"
}
