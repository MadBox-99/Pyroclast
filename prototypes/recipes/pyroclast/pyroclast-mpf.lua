data:extend({{
    type            = "recipe",
    name            = "pyroclast-mpf",
    category        = "crafting-with-fluid",
    enabled         = false,
    energy_required = 120,
    ingredients = {
        { type = "item",  name = "steel-plate",        amount = 100 },
        { type = "item",  name = "iron-gear-wheel",     amount = 50  },
        { type = "item",  name = "advanced-circuit",    amount = 30  },
        { type = "item",  name = "pipe",                amount = 40  },
        { type = "item",  name = "pyroclast-refinery",  amount = 2   },
        { type = "fluid", name = "lava",                amount = 2000 },
    },
    results = {
        { type = "item", name = "pyroclast-mpf", amount = 1 },
    },
}})
