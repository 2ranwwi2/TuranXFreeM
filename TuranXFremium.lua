-- TuranX Freemium Hile Sistemi
-- Criminality Özel - Geliştirilmiş ESP, Aimbot, Full Bright

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Key Sistemi
local correctKey = "turanbaba63" -- Bu anahtarı değiştirebilirsiniz
local keyVerified = false

-- GUI oluşturma
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TuranXFreemium_" .. math.random(10000, 99999)
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Key Sistemi GUI
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(0, 400, 0, 250)
KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
KeyFrame.BorderSizePixel = 0
KeyFrame.ClipsDescendants = true
KeyFrame.ZIndex = 10
KeyFrame.Parent = ScreenGui

local KeyUICorner = Instance.new("UICorner")
KeyUICorner.CornerRadius = UDim.new(0, 8)
KeyUICorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Name = "KeyTitle"
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "TuranX FREEMIUM"
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 200)
KeyTitle.Font = Enum.Font.GothamBlack
KeyTitle.TextSize = 24
KeyTitle.TextStrokeTransparency = 0.7
KeyTitle.TextStrokeColor3 = Color3.fromRGB(0, 100, 100)
KeyTitle.ZIndex = 11
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(0, 320, 0, 45)
KeyInput.Position = UDim2.new(0.5, -160, 0.5, -30)
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Lütfen anahtarı girin..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 16
KeyInput.ZIndex = 11
KeyInput.Parent = KeyFrame

local KeyUICorner2 = Instance.new("UICorner")
KeyUICorner2.CornerRadius = UDim.new(0, 6)
KeyUICorner2.Parent = KeyInput

local KeyButton = Instance.new("TextButton")
KeyButton.Name = "KeyButton"
KeyButton.Size = UDim2.new(0, 320, 0, 45)
KeyButton.Position = UDim2.new(0.5, -160, 0.5, 30)
KeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 120)
KeyButton.BorderSizePixel = 0
KeyButton.Text = "Giriş Yap"
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.Font = Enum.Font.GothamBold
KeyButton.TextSize = 16
KeyButton.ZIndex = 11
KeyButton.Parent = KeyFrame

local KeyUICorner3 = Instance.new("UICorner")
KeyUICorner3.CornerRadius = UDim.new(0, 6)
KeyUICorner3.Parent = KeyButton

local KeyMessage = Instance.new("TextLabel")
KeyMessage.Name = "KeyMessage"
KeyMessage.Size = UDim2.new(1, -20, 0, 20)
KeyMessage.Position = UDim2.new(0, 10, 1, -30)
KeyMessage.BackgroundTransparency = 1
KeyMessage.Text = ""
KeyMessage.TextColor3 = Color3.fromRGB(255, 50, 50)
KeyMessage.Font = Enum.Font.Gotham
KeyMessage.TextSize = 14
KeyMessage.ZIndex = 11
KeyMessage.Parent = KeyFrame

-- Ana menü (başlangıçta gizli)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 270)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -135)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.ZIndex = 10
MainFrame.Parent = ScreenGui

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 8)
MainUICorner.Parent = MainFrame

-- Gradient arkaplan
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
Gradient.Rotation = 90
Gradient.Parent = MainFrame

-- Başlık çubuğu
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 11
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "TURANX FREEMIUM"
Title.TextColor3 = Color3.fromRGB(0, 255, 200)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.ZIndex = 12
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.ZIndex = 12
CloseButton.Parent = TitleBar

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 8)
CloseButtonCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = not ScreenGui.Enabled
end)

-- Sürükleme işlevselliği
local Dragging, DragInput, DragStart, StartPosition

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPosition = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(
            StartPosition.X.Scale, 
            StartPosition.X.Offset + Delta.X, 
            StartPosition.Y.Scale, 
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)

-- Özellik butonları
local function createToggleButton(name, text, position, parent)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, -20, 0, 45)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 100, 100)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.ZIndex = 11
    button.Parent = parent
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Buton hover efekti
    button.MouseEnter:Connect(function()
        if button.TextColor3 == Color3.fromRGB(255, 100, 100) then
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        else
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button.TextColor3 == Color3.fromRGB(255, 100, 100) then
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        else
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        end
    end)
    
    return button
