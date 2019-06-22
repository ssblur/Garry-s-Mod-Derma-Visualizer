if SERVER then
    AddCSLuaFile()
    AddCSLuaFIle("vgui/dvisualizer.lua")
    AddCSLuaFile("vgui/dcirclevisualizer.lua")
else
    include("vgui/dvisualizer.lua")
    include("vgui/dcirclevisualizer.lua")
end