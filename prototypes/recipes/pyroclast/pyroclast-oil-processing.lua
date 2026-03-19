data:extend({ {
    type = "recipe",
    name = "pyroclast-oil-processing",
    icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
    category = "oil-processing",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-e[pyroclast-oil-processing]",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "pyroclast-scrap", amount = 10 },
        { type = "fluid", name = "heavy-oil",       amount = 25, ignored_by_stats = 25 },
        { type = "fluid", name = "steam",            amount = 50 },
    },
    results = {
        { type = "fluid", name = "heavy-oil",      amount = 90, ignored_by_stats = 25, ignored_by_productivity = 25 },
        { type = "fluid", name = "light-oil",       amount = 20 },
        { type = "fluid", name = "petroleum-gas",   amount = 10 },
    },
    allow_productivity = true,
    allow_decomposition = false,
} })