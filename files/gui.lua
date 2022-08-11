dofile("mods/moles_souls/files/utils.lua")
local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local soul_count = souls:count()

gui = gui or GuiCreate()
GuiStartFrame(gui)

GuiText(gui, 10, 10, "Souls: " .. soul_count) --coords random idk, will be an image instead of "Souls: "
--needs to be split up into normal, gilded, living