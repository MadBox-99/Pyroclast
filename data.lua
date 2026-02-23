require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technologies")
require("prototypes.tools")
require("prototypes.planet.pyroclast")

-- Sulfuric acid lake tile (deepcopied from water)
data:extend({ require("prototypes.tiles.sulfuric-acid-lake") })

-- Molten-metal geysers (deepcopied from sulfuric-acid-geyser)
data:extend(require("prototypes.entity.pyroclast-geysers"))

-- Pyroclast Rocket Silo (deepcopied from rocket-silo, Pyroclast only)
require("prototypes.entity.pyroclast-rocket-silo")

-- Autoplace-control entries give these geysers sliders in the map generation UI.
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
})
