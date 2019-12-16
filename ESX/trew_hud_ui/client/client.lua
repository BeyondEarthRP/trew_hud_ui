local ESX	 = nil

-- ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)






local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local AllWeapons = json.decode('{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')




local vehiclesCars = {0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20};



-- Hides TREW UI when it's on Pause Menu
Citizen.CreateThread(function()
  local isPauseMenu = false

	while true do
		Citizen.Wait(0)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = false })
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = true })
			end

			HideHudComponentThisFrame(1)  -- Wanted Stars
			HideHudComponentThisFrame(2)  -- Weapon Icon
			HideHudComponentThisFrame(3)  -- Cash
			HideHudComponentThisFrame(4)  -- MP Cash
			HideHudComponentThisFrame(6)  -- Vehicle Name
			HideHudComponentThisFrame(7)  -- Area Name
			HideHudComponentThisFrame(8)  -- Vehicle Class
			HideHudComponentThisFrame(9)  -- Street Name
			HideHudComponentThisFrame(13) -- Cash Change
			HideHudComponentThisFrame(17) -- Save Game
			HideHudComponentThisFrame(20) -- Weapon Stats
		end
	end
end)

-- Date and time update
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if Config.ui.showDate == true then
			SendNUIMessage({ action = 'setText', id = 'date', value = trewDate() })
		end
	end
end)





-- Location update
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local player = GetPlayerPed(-1)

		local position = GetEntityCoords(player)

		if Config.ui.showLocation == true then
			local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
			local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))

			local locationMessage = nil

			if zoneNameFull then
				locationMessage = streetName .. ', ' .. zoneNameFull
			else
				locationMessage = streetName
			end

			locationMessage = string.format(
				Locales[Config.Locale]['you_are_on_location'],
				locationMessage
			)

			SendNUIMessage({ action = 'setText', id = 'location', value = locationMessage })
		end
	end
end)



-- Vehicle Info
local vehicleCruiser
local vehicleSignalIndicator = 'off'
local seatbeltEjectSpeed = 28.0
local seatbeltEjectAccel = 100.0
local seatbeltIsOn = false
local currSpeed = 0.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}
local prevRotationVelocity = {x = 0.0, y = 0.0, z = 0.0}
local entFwdVector = {x = 0.0, y = 0.0, z = 0.0}
local isBlackedOut = false

