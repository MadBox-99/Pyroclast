data:extend({{
    type = "recipe",
    name = "emat",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 10,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "pyroclast-scrap", amount = 12  },
        { type = "fluid", name = "lava",            amount = 200 },
    },
    results = {
        { type = "item", name = "emat", amount = 5 },
    },
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/emat.png",
            icon_size = 64,
        },
        {
            icon = "__space-age__/graphics/icons/fluid/lava.png",
            icon_size = 64,
            scale = 0.25,
            shift = { -8, -8 },
        },
    },
    allow_productivity = true,
}})
