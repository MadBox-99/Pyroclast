data:extend({{
    type = "recipe",
    name = "pyroclast-artillery-shell",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 15,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "artillery-shell", amount = 4 },
        { type = "item",  name = "emat",            amount = 10 },
        { type = "item",  name = "bmat",            amount = 5 },
        { type = "fluid", name = "lava",            amount = 500 },
    },
    results = {
        { type = "item", name = "pyroclast-artillery-shell", amount = 4 },
    },
    allow_productivity = true,
}})
