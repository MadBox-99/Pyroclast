return {
    type            = "recipe",
    name            = "pyroclast-refinery",
    category        = "crafting-with-fluid",
    enabled         = false,
    energy_required = 30,
    ingredients = {
        { type = "item",  name = "steel-plate",       amount = 20  },
        { type = "item",  name = "iron-gear-wheel",    amount = 15  },
        { type = "item",  name = "electronic-circuit", amount = 10  },
        { type = "item",  name = "pipe",               amount = 10  },
        { type = "fluid", name = "lava",               amount = 500 },
    },
    results = {
        { type = "item", name = "pyroclast-refinery", amount = 1 },
    },
}
