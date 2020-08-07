-- This file allows for scalable expansion of multiple custom init files from multiple different addons to be active at once

-- Your final custom init file must exist at the path: "scripts/vscripts/mods/init/<YOUR_WORKSHOP_ID>.lua" - Update with this naming standard once your workshop addon has been initially submitted.
-- It is also a good idea to copy this addon's "scripts/vscripts/core/coreinit.lua" over to your addon at the same relative path.  This file should remain identical as it is overwritable.
-- For functionality during development in-game, your custom init path should be: "Half-Life Alyx/game/hlvr_addons/<YOUR_ADDON_NAME>/scripts/vscripts/mods/init/<YOUR_ADDON_NAME>.lua"
-- For functionality during development in Hammer, copy this file to "Half-Life Alyx/game/hlvr_addons/<YOUR_ADDON_NAME>/scripts/vscripts/game/gameinit.lua" - Make sure you delete it before shipping so functionality expands with updates to this centralized file

local DIRECTORY = "mods/init/"

print("Standardizing addon dependency funtions")
require("mods/modutils.lua")

local addonList = Convars:GetStr("default_enabled_addons_list")
print("Identified list of enabled addons:\n" .. addonList)

for workshopID in addonList:gmatch("[^,]+") do

    local path = DIRECTORY .. workshopID

    print("Looking for " .. path .. ".lua...")
    xpcall(function()
        require(path)
        print("  > Found " .. path .. ".lua")
    end,
    function(errorMessage)
        if not errorMessage:find(path .. "\']Failed to find") then
            Warning("Error loading " .. path .. ":\n" .. errorMessage)
        end
    end )

end