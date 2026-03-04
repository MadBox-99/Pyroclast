data:extend({
    -- Tier 1: Modular Armor + Power Armor
    {
        type = "technology",
        name = "pyroclast-uniforms",
        icons = {
            {
                icon      = "__base__/graphics/icons/power-armor.png",
                icon_size = 64,
                scale     = 2,
            },
            {
                icon      = "__Pyroclast__/graphics/icons/rmat.png",
                icon_size = 64,
                scale     = 0.5,
                shift     = {-16, 16},
            },
        },
        effects = {
            { type = "unlock-recipe", recipe = "pyroclast-modular-armor" },
            { type = "unlock-recipe", recipe = "pyroclast-power-armor" },
        },
        prerequisites = { "pyroclast-factory", "pyroclast-assembly-2", "power-armor" },
        unit = {
            count = 4000,
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
                { "pyroclast-science-pack",       1 },
            },
            time = 60,
        },
        order = "c-a-o[pyroclast-uniforms]",
    },
    -- Tier 2: Power Armor MK2 + Mech Armor
    {
        type = "technology",
        name = "pyroclast-uniforms-2",
        icons = {
            {
                icon      = "__base__/graphics/icons/power-armor-mk2.png",
                icon_size = 64,
                scale     = 2,
            },
            {
                icon      = "__Pyroclast__/graphics/icons/hemat.png",
                icon_size = 64,
                scale     = 0.5,
                shift     = {-16, 16},
            },
        },
        effects = {
            { type = "unlock-recipe", recipe = "pyroclast-power-armor-mk2" },
            { type = "unlock-recipe", recipe = "pyroclast-mech-armor" },
        },
        prerequisites = { "pyroclast-uniforms", "pyroclast-assembly-4", "power-armor-mk2", "mech-armor" },
        unit = {
            count = 6000,
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
                { "pyroclast-science-pack",       1 },
            },
            time = 60,
        },
        order = "c-a-o[pyroclast-uniforms-2]",
    },
})
