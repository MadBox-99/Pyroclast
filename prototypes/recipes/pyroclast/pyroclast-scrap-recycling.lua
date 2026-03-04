data:extend({{
    type = "recipe",
    name = "pyroclast-scrap-recycling",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 8,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "pyroclast-scrap", amount = 20 },
        { type = "fluid", name = "sulfuric-acid",   amount = 100 },
    },
    results = {
        { type = "item", name = "iron-plate",   amount = 8,  probability = 0.5  },
        { type = "item", name = "steel-plate",  amount = 4,  probability = 0.3  },
        { type = "item", name = "copper-plate", amount = 6,  probability = 0.4  },
        { type = "item", name = "calcite",      amount = 5,  probability = 0.35 },
    },
    icons = {
        { icon = "__base__/graphics/icons/iron-plate.png",   icon_size = 64, scale = 0.5, shift = {-8, -8} },
        { icon = "__base__/graphics/icons/steel-plate.png",  icon_size = 64, scale = 0.3, shift = {8, -8}  },
        { icon = "__base__/graphics/icons/copper-plate.png", icon_size = 64, scale = 0.3, shift = {-8, 8}  },
        { icon = "__space-age__/graphics/icons/calcite.png",      icon_size = 64, scale = 0.3, shift = {8, 8}   },
    },
    allow_productivity = true,
}})
