local util = require("util")

-- Register sulfuric-acid-lake as a water-type tile so offshore pumps,
-- boats and other water-aware mechanics treat it correctly.
if data.raw.tile["sulfuric-acid-lake"] then
    local uc = data.raw["utility-constants"]["default"]
    if uc and uc.water_tile_type_names then
        table.insert(uc.water_tile_type_names, "sulfuric-acid-lake")
    end
end

-- Add pyroclast-science-pack to labs
util.add_lab_input("lab", "pyroclast-science-pack")
util.add_lab_input("biolab", "pyroclast-science-pack")

-- Override volcanic tile autoplaces to use the standard `aux` channel.
-- This makes them work on Pyroclast (aux = pyroclast-aux).
-- The probability values (150-250) are calibrated to beat lava (~100) in biome zones
-- while losing to mountain lava spots (~1100) so volcanic rivers are preserved.
-- Rocky ground: low aux (0 → 0.4), max probability 200
if data.raw.tile["volcanic-smooth-stone"] then
    data.raw.tile["volcanic-smooth-stone"].autoplace = {
        probability_expression = "200 * clamp((0.40 - aux) / 0.40, 0, 1)",
        richness_expression = "1",
        order = "b[volcanic-smooth-stone]"
    }
end
-- Ash soil: medium aux (0.35 → 0.65), max probability 160 at center (0.5)
if data.raw.tile["volcanic-ash-soil"] then
    data.raw.tile["volcanic-ash-soil"].autoplace = {
        probability_expression = "160 * clamp(1 - 3 * abs(aux - 0.50), 0, 1)",
        richness_expression = "1",
        order = "b[volcanic-ash-soil]"
    }
end
-- Dark ash: high aux (0.60 → 1.0), max probability 200
if data.raw.tile["volcanic-ash-dark"] then
    data.raw.tile["volcanic-ash-dark"].autoplace = {
        probability_expression = "200 * clamp((aux - 0.60) / 0.40, 0, 1)",
        richness_expression = "1",
        order = "b[volcanic-ash-dark]"
    }
end
-- Volcanic folds: very high aux (0.78 → 1.0), max probability 250
if data.raw.tile["volcanic-folds"] then
    data.raw.tile["volcanic-folds"].autoplace = {
        probability_expression = "250 * clamp((aux - 0.78) / 0.22, 0, 1)",
        richness_expression = "1",
        order = "c[volcanic-folds]"
    }
end
