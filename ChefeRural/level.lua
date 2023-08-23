
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local level1Estrelas=0
local level2Estrelas=0
local level3Estrelas=0
local level4Estrelas=0
local level5Estrelas=0
local level6Estrelas=0
local level7Estrelas=0
local level8Estrelas=0
local level9Estrelas=0
local level10Estrelas=0
local botao1
local botao2
local botao3
local botao4
local botao5
local botao7
local botao8
local botao9
local botao10
local estrela1
local estrela2
local estrela3
local estrela4
local estrela5
local estrela6
local estrela7
local estrela8
local estrela9
local estrela10

local spriteBotao = graphics.newImageSheet ("imagens/level/level_lock.png", {width=48, height=48, numFrames=11})


local spriteEstrelas = graphics.newImageSheet ("imagens/level/stars.png", {width=56, height=14, numFrames=4})

local function irNivel1 ()
	composer.gotoScene ("fazenda")
end
	
	-----------------------------------------------------------
	
local function irNivel2 ()
	if not (level2Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 

	
	
	----------------------------------------------------------------
	
local function irNivel3 ()
	if not (level3Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 
 
	
	----------------------------------------------------------------
	
local function irNivel4 ()
	if not (level4Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 

	
	----------------------------------------------------------------
	
local function irNivel5 ()
	if not (level5Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 
	
	
	----------------------------------------------------------------
	
local function irNivel6 ()
	if not (level6Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 

	
	----------------------------------------------------------------
	
local function irNivel7 ()
	if not (level7Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 

	
	----------------------------------------------------------------
	
local function irNivel8 ()
	if not (level8Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 
	
	----------------------------------------------------------------
	
local function irNivel9 ()
	if not (level9Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 
	
	----------------------------------------------------------------
	
local function irNivel10 ()
	if not (level10Estrelas==0) then
		composer.gotoScene ("fazenda")
	end
end 
	
local spriteEstrelasAnimacao = {
        {name="nada", start=1, count=1, time=1000, loopCount=0},
        {name="1", start=2, count=1, time=1000, loopCount=0},
        {name="2", start=3, count=1, time=1000, loopCount=0},
        {name="3", start=4, count=1, time=1000, loopCount=0}
        
}


local spriteBotaoAnimacao = {
	{name="fase1", start=1, count=1, time=1000, loopCount=0},
	{name="fase2", start=2, count=1, time=1000, loopCount=0},
	{name="fase3", start=3, count=1, time=1000, loopCount=0},
	{name="fase4", start=4, count=1, time=1000, loopCount=0},
	{name="fase5", start=5, count=1, time=1000, loopCount=0},
	{name="fase6", start=6, count=1, time=1000, loopCount=0},
	{name="fase7", start=7, count=1, time=1000, loopCount=0},
	{name="fase8", start=8, count=1, time=1000, loopCount=0},
	{name="fase9", start=9, count=1, time=1000, loopCount=0},
	{name="fase10", start=10, count=1, time=1000, loopCount=0},
	{name="cadeado", start=11, count=1, time=1000, loopCount=0}
}

local function level1 ()

    if (level1Estrelas == 1) then
        estrela1:setSequence("1")
    elseif (level1Estrelas == 2) then
        estrela1:setSequence("2")
    elseif (level1Estrelas == 3) then
        estrela1:setSequence ("3")
    else
        estrela1:setSequence ("nada")
    
    end

end

local function level2 ()
    
    if (level2Estrelas == 1) then
        estrela2:setSequence("1")
    elseif (level2Estrelas == 2) then
        estrela2:setSequence("2")
    elseif (level2Estrelas == 3) then
        estrela2:setSequence ("3")
    else
        estrela2:setSequence ("nada")
        botao2:setSequence ("cadeado")
    end

end

local function level3 ()
   
    if (level3Estrelas == 1) then
        estrela3:setSequence("1")
    elseif (level3Estrelas == 2) then
        estrela3:setSequence("2")
    elseif (level3Estrelas == 3) then
        estrela3:setSequence ("3")
    else
        estrela3:setSequence ("nada")
        botao3:setSequence ("cadeado")
    end

end


local function level4 ()
   
    if (level4Estrelas == 1) then
        estrela4:setSequence("1")
    elseif (level4Estrelas == 2) then
        estrela4:setSequence("2")
    elseif (level4Estrelas == 3) then
        estrela4:setSequence ("3")
    else
        estrela4:setSequence ("nada")
        botao4:setSequence ("cadeado")
    end

end

local function level5 ()
  
    if (level5Estrelas == 1) then
        estrela5:setSequence("1")
    elseif (level5Estrelas == 2) then
        estrela5:setSequence("2")
    elseif (level5Estrelas == 3) then
        estrela5:setSequence ("3")
    else
        estrela5:setSequence ("nada")
        botao5:setSequence ("cadeado")
    end

end

local function level6 ()
    
    if (level2Estrelas == 1) then
        estrela6:setSequence("1")
    elseif (level6Estrelas == 2) then
        estrela6:setSequence("2")
    elseif (level6Estrelas == 3) then
        estrela6:setSequence ("3")
    else
        estrela6:setSequence ("nada")
        botao6:setSequence ("cadeado")
    end

end

local function level7 ()
   
    if (level2Estrelas == 1) then
        estrela7:setSequence("1")
    elseif (level7Estrelas == 2) then
        estrela7:setSequence("2")
    elseif (level7Estrelas == 3) then
        estrela7:setSequence ("3")
    else
        estrela7:setSequence ("nada")
        botao7:setSequence ("cadeado")
    end

end

local function level8 ()
    
    if (level8Estrelas == 1) then
        estrela8:setSequence("1")
    elseif (level8Estrelas == 2) then
        estrela8:setSequence("2")
    elseif (level8Estrelas == 3) then
        estrela8:setSequence ("3")
    else
        estrela8:setSequence ("nada")
        botao8:setSequence ("cadeado")
    end

end

local function level9 ()
    
    if (level9Estrelas == 1) then
        estrela9:setSequence("1")
    elseif (level9Estrelas == 2) then
        estrela9:setSequence("2")
    elseif (level9Estrelas == 3) then
        estrela9:setSequence ("3")
    else
        estrela9:setSequence ("nada")
        botao9:setSequence ("cadeado")
    end

end

local function level10 ()
    
    if (level10Estrelas == 1) then
        estrela10:setSequence("1")
    elseif (level10Estrelas == 2) then
        estrela10:setSequence("2")
    elseif (level9Estrelas == 3) then
        estrela10:setSequence ("3")
    else
        estrela10:setSequence ("nada")
        botao10:setSequence ("cadeado")
    end

end


-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	

	local bg = display.newImageRect (sceneGroup, "imagens/level/bg.png", 720, 480 )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	



	--- LOCAL FASE 1 ---

	botao1 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao1.x = display.contentCenterX -200
	botao1.y = display.contentCenterY - 15
	botao1:setSequence("fase1")
	botao1:play ()

	--- LOCAL FASE 2 ---


	botao2 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao2.x = display.contentCenterX -100
	botao2.y = display.contentCenterY - 15
	botao2:setSequence("fase2")
	botao2:play ()

	------------------------------------------------------------------


	--- LOCAL FASE 3 ---



	botao3 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao3.x = display.contentCenterX 
	botao3.y = display.contentCenterY - 15
	botao3:setSequence("fase3")
	botao3:play ()



	------------------------------------------------------------------


	--- LOCAL FASE 4 ---


	botao4 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao4.x = display.contentCenterX +100
	botao4.y = display.contentCenterY - 15
	botao4:setSequence("fase4")
	botao4:play ()


	------------------------------------------------------------------



	--- LOCAL FASE 5 ---



	botao5 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao5.x = display.contentCenterX +200
	botao5.y = display.contentCenterY - 15
	botao5:setSequence("fase5")
	botao5:play ()



	------------------------------------------------------------------



	--- LOCAL FASE 6 ---



	botao6 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao6.x = display.contentCenterX -200
	botao6.y = display.contentCenterY +100
	botao6:setSequence("fase6")
	botao6:play ()

	------------------------------------------------------------------




	--- LOCAL FASE 7 ---



	botao7 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao7.x = display.contentCenterX -100
	botao7.y = display.contentCenterY +100
	botao7:setSequence("fase7")
	botao7:play ()




	------------------------------------------------------------------



	--- LOCAL FASE 8 ---

	botao8 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao8.x = display.contentCenterX 
	botao8.y = display.contentCenterY +100
	botao8:setSequence("fase8")
	botao8:play ()




	------------------------------------------------------------------


	--- LOCAL FASE 9 ---


	botao9 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao9.x = display.contentCenterX +100
	botao9.y = display.contentCenterY +100
	botao9:setSequence("fase9")
	botao9:play ()


	------------------------------------------------------------------




	--- LOCAL FASE 10 ---


	botao10 = display.newSprite (sceneGroup, spriteBotao, spriteBotaoAnimacao)
	botao10.x = display.contentCenterX +200
	botao10.y = display.contentCenterY +100
	botao10:setSequence("fase10")
	botao10:play ()

	----- SPRITES  ESTRELAS  -----------





-- Insere AS ESTRELAS --------------------------------------------------------------------------------------------------------------


	estrela1 = display.newSprite (sceneGroup, spriteEstrelas, spriteEstrelasAnimacao)
	estrela1.x = display.contentCenterX -200
	estrela1.y = display.contentCenterY -60
	estrela1:setSequence ("nada")
	estrela1:play ()




-----------------------------------------------------------------------------------


--- FASE 2 ---  



-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------





estrela2 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela2.x = display.contentCenterX -100
estrela2.y = display.contentCenterY -60
estrela2:setSequence ("nada")
estrela2:play ()


-----------------------------------------------------------------------------------


--- FASE 3 ---  



-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela3 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela3.x = display.contentCenterX 
estrela3.y = display.contentCenterY -60
estrela3:setSequence ("nada")
estrela3:play ()


-----------------------------------------------------------------------------------


--- FASE 4 ---  




-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela4 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela4.x = display.contentCenterX +100
estrela4.y = display.contentCenterY -60
estrela4:setSequence ("nada")
estrela4:play ()



-----------------------------------------------------------------------------------


--- FASE 5 ---  



-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela5 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela5.x = display.contentCenterX +200
estrela5.y = display.contentCenterY -60
estrela5:setSequence ("nada")
estrela5:play ()


-----------------------------------------------------------------------------------


--- FASE 6 ---  




-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela6 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela6.x = display.contentCenterX -200
estrela6.y = display.contentCenterY +50
estrela6:setSequence ("nada")
estrela6:play ()


------------------------------------------------------------------------------

--- FASE 7 ---------




-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela7 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela7.x = display.contentCenterX -100
estrela7.y = display.contentCenterY +50
estrela7:setSequence ("nada")
estrela7:play ()




----------------------------------------------------------------------------



--- FASE 8 ---------


-- Insere AS ESTRELAS ---------------------------------------------------------------------------------


estrela8 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela8.x = display.contentCenterX 
estrela8.y = display.contentCenterY +50
estrela8:setSequence ("nada")
estrela8:play ()




----------------------------------------------------------------------------




--- FASE 9 ---------



-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela9 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela9.x = display.contentCenterX +100
estrela9.y = display.contentCenterY +50
estrela9:setSequence ("nada")
estrela9:play ()








----------------------------------------------------------------------------




--- FASE 10 ---------




-- Insere AS ESTRELAS -----------------------------------------------------------------------------------------


estrela10 = display.newSprite (sceneGroup,spriteEstrelas, spriteEstrelasAnimacao)
estrela10.x = display.contentCenterX +200
estrela10.y = display.contentCenterY +50
estrela10:setSequence ("nada")
estrela10:play ()


botao1:addEventListener ("tap", irNivel1) 
botao2:addEventListener ("tap", irNivel2)
botao3:addEventListener ("tap", irNivel3) 
botao4:addEventListener ("tap", irNivel4) 
botao5:addEventListener ("tap", irNivel5) 
botao6:addEventListener ("tap", irNivel6) 
botao7:addEventListener ("tap", irNivel7) 
botao8:addEventListener ("tap", irNivel8) 
botao9:addEventListener ("tap", irNivel9) 
botao10:addEventListener ("tap", irNivel10) 

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela
		Runtime:addEventListener ("enterFrame", level1)
		Runtime:addEventListener ("enterFrame", level2)
		Runtime:addEventListener ("enterFrame", level3)
		Runtime:addEventListener ("enterFrame", level4)
		Runtime:addEventListener ("enterFrame", level5)
		Runtime:addEventListener ("enterFrame", level6)
		Runtime:addEventListener ("enterFrame", level7)
		Runtime:addEventListener ("enterFrame", level8)
		Runtime:addEventListener ("enterFrame", level9)
		Runtime:addEventListener ("enterFrame", level10)

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- O código aqui é executado quando a cena está na tela (mas está prestes a sair da tela)

	elseif ( phase == "did" ) then
		Runtime:removeEventListener ("enterFrame", level1)
		Runtime:removeEventListener ("enterFrame", level2)
		Runtime:removeEventListener ("enterFrame", level3)
		Runtime:removeEventListener ("enterFrame", level4)
		Runtime:removeEventListener ("enterFrame", level5)
		Runtime:removeEventListener ("enterFrame", level6)
		Runtime:removeEventListener ("enterFrame", level7)
		Runtime:removeEventListener ("enterFrame", level8)
		Runtime:removeEventListener ("enterFrame", level9)
		Runtime:removeEventListener ("enterFrame", level10)
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