end

-- ESP Butonu
local ESPToggle = createToggleButton("ESPToggle", "ESP: KAPALI", UDim2.new(0, 10, 0, 50), MainFrame)

-- Aimbot Butonu (Aim Lock yerine)
local AimbotToggle = createToggleButton("AimbotToggle", "Aimbot: KAPALI", UDim2.new(0, 10, 0, 105), MainFrame)

-- Full Bright Butonu
local FullBrightToggle = createToggleButton("FullBrightToggle", "Full Bright: KAPALI", UDim2.new(0, 10, 0, 160), MainFrame)

-- NPC ESP Butonu
local NPCESPToggle = createToggleButton("NPCESPToggle", "NPC ESP: KAPALI", UDim2.new(0, 10, 0, 215), MainFrame)

-- Watermark
local Watermark = Instance.new("TextLabel")
Watermark.Name = "Watermark"
Watermark.Size = UDim2.new(0, 300, 0, 30)
Watermark.Position = UDim2.new(1, -310, 0, 10)
Watermark.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Watermark.BackgroundTransparency = 0.7
Watermark.BorderSizePixel = 0
Watermark.Text = "TuranX Freemium | " .. os.date("%H:%M:%S")
Watermark.TextColor3 = Color3.fromRGB(0, 255, 200)
Watermark.Font = Enum.Font.GothamBold
Watermark.TextSize = 14
Watermark.TextXAlignment = Enum.TextXAlignment.Left
Watermark.Visible = false
Watermark.ZIndex = 10
Watermark.Parent = ScreenGui

local WatermarkCorner = Instance.new("UICorner")
WatermarkCorner.CornerRadius = UDim.new(0, 6)
WatermarkCorner.Parent = Watermark

-- Değişkenler
local ESPEnabled = false
local AimbotEnabled = false
local FullBrightEnabled = false
local NPCESPEnabled = false
local ESPObjects = {}
local NPCHighlights = {}
local AimbotConnection = nil
local HighlightFolder = Instance.new("Folder")
HighlightFolder.Name = "TuranXHighlights"
HighlightFolder.Parent = CoreGui

-- Aimbot V2 değişkenleri
local AimbotV2Loaded = false
local AimbotV2

-- Roblox bildirim fonksiyonu
local function SendNotification(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- Key doğrulama
KeyButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == correctKey then
        keyVerified = true
        KeyMessage.Text = "Başarıyla giriş yapıldı!"
        KeyMessage.TextColor3 = Color3.fromRGB(0, 255, 127)
        
        -- KeyFrame'i kapat
        local fadeOut = TweenService:Create(
            KeyFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
        )
        fadeOut:Play()
        
        -- Ana menüyü aç
        wait(0.5)
        KeyFrame.Visible = false
        MainFrame.Visible = true
        Watermark.Visible = true
        
        -- Ana menüyü yumuşak şekilde aç
        MainFrame.BackgroundTransparency = 1
        local fadeIn = TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0}
        )
        fadeIn:Play()
        
        -- Watermark'ı göster
        Watermark.BackgroundTransparency = 1
        local watermarkFade = TweenService:Create(
            Watermark,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.3}
        )
        watermarkFade:Play()
        
        -- Bildirim göster
        SendNotification("TuranX Freemium", "TuranX İyi Kullanmalar Diler!", 5)
    else
        KeyMessage.Text = "Hatalı anahtar! Lütfen tekrar deneyin."
        KeyMessage.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

-- Key girişi için enter tuşu desteği
KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        KeyButton:Activate()
    end
end)

