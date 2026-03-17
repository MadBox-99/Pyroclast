data:extend({ {
    type = "recipe",
    name = "pyroclast-sulfur",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 100 },
        { type = "item",  name = "calcite",       amount = 5 },
        { type = "item",  name = "copper-plate",  amount = 5 },
    },
    results = {
        { type = "item", name = "sulfur", amount = 10 },
    },
    icons = {
        {
            icon = "__base__/graphics/icons/sulfur.png",
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
} })