-- Jay's vehicle ejections edit
local function ejectPedFromVehicle(player, vehicle, impact, position, fwdposition, prevVelocity, prevRotationVelocity)
	local velocity_multiplier = (math.floor(((impact/1500) + 1)*100)/100)
	local damage_multiplier = (math.floor((impact/50)*100)/100) + 0.01
	local damage_impact = 5.1 * velocity_multiplier
	local ejectionDamage = math.floor(damage_impact * damage_multiplier)

	DisableAllControlActions(0)
	SetFollowVehicleCamViewMode(4) -- Force first person view in the car to increase the blinking wakening and blinking effect
	StopScreenEffect("DrugsDrivingIn") -- Stop the injured effect to introduce the smooth injured effect exit
	SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
	SetPedToRagdoll(player, 1000, 2000, 0, true, false, false)
	ApplyForceToEntity(player, 1, prevVelocity.x, prevVelocity.y, prevVelocity.z, prevRotationVelocity.x, prevRotationVelocity.y, prevRotationVelocity.z, 0, false, true, false, false, true)
	ApplyDamageToPed(player, ejectionDamage, false)
	SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z * -1.5)
	Citizen.Wait(200)
	if not isBlackedOut then
		isBlackedOut = true
		DoScreenFadeOut(ejectionDamage*(damage_impact/2))
		if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then -- move_m@injured or MOVE_M@DRUNK@VERYDRUNK or move_injured_generic
			RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
			while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
				Citizen.Wait(0)
			end
		end
		SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0) -- Set the injured ped move, best one is verydrunk in my opinion.
		if not playerStatus.isdead then
			DoScreenFadeIn(1800) -- Blinking effect
			Citizen.Wait(200)
			DoScreenFadeOut(1600)
			Citizen.Wait(1800)
			DoScreenFadeIn(1400)
			Citizen.Wait(1600)
			DoScreenFadeOut(1100)
			isBlackedOut = false -- Release controls to the player after 2 blinks (added a disable camera mode to force FPS and a disable multiplayer talking)
			Citizen.Wait(1100)
			DoScreenFadeIn(1000)
			Citizen.Wait(1200)
			DoScreenFadeOut(900)
			Citizen.Wait(900)
			DoScreenFadeIn(800)
			Citizen.Wait(1000)
			DoScreenFadeOut(700)
			Citizen.Wait(700)
			DoScreenFadeIn(600)

			if impact <= 50 then -- Injured visual effect duration, depending on impact speed
				Citizen.Wait(100)
			elseif impact > 50 and impact <= 60 then
				Citizen.Wait(500)
			elseif impact > 60 and impact <= 70 then
				Citizen.Wait(1000)
			elseif impact > 70 and impact <= 80 then
				Citizen.Wait(1500)
			else
				Citizen.Wait(2300)
			end
		end
	end

	Citizen.Wait(50)

	if impact <= 500 and not playerStatus.isdead then -- Smooth exit, duration depending on impact speed, again
		StartScreenEffect("DrugsDrivingOut",1000,false)
		Citizen.Wait(1200)
		ResetPedMovementClipset(GetPlayerPed(-1))
		ResetPedWeaponMovementClipset(GetPlayerPed(-1))
		ResetPedStrafeClipset(GetPlayerPed(-1))
	elseif impact > 50 and impact <= 60 then
		StartScreenEffect("DrugsDrivingOut",4000,false)
		Citizen.Wait(4200)
		ResetPedMovementClipset(GetPlayerPed(-1))
		ResetPedWeaponMovementClipset(GetPlayerPed(-1))
		ResetPedStrafeClipset(GetPlayerPed(-1))
	elseif impact > 60 and impact <= 70 then
		StartScreenEffect("DrugsDrivingOut",8000,false)
		Citizen.Wait(8200)
		ResetPedMovementClipset(GetPlayerPed(-1))
		ResetPedWeaponMovementClipset(GetPlayerPed(-1))
		ResetPedStrafeClipset(GetPlayerPed(-1))
	elseif impact > 70 and impact <= 80 then
		StartScreenEffect("DrugsDrivingOut",10000,false)
		Citizen.Wait(10200)
		ResetPedMovementClipset(GetPlayerPed(-1))
		ResetPedWeaponMovementClipset(GetPlayerPed(-1))
		ResetPedStrafeClipset(GetPlayerPed(-1))
	else
		StartScreenEffect("DrugsDrivingOut",20000,false)
		Citizen.Wait(20200)
		ResetPedMovementClipset(GetPlayerPed(-1))
		ResetPedWeaponMovementClipset(GetPlayerPed(-1))
		ResetPedStrafeClipset(GetPlayerPed(-1))
	end

	print("[position] x:" ..  position.x .. " y:" .. position.y .. " z:" .. position.z)
	print("[fwdposition] x:" ..  fwdposition.x .. " y:" .. fwdposition.y .. " z:" .. fwdposition.z)
	print("[prevVelocity] x:" ..  prevVelocity.x .. " y:" .. prevVelocity.y .. " z:" .. prevVelocity.z)
	print("[prevRotationVelocity] x:" ..  prevRotationVelocity.x .. " y:" .. prevRotationVelocity.y .. " z:" .. prevRotationVelocity.z)
	print("")
	print("velocity_multiplier: " .. velocity_multiplier)
	print("damage_multiplier: " .. damage_multiplier)
	print("damage_impact: " .. damage_impact)
	print("ejectionDamage: " .. ejectionDamage)
	print("---------")
	print("")

	--[[ TO DO:
	-- WINDSHIELD NEEDS TO BREAK SOMEHOW
	-- PROBABLY NEED MORE BLOOD
	-- A GLASS SHATTER SOUND WOULD ALSO BE COOL HERE

	 TRYING TO BREAK THE WINDHSHIELD- BOO!
	 \/
	--this didn't work -->> DetachVehicleWindscreen(vehicle)
	--this didn't work -->> BreakEntityGlass(vehicle, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, true, true)

	--couldn't tell if this worked... no difference really--> 	PlaySoundFromEntity(vehicle, "FAMILY1_CAR_CRASH_BIG", l_BD7, 0, 0, 0)
	]]--

	--[[ this works below ]]--
	--PlayPain(player, 7, 0, 0)
	--ApplyPedDamagePack(player, 'BigRunOverByVehicle', ejectionDamage, 2)
	--ShakeGameplayCam("JOLT_SHAKE", damage_impact)
	--RenderFirstPersonCam(true, 1.0, 3)

	--[testing this]--
	--StartParticleFxNonLoopedOnEntity('glass_windscreen', player, prevVelocity.x, prevVelocity.y, prevVelocity.z, prevRotationVelocity.x, prevRotationVelocity.y, prevRotationVelocity.z,  1.0, false, false, false)
	--StartParticleFxNonLoopedOnEntity('ptfx_blood_spray', player, prevVelocity.x, prevVelocity.y, prevVelocity.z, prevRotationVelocity.x, prevRotationVelocity.y, prevRotationVelocity.z,  1.0, false, false, false)
	--SetPedMovementClipset(player, 'move_injured_generic', 1.0)
	--DID NOT WORK--> BreakEntityGlass(vehicle, position.x, position.y, position.z, 1, fwdposition.x, fwdposition.y, fwdposition.z, 0, 1, 1)
	--[continue what is already working]--

