data:extend({{
    type = "recipe",
    name = "pyroclast-plastic",
    category = "chemistry",
    enabled = false,
    energy_required = 10,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "obsidian",      amount = 5   },
        { type = "fluid", name = "sulfuric-acid", amount = 100 },
    },
    results = {
        { type = "item", name = "plastic-bar", amount = 5 },
    },
    icons = {
        {
            icon = "__base__/graphics/icons/plastic-bar.png",
            icon_size = 64,
        },
        {
            icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
            icon_size = 64,
            scale = 0.25,
            shift = { -8, -8 },
        },
    },
    allow_productivity = true,
}})