-- Pyroclast Ammo Facility: military factory for producing ammunition and
-- ordnance from Pyroclast war materials.
-- Deepcopied from assembling-machine-3 and scaled up to 7x7.
-- Only placeable on Pyroclast (surface_conditions).

local SCALE = 7 / 3  -- 2.33x scale factor (3x3 → 7x7)

local facility = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
facility.name         = "pyroclast-ammo-facility"
facility.icons        = {{ icon = "__Pyroclast__/graphics/icons/ammo-facility.png", icon_size = 64 }}
facility.icon         = nil
facility.icon_size    = nil
facility.minable      = { mining_time = 1.5, result = "pyroclast-ammo-facility" }
facility.placeable_by = { item = "pyroclast-ammo-facility", count = 1 }
facility.next_upgrade = nil
facility.fast_replaceable_group = nil

facility.surface_conditions = {
    { property = "pressure", min = 6000, max = 6000 },
    { property = "gravity",  min = 60,   max = 60   },
}

facility.crafting_categories = { "crafting", "advanced-crafting", "crafting-with-fluid" }
facility.crafting_speed = 3
facility.map_color = { r = 0.35, g = 0.45, b = 0.25 }

-- Scale up from 3x3 to 7x7
facility.collision_box  = {{ -3.4, -3.4 }, { 3.4, 3.4 }}
facility.selection_box  = {{ -3.5, -3.5 }, { 3.5, 3.5 }}

-- Scale fluid box pipe connections to match 7x7 footprint
if facility.fluid_boxes then
    for _, box in pairs(facility.fluid_boxes) do
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

-- Custom rendered graphics (replaces scaled assembling-machine sprites)
local function facility_sprite(direction)
    return {
        filename = "__Pyroclast__/graphics/entity/ammo-facility/ammo-facility-" .. direction .. ".png",
        width = 384,
        height = 384,
        frame_count = 1,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        scale = 0.58,
        priority = "high",
    }
end

facility.graphics_set = {
    animation = {
        north = facility_sprite("north"),
        east  = facility_sprite("east"),
        south = facility_sprite("south"),
        west  = facility_sprite("west"),
    },
}
facility.working_visualisations = nil

-- Higher energy for the larger building
facility.energy_usage = "800kW"

-- Module slots
facility.module_slots = 4

data:extend({ facility })
