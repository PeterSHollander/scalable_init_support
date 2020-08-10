# Scalable Init Support
This mod enables a limitless amount of init-based VScript mods for Half-Life: Alyx to be active at the same time, so long as all relevant VScript addons conform to this mod's standard.

To integrate Scalable Init Support into your own VScript mods, do the following:

## For development
* Add a file with the name of your mod's **local name** to `.../Half-Life Alyx/game/hlvr_addons/<YOUR_ADDON_NAME>/scripts/vscripts/mods/init/<YOUR_ADDON_NAME>.lua` containing your mod's base custom init script (not required for release, but useful for ongoing development)
    * It is recommended for ease of development between pushing workshop releases that your custom init script is simply one line, calling (for example) `require("my_custom_scripts_folder/my_mod_init")` so that you can easily edit just one file and its children, having `mods/init/<YOUR_ADDON_NAME>.lua`, and later `mods/init/<YOUR_WORKSHOP_ID>.lua` both simply call to include the same file
* Copy this project's `scripts/vscripts/game/gameinit.lua` to the same path in your own addon directory (**REMOVE BEFORE RELEASE**)
    * Not necessary if all development is ocurring in-game (ie. not using Hammer/tools mode)

## For workshop release
* Make sure you are viewing the README of the most up-to-date version of Scalable Init Support before proceeding with release
* Remove `game/gameinit.lua` from _your_ addon vscripts directory
    * You can also remove `mods/init/<YOUR_ADDON_NAME>.lua` if you would like to tidy up as much as possible before shipping
* If you wish to have Scalable Init Support's addon dependency enforcement featured in your mod, copy this project's `scripts/vscripts/core/coreinit.lua` to the same path in your own addon directory (this will automatically enforce Scalable Init Support being present & enabled - **DO NOT MODIFY, WILL BE OVERWRITTEN**)
* Upload your addon to the workshop **privately** (it will **not** be functional in this state)
* Add a file with the name of your mod's **workshop ID** to `.../Half-Life Alyx/game/hlvr_addons/<YOUR_ADDON_NAME>/scripts/vscripts/mods/init/<YOUR_WORKSHOP_ID>.lua` containing your mod's base custom init script (you can easily obtain your mod's workshop ID by looking at the string of numbers at the end of the addon's workshop page URL after you've initially uploaded it)
* It is recommended to include the sentence "This mod depends on the Scalable Init Support addon." as the first line of your workshop page's description, so it is always able to be seen when selecting the mod in-game as an extra layer of communication to the end-user
* Make sure you select Scalable Init Support under the **Required Items** section before making your workshop page public
* Ship it!

## FAQ
**Q**: **What is an init-based mod?**
**A**: Init-based mods are mods that require some/all of the content to be initialized within VScripts, rather than through the use of map files.

**Q**: **Why would I want to make my mod an init-based mod?**
**A**: The "init" stage of VScripting is executed for _all_ maps, not just maps that you set up.  So by making your mod init-based, all the content created from within the init VScripts will work on _any_ map!

**Q**: **Why do I need something like Scalable Init Support to make an init-based mod?**
**A**: When you overwrite one of the base init files for your mod's use, then any other mods which overwrite init files will in turn overwrite yours, leaving only one of these mods active in the end.  The code found in `game/gameinit.lua` takes care of procedurally searching for custom init files based on each mod's workshop ID.

**Q**: **Why can't I just copy Scalable Init Support's `game/gameinit.lua` to my own mod when I ship it?**
**A**: If you were to release your own init-based mod that overwrites `game/gameinit.lua`, then that would mean as Valve pushes changes to the VScripting system or as bugs are discovered in `game/gameinit.lua`, keeping this file up-to-date would be on **you**, and there would be no guarantee that the updates _you_ push to `game/gameinit.lua` would be the same as the updates _other_ developers push.  By keeping this file centralized in Scalable Init Support, such a patch would only need to come to _this_ addon, thus reducing potential overlapping points of failure from 10's or 100's of mods down to just one.

**Q**: **I'm worried about my mod having dependencies, and that it will potentially lead to a bad end-user experience.**
**A**: We understand!  That's why we've added a dependency enforcer to `scripts/vscripts/core/coreinit.lua`.  If, after being notified by Steam about the dependency, your user forgets to enable/install Scalable Init Support, then having this project's `core/coreinit.lua` present in _your_ mod's vscripts folder will either enable the dependency or warn the user that it is not installed, respectively.  This dependency enforcement feature is available for you to use in your own codebase as well, should you choose to do so.

**Q**: **Why should I adopt the standards laid out by Scalable Init Support?**
**A**: Multiple developers working on init-based mods for Half-Life: Alyx have come together and believe that this is the best way to load multiple addons at once moving forward.  The standard keeps the `scripts/vscripts/` root uncluttered, narrows the mod-loader code down to one centralized dependency, and cleanly reports mod-loading errors in the console should any come up.  If for whatever reason you are uncomfortable with adopting this standard, let us know why on the mod's workshop page or on GitHub and we will gladly work towards a resolution.

## Additional notes
If you're comfortable with depending on this addon for functions in your own code, you are welcome to make use of the addon dependency enforcement functions found in `core/coreinit.lua` in the event that your addon has additional dependencies which you would like to enforce.  Those functions will always be overwritten by Scalable Init Support's priority as to assert their original definitions over any improperly modified/conflicting `core/coreinit.lua` files.

If you are curious to see an implementation of Scalable Init Support, feel free to check out my [glorious_gloves](https://github.com/PeterSHollander/glorious_gloves) mod.