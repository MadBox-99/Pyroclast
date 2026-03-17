data:extend({ {
    type = "recipe",
    name = "pyroclast-heavy-oil",
    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
    category = "chemistry",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-c[pyroclast-heavy-oil]",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item", name = "sulfur",   amount = 10 },
        { type = "item", name = "obsidian", amount = 10 },
    },
    results = {
        { type = "fluid", name = "heavy-oil", amount = 50 },
    },
    allow_productivity = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
} })