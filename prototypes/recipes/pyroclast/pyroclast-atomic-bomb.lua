data:extend({{
    type = "recipe",
    name = "pyroclast-atomic-bomb",
    category = "pyroclast-manufacturing",
    enabled = false,
    energy_required = 30,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "atomic-bomb", amount = 1 },
        { type = "item",  name = "hemat",       amount = 10 },
        { type = "item",  name = "assmat3",     amount = 5 },
        { type = "fluid", name = "lava",        amount = 2000 },
    },
    results = {
        { type = "item", name = "pyroclast-atomic-bomb", amount = 1 },
    },
    allow_productivity = true,
}})
