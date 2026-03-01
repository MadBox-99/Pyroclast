data:extend({{
    type = "recipe",
    name = "bmat",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 5,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   }
    },
    ingredients = {
        { type = "item",  name = "pyroclast-scrap", amount = 8   },
        { type = "fluid", name = "lava",            amount = 300 },
    },
    results = {
        { type = "item", name = "bmat", amount = 8 },
    },
    icons = {
        {
            icon = "__Pyroclast__/graphics/icons/bmat.png",
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
