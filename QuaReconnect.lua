local P=game:GetService("Players") local U=game:GetService("UserInputService") local T=game:GetService("TweenService") local S=game:GetService("StarterGui") local GS=game:GetService("GuiService") local TS=game:GetService("TeleportService") local L=P.LocalPlayer
local C={AutoReconnect=true,RejoinDelay=5,Rejoins=0,SpeedEnabled=false,WalkSpeed=30,Scale=1}
local function N(t)pcall(function()S:SetCore("SendNotification",{Title="Quater's Reconnect",Text=t,Duration=3})end)end

local g=Instance.new("ScreenGui") g.Name="QuaterReconnectUI" g.ResetOnSpawn=false g.IgnoreGuiInset=true g.Parent=game:GetService("CoreGui")
local m=Instance.new("Frame") m.Size=UDim2.new(0,300,0,430) m.Position=UDim2.new(0,30,0,60) m.BackgroundColor3=Color3.fromRGB(20,20,28) m.BorderSizePixel=0 m.Active=true m.ClipsDescendants=true m.ZIndex=1 m.Parent=g
Instance.new("UICorner",m).CornerRadius=UDim.new(0,14) local st=Instance.new("UIStroke",m) st.Color=Color3.fromRGB(80,180,255) st.Thickness=1.5 st.Transparency=.35

local sh=Instance.new("ImageLabel") sh.Size=UDim2.new(0,306,0,436) sh.Position=UDim2.new(0,27,0,57) sh.BackgroundTransparency=1 sh.Image="rbxassetid://1316045217" sh.ImageColor3=Color3.fromRGB(0,0,0) sh.ImageTransparency=.55 sh.ScaleType=Enum.ScaleType.Slice sh.SliceCenter=Rect.new(10,10,118,118) sh.ZIndex=0 sh.Visible=false sh.Parent=g

local h=Instance.new("Frame") h.Size=UDim2.new(1,0,0,52) h.BackgroundColor3=Color3.fromRGB(30,30,42) h.BorderSizePixel=0 h.ZIndex=3 h.Active=true h.Parent=m Instance.new("UICorner",h).CornerRadius=UDim.new(0,14)
local hg=Instance.new("UIGradient") hg.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(80,180,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(180,100,255))} hg.Rotation=45 hg.Parent=h

local ic=Instance.new("ImageLabel") ic.Size=UDim2.new(0,32,0,32) ic.Position=UDim2.new(0,12,0,10) ic.BackgroundTransparency=1 ic.Image="rbxassetid://6031225724" ic.ZIndex=4 ic.Parent=h
local tt=Instance.new("TextLabel") tt.Size=UDim2.new(1,-60,1,0) tt.Position=UDim2.new(0,52,0,0) tt.Text="Quater's Reconnect" tt.TextColor3=Color3.fromRGB(255,255,255) tt.BackgroundTransparency=1 tt.Font=Enum.Font.GothamBlack tt.TextSize=17 tt.TextXAlignment=Enum.TextXAlignment.Left tt.Active=false tt.ZIndex=4 tt.Parent=h
local dz=Instance.new("TextButton") dz.Size=UDim2.new(1,0,1,0) dz.BackgroundTransparency=1 dz.Text="" dz.AutoButtonColor=false dz.ZIndex=5 dz.Active=true dz.Parent=h

local dr,ds,sp=false,nil,nil
dz.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true ds=i.Position sp=m.Position end end)
U.InputChanged:Connect(function(i) if dr and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds local vp=workspace.CurrentCamera.ViewportSize local us=m:FindFirstChildOfClass("UIScale") local sc=us and us.Scale or 1 local rw=m.AbsoluteSize.X*sc local rh=m.AbsoluteSize.Y*sc m.Position=UDim2.new(0,math.clamp(sp.X.Offset+d.X,0,math.max(0,vp.X-rw)),0,math.clamp(sp.Y.Offset+d.Y,0,math.max(0,vp.Y-rh))) if sh.Visible then sh.Position=UDim2.new(0,m.Position.X.Offset-3,0,m.Position.Y.Offset-3) end end end)
U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)

