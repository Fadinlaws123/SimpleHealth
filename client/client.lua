TriggerEvent('chat:addSuggestion', Config.Main.HealthSystem.Commands.mainCommand, 'Set your characters health!', {
  {name = 'Argument', help = '| 25 | 50 | 75 | 100 |'}
})
TriggerEvent('chat:addSuggestion', Config.Main.ArmorSystem.Commands.mainCommand, 'Set your characters armor!', {
  {name = 'Argument', help = '| 25 | 50 | 75 | 100 |'}
})
TriggerEvent('chat:addSuggestion', Config.Main.HealthSystem.Commands.killPlayer, 'Make your character commit suicide.')
TriggerEvent('chat:addSuggestion', Config.Main.ArmorSystem.Commands.removeArmor, 'Remove any armor that your character has on.')

-- Health System -- 
cooldownHealth = false
suicideCooldown = false
local playerHealth = '200'

RegisterNetEvent('SimpleHealth:0:Heal')
AddEventHandler('SimpleHealth:0:Heal', function()
  local source = GetPlayerPed(-1)
  if suicideCooldown then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.SuicideCooldown)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.SuicideMessage)
    SetEntityHealth(source, 0)
    suicideCooldown = true
    Wait(Config.Main.HealthSystem.SystemConfig.suicideCooldown)
    suicideCooldown = false
  end
end)

RegisterNetEvent('SimpleHealth:25:Heal')
AddEventHandler('SimpleHealth:25:Heal', function()
  local source = GetPlayerPed(-1)
  if cooldownHealth then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.CooldownMessage)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.Health_25)
    SetEntityHealth(source, 125)
    cooldownHealth = true
    Wait(Config.Main.HealthSystem.SystemConfig.healthCooldown)
    cooldownHealth = false
    playerHealth = '125'
  end
end)

RegisterNetEvent('SimpleHealth:50:Heal')
AddEventHandler('SimpleHealth:50:Heal', function()
  local source = GetPlayerPed(-1)
  if cooldownHealth then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.CooldownMessage)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.Health_50)
    SetEntityHealth(source, 145)
    cooldownHealth = true
    Wait(Config.Main.HealthSystem.SystemConfig.healthCooldown)
    cooldownHealth = false
    playerHealth = '145'
  end
end)

RegisterNetEvent('SimpleHealth:75:Heal')
AddEventHandler('SimpleHealth:75:Heal', function()
  local source = GetPlayerPed(-1)
  if cooldownHealth then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.CooldownMessage)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.Health_75)
    SetEntityHealth(source, 150)
    cooldownHealth = true
    Wait(Config.Main.HealthSystem.SystemConfig.healthCooldown)
    cooldownHealth = false
    playerHealth = '150'
  end
end)

RegisterNetEvent('SimpleHealth:100:Heal')
AddEventHandler('SimpleHealth:100:Heal', function()
  local source = GetPlayerPed(-1)
  if cooldownHealth then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.CooldownMessage)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.SuccessMessage)
    SetEntityHealth(source, 200)
    cooldownHealth = true
    Wait(Config.Main.HealthSystem.SystemConfig.healthCooldown)
    cooldownHealth = false
    playerHealth = '200'
  end
end)

RegisterNetEvent('SimpleHealth:Heal:InvalidArgs')
AddEventHandler('SimpleHealth:Heal:InvalidArgs', function()
  Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.HealthSystem.Messages.InvalidArgs)
end)

-- Health System In Vehicle --
local wasInCar = false
local oldBodyDamage = 0.0
local oldSpeed = 0.0
local currentDamage = 0.0
local currentSpeed = 0.0
local vehicle

IsCar = function(veh)
  local car = GetVehicleClass(veh)
  return (car >= 0 and car <= 7) or (car >= 9 and car <= 12) or (car >= 17 and car <= 20)
end

