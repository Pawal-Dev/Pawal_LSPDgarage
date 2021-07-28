 --------------------------------------- Garage LSPD By Pawal#6753 ------------------------------------------
 --------------------------------------- Discord Bewlife - Leaks  & Dev : https://discord.gg/7EzXdy5tcv   ------------------------------------------
 --------------------------------------- Interdiction de s'aproprié le script !------------------------------------------


ESX = nil
local PlayerData = {}


Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
  end)
 
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

local zone = {
    '~g~Vehicule',
    '~o~Zone'
}
 --------------------------------------- FUNCTION ------------------------------------------
 ---------------------------------------          ------------------------------------------

function spawnCar(car)
  local car = GetHashKey(car)
  RequestModel(car)
  while not HasModelLoaded(car) do
      RequestModel(car)
      Citizen.Wait(50)
       
  end
  local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
  local vehicle = CreateVehicle(car, 453.57, -1015.01, 28.45, 91.96, false, false)   ---- Possition du spawn du vehicule 
  ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous venez de sortir une ~y~"..GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))), 'CHAR_BEWLIFE', 7)
  CloseMenu(car)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
    SetVehicleNumberPlateText(vehicle, "POLICE") 
    SetEntityAsNoLongerNeeded(vehicle) 


end
 --------------------------------------- GARAGE ------------------------------------------
 ---------------------------------------          ------------------------------------------
