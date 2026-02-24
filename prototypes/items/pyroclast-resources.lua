local pyroclast_scrap = {
    type       = "item",
    name       = "pyroclast-scrap",
    icons = {
        {
            icon      = "__base__/graphics/icons/iron-ore.png",
            icon_size = 64,
            tint      = { r = 0.55, g = 0.50, b = 0.40, a = 1 },
        },
    },
    subgroup   = "raw-resource",
    order      = "b[pyroclast-scrap]",
    stack_size = 200,
}

local pyroclast_components = {
    type       = "item",
    name       = "pyroclast-components",
    icons = {
        {
            icon      = "__base__/graphics/icons/iron-ore.png",
            icon_size = 64,
            tint      = { r = 0.30, g = 0.55, b = 0.70, a = 1 },
        },
    },
    subgroup   = "raw-resource",
    order      = "b[pyroclast-components]",
    stack_size = 100,
}

return { pyroclast_scrap, pyroclast_components }
