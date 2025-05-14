pfUI:RegisterModule("chathider", "vanilla:tbc", function()
  if not pfUI.chat or not pfUI.chat.left then return end

  pfUI.chathider = CreateFrame("Frame", nil, UIParent)
  pfUI.chathider:RegisterEvent("PLAYER_REGEN_DISABLED")
  pfUI.chathider:RegisterEvent("PLAYER_REGEN_ENABLED")

  pfUI.chathider:SetScript("OnEvent", function()
    if event == "PLAYER_REGEN_DISABLED" then
      -- Hide only the LEFT chat frame
      pfUI.chat.left:Hide()
    elseif event == "PLAYER_REGEN_ENABLED" then
      -- Show it immediately when leaving combat
      pfUI.chat.left:Show()
    end
  end)
end)
