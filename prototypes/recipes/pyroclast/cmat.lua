return {
    type = "recipe",
    name = "cmat",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 10,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   }
    },
    ingredients = {
        { type = "item",  name = "pyroclast-components", amount = 5   },
        { type = "fluid", name = "lava",                 amount = 400 },
    },
    results = {
        { type = "item", name = "cmat", amount = 5 },
    },
    icons = {
        {
            icon = "__base__/graphics/icons/steel-plate.png",
            icon_size = 64,
            tint = { r = 0.35, g = 0.4, b = 0.3, a = 1 }
        },
        {
            icon = "__space-age__/graphics/icons/fluid/lava.png",
            icon_size = 64,
            scale = 0.25,
            shift = { -8, -8 },
        },
    },
    allow_productivity = true,
}