end

local function blackout(player, impact)
	impact = impact / 100 -- Before math, this number will be around 500 - 800 ... /100 puts it back on track.
	-- Only blackout once to prevent an extended blackout if both speed and damage thresholds were met
	if not isBlackedOut then
		isBlackedOut = true
		-- This thread will black out the user's screen for the specified time
		Citizen.CreateThread(function()
			print("The impact speed was: ", impact) -- Print impact speed for F8 console ... in french
			TriggerServerEvent('InteractSound_CL:PlayWithinDistance', 50.0, 'crash01', 0.5) -- Trigger crash sound around yourself, works with InteractiveSound
			if impact <= 50 then -- Shakycam on impact
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4)
			elseif impact > 50 and impact <= 60 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.7)
			elseif impact > 60 and impact <= 70 then
				ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 1.2)
			elseif impact > 70 and impact <= 80 then
				ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 1.5)
			else
				ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.5)
			end

			-- Cause death on blackout to have a ragdoll laying on the steering wheel for later revive
			--SetEntityHealth(GetPlayerPed(-1), 0)

			Citizen.Wait(200)
			DoScreenFadeOut(impact * 100)

			-- HERE IS AN ATTEMPT TO PLAY A LAYING ON THE STEERING WHEEL ANIMATION -> Ped disapears, don't know why
			-- while (not HasAnimDictLoaded("veh@std@ds@base")) do
			-- RequestAnimDict("veh@std@ds@base")
			-- Citizen.Wait(5)
			-- end
			-- TaskPlayAnim(GetPlayerPed(-1), "veh@std@ds@base", "veh@std@ds@base", 8.0, 1.0, 20000, -1, 0, 0, 0, 0)
			--veh@std@ds@base

			StartScreenEffect("DrugsDrivingIn",3000,false)	-- Start the injured effect
			while not IsScreenFadedOut() do
				Citizen.Wait(0)
			end

			if impact <= 50 then -- Blackout duration depending on impact speed, 1000 is 1 sec
				Citizen.Wait(5000)
			elseif impact > 50 and impact <= 60 then
				Citizen.Wait(10000)
				SetEntityHealth(player, 160)
			elseif impact > 60 and impact <= 70 then
				Citizen.Wait(20000)
				SetEntityHealth(player, 150)
			elseif impact > 70 and impact <= 80 then
				Citizen.Wait(30000)
				SetEntityHealth(player, 125)
			else
				Citizen.Wait(30000)
				SetEntityHealth(player, 75) -- This setting cause death to passengers, try 100 if you want very low life.
			end

			-- HERE WAS THE REVIVE -> Issue is ped is warping out and in the car in a seconde for other players, didn't find a a way to avoid id
			-- local lastveh = GetVehiclePedIsIn(GetPlayerPed(-1))
			-- ResurrectPed(GetPlayerPed(-1))
			-- SetEntityHealth(GetPlayerPed(-1), GetEntityMaxHealth(GetPlayerPed(-1)))
			-- ClearPedTasksImmediately(GetPlayerPed(-1))
			-- SetPedIntoVehicle(GetPlayerPed(-1), lastveh, -1)

			SetFollowVehicleCamViewMode(4) -- Force first person view in the car to increase the blinking wakening and blinking effect

			if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then -- move_m@injured or MOVE_M@DRUNK@VERYDRUNK or move_injured_generic
				RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
				while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
					Citizen.Wait(0)
				end
			end
			SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0) -- Set the injured ped move, best one is verydrunk in my opinion.
			DoScreenFadeIn(1800) -- Blinking effect
			Citizen.Wait(2000)
			DoScreenFadeOut(1600)
			Citizen.Wait(1800)
			DoScreenFadeIn(1400)
			Citizen.Wait(1600)
			DoScreenFadeOut(1100)
			isBlackedOut = false -- Release controls to the player after 2 blinks (added a disable camera mode to force FPS and a disable multiplayer talking)
			Citizen.Wait(1100)
			DoScreenFadeIn(1000)
			Citizen.Wait(1200)
			DoScreenFadeOut(900)
			Citizen.Wait(900)
			DoScreenFadeIn(800)
			Citizen.Wait(1000)
			DoScreenFadeOut(700)
			Citizen.Wait(700)
			DoScreenFadeIn(600)

			if impact <= 50 then -- Injured visual effect duration, depending on impact speed
				Citizen.Wait(1000)
			elseif impact > 50 and impact <= 60 then
				Citizen.Wait(5000)
			elseif impact > 60 and impact <= 70 then
				Citizen.Wait(10000)
			elseif impact > 70 and impact <= 80 then
				Citizen.Wait(15000)
			else
				Citizen.Wait(23000)
			end

			StopScreenEffect("DrugsDrivingIn") -- Stop the injured effect to introduce the smooth injured effect exit

			if impact <= 50 then -- Smooth exit, duration depending on impact speed, again
				StartScreenEffect("DrugsDrivingOut",1000,false)
				Citizen.Wait(1200)
				ResetPedMovementClipset(GetPlayerPed(-1))
				ResetPedWeaponMovementClipset(GetPlayerPed(-1))
				ResetPedStrafeClipset(GetPlayerPed(-1))
			elseif impact > 50 and impact <= 60 then
				StartScreenEffect("DrugsDrivingOut",4000,false)
				Citizen.Wait(4200)
				ResetPedMovementClipset(GetPlayerPed(-1))
				ResetPedWeaponMovementClipset(GetPlayerPed(-1))
				ResetPedStrafeClipset(GetPlayerPed(-1))
			elseif impact > 60 and impact <= 70 then
				StartScreenEffect("DrugsDrivingOut",8000,false)
				Citizen.Wait(8200)
				ResetPedMovementClipset(GetPlayerPed(-1))
				ResetPedWeaponMovementClipset(GetPlayerPed(-1))
				ResetPedStrafeClipset(GetPlayerPed(-1))
			elseif impact > 70 and impact <= 80 then
				StartScreenEffect("DrugsDrivingOut",10000,false)
				Citizen.Wait(10200)
				ResetPedMovementClipset(GetPlayerPed(-1))
				ResetPedWeaponMovementClipset(GetPlayerPed(-1))
				ResetPedStrafeClipset(GetPlayerPed(-1))
			else
				StartScreenEffect("DrugsDrivingOut",20000,false)
				Citizen.Wait(20200)
				ResetPedMovementClipset(GetPlayerPed(-1))
				ResetPedWeaponMovementClipset(GetPlayerPed(-1))
				ResetPedStrafeClipset(GetPlayerPed(-1))
			end
		end)
	end
