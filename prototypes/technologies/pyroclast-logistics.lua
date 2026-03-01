-- Unlocks crate pack/unpack recipes for all Pyroclast materials.

local effects = {}
local materials = { "bmat", "cmat", "emat", "rmat", "hemat", "assmat1", "assmat2", "assmat3", "assmat4" }
for _, name in pairs(materials) do
    table.insert(effects, { type = "unlock-recipe", recipe = "crate-pack-" .. name })
    table.insert(effects, { type = "unlock-recipe", recipe = "crate-unpack-" .. name })
end

data:extend({{
    type = "technology",
    name = "pyroclast-logistics",
    icons = {
        {
            icon = "__base__/graphics/icons/wooden-chest.png",
            icon_size = 64,
            scale = 2,
        },
        {
            icon = "__Pyroclast__/graphics/icons/bmat.png",
            icon_size = 64,
            scale = 0.5,
            shift = {-16, 16},
        },
    },
    effects = effects,
    prerequisites = { "pyroclast-materials" },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack",  1 },
            { "logistic-science-pack",    1 },
            { "chemical-science-pack",    1 },
            { "pyroclast-science-pack",   1 },
        },
        time = 30,
    },
    order = "c-a-m[pyroclast-logistics]",
}})
