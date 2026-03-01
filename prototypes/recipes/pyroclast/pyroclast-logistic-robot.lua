data:extend({{
    type = "recipe",
    name = "pyroclast-logistic-robot",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 15,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "logistic-robot", amount = 1 },
        { type = "item",  name = "assmat2",        amount = 3 },
        { type = "item",  name = "rmat",           amount = 2 },
        { type = "fluid", name = "lava",           amount = 100 },
    },
    results = {
        { type = "item", name = "pyroclast-logistic-robot", amount = 1 },
    },
    allow_productivity = true,
}})