-- Improved NPC detection for Criminality
local function IsNPC(model)
    if model and model:FindFirstChild("Humanoid") and model:FindFirstChild("Head") then
        -- Criminality-specific NPC detection
        local name = model.Name:lower()
        local npcKeywords = {"npc", "vendor", "dealer", "seller", "trader", "guard", "enemy", "bandit", "thug", "civilian", "citizen"}
        
        for _, keyword in ipairs(npcKeywords) do
            if name:find(keyword) then
                return true
            end
        end
        
        -- Check for specific NPC models in Criminality
        if model:FindFirstChild("NPC") or model:FindFirstChild("IsNPC") then
            return true
        end
        
        -- If it's not a player character and has humanoid, it might be an NPC
        local player = Players:GetPlayerFromCharacter(model)
        if not player and model:FindFirstChild("HumanoidRootPart") then
            -- Additional check to avoid false positives
            local humanoid = model:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                return true
            end
        end
    end
    return false
end

-- Highlight fonksiyonu
local function CreateHighlight(player, color)
    if not player.Character then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = player.Name .. "_Highlight"
    highlight.Adornee = player.Character
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0
    highlight.Parent = HighlightFolder
    
    return highlight
end

-- ESP fonksiyonları
local function CreateESP(player)
    if ESPObjects[player] then return end
    
    local ESPGroup = Instance.new("Folder")
    ESPGroup.Name = player.Name
    ESPGroup.Parent = ScreenGui
    ESPObjects[player] = {Group = ESPGroup, Highlight = nil}
    
    -- Highlight oluştur
    if player.Character then
        ESPObjects[player].Highlight = CreateHighlight(player, Color3.fromRGB(255, 0, 0))
    end
    
    local Box = Instance.new("Frame")
    Box.Name = "Box"
    Box.BorderSizePixel = 2
    Box.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Box.BackgroundTransparency = 1
    Box.ZIndex = 10
    Box.Visible = false
    Box.Parent = ESPGroup
    
    local Name = Instance.new("TextLabel")
    Name.Name = "Name"
    Name.BackgroundTransparency = 1
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextStrokeTransparency = 0
    Name.TextSize = 14
    Name.Font = Enum.Font.GothamBold
    Name.ZIndex = 10
    Name.Visible = false
    Name.Parent = ESPGroup
    
    local HealthText = Instance.new("TextLabel")
    HealthText.Name = "HealthText"
    HealthText.BackgroundTransparency = 1
    HealthText.TextColor3 = Color3.fromRGB(255, 255, 255)
    HealthText.TextStrokeTransparency = 0
    HealthText.TextSize = 12
    HealthText.Font = Enum.Font.Gotham
    HealthText.ZIndex = 10
    HealthText.Visible = false
    HealthText.Parent = ESPGroup
    
    local function UpdateESP()
        if not ESPEnabled or not player.Character or not player.Character:FindFirstChild("Head") then
            Box.Visible = false
            Name.Visible = false
            HealthText.Visible = false
            if ESPObjects[player] and ESPObjects[player].Highlight then
                ESPObjects[player].Highlight.Enabled = false
            end
            return
        end
        
        -- Highlight'ı güncelle
        if not ESPObjects[player].Highlight and player.Character then
            ESPObjects[player].Highlight = CreateHighlight(player, Color3.fromRGB(255, 0, 0))
        elseif ESPObjects[player].Highlight then
            ESPObjects[player].Highlight.Enabled = true
            ESPObjects[player].Highlight.Adornee = player.Character
        end
        
        local head = player.Character.Head
        local position, onScreen = Camera:WorldToViewportPoint(head.Position)
        
        if onScreen then
            local character = player.Character
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            
            if not rootPart or not humanoid then return end
            
            local cf = rootPart.CFrame
            local size = rootPart.Size
            
            -- Kutu boyutunu ve pozisyonunu ayarla
            local top = (cf * CFrame.new(size.X, size.Y, 0)).p
            local bottom = (cf * CFrame.new(-size.X, -size.Y, 0)).p
            
            local topScreen, topVisible = Camera:WorldToViewportPoint(top)
            local bottomScreen, bottomVisible = Camera:WorldToViewportPoint(bottom)
            
            if topVisible and bottomVisible then
                local width = math.abs(topScreen.X - bottomScreen.X)
                local height = math.abs(topScreen.Y - bottomScreen.Y)
                
                Box.Size = UDim2.new(0, width, 0, height)
                Box.Position = UDim2.new(0, math.min(topScreen.X, bottomScreen.X), 0, math.min(topScreen.Y, bottomScreen.Y))
                Box.Visible = true
            else
                Box.Visible = false
            end
            
            -- İsim etiketini ayarla
            Name.Text = player.Name
            Name.Position = UDim2.new(0, position.X, 0, position.Y - 40)
            Name.Visible = true
            
            -- Can bilgisini ayarla
            if humanoid then
                HealthText.Text = "CAN: " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                HealthText.Position = UDim2.new(0, position.X, 0, position.Y - 25)
                HealthText.Visible = true
                
                -- Can durumuna göre renk değiştir
                local healthPercent = humanoid.Health / humanoid.MaxHealth
                if healthPercent > 0.7 then
                    HealthText.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif healthPercent > 0.3 then
                    HealthText.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    HealthText.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
            end
            
        else
            Box.Visible = false
            Name.Visible = false
            HealthText.Visible = false
            if ESPObjects[player].Highlight then
                ESPObjects[player].Highlight.Enabled = false
            end
        end
    end
    
    -- Sürekli güncelleme
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not ESPObjects[player] then
            connection:Disconnect()
            return
        end
        UpdateESP()
    end)
