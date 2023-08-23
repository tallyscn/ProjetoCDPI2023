
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function gotoGame ()
	composer.gotoScene ("fazenda")
end

local function gotoLevel ()
	composer.gotoScene ("level")
end


-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	local bg = display.newImageRect (sceneGroup, "imagens/newGame/bg.png", 720, 480 )
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

-------------------- BOTÃO 1  NEW GAME ---------------------

    local botao1 = display.newImageRect (sceneGroup,"imagens/newGame/newGame.png", 102*1.3,37*1.3)
    botao1.x = display.contentCenterX -150
    botao1.y = display.contentCenterY +85
    botao1:addEventListener ("tap", gotoGame)

    local botao2 = display.newImageRect (sceneGroup,"imagens/newGame/botao_Level.png", 102*1.3,37*1.3)
    botao2.x = display.contentCenterX +150
    botao2.y = display.contentCenterY +85
    botao2:addEventListener ("tap", gotoLevel)

    local botao3 = display.newImageRect (sceneGroup, "imagens/newGame/botao_continue.png", 102*1.3,37*1.3)
    botao3.x = display.contentCenterX 
    botao3.y = display.contentCenterY +85   
    botao3:addEventListener ("tap", gotoGame)
	
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- O código aqui é executado quando a cena está na tela (mas está prestes a sair da tela)

	elseif ( phase == "did" ) then
		-- O código aqui é executado imediatamente após a cena sair totalmente da tela

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
-- O código aqui é executado antes da remoção da visualização da cena
end


-- -----------------------------------------------------------------------------------
-- Ouvintes de função de evento de cena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