local sbF=Instance.new("Frame") sbF.Size=UDim2.new(1,-24,0,32) sbF.Position=UDim2.new(0,12,0,62) sbF.BackgroundColor3=Color3.fromRGB(28,32,44) sbF.BackgroundTransparency=0.2 sbF.BorderSizePixel=0 sbF.ZIndex=3 sbF.Parent=m Instance.new("UICorner",sbF).CornerRadius=UDim.new(0,8)
local sbd=Instance.new("Frame") sbd.Size=UDim2.new(0,10,0,10) sbd.Position=UDim2.new(0,12,0.5,-5) sbd.BackgroundColor3=Color3.fromRGB(120,255,120) sbd.BorderSizePixel=0 sbd.ZIndex=4 sbd.Parent=sbF Instance.new("UICorner",sbd).CornerRadius=UDim.new(1,0)
local sb=Instance.new("TextLabel") sb.Size=UDim2.new(1,-36,1,0) sb.Position=UDim2.new(0,30,0,0) sb.BackgroundTransparency=1 sb.Text="Ожидание дисконнекта..." sb.TextColor3=Color3.fromRGB(220,225,235) sb.Font=Enum.Font.Gotham sb.TextSize=12 sb.TextXAlignment=Enum.TextXAlignment.Left sb.ZIndex=4 sb.Parent=sbF

local yPos=108
local function Toggle(txt,icId,def,cb)
    local row=Instance.new("Frame") row.Size=UDim2.new(1,-24,0,44) row.Position=UDim2.new(0,12,0,yPos) row.BackgroundColor3=Color3.fromRGB(32,36,48) row.BackgroundTransparency=0.15 row.BorderSizePixel=0 row.ZIndex=3 row.Parent=m Instance.new("UICorner",row).CornerRadius=UDim.new(0,8) yPos=yPos+52
    local ic=Instance.new("ImageLabel") ic.Size=UDim2.new(0,22,0,22) ic.Position=UDim2.new(0,10,0.5,-11) ic.BackgroundTransparency=1 ic.Image=icId ic.ZIndex=4 ic.Parent=row
    local lb=Instance.new("TextLabel") lb.Size=UDim2.new(1,-96,1,0) lb.Position=UDim2.new(0,38,0,0) lb.BackgroundTransparency=1 lb.Text=txt lb.TextColor3=Color3.fromRGB(230,230,235) lb.Font=Enum.Font.Gotham lb.TextSize=14 lb.TextXAlignment=Enum.TextXAlignment.Left lb.ZIndex=4 lb.Parent=row
    local pill=Instance.new("TextButton") pill.Size=UDim2.new(0,48,0,26) pill.Position=UDim2.new(1,-58,0.5,-13) pill.BackgroundColor3=def and Color3.fromRGB(80,180,255) or Color3.fromRGB(60,64,78) pill.Text="" pill.AutoButtonColor=false pill.BorderSizePixel=0 pill.ZIndex=4 pill.Parent=row Instance.new("UICorner",pill).CornerRadius=UDim.new(1,0)
    local knob=Instance.new("Frame") knob.Size=UDim2.new(0,20,0,20) knob.Position=def and UDim2.new(1,-24,0.5,-10) or UDim2.new(0,4,0.5,-10) knob.BackgroundColor3=Color3.fromRGB(240,240,240) knob.BorderSizePixel=0 knob.ZIndex=5 knob.Parent=pill Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)
    local on=def
    local function paint() T:Create(knob,TweenInfo.new(.15),{Position=on and UDim2.new(1,-24,0.5,-10)or UDim2.new(0,4,0.5,-10)}):Play() T:Create(pill,TweenInfo.new(.15),{BackgroundColor3=on and Color3.fromRGB(80,180,255)or Color3.fromRGB(60,64,78)}):Play() end
    paint()
    pill.MouseButton1Click:Connect(function() on=not on paint()cb(on) end)
end

local function Slider(txt,min,max,def,cb)
    local f=Instance.new("Frame") f.Size=UDim2.new(1,-24,0,56) f.Position=UDim2.new(0,12,0,yPos) f.BackgroundColor3=Color3.fromRGB(32,36,48) f.BackgroundTransparency=0.15 f.BorderSizePixel=0 f.ZIndex=3 f.Parent=m Instance.new("UICorner",f).CornerRadius=UDim.new(0,8) yPos=yPos+64
    local lb=Instance.new("TextLabel") lb.Size=UDim2.new(1,-20,0,18) lb.Position=UDim2.new(0,10,0,6) lb.BackgroundTransparency=1 lb.Text=txt..": "..def lb.TextColor3=Color3.fromRGB(220,220,225) lb.Font=Enum.Font.Gotham lb.TextSize=12 lb.TextXAlignment=Enum.TextXAlignment.Left lb.ZIndex=4 lb.Parent=f
    local bar=Instance.new("TextButton") bar.Size=UDim2.new(1,-20,0,12) bar.Position=UDim2.new(0,10,0,32) bar.BackgroundColor3=Color3.fromRGB(50,55,70) bar.Text="" bar.AutoButtonColor=false bar.BorderSizePixel=0 bar.ZIndex=4 bar.Parent=f Instance.new("UICorner",bar).CornerRadius=UDim.new(0,6)
    local fill=Instance.new("Frame") fill.Size=UDim2.new((def-min)/(max-min),0,1,0) fill.BackgroundColor3=Color3.fromRGB(80,180,255) fill.BorderSizePixel=0 fill.ZIndex=5 fill.Parent=bar Instance.new("UICorner",fill).CornerRadius=UDim.new(0,6)
    local val=def local dragging=false
    local function set(v) val=math.clamp(v,min,max) fill.Size=UDim2.new((val-min)/(max-min),0,1,0) lb.Text=txt..": "..(txt:find("асштаб")and string.format("%.2f",val)or math.floor(val)) cb(val) end
    local function updateFromInput(i) local px=(i.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X set(min+px*(max-min)) end
    bar.MouseButton1Down:Connect(function() dragging=true updateFromInput({Position=U:GetMouseLocation()}) end)
    U.InputChanged:Connect(function(i) if dragging and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then updateFromInput(i) end end)
    U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=false end end)
