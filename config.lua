Config = {}

Config.Main = {

  ScriptConfig = {
    
    usePermissionSystem = false, -- Enable / Disable ace permissions.
    useHealthSystem = true, -- Enable / Disable /heal
    useArmorSystem = true, -- Enable / Disable /armor

  },

  HealthSystem = {

    permissionConfig = {
      acePerm = "health.allowed", 
    },

    Commands = {
      mainCommand = "health", -- Main command used to change the health amount of your character.

      killPlayer = "die", -- Command to kill your player.
    },

    Messages = {
      CooldownMessage = '~r~Health System is currently on cooldown! Please wait before using again!',
      SuccessMessage = '~g~Player has been healed! Try not to get hurt again! (Bills exist!)',
      Health_75 = '~g~Player health has been set to ~y~75% ~g~Try not to get yourself killed.',
      Health_50 = '~g~Player health has been set to ~y~50% ~g~Try not to get yourself killed.',
      Health_25 = '~g~Player health has been set to ~y~25% ~g~Try not to get yourself killed.',
      SuicideMessage = '~g~You have committed suicide! You should feel bad for your family now!',
      SuicideCooldown = '~r~You have to wait before you can kill yourself again.',
      InvalidArgs = "~r~Please make sure to specify a health amount! (~o~25, 50, 75, 100~r~)"
    },

    SystemConfig = {
      healthCooldown = "120000", -- Time in miliseconds (2 min = default | 120000).
      suicideCooldown = "120000" -- Time in miliseconds (2 min = default | 120000).
    }
  },

  ArmorSystem = {

    permissionConfig = {
      acePerm = "armor.allowed", 
    },

    Commands = {
      mainCommand = "armor", -- Main command used to change the health amount of your character.

      removeArmor = "removeArmor" -- Command to remove armor from your character.
    },

    Messages = {
      CooldownMessage = '~r~Armor System is currently on cooldown! Please wait before using again!',
      Armor100 = '~g~You put cermaic armor on. This should hold. (~y~100% Armor~g~)',
      Armor75 = '~g~You put steel in your shirt, Soooo Comfy.. (~y~75% Armor~g~)',
      Armor50 = '~g~You use a book for armor. Hopefully this works.. (~y~50% Armor~g~)',
      Armor25 = '~g~You put bubblewrap on, don\'t pop the bubbles. (~y~25% Armor~g~)',
      RemoveMessage = '~g~You removed your armor, be careful, you\'re fragile.',
      RemoveCooldown = '~r~You have to wait before you can remove your armor again...',
      InvalidArgs = "~r~Please make sure to specify an armor amount! (~o~25, 50, 75, 100~r~)"
    },

    SystemConfig = {
      armorCooldown = "120000", -- Time in miliseconds (2 min = default | 120000).
      RemoveCooldown = "120000" -- Time in miliseconds (2 min = default | 120000).
    }
  }
}