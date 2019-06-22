--[[
    DVisualizer Panel.
    A basic symmetric line visualizer.
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
local function a(b,c,d,e)return d+b*math.cos(c),e+b*math.sin(c)end;local function f(g,c)if c then return g*math.pi else return math.pi+(1-g)*math.pi end end;function visualizer:Paint(h,i)surface.SetDrawColor(self.color)if IsValid(self.song)then self.r=(self.r or 0)+(self.rot or 0)self.song:FFT(self.bin,FFT_256)if#self.bin>=1 then local j=#self.bin;local k=math.min(h,i)/3;local l,m=a(k+k*self.bin[1],f(1/j,true),h/2,i/2)local d=0;local e=0;draw.NoTexture()for n=1,j do d,e=a(k+k*self.bin[n%j+1],f(n/j,true),h/2,i/2)surface.DrawLine(l,m,d,e)l=d;m=e end;for n=j,1,-1 do d,e=a(k+k*self.bin[n%j+1],f(n/j,false),h/2,i/2)surface.DrawLine(l,m,d,e)l=d;m=e end;local l,m=a(k+k*self.bin[1],f(1/j,true),h/2,i/2)surface.DrawLine(l,m,d,e)else local k=math.min(h,i)/3;local o,p=a(k,0,h/2,i/2)local d,e=0,0;for q=1,100 do d,e=a(k,math.pi*2*q/100,h/2,i/2)surface.DrawLine(o,p,d,e)o,p=d,e end end else local k=math.min(h,i)/3;local o,p=a(k,0,h/2,i/2)local d,e=0,0;for q=1,100 do d,e=a(k,math.pi*2*q/100,h/2,i/2)surface.DrawLine(o,p,d,e)o,p=d,e end end end;vgui.Register("DCircleVisualizer",visualizer,"DVisualizer")