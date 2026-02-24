-- Pyroclast Refinery: processes scrap and components into war materials.
-- Deepcopied from the Space Age foundry (5x5) and scaled up to 7x7 for an
-- imposing volcanic forge. Only placeable on Pyroclast (surface_conditions).
-- Built-in +150% productivity; productivity modules are NOT allowed.

local SCALE = 7 / 5  -- 1.4x scale factor (5x5 → 7x7)

-- Recursively scale all sprite `scale` values and `shift` vectors in a table.
local function scale_graphics(node, factor)
    if type(node) ~= "table" then return end
    -- Scale the `scale` property if it exists
    if node.scale then
        node.scale = node.scale * factor
    end
    -- Scale `shift` if present (2-element array: {x, y})
    if node.shift and type(node.shift) == "table" and #node.shift == 2 then
        node.shift = { node.shift[1] * factor, node.shift[2] * factor }
    end
    -- Recurse into sub-tables (layers, animations, etc.)
    for k, v in pairs(node) do
        if type(v) == "table" and k ~= "shift" then
            scale_graphics(v, factor)
        end
    end
end

-- Scale a bounding box {{x1,y1},{x2,y2}} by a factor
local function scale_box(box, factor)
    return {
        { box[1][1] * factor, box[1][2] * factor },
        { box[2][1] * factor, box[2][2] * factor },
    }
end

local refinery = table.deepcopy(data.raw["assembling-machine"]["foundry"])
refinery.name         = "pyroclast-refinery"
refinery.icons        = {{ icon = "__Pyroclast__/graphics/icons/refinery.png", icon_size = 64 }}
refinery.icon         = nil
refinery.icon_size    = nil
refinery.minable      = { mining_time = 1, result = "pyroclast-refinery" }
refinery.placeable_by = { item = "pyroclast-refinery", count = 1 }
refinery.next_upgrade = nil
refinery.fast_replaceable_group = nil

refinery.surface_conditions = {
    { property = "pressure", min = 6000, max = 6000 },
    { property = "gravity",  min = 60,   max = 60   },
}

refinery.crafting_categories = { "pyroclast-refining" }
refinery.crafting_speed = 4
refinery.map_color = { r = 0.70, g = 0.35, b = 0.10 }

-- Built-in +150% productivity (like foundry's +50%, but tripled)
refinery.effect_receiver = { base_effect = { productivity = 1.5 } }

-- Allow speed, efficiency, and quality modules — but NOT productivity
refinery.allowed_effects = { "consumption", "speed", "pollution", "quality" }
refinery.module_slots = 4

-- Scale up from 5x5 to 7x7
refinery.collision_box  = {{ -3.4, -3.4 }, { 3.4, 3.4 }}
refinery.selection_box  = {{ -3.5, -3.5 }, { 3.5, 3.5 }}
if refinery.drawing_box then
    refinery.drawing_box = scale_box(refinery.drawing_box, SCALE)
end

-- Scale fluid box pipe connection positions to match 7x7 footprint.
-- Foundry has 2 inputs (south) and 2 outputs (north).
if refinery.fluid_boxes then
    for _, box in pairs(refinery.fluid_boxes) do
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

-- Scale all graphics (animations, working_visualisations, etc.) to fit 7x7
scale_graphics(refinery.graphics_set, SCALE)
scale_graphics(refinery.working_visualisations, SCALE)

-- Higher energy for the larger building (foundry = 2500kW, ours = 3500kW)
refinery.energy_usage = "3500kW"

-- Remove foundry-specific heating requirement (Pyroclast has lava, not cold)
refinery.heating_energy = nil

data:extend({ refinery })
