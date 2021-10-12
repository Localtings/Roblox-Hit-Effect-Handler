--[[
	module.NEW_TWEEN() 
	module:GenerateParticles(Target, Object)
	module:GenerateMeshEffect(Target, Object, Duration, Desired Size, How many studs will the meshes move foward?)
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
function effect:GenerateParticles(_time, _object, _emit)
	local hiteffect = _object
	hiteffect.Parent = _time
	hiteffect:Emit(_emit)
	game.Debris:AddItem(hiteffect,1)
end

function effect:GenerateMeshEffect(_target, _object, _time, size, moveFoward)
	local tweenservice = game:GetService("TweenService")
	local ClonedBall = _object
	ClonedBall.Parent = _target
	ClonedBall.CFrame = _target.CFrame * CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
	ClonedBall.CFrame = CFrame.new(ClonedBall.Position, _target.Position)
	game.Debris:AddItem(ClonedBall,1)
	
	tweenservice:Create(
		ClonedBall,
		TweenInfo.new(
			_time,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut
		),{
			CFrame = ClonedBall.CFrame + ClonedBall.CFrame.lookVector * -moveFoward,
			Transparency = 1,
			Size = size
	 	}):Play()
end

return effect
