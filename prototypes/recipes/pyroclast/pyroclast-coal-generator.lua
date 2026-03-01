data:extend({{
    type            = "recipe",
    name            = "pyroclast-coal-generator",
    category        = "crafting",
    enabled         = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "steel-plate",       amount = 40 },
        { type = "item", name = "iron-gear-wheel",    amount = 20 },
        { type = "item", name = "electronic-circuit", amount = 10 },
        { type = "item", name = "pipe",               amount = 20 },
        { type = "item", name = "stone-brick",        amount = 30 },
    },
    results = {
        { type = "item", name = "pyroclast-coal-generator", amount = 1 },
    },
}})
