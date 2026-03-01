data:extend({{
    type            = "recipe",
    name            = "pyroclast-refinery",
    category        = "crafting-with-fluid",
    enabled         = false,
    energy_required = 45,
    ingredients = {
        { type = "item",  name = "steel-plate",       amount = 30  },
        { type = "item",  name = "iron-gear-wheel",    amount = 20  },
        { type = "item",  name = "electronic-circuit", amount = 15  },
        { type = "item",  name = "pipe",               amount = 20  },
        { type = "fluid", name = "lava",               amount = 800 },
    },
    results = {
        { type = "item", name = "pyroclast-refinery", amount = 1 },
    },
}})
