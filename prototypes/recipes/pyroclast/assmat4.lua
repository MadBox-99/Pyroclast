return {
    type = "recipe",
    name = "assmat4",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 20,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "assmat3", amount = 3 },
        { type = "item",  name = "hemat",   amount = 3 },
        { type = "item",  name = "rmat",    amount = 3 },
        { type = "fluid", name = "lava",    amount = 500 },
    },
    results = {
        { type = "item", name = "assmat4", amount = 2 },
    },
    allow_productivity = true,
}
