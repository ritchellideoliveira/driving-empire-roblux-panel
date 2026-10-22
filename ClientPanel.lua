local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local empireEvent = ReplicatedStorage:WaitForChild("EmpireEvent")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EmpirePanel"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 530, 0, 290)
main.Position = UDim2.new(0.5, -265, 0.5, -145)
main.BackgroundColor3 = Color3.fromRGB(16, 22, 30)
main.BorderSizePixel = 0
main.Parent = screenGui

local round = Instance.new("UICorner")
round.CornerRadius = UDim.new(0, 18)
round.Parent = main

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 56)
topBar.BackgroundColor3 = Color3.fromRGB(29, 42, 55)
topBar.BorderSizePixel = 0
topBar.Parent = main

local topRound = Instance.new("UICorner")
topRound.CornerRadius = UDim.new(0, 18)
topRound.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 32)
title.Position = UDim2.new(0, 10, 0, 12)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "DRIVING EMPIRE"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local cashLabel = Instance.new("TextLabel")
cashLabel.Size = UDim2.new(0, 180, 0, 28)
cashLabel.Position = UDim2.new(1, -190, 0, 13)
cashLabel.BackgroundTransparency = 1
cashLabel.Font = Enum.Font.GothamBold
cashLabel.Text = "$50.000"
cashLabel.TextColor3 = Color3.fromRGB(96, 255, 150)
cashLabel.TextSize = 20
cashLabel.TextXAlignment = Enum.TextXAlignment.Right
cashLabel.Parent = topBar

local leftFrame = Instance.new("Frame")
leftFrame.Size = UDim2.new(0, 245, 1, -80)
leftFrame.Position = UDim2.new(0, 18, 0, 72)
leftFrame.BackgroundColor3 = Color3.fromRGB(22, 31, 41)
leftFrame.BorderSizePixel = 0
leftFrame.Parent = main

local leftRound = Instance.new("UICorner")
leftRound.CornerRadius = UDim.new(0, 16)
leftRound.Parent = leftFrame

local statsTitle = Instance.new("TextLabel")
statsTitle.Size = UDim2.new(1, -20, 0, 22)
statsTitle.Position = UDim2.new(0, 10, 0, 12)
statsTitle.BackgroundTransparency = 1
statsTitle.Font = Enum.Font.GothamBold
statsTitle.Text = "ESTATÍSTICAS"
statsTitle.TextColor3 = Color3.fromRGB(202, 211, 223)
statsTitle.TextSize = 16
statsTitle.TextXAlignment = Enum.TextXAlignment.Left
statsTitle.Parent = leftFrame

local function createStat(labelText, y)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 42)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundColor3 = Color3.fromRGB(32, 43, 55)
    frame.BorderSizePixel = 0
    frame.Parent = leftFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(176, 189, 203)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Position = UDim2.new(0, 12, 0, 0)
    label.Parent = frame

    local value = Instance.new("TextLabel")
    value.Size = UDim2.new(0.45, -10, 1, 0)
    value.BackgroundTransparency = 1
    value.Font = Enum.Font.GothamBold
    value.Text = "$0"
    value.TextColor3 = Color3.fromRGB(120, 255, 155)
    value.TextSize = 14
    value.TextXAlignment = Enum.TextXAlignment.Right
    value.Position = UDim2.new(0.55, 0, 0, 0)
    value.Parent = frame

    return value
end

local incomeValue = createStat("Renda / min", 46)
local garageValue = createStat("Garagem", 94)
local carsValue = createStat("Carros", 142)

local rightFrame = Instance.new("Frame")
rightFrame.Size = UDim2.new(1, -285, 1, -80)
rightFrame.Position = UDim2.new(0, 280, 0, 72)
rightFrame.BackgroundColor3 = Color3.fromRGB(22, 31, 41)
rightFrame.BorderSizePixel = 0
rightFrame.Parent = main

local rightRound = Instance.new("UICorner")
rightRound.CornerRadius = UDim.new(0, 16)
rightRound.Parent = rightFrame

