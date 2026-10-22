local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local empireEvent = ReplicatedStorage:FindFirstChild("EmpireEvent")
if not empireEvent then
    empireEvent = Instance.new("RemoteEvent")
    empireEvent.Name = "EmpireEvent"
    empireEvent.Parent = ReplicatedStorage
end

local PASSIVE_TICK = 2

local function setupLeaderstats(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local cash = Instance.new("IntValue")
    cash.Name = "Cash"
    cash.Value = 50000
    cash.Parent = leaderstats

    local income = Instance.new("IntValue")
    income.Name = "IncomePerMinute"
    income.Value = 1500
    income.Parent = leaderstats

    local garageLevel = Instance.new("IntValue")
    garageLevel.Name = "GarageLevel"
    garageLevel.Value = 1
    garageLevel.Parent = leaderstats

    local carsOwned = Instance.new("IntValue")
    carsOwned.Name = "CarsOwned"
    carsOwned.Value = 1
    carsOwned.Parent = leaderstats
end

local function getStats(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
        return nil
    end

    return {
        cash = leaderstats:FindFirstChild("Cash"),
        income = leaderstats:FindFirstChild("IncomePerMinute"),
        garage = leaderstats:FindFirstChild("GarageLevel"),
        cars = leaderstats:FindFirstChild("CarsOwned")
    }
end

local function buyCar(player)
    local stats = getStats(player)
    if not stats then
        return
    end

    local cost = 15000 + (stats.cars.Value * 6500)

    if stats.cash.Value >= cost then
        stats.cash.Value -= cost
        stats.cars.Value += 1
        stats.income.Value += 250

        empireEvent:FireClient(player, "toast", "Carro comprado!")
        empireEvent:FireClient(player, "toast2", "Renda aumentada: +" .. tostring(stats.income.Value) .. " por minuto")
    else
        empireEvent:FireClient(player, "toast", "Dinheiro insuficiente.")
    end
end

local function upgradeGarage(player)
    local stats = getStats(player)
    if not stats then
        return
    end

    local cost = 20000 * stats.garage.Value

    if stats.cash.Value >= cost then
        stats.cash.Value -= cost
        stats.garage.Value += 1
        stats.income.Value += 600

        empireEvent:FireClient(player, "toast", "Garagem melhorada!")
        empireEvent:FireClient(player, "toast2", "Renda total aumentada.")
    else
        empireEvent:FireClient(player, "toast", "Dinheiro insuficiente para upgrade.")
    end
end

local function collectBonus(player)
    local stats = getStats(player)
    if not stats then
        return
    end

    stats.cash.Value += 5000
    empireEvent:FireClient(player, "toast", "Bônus recebido: $5.000")
end

empireEvent.OnServerEvent:Connect(function(player, action)
    if action == "buyCar" then
        buyCar(player)
    elseif action == "upgradeGarage" then
        upgradeGarage(player)
    elseif action == "collectBonus" then
        collectBonus(player)
    end
end)

local function passiveIncomeLoop(player)
    task.spawn(function()
        while player.Parent do
            task.wait(PASSIVE_TICK)

            local stats = getStats(player)
            if stats then
                local gain = math.floor(stats.income.Value / 30)
                stats.cash.Value += gain
            end
        end
    end)
end

Players.PlayerAdded:Connect(function(player)
    setupLeaderstats(player)
    passiveIncomeLoop(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    setupLeaderstats(player)
    passiveIncomeLoop(player)
end