car = {
  Base = {Header = {"commonmenu", "interaction_bgd"},  Title = "Garage", Color = {color_black}, HeaderColor = {255, 255, 255}}, 
  Data = {currentMenu = "Accueil"},
  Events = {
      onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
         

          if btn.name == "~h~~r~Ranger le véhicule" then
              TriggerEvent('esx:deleteVehicle')
		  elseif btn.name == "                          ~h~~r~→ Fermer le menu ←" then
              CloseMenu (true)
		  end
		  
		  if PlayerData.job.grade_name == 'boss' and btn.name == "~h~[~b~CMD~s~] Menu Commandant" then
		      OpenMenu("commandant")
		  elseif PlayerData.job.grade_name ~= 'boss' and btn.name == "~h~[~b~CMD~s~] Menu Commandant" then
		      ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous n'avez pas le grade suivant : ~b~Commandant", 'CHAR_BEWLIFE', 7)
		  end
		  
		  if PlayerData.job.grade_name == 'chef' and btn.name == "~h~[~b~CPT~s~] Menu Capitaine" then
		      OpenMenu("capitaine")
		  elseif PlayerData.job.grade_name ~= 'chef' and btn.name == "~h~[~b~CPT~s~] Menu Capitaine" then
		      ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous n'avez pas le grade suivant : ~b~Capitaine", 'CHAR_BEWLIFE', 7)
		  end
		  
		  if PlayerData.job.grade_name == 'lieutenant' and btn.name == "~h~[~b~LTN~s~] Menu Lieutenant" then
		      OpenMenu("lieutenant")
		  elseif PlayerData.job.grade_name ~= 'lieutenant' and btn.name == "~h~[~b~LTN~s~] Menu Lieutenant" then
		      ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous n'avez pas le grade suivant : ~b~Lieutenant", 'CHAR_BEWLIFE', 7)
		  end
		  
		  if PlayerData.job.grade_name == 'sergeant' and btn.name == "~h~[~b~SGT~s~] Menu Sergent" then
		      OpenMenu("sergent")
		  elseif PlayerData.job.grade_name ~= 'sergeant' and btn.name == "~h~[~b~SGT~s~] Menu Sergent" then
		      ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous n'avez pas le grade suivant : ~b~Sergent", 'CHAR_BEWLIFE', 7)
		  end
		  
		  if PlayerData.job.grade_name == 'officer' and btn.name == "~h~[~b~OFF~s~] Menu Officier" then
		      OpenMenu("officier")
		  elseif PlayerData.job.grade_name ~= 'officer' and btn.name == "~h~[~b~OFF~s~] Menu Officier" then
		      ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous n'avez pas le grade suivant : ~b~Officier", 'CHAR_BEWLIFE', 7)
		  end
		  
		  if PlayerData.job.grade_name == 'recruit' and btn.name == "~h~[~b~CAD~s~] Menu Cadet" then
		      OpenMenu("cadet")
		  elseif PlayerData.job.grade_name ~= 'recruit' and btn.name == "~h~[~b~CAD~s~] Menu Cadet" then
		      ESX.ShowAdvancedNotification('Garage LSPD', '~b~Notification', "Vous n'avez pas le grade suivant : ~b~Cadet", 'CHAR_BEWLIFE', 7)
		  end
		  
		
		  
		  if btn.name == "Dodge Charger" then
		     spawnCar('18charger')
			 CloseMenu()
			 
		  
		  elseif btn.name == "~h~[~g~Menu~s~] ~g~Option" then
		     OpenMenu("Option Garage LSPD")
		  
		  elseif btn.name == "Ford Explorer" then
		     spawnCar('16explorer')
			 CloseMenu()
			 
		  elseif btn.name == "Ford Caprice" then
		     spawnCar('11caprice')
			 CloseMenu()
	
		  elseif btn.name == "Ford Crown Victoria" then
		     spawnCar('newvic')
			 CloseMenu()
		  elseif btn.name == "Fourgon Blindé" then
		     spawnCar('riot')
			 CloseMenu()
		  elseif btn.name == "VIR" then
		     spawnCar('polgt500')
		     CloseMenu()
		  elseif btn.name == "Transporteur" then
		     spawnCar('policet')
			 CloseMenu()
    
		  
		      
				
 
          end
          end
      },

  Menu = {
      ["commandant"] = {
          b = {                  
		    {name = "                         ~h~~s~→ ~b~Véhicule Standard ~s~←", ask = "", askX = true},
			{name = "Ford Crown Victoria", ask = "", askX = true},
			{name = "Ford Caprice", ask = "", askX = true},
            {name = "Dodge Charger", ask = "", askX = true},
			{name = "Ford Explorer", ask = "", askX = true},
			{name = "                        ~h~~s~→ ~b~Véhicule Spécial ~s~←", ask = "", askX = true},
			{name = "Fourgon Blindé", ask = "", askX = true},
			{name = "VIR", ask = "", askX = true},
			{name = "Transporteur", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },
	  ["capitaine"] = {
          b = {                  
		    {name = "                         ~h~~s~→ ~b~Véhicule Standard ~s~←", ask = "", askX = true},
			{name = "Ford Crown Victoria", ask = "", askX = true},
			{name = "Ford Caprice", ask = "", askX = true},
            {name = "Dodge Charger", ask = "", askX = true},
			{name = "Ford Explorer", ask = "", askX = true},
			{name = "                        ~h~~s~→ ~b~Véhicule Spécial ~s~←", ask = "", askX = true},
			{name = "Fourgon Blindé", ask = "", askX = true},
			{name = "VIR", ask = "", askX = true},
			{name = "Transporteur", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },
	  ["lieutenant"] = {
          b = {                  
		    {name = "                         ~h~~s~→ ~b~Véhicule Standard ~s~←", ask = "", askX = true},
			{name = "Ford Crown Victoria", ask = "", askX = true},
			{name = "Ford Caprice", ask = "", askX = true},
            {name = "Dodge Charger", ask = "", askX = true},
			{name = "Ford Explorer", ask = "", askX = true},
			{name = "                        ~h~~s~→ ~b~Véhicule Spécial ~s~←", ask = "", askX = true},
			{name = "VIR", ask = "", askX = true},
			{name = "Transporteur", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },
	  ["sergent"] = {
          b = {                  
		    {name = "                         ~h~~s~→ ~b~Véhicule Standard ~s~←", ask = "", askX = true},
			{name = "Ford Crown Victoria", ask = "", askX = true},
			{name = "Ford Caprice", ask = "", askX = true},
            {name = "Dodge Charger", ask = "", askX = true},
			{name = "Ford Explorer", ask = "", askX = true},
			{name = "                        ~h~~s~→ ~b~Véhicule Spécial ~s~←", ask = "", askX = true},
			{name = "Transporteur", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },
	  ["officier"] = {
          b = {                  
		    {name = "                         ~h~~s~→ ~b~Véhicule Standard ~s~←", ask = "", askX = true},
			{name = "Ford Crown Victoria", ask = "", askX = true},
			{name = "Ford Caprice", ask = "", askX = true},
            {name = "Dodge Charger", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },
	  ["cadet"] = {
          b = {                  
		    {name = "                         ~h~~s~→ ~b~Véhicule Standard ~s~←", ask = "", askX = true},
			{name = "Ford Crown Victoria", ask = "", askX = true},
			{name = "Ford Caprice", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },
	  ["Accueil"] = {
          b = {                  
		    {name = "                           ~h~~s~→ ~b~Liste Véhicule ~s~←", ask = "", askX = true},
            {name = "~h~[~b~CMD~s~] Menu Commandant", ask = "", askX = true},
			{name = "~h~[~b~CPT~s~] Menu Capitaine", ask = "", askX = true},
			{name = "~h~[~b~LTN~s~] Menu Lieutenant", ask = "", askX = true},
			{name = "~h~[~b~SGT~s~] Menu Sergent", ask = "", askX = true},
			{name = "~h~[~b~OFF~s~] Menu Officier", ask = "", askX = true},
			{name = "~h~[~b~CAD~s~] Menu Cadet", ask = "", askX = true},
			{name = "                          ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
          }
      },


  } 
}




local garage = { 
    {x = 458.72,   y = -1008.02,  z = 28.26}  ---- Pos du menu   
}
     
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)    
        for k in pairs(garage) do    
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, garage[k].x, garage[k].y, garage[k].z)
            if dist <= 1.0 and PlayerData.job and PlayerData.job.name == 'police' then
              ESX.ShowHelpNotification("Appuyez sur [~b~E~s~] ~s~ pour accèder au garage. ")  			
              if IsControlJustPressed(1,51)  then        
             CreateMenu(car)                     
            end
          end
        end
    end  
end)

 --------------------------------------- Ranger son véhicule ------------------------------------------
 ---------------------------------------                     ------------------------------------------
 
 rangervoiture = {
	Base = {Header = {"commonmenu", "interaction_bgd"},  Title = "Garage", Color = {color_black}, HeaderColor = {0, 150, 255}}, 
	Data = {currentMenu = "Garage LSPD"},
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			if btn.name == "~h~~r~Ranger le véhicule" then
				TriggerEvent('esx:deleteVehicle')
			elseif btn.name == "                         ~h~~r~→ Fermer le menu ←" then
				CloseMenu (true)
				
				  
  
			end
		end,
		},
  
	Menu = {
		["Garage LSPD"] = {
			b = {                  
			  {name = "                           ~h~~s~→ ~g~Option ~s~←", ask = "", askX = true},
			  {name = "~h~~r~Ranger le véhicule", ask = "", askX = true},
			  {name = "                         ~h~~r~→ Fermer le menu ←", ask = "", askX = true},
			}
		},
		["Option Garage LSPD"] = {
			b = {                  
			  {name = "~h~~r~Ranger le véhicule", ask = "", askX = true},
			}
		}
  
  
	}
  }
  
  
  
  
  local rangercar = { 
	  {x = 463.37,   y = -1019.54,  z = 28.26}  ---- Pos du menu   
  }
	   
  Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)    
		  for k in pairs(rangercar) do    
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, rangercar[k].x, rangercar[k].y, rangercar[k].z)
				if dist <= 6.0 then
				  DrawMarker(6, 463.37, -1019.54, 27.26, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 2.0, 1.0, 2.0, 0, 150, 255, 100) ----- POS DU MARKER
				else
				  Citizen.Wait(500)
				end 
			  if dist <= 1.0 and PlayerData.job and PlayerData.job.name == 'police' then
				ESX.ShowHelpNotification("Appuyez sur [~b~E~s~] ~s~ pour ranger votre véhicule. ")  			
				if IsControlJustPressed(1,51)  then 
				 TriggerEvent('esx:deleteVehicle')			                   
			  end
			end
		  end
	  end  
  end)


Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_cop_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_cop_01", 458.72, -1008.02, 27.26, 90.97, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

