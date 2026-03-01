-- Pyroclast-exclusive robots: +50% speed, +100% HP
-- Deepcopied from base construction-robot and logistic-robot.

local con = table.deepcopy(data.raw["construction-robot"]["construction-robot"])
con.name = "pyroclast-construction-robot"
con.icons = {
    { icon = "__base__/graphics/icons/construction-robot.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
con.icon = nil
con.icon_size = nil
con.minable = { mining_time = 0.1, result = "pyroclast-construction-robot" }
con.placeable_by = { item = "pyroclast-construction-robot", count = 1 }
con.speed = con.speed * 1.5
con.max_health = con.max_health * 2

local log = table.deepcopy(data.raw["logistic-robot"]["logistic-robot"])
log.name = "pyroclast-logistic-robot"
log.icons = {
    { icon = "__base__/graphics/icons/logistic-robot.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
log.icon = nil
log.icon_size = nil
log.minable = { mining_time = 0.1, result = "pyroclast-logistic-robot" }
log.placeable_by = { item = "pyroclast-logistic-robot", count = 1 }
log.speed = log.speed * 1.5
log.max_health = log.max_health * 2

data:extend({ con, log })
