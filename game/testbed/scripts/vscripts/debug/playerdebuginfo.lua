
function printPlayerDebugInfo()
    player = Entities:GetLocalPlayer()
    -- Print Thy Stats
    print("Printing out some player info:")
    print("IsPlayer\n",player:IsPlayer())
    print("Current Origin\n",player:GetOrigin())
    print("Eye Angles\n",player:EyeAngles())
    print("Current Model\n",player:GetModelName())
    print("Eye Position\n",player:EyePosition())
end