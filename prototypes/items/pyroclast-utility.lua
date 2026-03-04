-- Pyroclast-exclusive enhanced utility items (grenades)

-- 1. Pyroclast Grenade (+50% damage, +25% radius)
local p_grenade = table.deepcopy(data.raw["capsule"]["grenade"])
p_grenade.name = "pyroclast-grenade"
p_grenade.order = "a[grenade]-b[pyroclast-grenade]"
p_grenade.icons = {
    { icon = "__base__/graphics/icons/grenade.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/emat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_grenade.icon = nil
p_grenade.icon_size = nil
if p_grenade.capsule_action and p_grenade.capsule_action.attack_parameters then
    local ap = p_grenade.capsule_action.attack_parameters
    if ap.ammo_type and ap.ammo_type.action then
        for _, action in pairs(ap.ammo_type.action) do
            if action.action_delivery and action.action_delivery.target_effects then
                for _, effect in pairs(action.action_delivery.target_effects) do
                    if effect.type == "damage" and effect.damage then
                        effect.damage.amount = effect.damage.amount * 1.5
                    end
                end
            end
            if action.radius then
                action.radius = action.radius * 1.25
            end
        end
    end
end

-- 2. Pyroclast Cluster Grenade (+40% damage, +25% radius)
local p_cluster = table.deepcopy(data.raw["capsule"]["cluster-grenade"])
p_cluster.name = "pyroclast-cluster-grenade"
p_cluster.order = "a[grenade]-c[pyroclast-cluster-grenade]"
p_cluster.icons = {
    { icon = "__base__/graphics/icons/cluster-grenade.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/hemat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_cluster.icon = nil
p_cluster.icon_size = nil
if p_cluster.capsule_action and p_cluster.capsule_action.attack_parameters then
    local ap = p_cluster.capsule_action.attack_parameters
    if ap.ammo_type and ap.ammo_type.action then
        for _, action in pairs(ap.ammo_type.action) do
            if action.action_delivery and action.action_delivery.target_effects then
                for _, effect in pairs(action.action_delivery.target_effects) do
                    if effect.type == "damage" and effect.damage then
                        effect.damage.amount = effect.damage.amount * 1.4
                    end
                end
            end
            if action.radius then
                action.radius = action.radius * 1.25
            end
        end
    end
end

data:extend({ p_grenade, p_cluster })
