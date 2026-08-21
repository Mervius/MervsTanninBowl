MervsTanninBowl = MervsTanninBowl or {}

local MTB = MervsTanninBowl
MTB.init = false


-- This is kind of bad but it seems to work.
local function patchRecipe(recipeID)
    local craftRecipe = getScriptManager():getCraftRecipe(recipeID)
    local inputs = craftRecipe:getInputs()
    local first = inputs:get(0)
    inputs:remove(first)
end

local function OnTick(tick)
    if not MTB.init then
        MTB.init = true
        local sandbox = SandboxVars.Tannins.RequireAlcohol or false
        if sandbox == true then
            patchRecipe("Tannins.CreateTanninBowlFromSplinters")
        end
    end
end

Events.OnTick.Add(OnTick)
