-- Pyroclast robot items (place the enhanced robot entities)

local con_item = {
    type = "item",
    name = "pyroclast-construction-robot",
    icons = {
        { icon = "__base__/graphics/icons/construction-robot.png", icon_size = 64 },
        { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
    },
    subgroup = "logistic-network",
    order = "a[robot]-b[pyroclast-construction-robot]",
    place_result = "pyroclast-construction-robot",
    stack_size = 50,
}

local log_item = {
    type = "item",
    name = "pyroclast-logistic-robot",
    icons = {
        { icon = "__base__/graphics/icons/logistic-robot.png", icon_size = 64 },
        { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
    },
    subgroup = "logistic-network",
    order = "a[robot]-c[pyroclast-logistic-robot]",
    place_result = "pyroclast-logistic-robot",
    stack_size = 50,
}

data:extend({ con_item, log_item })
