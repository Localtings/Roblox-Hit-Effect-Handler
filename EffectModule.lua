--[[
	module:GenerateParticles(Target, Object, Emit)
	module:GenerateMeshEffect(Target, Object, Duration, How many studs will the mesh move foward?)
]]

local effect = {}

function effect:GenerateParticles(t, o, e)
	local hiteffect = o
	
	if not e then
		e = 1
	end
	
	hiteffect.Parent = t
	hiteffect:Emit(e)
	game.Debris:AddItem(hiteffect,1)
end

function effect:GenerateMeshEffect(t, o, ti, st)
	
	local tweenservice = game:GetService("TweenService")
	local HiteffectBall = function(Target, Object, T_ime)
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
				CFrame = ClonedBall.CFrame + ClonedBall.CFrame.lookVector * -st, 
				Transparency = 1,
			}
		):Play()
		
	end
	HiteffectBall(t, o, ti)
	
	
end


return effect
