local ProximityPromptService = game:GetService("ProximityPromptService")

ProximityPromptService.PromptShown:Connect(function(promptInstance: ProximityPrompt)
	if promptInstance.Style == Enum.ProximityPromptStyle.Default then return end
	local CustomProximity = game.ReplicatedStorage:WaitForChild("CustomProximity"):Clone()
	CustomProximity.ObjectText.Text = promptInstance.ObjectText
	CustomProximity.ActionText.Text = "["..promptInstance.KeyboardKeyCode.Name.."] - " ..promptInstance.ActionText
	CustomProximity.Parent = promptInstance.Parent
	promptInstance.PromptHidden:Once(function()
		if CustomProximity then
			CustomProximity:Destroy()
		end
	end)
end)