--[[
    DCircleVisualizer Panel.
    A basic symmetric circular visualizer.
    Usage:
        Create a panel with vgui.Create("DVisualizer"), then set
        the IGModAudioChannel with panel:SetSong( channel ).
]]
local visualizer = {}
--[[
    visualizer:SetRotation
    Arguments:
            x - number, The new rotation speed, in radians per frame.
]]
function visualizer:SetRotation( x )
    self.rot = x
end
-- The functions below do not require documentation.
local function a(b,c,d,e)return d+b*math.cos(c),e+b*math.sin(c)end;local f=0;local function g(h,c)if c then return h*math.pi+f else return math.pi+(1-h)*math.pi+f end end;function visualizer:Paint(i,j)if IsValid(self.song)then f=f+(self.rot or 0);self.song:FFT(self.bin,FFT_256)if#self.bin>=1 then local k=#self.bin;local l=math.min(i,j)/3;local m,n=a(l+l*self.bin[1],g(1/k,true),i/2,j/2)local d=0;local e=0;draw.NoTexture()surface.SetDrawColor(self.color)for o=1,k do d,e=a(l+l*self.bin[o%k+1],g(o/k,true),i/2,j/2)surface.DrawLine(m,n,d,e)m=d;n=e end;for o=k,1,-1 do d,e=a(l+l*self.bin[o%k+1],g(o/k,false),i/2,j/2)surface.DrawLine(m,n,d,e)m=d;n=e end;local m,n=a(l+l*self.bin[1],g(1/k,true),i/2,j/2)surface.DrawLine(m,n,d,e)else end end end;vgui.Register("DCircleVisualizer",visualizer,"DVisualizer")