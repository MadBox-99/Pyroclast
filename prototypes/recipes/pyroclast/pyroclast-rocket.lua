data:extend({{
    type = "recipe",
    name = "pyroclast-rocket",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "explosive-rocket", amount = 5 },
        { type = "item",  name = "emat",             amount = 8 },
        { type = "item",  name = "assmat1",          amount = 2 },
        { type = "fluid", name = "lava",             amount = 200 },
    },
    results = {
        { type = "item", name = "pyroclast-rocket", amount = 5 },
    },
    allow_productivity = true,
}})
