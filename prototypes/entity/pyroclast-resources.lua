-- Scrap and Components: solid minable ore resources for Pyroclast.
-- Deepcopied from iron-ore (standard mining drill target).
-- Autoplace probability is 0 by default; Pyroclast planet overrides it via
-- property_expression_names in map_gen_settings.

local function tint_all_sprites(node, tint)
    if type(node) ~= "table" then return end
    if node.filename or node.filenames then
        node.tint = tint
    else
        for _, v in pairs(node) do
            tint_all_sprites(v, tint)
        end
    end
end

local base = data.raw.resource["iron-ore"]

-- Scrap: common resource, grey-brown (twisted metal debris on volcanic ash)
local scrap_tint = { r = 0.55, g = 0.50, b = 0.40, a = 1 }

local pyroclast_scrap = table.deepcopy(base)
pyroclast_scrap.name      = "pyroclast-scrap"
pyroclast_scrap.icons     = {{ icon = "__base__/graphics/icons/iron-ore.png", icon_size = 64, tint = scrap_tint }}
pyroclast_scrap.icon      = nil
pyroclast_scrap.icon_size = nil
pyroclast_scrap.order     = "g[pyroclast-scrap]"
pyroclast_scrap.map_color = { r = 0.55, g = 0.50, b = 0.40 }
pyroclast_scrap.mining_visualisation_tint = scrap_tint
pyroclast_scrap.minable   = {
    mining_time = 1,
    result = "pyroclast-scrap",
}
pyroclast_scrap.autoplace = { order = "c", probability_expression = 0 }
if pyroclast_scrap.stages then
    tint_all_sprites(pyroclast_scrap.stages, scrap_tint)
end
if pyroclast_scrap.stages_effect then
    tint_all_sprites(pyroclast_scrap.stages_effect, scrap_tint)
end

-- Components: rare resource, blue-green (exotic crystalline metal)
local comp_tint = { r = 0.30, g = 0.55, b = 0.70, a = 1 }

local pyroclast_components = table.deepcopy(base)
pyroclast_components.name      = "pyroclast-components"
pyroclast_components.icons     = {{ icon = "__base__/graphics/icons/iron-ore.png", icon_size = 64, tint = comp_tint }}
pyroclast_components.icon      = nil
pyroclast_components.icon_size = nil
pyroclast_components.order     = "h[pyroclast-components]"
pyroclast_components.map_color = { r = 0.30, g = 0.55, b = 0.70 }
pyroclast_components.mining_visualisation_tint = comp_tint
pyroclast_components.minable   = {
    mining_time = 2,
    result = "pyroclast-components",
}
pyroclast_components.autoplace = { order = "c", probability_expression = 0 }
if pyroclast_components.stages then
    tint_all_sprites(pyroclast_components.stages, comp_tint)
end
if pyroclast_components.stages_effect then
    tint_all_sprites(pyroclast_components.stages_effect, comp_tint)
end

return { pyroclast_scrap, pyroclast_components }