end

local function RemoveESP(player)
    if ESPObjects[player] then
        if ESPObjects[player].Highlight then
            ESPObjects[player].Highlight:Destroy()
        end
        if ESPObjects[player].Group then
            ESPObjects[player].Group:Destroy()
        end
        ESPObjects[player] = nil
    end
end

-- NPC ESP fonksiyonları
local function CreateNPCESP(model)
    if NPCHighlights[model] then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = model.Name .. "_NPCHighlight"
    highlight.Adornee = model
    highlight.FillColor = Color3.fromRGB(0, 255, 100) -- Yeşil renk
    highlight.FillTransparency = 0.7
    highlight.OutlineColor = Color3.fromRGB(0, 200, 80)
    highlight.OutlineTransparency = 0
    highlight.Parent = HighlightFolder
    
    NPCHighlights[model] = highlight
    
    return highlight
end

local function RemoveNPCESP(model)
    if NPCHighlights[model] then
        NPCHighlights[model]:Destroy()
        NPCHighlights[model] = nil
    end
end

local function UpdateNPCESP()
    if not NPCESPEnabled then
        for model, highlight in pairs(NPCHighlights) do
            highlight.Enabled = false
        end
        return
    end
    
    -- Tüm modelleri kontrol et
    for _, model in ipairs(workspace:GetChildren()) do
        if IsNPC(model) then
            if not NPCHighlights[model] then
                CreateNPCESP(model)
            else
                NPCHighlights[model].Enabled = true
                NPCHighlights[model].Adornee = model
            end
        end
    end
    
    -- Artık NPC olmayanları temizle
    for model, highlight in pairs(NPCHighlights) do
        if not model.Parent or not IsNPC(model) then
            RemoveNPCESP(model)
        end
    end
end

-- ESP açma/kapama
ESPToggle.MouseButton1Click:Connect(function()
    if not keyVerified then return end
    
    ESPEnabled = not ESPEnabled
    ESPToggle.Text = "ESP: " .. (ESPEnabled and "AÇIK" or "KAPALI")
    ESPToggle.TextColor3 = ESPEnabled and Color3.fromRGB(0, 255, 200) or Color3.fromRGB(255, 100, 100)
    
    if ESPEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player then
                CreateESP(player)
            end
        end
        
        Players.PlayerAdded:Connect(function(player)
            CreateESP(player)
        end)
        
        Players.PlayerRemoving:Connect(function(player)
            RemoveESP(player)
        end)
    else
        for player in pairs(ESPObjects) do
            RemoveESP(player)
        end
    end
end)

-- NPC ESP açma/kapama
NPCESPToggle.MouseButton1Click:Connect(function()
    if not keyVerified then return end
    
    NPCESPEnabled = not NPCESPEnabled
    NPCESPToggle.Text = "NPC ESP(Bakım): " .. (NPCESPEnabled and "AÇIK" or "KAPALI")
    NPCESPToggle.TextColor3 = NPCESPEnabled and Color3.fromRGB(0, 255, 200) or Color3.fromRGB(255, 100, 100)
    
    if not NPCESPEnabled then
        for model, highlight in pairs(NPCHighlights) do
            RemoveNPCESP(model)
        end
    end
end)

