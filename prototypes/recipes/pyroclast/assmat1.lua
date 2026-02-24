return {
    type = "recipe",
    name = "assmat1",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 8,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "bmat", amount = 5 },
        { type = "item",  name = "emat", amount = 2 },
        { type = "fluid", name = "lava", amount = 100 },
    },
    results = {
        { type = "item", name = "assmat1", amount = 5 },
    },
    allow_productivity = true,
}
