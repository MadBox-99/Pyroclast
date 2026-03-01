-- Restricts cargo drops to Pyroclast until this technology is researched.
-- Uses PlanetsLib's cargo drops system: blocks all drops by default,
-- whitelisted items/entity types are exempt (see data-updates.lua).

local cargo_drops = PlanetsLib.cargo_drops_technology_base(
    "pyroclast",
    "__space-age__/graphics/technology/vulcanus.png",
    256
)

-- Override icons with tinted Pyroclast variant (base Vulcanus icon is wrong color)
local pyroclast_icon = {
    icon = "__space-age__/graphics/technology/vulcanus.png",
    icon_size = 256,
    tint = { r = 0.25, g = 0.08, b = 0.08, a = 1 },
}

cargo_drops.icons = { pyroclast_icon }

for _, effect in pairs(cargo_drops.effects or {}) do
    if effect.icons then
        for _, layer in pairs(effect.icons) do
            if layer.icon == "__space-age__/graphics/technology/vulcanus.png" and not layer.tint then
                layer.tint = { r = 0.25, g = 0.08, b = 0.08, a = 1 }
            end
        end
    end
    if effect.icon == "__space-age__/graphics/technology/vulcanus.png" and not effect.tint then
        effect.tint = { r = 0.25, g = 0.08, b = 0.08, a = 1 }
    end
end

-- Override PlanetsLib auto-generated locale with our own
cargo_drops.localised_name = { "technology-name.planetslib-pyroclast-cargo-drops" }
cargo_drops.localised_description = { "technology-description.planetslib-pyroclast-cargo-drops" }

cargo_drops.prerequisites = { "planet-discovery-pyroclast" }
cargo_drops.unit = {
    count = 500,
    ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "chemical-science-pack",    1 },
        { "production-science-pack",  1 },
        { "utility-science-pack",     1 },
        { "space-science-pack",       1 },
        { "metallurgic-science-pack", 1 },
    },
    time = 60,
}

data:extend({ cargo_drops })
