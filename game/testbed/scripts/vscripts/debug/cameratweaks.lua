DoIncludeScript("aperture_desk_job", getfenv(1))

function modifyCameraSettings()
    Msg( "Changing Camera Settings!\n" )
    print( "Changing Camera Settings!\n" )
    LocalPlayer = player
    EntityTarget = steampal_toilet_test_panel


    if LocalPlayer == nil then
        SteamPalPrint( "LocalPlayer not defined" )
    else
        -- Change camera path look values so you can move a bit more freely 
        LocalPlayer:SetCameraLookRangePitch( -90, 90 )
		LocalPlayer:SetCameraLookRangeYaw( -360, 360 )
		LocalPlayer:SetCameraMoveRangeLR( -512, 512 )
		LocalPlayer:SetCameraMoveRangeFB( -512, 512 )
		LocalPlayer:SetCameraLookSpeed( 0.5 )
        LocalPlayer:SetCameraMoveSpeed( 0.5 )
        LocalPlayer:ShowTransitionText("\nBow Down to your lord and savior...\nAnimal King!")
    end
end

camerakapow = modifyCameraSettings()