-- Pyroclast Defender: enhanced combat robot (+50% damage, 2x health, 1.5x lifetime)
-- Spawned by the Pyroclast Defender Capsule.

local defender = table.deepcopy(data.raw["combat-robot"]["defender"])
defender.name = "pyroclast-defender"
defender.icons = {
    { icon = "__base__/graphics/icons/defender.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
defender.icon = nil
defender.icon_size = nil
defender.max_health = defender.max_health * 2

-- Boost attack damage
if defender.attack_parameters then
    if defender.attack_parameters.ammo_type and defender.attack_parameters.ammo_type.action then
        for _, action in pairs(defender.attack_parameters.ammo_type.action) do
            if action.action_delivery and action.action_delivery.target_effects then
                for _, effect in pairs(action.action_delivery.target_effects) do
                    if effect.type == "damage" and effect.damage then
                        effect.damage.amount = effect.damage.amount * 1.5
                    end
                end
            end
        end
    end
end

defender.time_to_live = defender.time_to_live * 1.5

data:extend({ defender })
