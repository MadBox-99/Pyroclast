-- Pyroclast Refinery: processes scrap and components into war materials.
-- Deepcopied from chemical-plant (3x3 with fluid pipes).
-- Only placeable on Pyroclast (surface_conditions).

local refinery = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
refinery.name         = "pyroclast-refinery"
refinery.icons        = {{ icon = "__base__/graphics/icons/chemical-plant.png", icon_size = 64, tint = { r = 0.70, g = 0.35, b = 0.10, a = 1 } }}
refinery.icon         = nil
refinery.icon_size    = nil
refinery.minable      = { mining_time = 0.5, result = "pyroclast-refinery" }
refinery.placeable_by = { item = "pyroclast-refinery", count = 1 }
refinery.next_upgrade = nil
refinery.fast_replaceable_group = nil

refinery.surface_conditions = {
    { property = "pressure", min = 6000, max = 6000 },
    { property = "gravity",  min = 60,   max = 60   },
}

refinery.crafting_categories = { "pyroclast-refining" }
refinery.map_color = { r = 0.70, g = 0.35, b = 0.10 }

data:extend({ refinery })
