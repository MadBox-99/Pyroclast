-- Pyroclast Factory: general-purpose manufacturing building for producing
-- enhanced equipment from Pyroclast war materials.
-- Deepcopied from assembling-machine-3 and scaled up to 7x7.
-- Only placeable on Pyroclast (surface_conditions).

local SCALE = 7 / 3  -- 2.33x scale factor (3x3 -> 7x7)

local factory = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
factory.name         = "pyroclast-factory"
factory.icons        = {
    { icon = "__base__/graphics/icons/assembling-machine-3.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/bmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
factory.icon         = nil
factory.icon_size    = nil
factory.minable      = { mining_time = 1.5, result = "pyroclast-factory" }
factory.placeable_by = { item = "pyroclast-factory", count = 1 }
factory.next_upgrade = nil
factory.fast_replaceable_group = nil

factory.surface_conditions = {
    { property = "pressure", min = 6000, max = 6000 },
    { property = "gravity",  min = 60,   max = 60   },
}

factory.crafting_categories = { "pyroclast-manufacturing" }
factory.crafting_speed = 2.5
factory.map_color = { r = 0.25, g = 0.35, b = 0.55 }

-- Scale up from 3x3 to 7x7
factory.collision_box  = {{ -3.4, -3.4 }, { 3.4, 3.4 }}
factory.selection_box  = {{ -3.5, -3.5 }, { 3.5, 3.5 }}

-- Scale fluid box pipe connections to match 7x7 footprint
if factory.fluid_boxes then
    for _, box in pairs(factory.fluid_boxes) do
        if type(box) == "table" and box.pipe_connections then
            for _, conn in pairs(box.pipe_connections) do
                if conn.position then
                    conn.position = {
                        conn.position[1] * SCALE,
                        conn.position[2] * SCALE,
                    }
                end
            end
        end
    end
end

-- Reuse ammo-facility sprites with blue tint for placeholder graphics
local tint = { r = 0.5, g = 0.6, b = 0.9, a = 1 }

local function factory_sprite(direction)
    return {
        filename = "__Pyroclast__/graphics/entity/ammo-facility/ammo-facility-" .. direction .. ".png",
        width = 384,
        height = 384,
        frame_count = 1,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        scale = 0.58,
        priority = "high",
        tint = tint,
    }
end

factory.graphics_set = {
    animation = {
        north = factory_sprite("north"),
        east  = factory_sprite("east"),
        south = factory_sprite("south"),
        west  = factory_sprite("west"),
    },
}
factory.working_visualisations = nil

-- Higher energy for the larger building
factory.energy_usage = "900kW"

-- Module slots
factory.module_slots = 4

data:extend({ factory })
