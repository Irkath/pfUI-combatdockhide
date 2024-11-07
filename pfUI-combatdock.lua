pfUI:RegisterModule("combatdock", "vanilla:tbc", function ()
    if not pfUI.chat.right or not pfUI.thirdparty.meters then
        return
    end

    pfUI.combatdock = CreateFrame("Frame", nil, UIParent)
    pfUI.combatdock:RegisterEvent("PLAYER_REGEN_DISABLED")
    pfUI.combatdock:RegisterEvent("PLAYER_REGEN_ENABLED")

    pfUI.combatdock:SetScript("OnEvent", function()
        if event == "PLAYER_REGEN_DISABLED" then
            if pfUI.chat.right:IsShown() and not pfUI.thirdparty.meters.state then
                pfUI.thirdparty.meters:Toggle()
            end
        elseif event == "PLAYER_REGEN_ENABLED" then
            if pfUI.chat.right:IsShown() and pfUI.thirdparty.meters.state then
                pfUI.thirdparty.meters:Toggle()
            end
        end
    end)
end)