end

--------------------------------------------------------

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(100)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local position = GetEntityCoords(player)
		local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
		local vehicleInfo

		if IsPedInAnyVehicle(player, false) and vehicleIsOn then


			local vehicleClass = GetVehicleClass(vehicle)


			if Config.ui.showMinimap == false then
				DisplayRadar(true)
			end

			-- Vehicle Speed
			local vehicleSpeedSource = GetEntitySpeed(vehicle)
			local vehicleSpeed
			if Config.vehicle.speedUnit == 'MPH' then
				vehicleSpeed = math.ceil(vehicleSpeedSource * 2.237)
			else
				vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)
			end

			-- Vehicle Gradient Speed
			local vehicleNailSpeed

			if vehicleSpeed > Config.vehicle.maxSpeed then
				vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(Config.vehicle.maxSpeed * 205) / Config.vehicle.maxSpeed) )
			else
				vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(vehicleSpeed * 205) / Config.vehicle.maxSpeed) )
			end



			-- Vehicle Fuel and Gear
			local vehicleFuel
			vehicleFuel = GetVehicleFuelLevel(vehicle)

			local vehicleGear = GetVehicleCurrentGear(vehicle)

			if (vehicleSpeed == 0 and vehicleGear == 0) or (vehicleSpeed == 0 and vehicleGear == 1) then
				vehicleGear = 'N'
			elseif vehicleSpeed > 0 and vehicleGear == 0 then
				vehicleGear = 'R'
			end

			-- Vehicle Lights
			local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
			local vehicleIsLightsOn
			if vehicleLights == 1 and vehicleHighlights == 0 then
				vehicleIsLightsOn = 'normal'
			elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
				vehicleIsLightsOn = 'high'
			else
				vehicleIsLightsOn = 'off'
			end

			-- Vehicle Siren
			local vehicleSiren

			if IsVehicleSirenOn(vehicle) then
				vehicleSiren = true
			else
				vehicleSiren = false
			end


			-- Vehicle Seatbelt
			local prevSpeed = currSpeed
			currSpeed = vehicleSpeedSource

			local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
			local impact = (prevSpeed - currSpeed) / GetFrameTime()

			if has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8 then

        if not seatbeltIsOn then
					if (prevSpeed - currSpeed) > 10 then
						print("--------------------------------------------------------------")
						print("vehIsMovingFwd: " .. tostring(vehIsMovingFwd))
						print("")
						print("prevSpeed: " .. prevSpeed)
						print("seatbeltEjectSpeed: " .. seatbeltEjectSpeed)
						print("prevSpeed > seatbeltEjectSpeed: " .. tostring(prevSpeed > seatbeltEjectSpeed))
						print("")
						print("prevSpeed: " .. prevSpeed)
						print("currSpeed: " .. currSpeed)
						print("impact = " .. impact)
						print("is this greater than " .. (seatbeltEjectAccel*3.7) .. "? " .. tostring(impact > (seatbeltEjectAccel*3.7)))
						print("")
					end
					--print("the seatbelt is off")
          if vehIsMovingFwd and (prevSpeed > seatbeltEjectSpeed) and (impact > (seatbeltEjectAccel*3.7)) then  -- was (seatbeltEjectAccel*9.81) || this is very high.  I ran into some cars an only got about 700ish, running full speed into a head on car.  This should be about half what it is.
						print(impact .. "IMPACT!!!!!!")
						entFwdVector = GetEntityForwardVector(player)
						print("You've been ejected from the vehicle...")
						if (impact > (seatbeltEjectAccel*6.1)) then
							print("greater than " .. (seatbeltEjectAccel*6.1) .. "... and you blacked out like a true wuss...")
							blackout(player, impact)
						end
						ejectPedFromVehicle(player, vehicle, impact, position, entFwdVector, prevVelocity, prevRotationVelocity)
          else
              -- Update previous velocity for ejecting player
              prevVelocity = GetEntityVelocity(vehicle)
							prevRotationVelocity = GetEntityRotationVelocity(vehicle)
          end
        else
					--print("the seatbelt is on")
					SetPedConfigFlag(PlayerPedId(), 32, true)
					DisableControlAction(0, 75)
					if (prevSpeed - currSpeed) > 10 then
						print("--------------------------------------------------------------")
						print("(not isBlackedOut): " .. tostring((not isBlackedOut)))
						print("vehIsMovingFwd: " .. tostring(vehIsMovingFwd))
						print("currSpeed < prevSpeed: " .. tostring((currSpeed < prevSpeed)))
						print("")
						print("prevSpeed: " .. prevSpeed)
						print("currSpeed: " .. currSpeed)
						print("prevSpeed - currSpeed = " .. (prevSpeed - currSpeed))
						print("is this greater than " .. Config.BlackoutSpeedRequired)
						print("((prevSpeed - currSpeed) >= Config.BlackoutSpeedRequired): " .. tostring(((prevSpeed - currSpeed) >= Config.BlackoutSpeedRequired)))
						print("")
					end
					if (not isBlackedOut) and vehIsMovingFwd and (currSpeed < prevSpeed) and ((prevSpeed - currSpeed) >= Config.BlackoutSpeedRequired) then
						print(impact .. "IMPACT!!!!!!")
						if (impact > (seatbeltEjectAccel*7.1)) then
							print("greater than " .. (seatbeltEjectAccel*7.1) .. "blacked out...")
							blackout(player, impact)
						end
					else
						-- Update previous velocity for ejecting player
						prevVelocity = GetEntityVelocity(vehicle)
						prevRotationVelocity = GetEntityRotationVelocity(vehicle)
					end
				end
			elseif has_value(vehiclesCars, vehicleClass) == true and vehicleClass == 8 then
				print("there is no seatbelt in the vehicle. careful now!")
				local prevSpeed = currSpeed
				currSpeed = vehicleSpeedSource

				SetPedConfigFlag(PlayerPedId(), 32, true)

				local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
				local impact = (prevSpeed - currSpeed) / GetFrameTime()
				if vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed-10)) and (impact > (seatbeltEjectAccel*1.3)) then  -- was (seatbeltEjectAccel*9.81) || this is very high.  I ran into some cars an only got about 700ish, running full speed into a head on car.  This should be about half what it is.
					entFwdVector = GetEntityForwardVector(player)
					ejectPedFromVehicle(player, vehicle, impact, position, entFwdVector, prevVelocity, prevRotationVelocity)
					Citizen.Wait(100)
					if (impact > (seatbeltEjectAccel*4.1)) then
						blackout(impact)
					end
				else
					-- Update previous velocity for ejecting player
					prevVelocity = GetEntityVelocity(vehicle)
					prevRotationVelocity = GetEntityRotationVelocity(vehicle)
				end
			end
			vehicleInfo = {
				action = 'updateVehicle',

				status = true,
				speed = vehicleSpeed,
				nail = vehicleNailSpeed,
				gear = vehicleGear,
				fuel = vehicleFuel,
				lights = vehicleIsLightsOn,
				signals = vehicleSignalIndicator,
				cruiser = vehicleCruiser,
				type = vehicleClass,
				siren = vehicleSiren,
				seatbelt = {},

				config = {
					speedUnit = Config.vehicle.speedUnit,
					maxSpeed = Config.vehicle.maxSpeed
				}
			}

			vehicleInfo['seatbelt']['status'] = seatbeltIsOn
		else
			vehicleCruiser = false
			vehicleNailSpeed = 0
			vehicleSignalIndicator = 'off'

            seatbeltIsOn = false

			vehicleInfo = {
				action = 'updateVehicle',

				status = false,
				nail = vehicleNailSpeed,
				seatbelt = { status = seatbeltIsOn },
				cruiser = vehicleCruiser,
				signals = vehicleSignalIndicator,
				type = 0,
			}

			if Config.ui.showMinimap == false then
				DisplayRadar(false)
			end
		end
		SendNUIMessage(vehicleInfo)
	end
