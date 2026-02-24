-- Recipe category must be declared before any recipe references it
data:extend({ { type = "recipe-category", name = "pyroclast-refining" } })

require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technologies")
require("prototypes.tools")
require("prototypes.planet.pyroclast")

-- Sulfuric acid lake tile (deepcopied from water)
data:extend({ require("prototypes.tiles.sulfuric-acid-lake") })

-- Molten-metal geysers (deepcopied from sulfuric-acid-geyser)
data:extend(require("prototypes.entity.pyroclast-geysers"))

-- Ore resources: scrap and components (deepcopied from iron-ore)
data:extend(require("prototypes.entity.pyroclast-resources"))

-- Pyroclast Rocket Silo (deepcopied from rocket-silo, Pyroclast only)
require("prototypes.entity.pyroclast-rocket-silo")

-- Pyroclast Refinery (deepcopied from chemical-plant, Pyroclast only)
require("prototypes.entity.pyroclast-refinery")

-- Autoplace-control entries give resources sliders in the map generation UI.
data:extend({
    {
        type = "autoplace-control",
        name = "pyroclast_iron_geyser",
        localised_name = {"", "[entity=molten-iron-geyser] ", {"entity-name.molten-iron-geyser"}},
        richness = true,
        order = "f-a",
        category = "resource"
    },
    {
        type = "autoplace-control",
        name = "pyroclast_copper_geyser",
        localised_name = {"", "[entity=molten-copper-geyser] ", {"entity-name.molten-copper-geyser"}},
        richness = true,
        order = "f-b",
        category = "resource"
    },
    {
        type = "autoplace-control",
        name = "pyroclast_scrap",
        localised_name = {"", "[entity=pyroclast-scrap] ", {"entity-name.pyroclast-scrap"}},
        richness = true,
        order = "f-c",
        category = "resource"
    },
    {
        type = "autoplace-control",
        name = "pyroclast_components",
        localised_name = {"", "[entity=pyroclast-components] ", {"entity-name.pyroclast-components"}},
        richness = true,
        order = "f-d",
        category = "resource"
    },
})
