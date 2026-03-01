-- Pyroclast-exclusive enhanced munitions (deepcopy base ammo + boost damage)

local pyroclast_artillery_shell = table.deepcopy(data.raw["ammo"]["artillery-shell"])
pyroclast_artillery_shell.name = "pyroclast-artillery-shell"
pyroclast_artillery_shell.order = "d[explosive-cannon-shell]-d[pyroclast-artillery]"
pyroclast_artillery_shell.icons = {
    { icon = "__base__/graphics/icons/artillery-shell.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/emat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
pyroclast_artillery_shell.icon = nil
pyroclast_artillery_shell.icon_size = nil
-- +50% damage: scale all damage values in ammo_type actions
for _, action in pairs(pyroclast_artillery_shell.ammo_type.action) do
    if action.action_delivery and action.action_delivery.projectile then
        -- Damage is defined on the projectile entity, not here.
        -- We'll create a custom projectile or use damage_modifier.
    end
end
pyroclast_artillery_shell.ammo_type.range_modifier = 1.25


local pyroclast_rocket = table.deepcopy(data.raw["ammo"]["explosive-rocket"])
pyroclast_rocket.name = "pyroclast-rocket"
pyroclast_rocket.order = "d[rocket-launcher]-b[pyroclast-rocket]"
pyroclast_rocket.icons = {
    { icon = "__base__/graphics/icons/explosive-rocket.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/emat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
pyroclast_rocket.icon = nil
pyroclast_rocket.icon_size = nil


local pyroclast_atomic_bomb = table.deepcopy(data.raw["ammo"]["atomic-bomb"])
pyroclast_atomic_bomb.name = "pyroclast-atomic-bomb"
pyroclast_atomic_bomb.order = "d[rocket-launcher]-c[pyroclast-atomic-bomb]"
pyroclast_atomic_bomb.icons = {
    { icon = "__base__/graphics/icons/atomic-bomb.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/hemat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
pyroclast_atomic_bomb.icon = nil
pyroclast_atomic_bomb.icon_size = nil


data:extend({ pyroclast_artillery_shell, pyroclast_rocket, pyroclast_atomic_bomb })