end)




-- Player status
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1000)

		local playerStatus
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }

		if Config.ui.showHealth == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['isdead'] = false

			playerStatus['status'][showPlayerStatus] = {
				name = 'health',
				value = GetEntityHealth(GetPlayerPed(-1)) - 100
			}

			if IsEntityDead(GetPlayerPed(-1)) then
				playerStatus.isdead = true
			end
		end

		if Config.ui.showArmor == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'armor',
				value = GetPedArmour(GetPlayerPed(-1)),
			}
		end

		if Config.ui.showStamina == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'stamina',
				value = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
			}
		end

		TriggerServerEvent('trew_hud_ui:getServerInfo')

		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end

	end
end)

-- Overall Info
RegisterNetEvent('trew_hud_ui:setInfo')
AddEventHandler('trew_hud_ui:setInfo', function(info)

	SendNUIMessage({ action = 'setText', id = 'job', value = info['job'] })
	SendNUIMessage({ action = 'setMoney', id = 'wallet', value = info['money'] })
	SendNUIMessage({ action = 'setMoney', id = 'bank', value = info['bankMoney'] })
	SendNUIMessage({ action = 'setMoney', id = 'blackMoney', value = info['blackMoney'] })

	TriggerEvent('esx:getSharedObject', function(obj)
		ESX = obj
		ESX.PlayerData = ESX.GetPlayerData()
	end)

	if ESX.PlayerData.job ~= nil then
		if ESX.PlayerData.job.grade_name ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
			if (Config.ui.showSocietyMoney == true) then
				SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
			end
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
				SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
			end, ESX.PlayerData.job.name)
		else
			SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		end
	end

	local playerStatus
	local showPlayerStatus = 0
	playerStatus = { action = 'setStatus', status = {} }


	if Config.ui.showHunger == true then
		showPlayerStatus = (showPlayerStatus+1)

		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			playerStatus['status'][showPlayerStatus] = {
				name = 'hunger',
				value = math.floor(100-status.getPercent())
			}
		end)

	end

	if Config.ui.showThirst == true then
		showPlayerStatus = (showPlayerStatus+1)

		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			playerStatus['status'][showPlayerStatus] = {
				name = 'thirst',
				value = math.floor(100-status.getPercent())
			}
		end)
	end

	if showPlayerStatus > 0 then
		SendNUIMessage(playerStatus)
	end


