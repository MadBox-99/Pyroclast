-- Pyroclast Coal Power Plant: boiler that burns solid fuel to produce steam.
-- Deepcopied from boiler, scaled to 3x3 with custom graphics.
-- Only placeable on Pyroclast (surface_conditions).

local boiler = table.deepcopy(data.raw["boiler"]["boiler"])
boiler.name         = "pyroclast-coal-generator"
boiler.icons        = {{ icon = "__Pyroclast__/graphics/icons/coal-generator.png", icon_size = 64 }}
boiler.icon         = nil
boiler.icon_size    = nil
boiler.minable      = { mining_time = 1.5, result = "pyroclast-coal-generator" }
boiler.placeable_by = { item = "pyroclast-coal-generator", count = 1 }
boiler.next_upgrade = nil
boiler.fast_replaceable_group = nil

boiler.surface_conditions = {
    { property = "pressure", min = 6000, max = 6000 },
    { property = "gravity",  min = 60,   max = 60   },
}

boiler.map_color = { r = 0.30, g = 0.30, b = 0.35 }

-- 3x3 footprint
boiler.collision_box  = {{ -1.4, -1.4 }, { 1.4, 1.4 }}
boiler.selection_box  = {{ -1.5, -1.5 }, { 1.5, 1.5 }}

-- Higher energy consumption = more steam output
boiler.energy_consumption = "3.6MW"
boiler.target_temperature = 165

-- Pipe connections scaled to 3x3
if boiler.fluid_box then
    boiler.fluid_box.pipe_connections = {
        { flow_direction = "input-output", direction = defines.direction.south, position = { 0, 1 } },
    }
end
if boiler.output_fluid_box then
    boiler.output_fluid_box.pipe_connections = {
        { flow_direction = "output", direction = defines.direction.north, position = { 0, -1 } },
    }
end

-- Custom 4-directional sprites (scale 0.56 for visible size on 3x3)
local function boiler_sprite(direction)
    return {
        structure = {
            layers = {
                {
                    filename = "__Pyroclast__/graphics/entity/coal-generator/coal-generator-" .. direction .. ".png",
                    width = 384,
                    height = 384,
                    frame_count = 1,
                    shift = util.by_pixel(0, 0),
                    scale = 0.56,
                    priority = "high",
                },
            },
        },
    }
end

boiler.pictures = {
    north = boiler_sprite("south"),
    east  = boiler_sprite("east"),
    south = boiler_sprite("north"),
    west  = boiler_sprite("west"),
}

data:extend({ boiler })
