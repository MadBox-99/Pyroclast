-- Pyroclast-exclusive enhanced medical/support items

-- 1. Pyroclast Repair Pack (2x durability, 1.5x speed)
local p_repair = table.deepcopy(data.raw["repair-tool"]["repair-pack"])
p_repair.name = "pyroclast-repair-pack"
p_repair.order = "b[repair]-b[pyroclast-repair-pack]"
p_repair.icons = {
    { icon = "__base__/graphics/icons/repair-pack.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/cmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_repair.icon = nil
p_repair.icon_size = nil
p_repair.durability = (p_repair.durability or 300) * 2
p_repair.speed = (p_repair.speed or 2) * 1.5

-- 2. Pyroclast Defender Capsule (spawns enhanced pyroclast-defender)
local p_defender = table.deepcopy(data.raw["capsule"]["defender-capsule"])
p_defender.name = "pyroclast-defender-capsule"
p_defender.order = "d[defender-capsule]-b[pyroclast-defender]"
p_defender.icons = {
    { icon = "__base__/graphics/icons/defender.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_defender.icon = nil
p_defender.icon_size = nil

-- Point capsule at the enhanced pyroclast-defender entity
if p_defender.capsule_action and p_defender.capsule_action.attack_parameters then
    local ap = p_defender.capsule_action.attack_parameters
    if ap.ammo_type and ap.ammo_type.action then
        for _, action in pairs(ap.ammo_type.action) do
            if action.action_delivery and action.action_delivery.target_effects then
                for _, effect in pairs(action.action_delivery.target_effects) do
                    if effect.type == "create-entity" and effect.entity_name == "defender" then
                        effect.entity_name = "pyroclast-defender"
                    end
                end
            end
        end
    end
end

data:extend({ p_repair, p_defender })
