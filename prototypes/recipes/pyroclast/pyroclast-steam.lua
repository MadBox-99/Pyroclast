data:extend({ {
    type = "recipe",
    name = "pyroclast-acid-neutralisation",
    icon = "__space-age__/graphics/icons/fluid/acid-neutralisation.png",
    categories = { "chemistry", "cryogenics" },
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-b[pyroclast-acid-neutralisation]",
    auto_recycle = false,
    enabled = false,
    energy_required = 10,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "calcite",       amount = 1 },
        { type = "item",  name = "obsidian",       amount = 2 },
        { type = "fluid", name = "sulfuric-acid", amount = 1000 },
    },
    results = {
        { type = "fluid", name = "steam", amount = 10000, temperature = 500 },
    },
    allow_productivity = false,
    allow_decomposition = false,
} })