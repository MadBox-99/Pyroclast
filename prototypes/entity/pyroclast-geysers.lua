-- Molten-iron and molten-copper geysers for Pyroclast.
-- Deepcopied from sulfuric-acid-geyser; tints and fluid overridden for each type.
-- Extracted by offshore pump (resource category = "basic-fluid").
-- Autoplace probability is 0 by default; Pyroclast planet overrides it via
-- property_expression_names in map_gen_settings.

local function tint_all_animations(node, tint)
    if type(node) ~= "table" then return end
    if node.filename or node.filenames then
        node.tint = tint
    else
        for _, v in pairs(node) do
            tint_all_animations(v, tint)
        end
    end
end

local base = data.raw.resource["sulfuric-acid-geyser"]

-- Molten iron: blue-grey matching the molten-iron fluid color {0.2, 0.68, 0.93}
local iron_tint = { r = 0.30, g = 0.65, b = 0.90, a = 0.8 }

-- Molten copper: distinctive copper-orange
local copper_tint = { r = 0.90, g = 0.45, b = 0.10, a = 0.8 }

-- Helper: apply tint to ALL visual fields of a geyser entity
local function tint_geyser(geyser, tint)
    if geyser.stateless_visualisation then
        tint_all_animations(geyser.stateless_visualisation, tint)
    end
    if geyser.stages then
        tint_all_animations(geyser.stages, tint)
    end
    if geyser.stages_effect then
        tint_all_animations(geyser.stages_effect, tint)
    end
end

local molten_iron_geyser = table.deepcopy(base)
molten_iron_geyser.name      = "molten-iron-geyser"
molten_iron_geyser.icon      = "__space-age__/graphics/icons/fluid/molten-iron.png"
molten_iron_geyser.icon_size = 64
molten_iron_geyser.order     = "e"
molten_iron_geyser.map_color = { r = 0.55, g = 0.60, b = 0.70 }
molten_iron_geyser.minable   = {
    mining_time = 1,
    results = {
        { type = "fluid", name = "molten-iron", amount_min = 10, amount_max = 10, probability = 1 }
    }
}
molten_iron_geyser.autoplace = { control = "pyroclast_iron_geyser", order = "c", probability_expression = 0 }
tint_geyser(molten_iron_geyser, iron_tint)

local molten_copper_geyser = table.deepcopy(base)
molten_copper_geyser.name      = "molten-copper-geyser"
molten_copper_geyser.icon      = "__space-age__/graphics/icons/fluid/molten-copper.png"
molten_copper_geyser.icon_size = 64
molten_copper_geyser.order     = "f"
molten_copper_geyser.map_color = { r = 0.85, g = 0.45, b = 0.10 }
molten_copper_geyser.minable   = {
    mining_time = 1,
    results = {
        { type = "fluid", name = "molten-copper", amount_min = 10, amount_max = 10, probability = 1 }
    }
}
molten_copper_geyser.autoplace = { control = "pyroclast_copper_geyser", order = "c", probability_expression = 0 }
tint_geyser(molten_copper_geyser, copper_tint)

data:extend({ molten_iron_geyser, molten_copper_geyser })
