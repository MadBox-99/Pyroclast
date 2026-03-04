-- Pyroclast-exclusive enhanced small arms (deepcopy base ammo + boost damage)

-- 1. Pyroclast Firearm Magazine (+50% damage)
local p_firearm = table.deepcopy(data.raw["ammo"]["firearm-magazine"])
p_firearm.name = "pyroclast-firearm-magazine"
p_firearm.order = "a[basic-clips]-b[pyroclast-firearm-magazine]"
p_firearm.icons = {
    { icon = "__base__/graphics/icons/firearm-magazine.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/bmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_firearm.icon = nil
p_firearm.icon_size = nil
if p_firearm.ammo_type then
    p_firearm.ammo_type.damage_modifier = (p_firearm.ammo_type.damage_modifier or 1) * 1.5
end

-- 2. Pyroclast Piercing Rounds Magazine (+40% damage)
local p_piercing = table.deepcopy(data.raw["ammo"]["piercing-rounds-magazine"])
p_piercing.name = "pyroclast-piercing-rounds-magazine"
p_piercing.order = "a[basic-clips]-c[pyroclast-piercing-rounds]"
p_piercing.icons = {
    { icon = "__base__/graphics/icons/piercing-rounds-magazine.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/emat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_piercing.icon = nil
p_piercing.icon_size = nil
if p_piercing.ammo_type then
    p_piercing.ammo_type.damage_modifier = (p_piercing.ammo_type.damage_modifier or 1) * 1.4
end

-- 3. Pyroclast Uranium Rounds Magazine (+30% damage)
local p_uranium = table.deepcopy(data.raw["ammo"]["uranium-rounds-magazine"])
p_uranium.name = "pyroclast-uranium-rounds-magazine"
p_uranium.order = "a[basic-clips]-d[pyroclast-uranium-rounds]"
p_uranium.icons = {
    { icon = "__base__/graphics/icons/uranium-rounds-magazine.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/hemat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_uranium.icon = nil
p_uranium.icon_size = nil
if p_uranium.ammo_type then
    p_uranium.ammo_type.damage_modifier = (p_uranium.ammo_type.damage_modifier or 1) * 1.3
end

-- 4. Pyroclast Shotgun Shell (+50% damage)
local p_shotgun = table.deepcopy(data.raw["ammo"]["shotgun-shell"])
p_shotgun.name = "pyroclast-shotgun-shell"
p_shotgun.order = "b[shotgun]-b[pyroclast-shotgun-shell]"
p_shotgun.icons = {
    { icon = "__base__/graphics/icons/shotgun-shell.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/bmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_shotgun.icon = nil
p_shotgun.icon_size = nil
if p_shotgun.ammo_type then
    p_shotgun.ammo_type.damage_modifier = (p_shotgun.ammo_type.damage_modifier or 1) * 1.5
end

data:extend({ p_firearm, p_piercing, p_uranium, p_shotgun })
