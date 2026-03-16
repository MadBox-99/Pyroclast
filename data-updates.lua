-- data-updates.lua
-- Recycler restriction for Pyroclast.

-- ── Block recycler on Pyroclast ────────────────────────────────────────────────
-- Pyroclast has pressure = 6000, unique among all base planets.
-- Adding max pressure 5999 to the recycler prevents placement on Pyroclast
-- while allowing it on every other planet (Nauvis 1000, Vulcanus 4000, etc.).
local recycler = data.raw["furnace"]["recycler"]
if recycler then
    recycler.surface_conditions = recycler.surface_conditions or {}
    table.insert(recycler.surface_conditions, { property = "pressure", max = 5999 })
end