end)


-- Voice detection and distance
Citizen.CreateThread(function()

	if Config.ui.showVoice == true then

	    RequestAnimDict('facials@gen_male@variations@normal')
	    RequestAnimDict('mp_facial')

	    while true do
	        Citizen.Wait(300)
	        local playerID = PlayerId()

	        for _,player in ipairs(GetActivePlayers()) do
	            local boolTalking = NetworkIsPlayerTalking(player)

	            if player ~= playerID then
	                if boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
	                elseif not boolTalking then
	                    PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
	                end
	            end
	        end
	    end

	end
end)



Citizen.CreateThread(function()
	if Config.ui.showVoice == true then



		local isTalking = false
		local voiceDistance = nil

		while true do
			Citizen.Wait(1)




			if NetworkIsPlayerTalking(PlayerId()) and not isTalking then
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			elseif not NetworkIsPlayerTalking(PlayerId()) and isTalking then
				isTalking = not isTalking
				SendNUIMessage({ action = 'isTalking', value = isTalking })
			end



			if IsControlJustPressed(1, Keys[Config.voice.keys.distance]) then

				Config.voice.levels.current = (Config.voice.levels.current + 1) % 3

				if Config.voice.levels.current == 0 then
					NetworkSetTalkerProximity(Config.voice.levels.default)
					voiceDistance = 'normal'
				elseif Config.voice.levels.current == 1 then
					NetworkSetTalkerProximity(Config.voice.levels.shout)
					voiceDistance = 'shout'
				elseif Config.voice.levels.current == 2 then
					NetworkSetTalkerProximity(Config.voice.levels.whisper)
					voiceDistance = 'whisper'
				end

				SendNUIMessage({ action = 'setVoiceDistance', value = voiceDistance })
			end

			if Config.voice.levels.current == 0 then
				voiceDistance = 'normal'
			elseif Config.voice.levels.current == 1 then
				voiceDistance = 'shout'
			elseif Config.voice.levels.current == 2 then
				voiceDistance = 'whisper'
			end


		end





	end
end)




