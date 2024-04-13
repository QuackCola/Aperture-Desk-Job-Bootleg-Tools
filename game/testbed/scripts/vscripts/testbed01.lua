local localplayer = nil
local target = nil

function teleportPlayer()
    -- get a handle to the player object
    localplayer = Entities:GetLocalPlayer()
    -- Move The Player to a 'point_teleport' with the target name 'teleport_location'
    teleportLocation = Entities:FindByName(nil,"teleport_location")
    local pos = teleportLocation:GetOrigin()

    localplayer:SetOrigin(pos)
end


function printDebugStats()
    -- get a handle to the player object
    player = Entities:GetLocalPlayer()
    -- Print Thy Stats
    print("Printing out some player info:")
    print(player:IsPlayer())
    print(player:GetOrigin())
    print(player:EyeAngles())
    print(player:GetModelName())
    print(player:EyePosition())
end