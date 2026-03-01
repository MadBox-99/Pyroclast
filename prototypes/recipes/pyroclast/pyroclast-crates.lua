-- Pack and unpack recipes for Pyroclast material crates.
-- Pack: only on Pyroclast. Unpack: anywhere.

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

local recipes = {}
for _, mat in pairs(materials) do
    -- Pack recipe (Pyroclast only)
    table.insert(recipes, {
        type = "recipe",
        name = "crate-pack-" .. mat.name,
        category = "crafting",
        enabled = false,
        energy_required = 2,
        surface_conditions = {
            { property = "pressure", min = 6000, max = 6000 },
            { property = "gravity",  min = 60,   max = 60   },
        },
        ingredients = {
            { type = "item", name = mat.name, amount = mat.amount },
        },
        results = {
            { type = "item", name = "crated-" .. mat.name, amount = 1 },
        },
        icons = {
            { icon = "__Pyroclast__/graphics/icons/" .. mat.name .. ".png", icon_size = 64 },
            { icon = "__base__/graphics/icons/wooden-chest.png", icon_size = 64, scale = 0.25, shift = {8, -8} },
        },
        allow_productivity = false,
    })

    -- Unpack recipe (anywhere)
    table.insert(recipes, {
        type = "recipe",
        name = "crate-unpack-" .. mat.name,
        category = "crafting",
        enabled = false,
        energy_required = 1,
        ingredients = {
            { type = "item", name = "crated-" .. mat.name, amount = 1 },
        },
        results = {
            { type = "item", name = mat.name, amount = mat.amount },
        },
        icons = {
            { icon = "__Pyroclast__/graphics/icons/" .. mat.name .. ".png", icon_size = 64 },
            { icon = "__base__/graphics/icons/deconstruction-planner.png", icon_size = 64, scale = 0.25, shift = {8, -8} },
        },
        allow_productivity = false,
    })
end

data:extend(recipes)
