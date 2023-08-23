-- Chama a biblioteca para utilizar as cenas
local composer = require ("composer")

display.setStatusBar (display.HiddenStatusBar)

display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

math.randomseed (os.time())
audio.reserveChannels (1)
audio.setVolume (0.4, {channel = 1})
composer.gotoScene ("menu")
