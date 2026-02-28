-- Pyroclast Mass Production Factory: massive 11x11 building for bulk material
-- production. Same recipes as the Refinery, but with +50% built-in productivity.
-- Deepcopied from oil-refinery (5x5) and scaled up to 11x11.
-- Only placeable on Pyroclast (surface_conditions).

local SCALE = 11 / 5  -- 2.2x scale factor (5x5 → 11x11)


local mpf = table.deepcopy(data.raw["assembling-machine"]["oil-refinery"])
mpf.name         = "pyroclast-mpf"
mpf.icons        = {{ icon = "__Pyroclast__/graphics/icons/mpf.png", icon_size = 64 }}
mpf.icon         = nil
mpf.icon_size    = nil
mpf.minable      = { mining_time = 2, result = "pyroclast-mpf" }
mpf.placeable_by = { item = "pyroclast-mpf", count = 1 }
mpf.next_upgrade = nil
mpf.fast_replaceable_group = nil

mpf.surface_conditions = {
    { property = "pressure", min = 6000, max = 6000 },
    { property = "gravity",  min = 60,   max = 60   },
}

mpf.crafting_categories = { "pyroclast-refining" }
mpf.crafting_speed = 2
mpf.base_productivity = 0.5  -- +50% free output
mpf.map_color = { r = 0.50, g = 0.20, b = 0.10 }

-- Scale up from 5x5 to 11x11
mpf.collision_box  = {{ -5.4, -5.4 }, { 5.4, 5.4 }}
mpf.selection_box  = {{ -5.5, -5.5 }, { 5.5, 5.5 }}
if mpf.drawing_box then
    mpf.drawing_box = {
        { mpf.drawing_box[1][1] * SCALE, mpf.drawing_box[1][2] * SCALE },
        { mpf.drawing_box[2][1] * SCALE, mpf.drawing_box[2][2] * SCALE },
    }
end

-- Scale fluid box pipe connection positions to match 11x11 footprint
if mpf.fluid_boxes then
    for _, box in pairs(mpf.fluid_boxes) do
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

-- Custom rendered graphics (replaces scaled oil-refinery sprites)
local function mpf_sprite(direction)
    return {
        filename = "__Pyroclast__/graphics/entity/mpf/mpf-" .. direction .. ".png",
        width = 384,
        height = 384,
        frame_count = 1,
        line_length = 1,
        shift = util.by_pixel(0, 0),
        scale = 1.0,
        priority = "high",
    }
end

mpf.graphics_set = {
    animation = {
        north = mpf_sprite("north"),
        east  = mpf_sprite("east"),
        south = mpf_sprite("south"),
        west  = mpf_sprite("west"),
    },
}
mpf.working_visualisations = nil

-- High energy for the massive building
mpf.energy_usage = "1200kW"

-- Module slots for further productivity/speed upgrades
mpf.module_slots = 5

data:extend({ mpf })
