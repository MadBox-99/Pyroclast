return {
    type = "technology",
    name = "pyroclast-assembly-4",
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/assmat4.png",
            icon_size = 64,
            scale = 2,
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "assmat4" },
        { type = "unlock-recipe", recipe = "pyroclast-rocket-silo" },
    },
    prerequisites = { "pyroclast-assembly-3", "pyroclast-heavy-explosives" },
    unit = {
        count = 600,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "production-science-pack",  1 },
            { "metallurgic-science-pack", 1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 60
    },
    upgrade = true,
    order = "c-a-h[pyroclast-assembly-4]"
}
