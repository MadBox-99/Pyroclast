-- Pyroclast minable ore resources: Scrap (common) and Components (rare).
-- Both deepcopied from Fulgora's scrap entity for the scattered mechanical parts look.
-- Pyroclast-scrap is a separate item from Fulgora's scrap to prevent recycling exploits
-- (Fulgora's scrap-recycling recipe gives free base game items).
--
-- Components use resource_autoplace (same system as iron-ore/copper-ore) for proper
-- patch density. Scrap uses property_expression_names overrides in pyroclast.lua.

local resource_autoplace = require("resource-autoplace")
resource_autoplace.initialize_patch_set("pyroclast-components", false, "pyroclast")

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

local base = data.raw.resource["scrap"]

-- ── Pyroclast Scrap: common resource, grey-brown tint (war salvage) ──────────
local scrap_tint = { r = 0.55, g = 0.50, b = 0.40, a = 1 }

local pyroclast_scrap = table.deepcopy(base)
pyroclast_scrap.name      = "pyroclast-scrap"
pyroclast_scrap.icon      = "__Pyroclast__/graphics/icons/scrap.png"
pyroclast_scrap.icon_size = 64
pyroclast_scrap.icons     = nil
pyroclast_scrap.order     = "g[pyroclast-scrap]"
pyroclast_scrap.map_color = { r = 0.55, g = 0.50, b = 0.40 }
pyroclast_scrap.mining_visualisation_tint = scrap_tint
pyroclast_scrap.minable   = {
    mining_time = 1,
    result = "pyroclast-scrap",
}
-- Autoplace uses property_expression_names override (see pyroclast.lua + noise expressions)
pyroclast_scrap.autoplace = {
    control = "pyroclast_scrap",
    order = "c",
    probability_expression = 0,
}
if pyroclast_scrap.stages then
    tint_all_sprites(pyroclast_scrap.stages, scrap_tint)
end
if pyroclast_scrap.stages_effect then
    tint_all_sprites(pyroclast_scrap.stages_effect, scrap_tint)
end

-- ── Pyroclast Components: rare resource, blue-green tint (exotic crystalline metal) ──
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
-- Use the same autoplace system as iron-ore/copper-ore for proper patch density
pyroclast_components.autoplace = resource_autoplace.resource_autoplace_settings{
    name = "pyroclast-components",
    autoplace_control_name = "pyroclast_components",
    order = "c",
    base_density = 6,
    regular_rq_factor_multiplier = 1.10,
    candidate_spot_count = 22,
    has_starting_area_placement = false,
}
if pyroclast_components.stages then
    tint_all_sprites(pyroclast_components.stages, comp_tint)
end
if pyroclast_components.stages_effect then
    tint_all_sprites(pyroclast_components.stages_effect, comp_tint)
end

data:extend({ pyroclast_scrap, pyroclast_components })