-- Weapons
Citizen.CreateThread(function()
	if Config.ui.showWeapons == true then
		while true do
			Citizen.Wait(100)

			local player = GetPlayerPed(-1)
			local status = {}

			if IsPedArmed(player, 7) then

				local weapon = GetSelectedPedWeapon(player)
				local ammoTotal = GetAmmoInPedWeapon(player,weapon)
				local bool,ammoClip = GetAmmoInClip(player,weapon)
				local ammoRemaining = math.floor(ammoTotal - ammoClip)

				status['armed'] = true

				for key,value in pairs(AllWeapons) do

					for keyTwo,valueTwo in pairs(AllWeapons[key]) do
						if weapon == GetHashKey('weapon_'..keyTwo) then
							status['weapon'] = keyTwo


							if key == 'melee' then
								SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
								SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
							else
								if keyTwo == 'stungun' then
									SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
								else
									SendNUIMessage({ action = 'element', task = 'enable', value = 'weapon_bullets' })
									SendNUIMessage({ action = 'element', task = 'enable', value = 'bullets' })
								end
							end

						end
					end

				end

				SendNUIMessage({ action = 'setText', id = 'weapon_clip', value = ammoClip })
				SendNUIMessage({ action = 'setText', id = 'weapon_ammo', value = ammoRemaining })

			else
				status['armed'] = false
			end

			SendNUIMessage({ action = 'updateWeapon', status = status })

		end
	end
end)













-- Everything that neededs to be at WAIT 0
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)


		if IsControlPressed(1, Keys[Config.vehicle.keys.controlkey]) and GetPedInVehicleSeat(vehicle, -1) == player and  (has_value(vehiclesCars, vehicleClass) == true) then
			-- Vehicle Seatbelt
			if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) then
				if IsControlJustReleased(0, Keys[Config.vehicle.keys.seatbelt]) and (has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8) then
					seatbeltIsOn = not seatbeltIsOn
				end
			end

			-- Vehicle Cruiser
			if IsControlJustPressed(1, Keys[Config.vehicle.keys.cruiser]) and GetPedInVehicleSeat(vehicle, -1) == player and (has_value(vehiclesCars, vehicleClass) == true) then

				local vehicleSpeedSource = GetEntitySpeed(vehicle)

				if vehicleCruiser == 'on' then
					vehicleCruiser = 'off'
					SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))

				else
					vehicleCruiser = 'on'
					SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
				end
			end

  		-- Vehicle Signal Lights
			if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalLeft]) and (has_value(vehiclesCars, vehicleClass) == true) then
				if vehicleSignalIndicator == 'off' then
					vehicleSignalIndicator = 'left'
				else
					vehicleSignalIndicator = 'off'
				end

				TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
			end

			if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalRight]) and (has_value(vehiclesCars, vehicleClass) == true) then
				if vehicleSignalIndicator == 'off' then
					vehicleSignalIndicator = 'right'
				else
					vehicleSignalIndicator = 'off'
				end

				TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
			end

			if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalBoth]) and (has_value(vehiclesCars, vehicleClass) == true) then
				if vehicleSignalIndicator == 'off' then
					vehicleSignalIndicator = 'both'
				else
					vehicleSignalIndicator = 'off'
				end

				TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
			end
		end

	end
end)










AddEventHandler('onClientMapStart', function()

	SendNUIMessage({ action = 'ui', config = Config.ui })
	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
	SendNUIMessage({ action = 'setLogo', value = Config.serverLogo })

	if Config.ui.showVoice == true then
		if Config.voice.levels.current == 0 then
			NetworkSetTalkerProximity(Config.voice.levels.default)
		elseif Config.voice.levels.current == 1 then
			NetworkSetTalkerProximity(Config.voice.levels.shout)
		elseif Config.voice.levels.current == 2 then
			NetworkSetTalkerProximity(Config.voice.levels.whisper)
		end
	end
end)

