-- Components: rare minable ore resource for Pyroclast.
-- Deepcopied from iron-ore (standard mining drill target).
-- Autoplace probability is 0 by default; Pyroclast planet overrides it via
-- property_expression_names in map_gen_settings.
-- Note: Scrap uses the Space Age built-in scrap entity (from Fulgora).

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

-- Components: rare resource, blue-green (exotic crystalline metal)
local comp_tint = { r = 0.30, g = 0.55, b = 0.70, a = 1 }

local pyroclast_components = table.deepcopy(base)
pyroclast_components.name      = "pyroclast-components"
pyroclast_components.icon      = "__Pyroclast__/graphics/icons/components.png"
pyroclast_components.icon_size = 64
pyroclast_components.icons     = nil
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

return { pyroclast_components }
