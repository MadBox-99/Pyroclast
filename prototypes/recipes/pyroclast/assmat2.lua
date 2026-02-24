return {
    type = "recipe",
    name = "assmat2",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 12,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "assmat1", amount = 5 },
        { type = "item",  name = "cmat",    amount = 5 },
        { type = "fluid", name = "lava",    amount = 200 },
    },
    results = {
        { type = "item", name = "assmat2", amount = 5 },
    },
    allow_productivity = true,
}
