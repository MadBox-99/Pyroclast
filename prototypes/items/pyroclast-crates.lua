-- Crated versions of Pyroclast materials for efficient inter-planetary transport.
-- Each crate holds a full stack of the base material.
-- Explicit weight set to 2kg per crate (rocket capacity = 1000kg).
-- Loose materials auto-calculate to ~1-2kg each, so a crate of 100 items
-- at 2kg total gives massive transport density improvement.

local materials = {
    { name = "bmat",    amount = 100 },
    { name = "cmat",    amount = 100 },
    { name = "emat",    amount = 100 },
    { name = "rmat",    amount = 100 },
    { name = "hemat",   amount = 50  },
    { name = "assmat1", amount = 50  },
    { name = "assmat2", amount = 50  },
    { name = "assmat3", amount = 50  },
    { name = "assmat4", amount = 50  },
}

local crates = {}
for _, mat in pairs(materials) do
    table.insert(crates, {
        type = "item",
        name = "crated-" .. mat.name,
        icons = {
            { icon = "__Pyroclast__/graphics/icons/" .. mat.name .. ".png", icon_size = 64 },
            { icon = "__base__/graphics/icons/wooden-chest.png", icon_size = 64, scale = 0.25, shift = {8, -8} },
        },
        subgroup = "raw-material",
        order = "d[crated-" .. mat.name .. "]",
        stack_size = 50,
        weight = 2 * kg,
    })
end

data:extend(crates)