AddEventHandler('playerSpawned', function()
	if Config.ui.showVoice == true then
	    NetworkSetTalkerProximity(5.0)
	end

	HideHudComponentThisFrame(7) -- Area
	HideHudComponentThisFrame(9) -- Street
	HideHudComponentThisFrame(6) -- Vehicle
	HideHudComponentThisFrame(3) -- SP Cash
	HideHudComponentThisFrame(4) -- MP Cash
	HideHudComponentThisFrame(13) -- Cash changes!
end)









AddEventHandler('trew_hud_ui:setCarSignalLights', function(status)
	local driver = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	local hasTrailer,vehicleTrailer = GetVehicleTrailerVehicle(driver,vehicleTrailer)
	local leftLight
	local rightLight

	if status == 'left' then
		leftLight = false
		rightLight = true
		if hasTrailer then driver = vehicleTrailer end

	elseif status == 'right' then
		leftLight = true
		rightLight = false
		if hasTrailer then driver = vehicleTrailer end

	elseif status == 'both' then
		leftLight = true
		rightLight = true
		if hasTrailer then driver = vehicleTrailer end

	else
		leftLight = false
		rightLight = false
		if hasTrailer then driver = vehicleTrailer end

	end

	TriggerServerEvent('trew_hud_ui:syncCarLights', status)

	SetVehicleIndicatorLights(driver, 0, leftLight)
	SetVehicleIndicatorLights(driver, 1, rightLight)
end)



RegisterNetEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function(driver, status)

	if GetPlayerFromServerId(driver) ~= PlayerId() then
		local driver = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(driver)), false)

		if status == 'left' then
			leftLight = false
			rightLight = true

		elseif status == 'right' then
			leftLight = true
			rightLight = false

		elseif status == 'both' then
			leftLight = true
			rightLight = true

		else
			leftLight = false
			rightLight = false
		end

		SetVehicleIndicatorLights(driver, 0, leftLight)
		SetVehicleIndicatorLights(driver, 1, rightLight)

	end
end)





















function trewDate()
	local timeString = nil

	local day = _U('day_' .. GetClockDayOfMonth())
	local weekDay = _U('weekDay_' .. GetClockDayOfWeek())
	local month = _U('month_' .. GetClockMonth())
	local day = _U('day_' .. GetClockDayOfMonth())
	local year = GetClockYear()


	local hour = GetClockHours()
	local minutes = GetClockMinutes()
	local time = nil
	local AmPm = ''


	if Config.date.AmPm == true then

		if hour >= 13 and hour <= 24 then
			hour = hour - 12
			AmPm = 'PM'
		else
			if hour == 0 or hour == 24 then
				hour = 12
			end
			AmPm = 'AM'
		end

	end

	if hour <= 9 then
		hour = '0' .. hour
	end
	if minutes <= 9 then
		minutes = '0' .. minutes
	end

	time = hour .. ':' .. minutes .. ' ' .. AmPm




	local date_format = Locales[Config.Locale]['date_format'][Config.date.format]

	if Config.date.format == 'default' then
		timeString = string.format(
			date_format,
			day, month, year
		)
	elseif Config.date.format == 'simple' then
		timeString = string.format(
			date_format,
			day, month
		)

	elseif Config.date.format == 'simpleWithHours' then
		timeString = string.format(
			date_format,
			time, day, month
		)
	elseif Config.date.format == 'withWeekday' then
		timeString = string.format(
			date_format,
			weekDay, day, month, year
		)
	elseif Config.date.format == 'withHours' then
		timeString = string.format(
			date_format,
			time, day, month, year
		)
	elseif Config.date.format == 'withWeekdayAndHours' then
		timeString = string.format(
			date_format,
			time, weekDay, day, month, year
		)
	end




	return timeString
end






function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end



















local toggleui = false
RegisterCommand('toggleui', function()
	if not toggleui then
		SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'bank' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'blackMoney' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'wallet' })
	else
		if (Config.ui.showJob == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'job' })
		end
		if (Config.ui.showSocietyMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
		end
		if (Config.ui.showBankMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'bank' })
		end
		if (Config.ui.showBlackMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'blackMoney' })
		end
		if (Config.ui.showWalletMoney == true) then
			SendNUIMessage({ action = 'element', task = 'enable', value = 'wallet' })
		end
	end

	toggleui = not toggleui
end)










exports('createStatus', function(args)
	local statusCreation = { action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon'] }
	SendNUIMessage(statusCreation)
end)




exports('setStatus', function(args)
	local playerStatus = { action = 'setStatus', status = {
		{ name = args['name'], value = args['value'] }
	}}
	SendNUIMessage(playerStatus)
end)
