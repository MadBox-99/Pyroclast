data:extend({{
    type = "recipe",
    name = "assmat3",
    category = "pyroclast-refining",
    enabled = false,
    energy_required = 15,
    surface_conditions = {
        { property = "pressure", min = 6000, max = 6000 },
        { property = "gravity",  min = 60,   max = 60 },
    },
    ingredients = {
        { type = "item",  name = "assmat2", amount = 5 },
        { type = "item",  name = "rmat",    amount = 5 },
        { type = "item",  name = "emat",    amount = 3 },
        { type = "fluid", name = "lava",    amount = 300 },
    },
    results = {
        { type = "item", name = "assmat3", amount = 3 },
    },
    allow_productivity = true,
}})
