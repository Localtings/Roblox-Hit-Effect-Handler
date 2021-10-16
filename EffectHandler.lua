local effect = {}
effect.__index = effect

effect.NEW_TWEEN = function()
	local effect = setmetatable({},effect)
	return effect
end

function effect:GenerateParticles(t, o)
	local hiteffect = o
	hiteffect.Parent = t
	hiteffect:Emit(1)
	game.Debris:AddItem(hiteffect,1)
end

function effect:GenerateMeshEffect(t, o, ti)
	local tweenservice = game:GetService("TweenService")
	local HiteffectBall = function(Target, Object, T_ime)
		local size
		
		if o.Name == "Sphere" then
			size = Vector3.new(0.195, 0.195, 0.195)
		else
			size = Vector3.new(0.106, 0.094, 11.668)
		end
		
		local ClonedBall = Object
		ClonedBall.Parent = Target
		ClonedBall.CFrame = Target.CFrame * CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
		ClonedBall.CFrame = CFrame.new(ClonedBall.Position, Target.Position)
		game.Debris:AddItem(ClonedBall,1)
		
		tweenservice:Create(
			ClonedBall,
			TweenInfo.new(
				T_ime,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.InOut
			),
			{
				CFrame = ClonedBall.CFrame + ClonedBall.CFrame.lookVector * -12, 
				Transparency = 1,
				Size = size
			}
		):Play()
		
	end
	HiteffectBall(t, o, ti)
end
return effect
