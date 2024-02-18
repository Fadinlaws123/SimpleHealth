RegisterCommand(Config.Main.HealthSystem.Commands.mainCommand, function(source, args, rawCommand)
  if Config.Main.ScriptConfig.usePermissionSystem then
    if IsPlayerAceAllowed(source, Config.Main.HealthSystem.permissionConfig.acePerm) then 
      if args[1] == "25" then
        TriggerClientEvent('SimpleHealth:25:Heal', -1)
      elseif args[1] == "50" then
        TriggerClientEvent('SimpleHealth:50:Heal', -1)
      elseif args[1] == "75" then
        TriggerClientEvent('SimpleHealth:75:Heal', -1)
      elseif args[1] == '100' then
        TriggerClientEvent('SimpleHealth:100:Heal', -1)
      elseif args[1] ~= "25" then
        TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
      elseif args[1] ~= "50" then
        TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
      elseif args[1] ~= "75" then
        TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
      elseif args[1] ~= '100' then
        TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
      end
    else
      TriggerClientEvent('SimpleHealth:Heal:InvalidPerms', -1)
    end
  else
    if args[1] == "25" then
      TriggerClientEvent('SimpleHealth:25:Heal', -1)
    elseif args[1] == "50" then
      TriggerClientEvent('SimpleHealth:50:Heal', -1)
    elseif args[1] == "75" then
      TriggerClientEvent('SimpleHealth:75:Heal', -1)
    elseif args[1] == '100' then
      TriggerClientEvent('SimpleHealth:100:Heal', -1)
    elseif args[1] ~= "25" then
      TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
    elseif args[1] ~= "50" then
      TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
    elseif args[1] ~= "75" then
      TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
    elseif args[1] ~= '100' then
      TriggerClientEvent('SimpleHealth:Heal:InvalidArgs', -1)
    end
  end
end)

RegisterCommand(Config.Main.HealthSystem.Commands.killPlayer, function(source, args, rawCommand)
  if Config.Main.ScriptConfig.usePermissionSystem then
    if IsPlayerAceAllowed(source, Config.Main.HealthSystem.permissionConfig.acePerm) then 
      TriggerClientEvent('SimpleHealth:0:Heal', -1)
    else
      TriggerClientEvent('SimpleHealth:Heal:InvalidPerms', -1)
    end
  else
    TriggerClientEvent('SimpleHealth:0:Heal', -1)
  end
end)

RegisterCommand(Config.Main.ArmorSystem.Commands.removeArmor, function(source, args, rawCommand)
  if Config.Main.ScriptConfig.usePermissionSystem then
    if IsPlayerAceAllowed(source, Config.Main.ArmorSystem.permissionConfig.acePerm) then 
      TriggerClientEvent('SimpleHealth:0:Armor', -1)
    else
      TriggerClientEvent('SimpleHealth:Heal:InvalidPerms', -1)
    end
  else
    TriggerClientEvent('SimpleHealth:0:Armor', -1)
  end
end)

RegisterCommand(Config.Main.ArmorSystem.Commands.mainCommand, function(source, args, rawCommand)
  if args[1] == "25" then
    TriggerClientEvent('SimpleHealth:25:Armor', -1)
  elseif args[1] == "50" then
    TriggerClientEvent('SimpleHealth:50:Armor', -1)
  elseif args[1] == "75" then
    TriggerClientEvent('SimpleHealth:75:Armor', -1)
  elseif args[1] == '100' then
    TriggerClientEvent('SimpleHealth:100:Armor', -1)
  elseif args[1] ~= "25" then
    TriggerClientEvent('SimpleHealth:Armor:InvalidArgs', -1)
  elseif args[1] ~= "50" then
    TriggerClientEvent('SimpleHealth:Armor:InvalidArgs', -1)
  elseif args[1] ~= "75" then
    TriggerClientEvent('SimpleHealth:Armor:InvalidArgs', -1)
  elseif args[1] ~= '100' then
    TriggerClientEvent('SimpleHealth:Armor:InvalidArgs', -1)
  end
end)