RegisterNetEvent('Blackout')
AddEventHandler('Blackout', function()
  blackoutEffect = true
  disableControls = true
  DoScreenFadeOut(100)
  Wait(3000)
  DoScreenFadeIn(250)
  blackoutEffect = false
  disableControls = false
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)

    vehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
    if DoesEntityExist(vehicle) and (wasInCar or IsCar(vehicle)) then
      wasInCar = true
      oldSpeed = currentSpeed
      player = GetPlayerPed(-1)
      oldBodyDamage = currentDamage
      currentDamage = GetVehicleBodyHealth(vehicle)
      currentSpeed = GetEntitySpeed(vehicle) * 2.23
      blackoutEffect = false

      if currentDamage ~= oldBodyDamage then
        if currentDamage < oldBodyDamage then
          if (oldBodyDamage - currentDamage) >= 35 or (oldSpeed - currentSpeed)  >= 100 then
            oldBodyDamage = currentDamage
            SetEntityHealth(GetPlayerPed(-1), 0)
            TriggerEvent('Blackout')
            Notify('~w~[~b~SimpleHealth~w~]: ~y~You have died due to crashing at high speeds.')
            playerHealth = '200'
          elseif (oldBodyDamage - currentDamage) >= 5 or (oldSpeed - currentSpeed)  >= 60 then 
            oldBodyDamage = currentDamage
            if playerHealth == '200' then
              Notify('~w~[~b~SimpleHealth~w~]: ~y~You have taken damage from crashing at high speeds!')
              SetEntityHealth(GetPlayerPed(-1), 160)
              playerHealth = '160'
            elseif playerHealth == '160' then
              SetEntityHealth(GetPlayerPed(-1), 120)
              Notify('~w~[~b~SimpleHealth~w~]: ~y~You have taken damage from crashing & Previous injuries')
              playerHealth = '120'
            elseif playerHealth == '120' then
              SetEntityHealth(GetPlayerPed(-1), 80)
              Notify('~w~[~b~SimpleHealth~w~]: ~y~You have taken damage from crashing & Previous injuries')
              playerHealth = '80'
            elseif playerHealth == '40' then
              print('Idek')
              SetEntityHealth(GetPlayerPed(-1), 0)
              Notify('~w~[~b~SimpleHealth~w~]: ~y~You have taken damage from crashing & Previous injuries')
              playerHealth = '200'
            end
          end
        end
      end
    elseif wasInCar then
      wasInCar = false
      beltOn = false
      currentDamage = 0
      oldBodyDamage = 0
      currentSpeed = 0
      oldSpeed = 0
    end   
  end

  if disableControls then
    DisableControlAction(0,71,true) -- veh forward
    DisableControlAction(0,72,true) -- veh backwards
    DisableControlAction(0,63,true) -- veh turn left
    DisableControlAction(0,64,true) -- veh turn right
    DisableControlAction(0,75,true) -- disable exit vehicle
  end
end)

-- Armor System --
removeCooldown = false
armorCooldown = false
local player = GetPlayerPed(-1)
local armor = GetPedArmour(player)



RegisterNetEvent('SimpleHealth:0:Armor')
AddEventHandler('SimpleHealth:0:Armor', function()
  local source = GetPlayerPed(-1)
  if armor >= 10 then
    if removeCooldown then
      Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.RemoveCooldown)
    else
      Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.RemoveMessage)
      SetPedArmour(source, 0)
      removeCooldown = true
      Wait(Config.Main.ArmorSystem.SystemConfig.armorCooldown)
      removeCooldown = false
      hasArmor = false
    end
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.NoArmor)
  end
end)

RegisterNetEvent('SimpleHealth:25:Armor')
AddEventHandler('SimpleHealth:25:Armor', function()
  local source = GetPlayerPed(-1)
  if armorCooldown then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.CooldownMessage)
    TriggerServerEvent('SimpleHealth:Armor:Cooldown', -1)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.Armor25)
    SetPedArmour(source, 25)
    armorCooldown = true
    Wait(Config.Main.ArmorSystem.SystemConfig.armorCooldown)
    armorCooldown = false
  end
end)

RegisterNetEvent('SimpleHealth:50:Armor')
AddEventHandler('SimpleHealth:50:Armor', function()
  local source = GetPlayerPed(-1)
  if armorCooldown then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.CooldownMessage)
    TriggerServerEvent('SimpleHealth:Armor:Cooldown', -1)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.Armor50)
    SetPedArmour(source, 50)
    armorCooldown = true
    Wait(Config.Main.ArmorSystem.SystemConfig.armorCooldown)
    armorCooldown = false
  end
end)

RegisterNetEvent('SimpleHealth:75:Armor')
AddEventHandler('SimpleHealth:75:Armor', function()
  local source = GetPlayerPed(-1)
  if armorCooldown then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.CooldownMessage)
    TriggerServerEvent('SimpleHealth:Armor:Cooldown', -1)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.Armor75)
    SetPedArmour(source, 75)
    armorCooldown = true
    Wait(Config.Main.ArmorSystem.SystemConfig.healthCooldown)
    armorCooldown = false
  end
end)

RegisterNetEvent('SimpleHealth:100:Armor')
AddEventHandler('SimpleHealth:100:Armor', function()
  local source = GetPlayerPed(-1)
  if armorCooldown then
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.CooldownMessage)
    TriggerServerEvent('SimpleHealth:Armor:Cooldown', -1)
  else
    Notify('~w~[~b~SimpleHealth~w~]: ' .. Config.Main.ArmorSystem.Messages.Armor100)
    SetPedArmour(source, 100)
    armorCooldown = true
    Wait(Config.Main.ArmorSystem.SystemConfig.healthCooldown)
    armorCooldown = false
  end
end)



function Notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(false, false)
end