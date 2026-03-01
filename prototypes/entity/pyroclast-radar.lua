-- Pyroclast Radar: +100% scan range
-- Deepcopied from base radar.

local radar = table.deepcopy(data.raw["radar"]["radar"])
radar.name = "pyroclast-radar"
radar.icons = {
    { icon = "__base__/graphics/icons/radar.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
radar.icon = nil
radar.icon_size = nil
radar.minable = { mining_time = 0.5, result = "pyroclast-radar" }
radar.placeable_by = { item = "pyroclast-radar", count = 1 }
radar.next_upgrade = nil
radar.fast_replaceable_group = nil
radar.max_distance_of_sector_revealed = radar.max_distance_of_sector_revealed * 2
radar.max_distance_of_nearby_sector_revealed = radar.max_distance_of_nearby_sector_revealed * 2

data:extend({ radar })
