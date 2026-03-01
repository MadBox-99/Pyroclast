data:extend({{
    type = "recipe",
    name = "pyroclast-radar",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 15,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60   },
    },
    ingredients = {
        { type = "item",  name = "radar",   amount = 1 },
        { type = "item",  name = "rmat",    amount = 5 },
        { type = "item",  name = "assmat1", amount = 3 },
        { type = "fluid", name = "lava",    amount = 200 },
    },
    results = {
        { type = "item", name = "pyroclast-radar", amount = 1 },
    },
    allow_productivity = true,
}})
