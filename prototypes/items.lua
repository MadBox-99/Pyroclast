local pyroclast_items = require("prototypes.items.pyroclast-items")
local pyroclast_materials = require("prototypes.items.pyroclast-materials")
local pyroclast_assembly = require("prototypes.items.pyroclast-assembly-materials")
local pyroclast_resources = require("prototypes.items.pyroclast-resources")

data:extend({
    pyroclast_items[1],       -- obsidian
    pyroclast_materials[1],   -- bmat
    pyroclast_materials[2],   -- cmat
    pyroclast_materials[3],   -- emat
    pyroclast_materials[4],   -- rmat
    pyroclast_materials[5],   -- hemat
    pyroclast_assembly[1],    -- assmat1
    pyroclast_assembly[2],    -- assmat2
    pyroclast_assembly[3],    -- assmat3
    pyroclast_assembly[4],    -- assmat4
    pyroclast_resources[1],   -- pyroclast-scrap
    pyroclast_resources[2],   -- pyroclast-components
    require("prototypes.items.pyroclast-rocket-silo"),
    require("prototypes.items.pyroclast-refinery"),
    require("prototypes.items.pyroclast-mpf"),
})
