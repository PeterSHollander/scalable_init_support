# Scalable Init Support
This mod enables a limitless amount of init-based VScript mods to be active at the same time, so long as all relevant VScript addons conform to this mod's standard.

To integrate Scalable Init Support into your own VScript mods, do the following:

## For workshop release
* Copy `scripts/vscripts/core/coreinit.lua` to the same path in your own addon directory (This will enforce Scalable Init Support being present & enabled - **DO NOT MODIFY, WILL BE OVERWRITTEN**)
* Add a file with the name of your mod's **workshop ID** to `scripts/vscripts/mods/init/<YOUR_WORKSHOP_ID>.lua` containing your mod's base custom init script (you can easily obtain your mod's workshop ID by looking at the string of numbers at then end of the addon's workshop page URL)
* Remove any files used for development, especially those listed with "**REMOVE BEFORE RELEASE**" below
* It is recommended to include "This mod depends on the Scalable Init Support addon." as the first line of your workshop page's description, so it is always able to be seen when selecting the mod in-game
* Make sure you select Scalable Init Support under the **Required Items** section when creating your workshop page
* Ship it!

## For development
* Copy `scripts/vscripts/core/coreinit.lua` to the same path in your own addon directory (same as for release - **DO NOT MODIFY, WILL BE OVERWRITTEN**)
* Add a file with the name of your mod's **local name** to `scripts/vscripts/mods/init/<YOUR_ADDON_NAME>.lua` containing your mod's base custom init script (not required for release)
* Copy `scripts/vscripts/game/gameinit.lua` to the same path in your own addon directory (**REMOVE BEFORE RELEASE**)

## Additional notes
If you're comfortable with depending on this addon for functions, you are welcome to make use of the addon dependency enforcement functions found in `coreinit.lua` if your addon has additional dependencies.  Those functions will always be overwritten by Scalable Init Support in the `gameinit` stage as to assert their definitions over any improperly modified/conflicting `coreinit.lua` files.

If you are curious to see an implementation of Scalable Init Support, feel free to check out my [glorious_gloves](https://github.com/PeterSHollander/glorious_gloves) mod.