--[[
    DVisualizer Panel.
    A basic symmetric line visualizer.
    Usage:
        Create a panel with vgui.Create("DVisualizer"), then set
        the IGModAudioChannel with panel:SetSong( channel ).
]]
local visualizer = {}
--[[
    visualizer:SetSong
    Arguments:
        song - IGModAudioChannel, The song to visualize.
]]
function visualizer:SetSong( song )
    if IsValid(song) then
        self.song = song
    end
end
-- The functions below do not require documentation.
local function a(b,c)if b<=c/2 then return math.max(1,(c/2-b)*2)else return math.min(c,(b-c/2)*2)end end;function visualizer:Paint(d,e)if IsValid(self.song)then self.song:FFT(self.bin,FFT_256)local f=0;local g=e/2;local h=f+d/128;local c=#self.bin;for i=1,c do surface.DrawLine(f,g,h,e/2-self.bin[a(i,c)]*e)f=h;g=e/2-self.bin[a(i,c)]*e;h=h+d/128 end;surface.DrawLine(h,g,d,e/2)else surface.DrawLine(0,e/2,d,e/2)end end;function visualizer:Init()self.bin={}self.color=Color(255,255,255)end;vgui.Register("DVisualizer",visualizer,"Panel")