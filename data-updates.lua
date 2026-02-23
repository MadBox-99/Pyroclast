-- Modify base game recipes to use Pyroclast materials

-- Modify artillery shell recipe to use Pyroclast materials (bmat + cmat + emat)
data.raw.recipe["artillery-shell"].ingredients = {
    { type = "item",  name = "explosive-cannon-shell", amount = 4 },
    { type = "item",  name = "emat",                   amount = 8 },
    { type = "item",  name = "bmat",                   amount = 10 },
    { type = "item",  name = "cmat",                   amount = 5 },
    { type = "fluid", name = "lava",                   amount = 500 },
}
data.raw.recipe["artillery-shell"].energy_required = 10
data.raw.recipe["artillery-shell"].category = "crafting-with-fluid"

-- Modify radar recipe (100x batch, lava + electronic-circuit + rmat)
data.raw.recipe["radar"].ingredients = {
    { type = "item",  name = "electronic-circuit", amount = 500 },
    { type = "item",  name = "rmat",               amount = 50 },
    { type = "fluid", name = "lava",               amount = 100000 },
}
data.raw.recipe["radar"].results = {
    { type = "item", name = "radar", amount = 100 },
}
data.raw.recipe["radar"].category = "crafting-with-fluid"

-- Modify railgun turret recipe (add lava + rmat)
table.insert(data.raw.recipe["railgun-turret"].ingredients, {
    type = "fluid", name = "lava", amount = 100
})
table.insert(data.raw.recipe["railgun-turret"].ingredients, {
    type = "item", name = "rmat", amount = 5
})
data.raw.recipe["railgun-turret"].category = "crafting-with-fluid"

-- Modify explosive rocket recipe (add emat)
table.insert(data.raw.recipe["explosive-rocket"].ingredients, {
    type = "item", name = "emat", amount = 5
})

-- Modify atomic bomb recipe (add hemat)
table.insert(data.raw.recipe["atomic-bomb"].ingredients, {
    type = "item", name = "hemat", amount = 10
})

-- Modify nuclear reactor recipe (add rmat + lava)
table.insert(data.raw.recipe["nuclear-reactor"].ingredients, {
    type = "item", name = "rmat", amount = 20
})
table.insert(data.raw.recipe["nuclear-reactor"].ingredients, {
    type = "fluid", name = "lava", amount = 1000
})
data.raw.recipe["nuclear-reactor"].category = "crafting-with-fluid"

-- Modify car recipe (add assmat1)
table.insert(data.raw.recipe["car"].ingredients, {
    type = "item", name = "assmat1", amount = 5
})

-- Modify locomotive recipe (add assmat1)
table.insert(data.raw.recipe["locomotive"].ingredients, {
    type = "item", name = "assmat1", amount = 10
})

-- Modify tank recipe (add assmat2)
table.insert(data.raw.recipe["tank"].ingredients, {
    type = "item", name = "assmat2", amount = 10
})

-- Modify cargo wagon recipe (add assmat2)
table.insert(data.raw.recipe["cargo-wagon"].ingredients, {
    type = "item", name = "assmat2", amount = 5
})

-- Modify spidertron recipe (add assmat3)
table.insert(data.raw.recipe["spidertron"].ingredients, {
    type = "item", name = "assmat3", amount = 10
})

-- Modify flying robot frame recipe (add assmat3)
table.insert(data.raw.recipe["flying-robot-frame"].ingredients, {
    type = "item", name = "assmat3", amount = 2
})

-- Modify artillery wagon recipe (add assmat4)
table.insert(data.raw.recipe["artillery-wagon"].ingredients, {
    type = "item", name = "assmat4", amount = 10
})

-- Add pyroclast-assembly prerequisites to base game technologies
-- Tier 1: car, locomotive
table.insert(data.raw.technology["automobilism"].prerequisites, "pyroclast-assembly-1")
table.insert(data.raw.technology["railway"].prerequisites, "pyroclast-assembly-2")

-- Tier 2: tank
table.insert(data.raw.technology["tank"].prerequisites, "pyroclast-assembly-2")

-- Tier 3: spidertron
table.insert(data.raw.technology["spidertron"].prerequisites, "pyroclast-assembly-3")

-- Tier 4: artillery
table.insert(data.raw.technology["artillery"].prerequisites, "pyroclast-assembly-4")
