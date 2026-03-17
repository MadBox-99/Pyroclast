data:extend({ {
    type = "recipe",
    name = "pyroclast-rocket-fuel",
    category = "chemistry",
    enabled = false,
    energy_required = 15,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "emat",      amount = 5 },
        { type = "fluid", name = "heavy-oil", amount = 100 },
    },
    results = {
        { type = "item", name = "rocket-fuel", amount = 1 },
    },
    icons = {
        {
            icon = "__base__/graphics/icons/rocket-fuel.png",
            icon_size = 64,
        },
        {
            icon = "__Pyroclast__/graphics/icons/emat.png",
            icon_size = 64,
            scale = 0.25,
            shift = { -8, -8 },
        },
    },
    allow_productivity = true,
} })