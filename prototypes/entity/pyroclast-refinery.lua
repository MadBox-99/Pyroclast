-- Pyroclast Refinery: processes scrap and components into war materials.
-- Deepcopied from the Space Age foundry (5x5) and scaled up to 7x7 for an
-- imposing volcanic forge. Only placeable on Pyroclast (surface_conditions).
-- Built-in +150% productivity; productivity modules are NOT allowed.

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
refinery.drawing_box    = {{ -4.0, -4.5 }, { 4.0, 3.5 }}

-- Always show pipe connections (and allow rotation) even without a fluid recipe
refinery.fluid_boxes_off_when_no_fluid_recipe = false

-- Replace fluid_boxes entirely to remove all working visualisation references.
-- Foundry has 2 inputs (south) + 2 outputs (north); we keep the same layout
-- with positions scaled to fit our 7x7 footprint.
refinery.fluid_boxes = {
    {
        production_type = "input",
        volume = 1000,
        pipe_connections = {
            { flow_direction = "input", direction = defines.direction.south, position = { -1, 3 } },
        },
    },
    {
        production_type = "input",
        volume = 1000,
        pipe_connections = {
            { flow_direction = "input", direction = defines.direction.south, position = { 1, 3 } },
        },
    },
    {
        production_type = "output",
        volume = 100,
        pipe_connections = {
            { flow_direction = "output", direction = defines.direction.north, position = { -1, -3 } },
        },
    },
    {
        production_type = "output",
        volume = 100,
        pipe_connections = {
            { flow_direction = "output", direction = defines.direction.north, position = { 1, -3 } },
        },
    },
}

-- Custom rendered graphics (replaces foundry sprites)
local function refinery_sprite(direction)
    return {
        filename = "__Pyroclast__/graphics/entity/refinery/refinery-" .. direction .. ".png",
        width = 384,
        height = 384,
        frame_count = 1,
        line_length = 1,
        shift = util.by_pixel(0, -16),
        scale = 0.74,
        priority = "high",
    }
end

refinery.graphics_set = {
    animation = {
        north = refinery_sprite("north"),
        east  = refinery_sprite("west"),
        south = refinery_sprite("south"),
        west  = refinery_sprite("east"),
    },
}

-- Remove all working visualisations (we use simple static sprites)
refinery.working_visualisations = nil

-- Higher energy for the larger building (foundry = 2500kW, ours = 3500kW)
refinery.energy_usage = "3500kW"

-- Remove foundry-specific heating requirement (Pyroclast has lava, not cold)
refinery.heating_energy = nil

data:extend({ refinery })
