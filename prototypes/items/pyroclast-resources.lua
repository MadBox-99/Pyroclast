local pyroclast_scrap = {
    type       = "item",
    name       = "pyroclast-scrap",
    icon       = "__Pyroclast__/graphics/icons/scrap.png",
    icon_size  = 64,
    subgroup   = "raw-resource",
    order      = "a[pyroclast-scrap]",
    stack_size = 200,
}

local pyroclast_components = {
    type       = "item",
    name       = "pyroclast-components",
    icon       = "__Pyroclast__/graphics/icons/components.png",
    icon_size  = 64,
    subgroup   = "raw-resource",
    order      = "b[pyroclast-components]",
    stack_size = 100,
}

data:extend({ pyroclast_scrap, pyroclast_components })
