-- This file allows for scalable expansion of multiple custom init files from multiple different addons to be active at once

-- Your final custom init file should exist at the path: "scripts/vscripts/mods/init/<YOUR_WORKSHOP_ID>.lua" - Update with this naming standard once your workshop addon has been initially submitted.
-- It can also be a good idea to copy this addon's "scripts/vscripts/core/coreinit.lua" and "scripts/vscripts/core/scalableinit.lua" over to your addon at the same relative path.  These files should remain unaltered as they are overwritable.
-- For functionality during development in-game, your custom init path should be: "Half-Life Alyx/game/hlvr_addons/<YOUR_ADDON_NAME>/scripts/vscripts/mods/init/<YOUR_ADDON_NAME>.lua", and you should ensure Scalable Init Support is enabled.
-- For functionality during development in Hammer, copy this file to "Half-Life Alyx/game/hlvr_addons/<YOUR_ADDON_NAME>/scripts/vscripts/game/gameinit.lua" - Make sure you delete it before shipping so functionality expands with updates to this centralized file.

-- Please read the included README.md for more details

local DIRECTORIES = {
    "mods/init/",
    ""
}

local addonList = Convars:GetStr("default_enabled_addons_list")

print("Searching scripts for enabled addon workshop IDs...")
for workshopID in addonList:gmatch("[^,]+") do

    for _, DIRECTORY in pairs(DIRECTORIES) do

        local path = DIRECTORY .. workshopID

        xpcall(function()
            require(path)
            print("Executed " .. path .. ".lua")
        end,
        function(errorMessage)
            if not errorMessage:find(path .. "\']Failed to find") then
                Warning("Error loading " .. path .. ":\n" .. errorMessage)
            end
        end )
    end

end
