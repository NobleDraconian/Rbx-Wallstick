local PhysicsService = game:GetService("PhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayerScripts = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts")
local StarterCharacterScripts = game:GetService("StarterPlayer"):WaitForChild("StarterCharacterScripts")

local PlayerScriptsLoader = script:WaitForChild("PlayerScriptsLoader")
local foundPlayerScriptsLoader = StarterPlayerScripts:FindFirstChild("PlayerScriptsLoader")

if foundPlayerScriptsLoader then
	-- destroy the loader if it already exists
	foundPlayerScriptsLoader:Destroy()
end

PlayerScriptsLoader.Parent = StarterPlayerScripts

local Animate = script:WaitForChild("Animate")
local foundAnimate = StarterCharacterScripts:FindFirstChild("Animate")

if foundAnimate then
	foundAnimate:Destroy()
end

Animate.Parent = StarterCharacterScripts

local defaultGroup = PhysicsService:GetCollisionGroupName(0)
local characterGroup = "WallstickCharacters"
PhysicsService:CreateCollisionGroup(characterGroup)
PhysicsService:CollisionGroupSetCollidable(defaultGroup, characterGroup, false)

require(script:WaitForChild("Remotes")) -- this creates and runs the remotes we need

local Wallstick = script:WaitForChild("Wallstick")
Wallstick.Parent = ReplicatedStorage