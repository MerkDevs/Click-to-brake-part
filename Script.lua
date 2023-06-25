-- Usefull variables
local plr = game:GetService("Players").LocalPlayer
local Clickdetector = script.Parent
local DestroyablePart = script.Parent.Parent
local healthUi = DestroyablePart.HealthBarUi
local clickedCounter = 0
local debounce = false
local healthFrame = healthUi.HealthBarUi.Health
local x = 200
local RunS = game:GetService("RunService")
Clickdetector.MouseClick:Connect(function()
	-- Debounce so that users cant spam click slowly ticks of health until it will disapear after 4 hits
	if debounce == false then
		debounce = true
		-- Increse the click counter each time the part is clicked
		clickedCounter += 1
		-- Make the health bar visible after the first hit
		if clickedCounter == 1 then
			healthUi.HealthBarUi.Enabled = true
			healthUi.HealthBarUi.Background.Visible = true
		end
			-- if the clickcounter reaches 4 then delete everything
		if clickedCounter == 4 then
			DestroyablePart.Transparency = 1
			DestroyablePart.CanCollide = false
			Clickdetector.Parent = game.ReplicatedStorage
			healthUi.HealthBarUi.Enabled = false
			-- Waits 5 secs before bringing the 
			task.wait(5)
			DestroyablePart.Position = Vector3.new(math.random(-65.522, 65.522), 4.918, math.random(-44.213, 44.213))
			healthUi.Position = DestroyablePart.Position + Vector3.new(0, 6.9, 0)
			DestroyablePart.Transparency = 0
			DestroyablePart.CanCollide = true
			Clickdetector.Parent = DestroyablePart
			clickedCounter = 0
		end
		-- gui decreases by 1/4 each time the click detector is clicked
		x = x - 50
		healthFrame.Size = UDim2.new(0, x, 0, 50)
		-- using heart beat wait because its better 💪
		RunS.Heartbeat.wait(.5)
		debounce = false
	end
end)
