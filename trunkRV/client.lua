local function VehicleInFront()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 4.0, 0.0)
	local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, result = GetRaycastResult(rayHandle)
	return result
end


Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      if (IsControlJustPressed(0, 38)) then
			local Veh = VehicleInFront()
			local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(Veh))
			local locked = GetVehicleDoorAngleRatio(Veh,5)
			if locked == 0 then
				SetVehicleDoorOpen(Veh, 5, false, false)
			else
				SetVehicleDoorShut(Veh, 5, false, false)
			end
      end
    end
end)

-- 0 to zamkniete
-- gaun -1233767450