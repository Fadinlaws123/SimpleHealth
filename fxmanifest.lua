fx_version 'cerulean'
game 'gta5'

version '1.0.0'
description 'Simple healing / armor script for your fivem server!'
author 'SimpleDevelopments'

client_scripts {
  'client/client.lua'
}

server_scripts {
  'server/server.lua',
  'server/versionChecker.lua'
}

shared_scripts {
  'config.lua'
}