end

Toggle("Auto Reconnect","rbxassetid://6031225724",true,function(v) C.AutoReconnect=v sb.Text=v and "Ожидание дисконнекта..." or "Перезаход отключён" sbd.BackgroundColor3=v and Color3.fromRGB(120,255,120)or Color3.fromRGB(255,100,100) end)
Toggle("Speed Hack","rbxassetid://6035047409",false,function(v) C.SpeedEnabled=v local ch=L.Character local hu=ch and ch:FindFirstChildOfClass("Humanoid") if hu then hu.WalkSpeed=v and C.WalkSpeed or 16 end end)
Slider("Скорость",16,100,30,function(v) C.WalkSpeed=v if C.SpeedEnabled then local ch=L.Character local hu=ch and ch:FindFirstChildOfClass("Humanoid") if hu then hu.WalkSpeed=v end end end)
Slider("Масштаб",0.6,1.6,1.0,function(v) C.Scale=v local us=m:FindFirstChildOfClass("UIScale") if not us then us=Instance.new("UIScale")us.Parent=m end us.Scale=v if v>=0.95 then sh.Visible=true local w=m.AbsoluteSize.X*us.Scale local hh=m.AbsoluteSize.Y*us.Scale sh.Size=UDim2.new(0,w+6,0,hh+6) sh.Position=UDim2.new(0,m.AbsolutePosition.X-3,0,m.AbsolutePosition.Y-3) else sh.Visible=false end end)

local hd=Instance.new("TextButton") hd.Size=UDim2.new(0,22,0,22) hd.Position=UDim2.new(1,-26,1,-26) hd.BackgroundColor3=Color3.fromRGB(80,180,255) hd.BackgroundTransparency=0.2 hd.Text="⋰" hd.TextColor3=Color3.fromRGB(255,255,255) hd.TextSize=16 hd.Font=Enum.Font.GothamBold hd.AutoButtonColor=false hd.BorderSizePixel=0 hd.ZIndex=6 hd.Parent=m Instance.new("UICorner",hd).CornerRadius=UDim.new(0,6)
local rs=false
hd.MouseButton1Down:Connect(function() rs=true end)
U.InputChanged:Connect(function(i) if rs and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local mouse=U:GetMouseLocation() local nw=math.clamp(mouse.X-m.AbsolutePosition.X,240,500) local nh=math.clamp(mouse.Y-m.AbsolutePosition.Y,200,600) m.Size=UDim2.new(0,nw,0,nh) if sh.Visible then local us=m:FindFirstChildOfClass("UIScale") local sc=us and us.Scale or 1 sh.Size=UDim2.new(0,nw*sc+6,0,nh*sc+6) end end end)
U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then rs=false end end)

local stats=Instance.new("TextLabel") stats.Size=UDim2.new(1,-24,0,20) stats.Position=UDim2.new(0,12,1,-28) stats.BackgroundTransparency=1 stats.Text="Перезаходов: 0" stats.TextColor3=Color3.fromRGB(200,200,210) stats.Font=Enum.Font.Gotham stats.TextSize=11 stats.TextXAlignment=Enum.TextXAlignment.Left stats.ZIndex=4 stats.Parent=m

GS.ErrorMessageChanged:Connect(function(msg) if not C.AutoReconnect then return end if msg and msg~="" then C.Rejoins=C.Rejoins+1 stats.Text="Перезаходов: "..C.Rejoins sb.Text="Дисконнект! Перезаход через "..C.RejoinDelay.."с..." sbd.BackgroundColor3=Color3.fromRGB(255,200,50) task.wait(C.RejoinDelay) pcall(function()TS:Teleport(game.PlaceId,L)end) end end)
task.spawn(function() while task.wait(5)do if not C.AutoReconnect then continue end local ok=pcall(function()return P.LocalPlayer end) if not ok then pcall(function()TS:Teleport(game.PlaceId,L)end) end end end)
N("Quater's Reconnect загружен 🔄")
