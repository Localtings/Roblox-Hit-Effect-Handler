--[[
	USAGE:
	module.NEW_TWEEN() - Starts the module.
	module:GenerateParticles(Target, Object) - Play Effect (Particles)
	module:GenerateMeshEffect(Target, Object, Duration, Desired Size) - Play Effect (Meshes)
]]

--Metatable--
local effect = {}
effect.__index = effect


--Initialize--
effect.NEW_TWEEN = function()
	local effect = setmetatable({},effect)
	return effect
end

--Child--
function effect:GenerateParticles(t, o)
	local hiteffect = o
	hiteffect.Parent = t
	hiteffect:Emit(1)
	game.Debris:AddItem(hiteffect,1)
end

function effect:GenerateMeshEffect(t, o, ti, size)
	local tweenservice = game:GetService("TweenService")
	local HiteffectBall = function(Target, Object, T_ime, Size)
		local ClonedBall = Object
		ClonedBall.Parent = Target
		ClonedBall.CFrame = Target.CFrame * CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
		ClonedBall.CFrame = CFrame.new(ClonedBall.Position, Target.Position)
		game.Debris:AddItem(ClonedBall,1)
		tweenservice:Create(ClonedBall,TweenInfo.new(T_ime,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{CFrame = ClonedBall.CFrame + ClonedBall.CFrame.lookVector * -7,Transparency = 1,Size = size:Play()
	end	
	HiteffectBall(t, o, ti, size)
end
return effect
