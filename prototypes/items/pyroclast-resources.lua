-- Note: Scrap uses the Space Age built-in scrap item (from Fulgora).

local pyroclast_components = {
    type       = "item",
    name       = "pyroclast-components",
    icon       = "__Pyroclast__/graphics/icons/components.png",
    icon_size  = 64,
    subgroup   = "raw-resource",
    order      = "b[pyroclast-components]",
    stack_size = 100,
}

return { pyroclast_components }
