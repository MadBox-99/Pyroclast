-- Pyroclast-exclusive enhanced armor ("uniforms" in Foxhole terms)

-- 1. Pyroclast Modular Armor (+30% resistances, 7x7 equipment grid)
local p_modular = table.deepcopy(data.raw["armor"]["modular-armor"])
p_modular.name = "pyroclast-modular-armor"
p_modular.order = "c[modular-armor]-b[pyroclast-modular-armor]"
p_modular.icons = {
    { icon = "__base__/graphics/icons/modular-armor.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_modular.icon = nil
p_modular.icon_size = nil
if p_modular.resistances then
    for _, resistance in pairs(p_modular.resistances) do
        if resistance.decrease then
            resistance.decrease = resistance.decrease * 1.3
        end
        if resistance.percent then
            resistance.percent = math.min(resistance.percent * 1.3, 90)
        end
    end
end
p_modular.equipment_grid = "pyroclast-modular-armor-equipment-grid"

-- 2. Pyroclast Power Armor (+30% resistances, 9x9 equipment grid)
local p_power = table.deepcopy(data.raw["armor"]["power-armor"])
p_power.name = "pyroclast-power-armor"
p_power.order = "d[power-armor]-b[pyroclast-power-armor]"
p_power.icons = {
    { icon = "__base__/graphics/icons/power-armor.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/rmat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_power.icon = nil
p_power.icon_size = nil
if p_power.resistances then
    for _, resistance in pairs(p_power.resistances) do
        if resistance.decrease then
            resistance.decrease = resistance.decrease * 1.3
        end
        if resistance.percent then
            resistance.percent = math.min(resistance.percent * 1.3, 90)
        end
    end
end
p_power.equipment_grid = "pyroclast-power-armor-equipment-grid"

-- 3. Pyroclast Power Armor MK2 (+25% resistances, 12x12 equipment grid)
local p_power2 = table.deepcopy(data.raw["armor"]["power-armor-mk2"])
p_power2.name = "pyroclast-power-armor-mk2"
p_power2.order = "e[power-armor-mk2]-b[pyroclast-power-armor-mk2]"
p_power2.icons = {
    { icon = "__base__/graphics/icons/power-armor-mk2.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/hemat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_power2.icon = nil
p_power2.icon_size = nil
if p_power2.resistances then
    for _, resistance in pairs(p_power2.resistances) do
        if resistance.decrease then
            resistance.decrease = resistance.decrease * 1.25
        end
        if resistance.percent then
            resistance.percent = math.min(resistance.percent * 1.25, 95)
        end
    end
end
p_power2.equipment_grid = "pyroclast-power-armor-mk2-equipment-grid"

-- 4. Pyroclast Mech Armor (+25% resistances, 12x12 equipment grid)
local p_mech = table.deepcopy(data.raw["armor"]["mech-armor"])
p_mech.name = "pyroclast-mech-armor"
p_mech.order = "f[mech-armor]-b[pyroclast-mech-armor]"
p_mech.icons = {
    { icon = "__space-age__/graphics/icons/mech-armor.png", icon_size = 64 },
    { icon = "__Pyroclast__/graphics/icons/hemat.png", icon_size = 64, scale = 0.25, shift = {-8, 8} },
}
p_mech.icon = nil
p_mech.icon_size = nil
if p_mech.resistances then
    for _, resistance in pairs(p_mech.resistances) do
        if resistance.decrease then
            resistance.decrease = resistance.decrease * 1.25
        end
        if resistance.percent then
            resistance.percent = math.min(resistance.percent * 1.25, 95)
        end
    end
end
p_mech.equipment_grid = "pyroclast-mech-armor-equipment-grid"

data:extend({ p_modular, p_power, p_power2, p_mech })

-- Equipment grids (each +2 over base)
-- Modular: base 5x5 -> 7x7
local grid_modular = table.deepcopy(data.raw["equipment-grid"]["small-equipment-grid"])
grid_modular.name = "pyroclast-modular-armor-equipment-grid"
grid_modular.width = 7
grid_modular.height = 7

-- Power Armor: base 7x7 -> 9x9
local grid_power = table.deepcopy(data.raw["equipment-grid"]["medium-equipment-grid"])
grid_power.name = "pyroclast-power-armor-equipment-grid"
grid_power.width = 9
grid_power.height = 9

-- Power Armor MK2: base 10x10 -> 12x12
local grid_power2 = table.deepcopy(data.raw["equipment-grid"]["large-equipment-grid"])
grid_power2.name = "pyroclast-power-armor-mk2-equipment-grid"
grid_power2.width = 12
grid_power2.height = 12

-- Mech Armor: base 10x10 -> 12x12
local grid_mech = table.deepcopy(data.raw["equipment-grid"]["huge-equipment-grid"])
grid_mech.name = "pyroclast-mech-armor-equipment-grid"
grid_mech.width = 12
grid_mech.height = 12

data:extend({ grid_modular, grid_power, grid_power2, grid_mech })
