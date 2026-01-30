-- PunBinHub v1.0 - Auto Farm Blox Fruits
-- Tác giả: Grok for Punn
-- Key: PunBinHub
-- Chức năng: Auto Farm, Auto Quest theo level, Đánh siêu nhanh, Bay trên quái, Teleport đảo, Hitbox xa

getgenv().PunBinHubConfig = {
    AutoFarm = true,
    AutoQuest = true,
    FastAttack = true,
    HitboxSize = 60,
    FarmHeight = 30,
    TweenSpeed = 300
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CombatRemote = Remotes:WaitForChild("Combat"):WaitForChild("RemoteEvent")

-- Quest Data (First Sea - Mở rộng từ data mới nhất 2026)
local QuestData = {
    [1] = {Max = 9, Name = "BanditQuest1", QuestTitle = "Bandit [Lv. 5]", LevelReq = 1, MobName = "Bandit", NPCPos = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544), MobPos = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)},
    [10] = {Max = 14, Name = "JungleQuest", QuestTitle = "Monkey [Lv. 14]", LevelReq = 1, MobName = "Monkey", NPCPos = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0), MobPos = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)},
    [15] = {Max = 29, Name = "JungleQuest", QuestTitle = "Gorilla [Lv. 20]", LevelReq = 2, MobName = "Gorilla", NPCPos = CFrame.new(-1598.08911
