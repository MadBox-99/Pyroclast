data:extend({{
    type = "technology",
    name = "pyroclast-small-arms",
    icons = {
        {
            icon      = "__base__/graphics/icons/firearm-magazine.png",
            icon_size = 64,
            scale     = 2,
        },
        {
            icon      = "__Pyroclast__/graphics/icons/bmat.png",
            icon_size = 64,
            scale     = 0.5,
            shift     = {-16, 16},
        },
    },
    effects = {
        { type = "unlock-recipe", recipe = "pyroclast-firearm-magazine" },
        { type = "unlock-recipe", recipe = "pyroclast-piercing-rounds-magazine" },
        { type = "unlock-recipe", recipe = "pyroclast-uranium-rounds-magazine" },
        { type = "unlock-recipe", recipe = "pyroclast-shotgun-shell" },
    },
    prerequisites = { "pyroclast-factory", "uranium-ammo" },
    unit = {
        count = 3000,
        ingredients = {
            { "automation-science-pack",    1 },
            { "logistic-science-pack",      1 },
            { "military-science-pack",      1 },
            { "chemical-science-pack",      1 },
            { "production-science-pack",    1 },
            { "utility-science-pack",       1 },
            { "space-science-pack",           1 },
            { "electromagnetic-science-pack", 1 },
            { "metallurgic-science-pack",     1 },
            { "pyroclast-science-pack",     1 },
        },
        time = 60,
    },
    order = "c-a-m[pyroclast-small-arms]",
}})
