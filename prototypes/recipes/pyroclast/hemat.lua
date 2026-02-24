return {
    type = "recipe",
    name = "hemat",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 15,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "pyroclast-scrap", amount = 10  },
        { type = "fluid", name = "sulfuric-acid",   amount = 100 },
        { type = "fluid", name = "lava",            amount = 500 },
    },
    results = {
        { type = "item", name = "hemat", amount = 3 },
    },
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/hemat.png",
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
}