local btnBuy = Instance.new("TextButton")
btnBuy.Size = UDim2.new(0, 155, 0, 42)
btnBuy.Position = UDim2.new(0, 18, 0, 16)
btnBuy.BackgroundColor3 = Color3.fromRGB(36, 174, 110)
btnBuy.Text = "COMPRAR CARRO"
btnBuy.Font = Enum.Font.GothamBold
btnBuy.TextColor3 = Color3.fromRGB(255,255,255)
btnBuy.TextSize = 14
btnBuy.Parent = rightFrame

local buyRound = Instance.new("UICorner")
buyRound.CornerRadius = UDim.new(0, 10)
buyRound.Parent = btnBuy

local btnUpgrade = Instance.new("TextButton")
btnUpgrade.Size = UDim2.new(0, 155, 0, 42)
btnUpgrade.Position = UDim2.new(0, 18, 0, 72)
btnUpgrade.BackgroundColor3 = Color3.fromRGB(72, 108, 255)
btnUpgrade.Text = "UPGRADE"
btnUpgrade.Font = Enum.Font.GothamBold
btnUpgrade.TextColor3 = Color3.fromRGB(255,255,255)
btnUpgrade.TextSize = 14
btnUpgrade.Parent = rightFrame

local upRound = Instance.new("UICorner")
upRound.CornerRadius = UDim.new(0, 10)
upRound.Parent = btnUpgrade

local btnBonus = Instance.new("TextButton")
btnBonus.Size = UDim2.new(0, 155, 0, 42)
btnBonus.Position = UDim2.new(0, 18, 0, 128)
btnBonus.BackgroundColor3 = Color3.fromRGB(245, 158, 42)
btnBonus.Text = "BÔNUS"
btnBonus.Font = Enum.Font.GothamBold
btnBonus.TextColor3 = Color3.fromRGB(255,255,255)
btnBonus.TextSize = 14
btnBonus.Parent = rightFrame

local bonusRound = Instance.new("UICorner")
bonusRound.CornerRadius = UDim.new(0, 10)
bonusRound.Parent = btnBonus

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -36, 0, 78)
statusText.Position = UDim2.new(0, 18, 0, 190)
statusText.BackgroundColor3 = Color3.fromRGB(33, 44, 56)
statusText.BorderSizePixel = 0
statusText.Font = Enum.Font.Gotham
statusText.Text = "Status: sistema funcionando."
statusText.TextColor3 = Color3.fromRGB(226, 236, 243)
statusText.TextSize = 14
statusText.TextWrapped = true
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.TextYAlignment = Enum.TextYAlignment.Top
statusText.Parent = rightFrame

local statusRound = Instance.new("UICorner")
statusRound.CornerRadius = UDim.new(0, 10)
statusRound.Parent = statusText

local function formatMoney(value)
    local sign = ""
    if value < 0 then
        sign = "-"
        value = math.abs(value)
    end

    local str = tostring(value)
    local num = ""

    while #str > 3 do
        num = "." .. string.sub(str, -3) .. num
        str = string.sub(str, 1, #str - 3)
    end

    num = str .. num
    return sign .. "$" .. num
end

local function updateUI()
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
        return
    end

    local cash = leaderstats:FindFirstChild("Cash")
    local income = leaderstats:FindFirstChild("IncomePerMinute")
    local garage = leaderstats:FindFirstChild("GarageLevel")
    local cars = leaderstats:FindFirstChild("CarsOwned")

    if cash then
        cashLabel.Text = formatMoney(cash.Value)
    end

    if income then
        incomeValue.Text = formatMoney(income.Value)
    end

    if garage then
        garageValue.Text = "Nível " .. tostring(garage.Value)
    end

    if cars then
        carsValue.Text = tostring(cars.Value)
    end
end

btnBuy.MouseButton1Click:Connect(function()
    empireEvent:FireServer("buyCar")
end)

btnUpgrade.MouseButton1Click:Connect(function()
    empireEvent:FireServer("upgradeGarage")
end)

btnBonus.MouseButton1Click:Connect(function()
    empireEvent:FireServer("collectBonus")
end)

empireEvent.OnClientEvent:Connect(function(typeName, message)
    if typeName == "toast" then
        statusText.Text = message
    elseif typeName == "toast2" then
        statusText.Text = statusText.Text .. "\n" .. message
    end
end)

task.spawn(function()
    while true do
        updateUI()
        task.wait(0.25)
    end
end)
