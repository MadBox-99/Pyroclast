-- data-updates.lua
-- PlanetsLib cargo drops whitelist and recycler restriction for Pyroclast.

-- ── Cargo drops whitelist ──────────────────────────────────────────────────────
-- The cargo drops technology (planetslib-pyroclast-cargo-drops) blocks all drops
-- until researched. Players and construction robots are always exempt (hardcoded
-- by PlanetsLib). These whitelists allow specific extras before the tech.

-- Basic logistics entity types: allow dropping belts/inserters for emergency setup
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "transport-belt")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "underground-belt")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "splitter")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "inserter")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "electric-pole")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "pipe")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "pipe-to-ground")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "offshore-pump")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "mining-drill")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "assembling-machine")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "lab")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "container")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "logistic-container")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "roboport")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "radar")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "solar-panel")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "accumulator")
PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("pyroclast", "lamp")

-- ── Block recycler on Pyroclast ────────────────────────────────────────────────
-- Pyroclast has pressure = 6000, unique among all base planets.
-- Adding max pressure 5999 to the recycler prevents placement on Pyroclast
-- while allowing it on every other planet (Nauvis 1000, Vulcanus 4000, etc.).
local recycler = data.raw["furnace"]["recycler"]
if recycler then
    recycler.surface_conditions = recycler.surface_conditions or {}
    table.insert(recycler.surface_conditions, { property = "pressure", max = 5999 })
end