-- Aimbot V2 yükleme ve kontrol fonksiyonu
local function ToggleAimbot()
    if not keyVerified then return end
    
    AimbotEnabled = not AimbotEnabled
    
    if AimbotEnabled then
        -- Aimbot'u yükle ve başlat
        if not AimbotV2Loaded then
            local success, err = pcall(function()
                -- Cache
                local loadstring, game, getgenv, setclipboard = loadstring, game, getgenv, setclipboard
                
                -- Loaded check
                if getgenv().Aimbot then return end
                
                -- Load Aimbot V2 (Raw)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Raw%20Main.lua"))()
                
                -- Variables
                AimbotV2 = getgenv().Aimbot
                AimbotV2Loaded = true
                
                -- Aimbot'u otomatik olarak aç
                AimbotV2.Settings.Enabled = true
                
                SendNotification("Aimbot V2", "aktif!", 3)
            end)
            
            if not success then
                SendNotification("Hata", "Aimbot yüklenirken hata oluştu: " .. tostring(err), 5)
                AimbotEnabled = false
                AimbotToggle.Text = "Aimbot: KAPALI"
                AimbotToggle.TextColor3 = Color3.fromRGB(255, 100, 100)
                return
            end
        else
            -- Zaten yüklüyse sadece aç
            AimbotV2.Settings.Enabled = true
            SendNotification("TuranX", "Aimbot aktif!", 2)
        end
        
        AimbotToggle.Text = "Aimbot: AÇIK"
        AimbotToggle.TextColor3 = Color3.fromRGB(0, 255, 200)
    else
        -- Aimbot'u kapat
        if AimbotV2Loaded then
            AimbotV2.Settings.Enabled = false
            SendNotification("TuranX", "Aimbot kapatıldı!", 2)
        end
        
        AimbotToggle.Text = "Aimbot: KAPALI"
        AimbotToggle.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end

-- Aimbot açma/kapama
AimbotToggle.MouseButton1Click:Connect(ToggleAimbot)

-- Full Bright fonksiyonu
local function UpdateLighting()
    if FullBrightEnabled then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        Lighting.EnvironmentDiffuseScale = 1
        Lighting.EnvironmentSpecularScale = 1
    else
        Lighting.Brightness = 1
        Lighting.ClockTime = 12
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 10000
    end
end

-- Full Bright açma/kapama
FullBrightToggle.MouseButton1Click:Connect(function()
    if not keyVerified then return end
    
    FullBrightEnabled = not FullBrightEnabled
    FullBrightToggle.Text = "Full Bright: " .. (FullBrightEnabled and "AÇIK" or "KAPALI")
    FullBrightToggle.TextColor3 = FullBrightEnabled and Color3.fromRGB(0, 255, 200) or Color3.fromRGB(255, 100, 100)
    
    UpdateLighting()
end)

-- UI açma/kapama tuşu
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F4 then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

-- Watermark güncelleme
spawn(function()
    while ScreenGui and ScreenGui.Parent do
        Watermark.Text = "TuranX Freemium | " .. os.date("%H:%M:%S")
        wait(1)
    end
end)

-- NPC ESP güncelleme
spawn(function()
    while ScreenGui and ScreenGui.Parent do
        UpdateNPCESP()
        wait(0.5)
    end
end)

-- Karakter değiştiğinde ESP'yi güncelle
Player.CharacterAdded:Connect(function()
    if ESPEnabled then
        for player in pairs(ESPObjects) do
            RemoveESP(player)
        end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player then
                CreateESP(player)
            end
        end
    end
end)

-- Oyun başladığında lighting ayarlarını güncelle
spawn(function()
    wait(2) -- Oyunun yüklenmesini bekle
    UpdateLighting()
end)

print("TuranX Freemium Hile Sistemi yüklendi! Lütfen anahtar girin.")
print("Criminality için özel olarak optimize edilmiştir.")
