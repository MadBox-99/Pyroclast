-- Crated versions of Pyroclast materials for efficient inter-planetary transport.
-- Each crate holds a full stack of the base material, 5x transport density.

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
        stack_size = 5,
    })
end

data:extend(crates)
