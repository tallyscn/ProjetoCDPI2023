
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require ("physics")
physics.start ()
physics.setGravity (0,0)
physics.setDrawMode ("normal")
display.setStatusBar (display.HiddenStatusBar)

local letterboxWidth = (display.actualContentWidth-display.contentWidth)/2
-- Define o objeto para a borda de baixo
local letterboxHeight = (display.actualContentHeight-display.contentHeight)/2

local grupoBg
local grupoMain
local grupoPortaDaGeladeira
local grupoUI
local tabuaComIngrediente = false
local fornoComIngrediente = false
local fornoEstaPronto = false
local tipoDoIngrediente = "nada"
local pratoNoMonte = 4
local jaTemPrato1 = false
local jaTemPrato2 = false
local jaTemPrato3 = false
local jaTemPrato4 = false
local statusPrato1 = 0
local statusPrato2 = 0
local statusPrato3 = 0
local statusPrato4 = 0
local bancada
local ferramentas
local barraDePedidos
local PortaDaGeladeira
local forno
local fogaoE
local fogaoD
local tabua
local pia
local pratos
local prato1
local prato2
local prato3
local prato4
local pratoMovel
local alface
local alfaceCortado
local alfaceCortadoNaTabua = false
local jaComAlface1 = false
local jaComAlface2 = false
local jaComAlface3 = false
local jaComAlface4 = false
local batata
local batataCortada
local batataCortadaNaTabua = false
local jaComBatata1 = false
local jaComBatata2 = false
local jaComBatata3 = false
local jaComBatata4 = false
local tomate
local tomateCortado
local tomateCortadoNaTabua = false
local jaComTomate1 = false
local jaComTomate2 = false
local jaComTomate3 = false
local jaComTomate4 = false
local trigo
local pao
local paoCortado
local paoCortadoNaTabua = false
local jaComPao1 = false
local jaComPao2 = false
local jaComPao3 = false
local jaComPao4 = false
local luva
local colher
local faca
local mao
local spritePedidos
local spritePedidosAnimacao
local pedidos
local pedidos2
local pedidos3
local pedidos4
local pratosNaPia = 0
local valorPedido = -1
local valorPedido2 = -1
local valorPedido3 = -1
local valorPedido4 = -1
local pontos = 0
local pontosText
local segundosRestantes = 180
local relogioText
local minutos
local segundos
local timeDisplay
local contador
local chamadoDoPedido
local nivel = 2
local tempoNivel = 0
local time = 0
local teveColisao = false


local spriteForno = graphics.newImageSheet ("imagens/cozinha/forno.png", {width=96, height=46, numFrames=3})

-- Cria as opções de animações do forno -----------------------------------------------------------------------------------------
local spriteFornoAnimacao = {
        {name="desligado", start=1, count=1, time=1000, loopCount=0},
        {name="ligado", start=2, count=1, time=1000, loopCount=0},
        {name="pronto", start=3, count=1, time=1000, loopCount=0},
}

local spriteFogaoE = graphics.newImageSheet ("imagens/cozinha/bocafoagaoE.png", {width=48, height=50, numFrames=8})

-- Cria as opções de animações do fogão da esquerda -----------------------------------------------------------------------------
local spriteFogaoEAnimacao = {
        {name="desligado", start=1, count=1, time=1000, loopCount=0},
        {name="comingrediente", start=2, count=1, time=1000, loopCount=0},
        {name="pronto", start=3, count=4, time=1000, loopCount=0},
        {name="queimando", start=7, count=2, time=1000, loopCount=0}
}

local spriteFogaoD = graphics.newImageSheet ("imagens/cozinha/bocafoagaoD.png", {width=48, height=50, numFrames=8})

-- Cria as opções de animações do fogão da direita ------------------------------------------------------------------------------
local spriteFogaoDAnimacao = {
        {name="desligado", start=1, count=1, time=1000, loopCount=0},
        {name="comingrediente", start=2, count=1, time=1000, loopCount=0},
        {name="pronto", start=3, count=4, time=1000, loopCount=0},
        {name="queimando", start=7, count=2, time=1000, loopCount=0}
}

local spriteTabua = graphics.newImageSheet ("imagens/cozinha/tabua.png", {width=96, height=48, numFrames=9})

-- Cria as opções de animações da tábua -----------------------------------------------------------------------------------------
local spriteTabuaAnimacao = {
    {name="nada", start=1, count=1, time=1000, loopCount=0},
    {name="alface", start=2, count=1, time=1000, loopCount=0},
    {name="alfacecortado", start=3, count=1, time=1000, loopCount=0},
    {name="batata", start=4, count=1, time=1000, loopCount=0},
    {name="batatacortada", start=5, count=1, time=1000, loopCount=0},
    {name="tomate", start=6, count=1, time=1000, loopCount=0},
    {name="tomatecortado", start=7, count=1, time=1000, loopCount=0},
    {name="pao", start=8, count=1, time=1000, loopCount=0},
    {name="paocortado", start=9, count=1, time=1000, loopCount=0},
}

local spritePia = graphics.newImageSheet ("imagens/cozinha/pia.png", {width=96, height=48, numFrames=11})

-- Cria as opções de animações da pia -------------------------------------------------------------------------------------------
local spritePiaAnimacao = {
        {name="nada", start=1, count=1, time=1000, loopCount=0},
        {name="1prato", start=2, count=1, time=1000, loopCount=0},
        {name="2prato", start=3, count=1, time=1000, loopCount=0},
        {name="3prato", start=4, count=1, time=1000, loopCount=0},
        {name="4prato", start=5, count=1, time=1000, loopCount=0},
        {name="5prato", start=6, count=1, time=1000, loopCount=0},
        {name="6prato", start=7, count=1, time=1000, loopCount=0},
        {name="7prato", start=8, count=1, time=1000, loopCount=0},
        {name="8prato", start=9, count=1, time=1000, loopCount=0},
        {name="9prato", start=10, count=1, time=1000, loopCount=0},
        {name="10prato", start=11, count=1, time=1000, loopCount=0}
}

local spritePratos = graphics.newImageSheet ("imagens/cozinha/pratos.png", {width=48, height=88, numFrames=5})

-- Cria as opções de animações dos pratos ---------------------------------------------------------------------------------------
local spritePratosAnimacao = {
        {name="nada", start=1, count=1, time=1000, loopCount=0},
        {name="1prato", start=2, count=1, time=1000, loopCount=0},
        {name="2pratos", start=3, count=1, time=1000, loopCount=0},
        {name="3pratos", start=4, count=1, time=1000, loopCount=0},
        {name="4pratos", start=5, count=1, time=1000, loopCount=0}
}

local spritePrato1 = graphics.newImageSheet ("imagens/cozinha/prato.png", {width=48, height=48, numFrames=16})

-- Cria as opções de animações dos pratos ---------------------------------------------------------------------------------------
local spritePrato1Animacao = {
        {name="nada", start=1, count=1, time=1000, loopCount=0},
        {name="pratoVazio", start=2, count=1, time=1000, loopCount=0},
        {name="pratoComPao", start=3, count=1, time=1000, loopCount=0},
        {name="pratoComAlface", start=4, count=1, time=1000, loopCount=0},
        {name="pratoComBatata", start=5, count=1, time=1000, loopCount=0},
        {name="pratoComBatataFrita", start=6, count=1, time=1000, loopCount=0},
        {name="pratoComTomate", start=7, count=1, time=1000, loopCount=0},
        {name="pratoComTomateEBatata", start=8, count=1, time=1000, loopCount=0},
        {name="pratoComAlfaceETomate", start=9, count=1, time=1000, loopCount=0},
        {name="pratoComAlfaceBatataETomate", start=10, count=1, time=1000, loopCount=0},
        {name="pratoComAlfaceEBatata", start=11, count=1, time=1000, loopCount=0},
        {name="pratoComSanduicheDeAlfaceETomate", start=12, count=1, time=1000, loopCount=0},
        {name="pratoComSanduicheDeTomate", start=13, count=1, time=1000, loopCount=0},
        {name="pratoComSanduicheDeAlface", start=14, count=1, time=1000, loopCount=0},
        {name="pratoComMacarrao", start=15, count=1, time=1000, loopCount=0},
        {name="pratoComMacarraoEMolho", start=16, count=1, time=1000, loopCount=0}
}

-- Cria a sprite dos pedidos ----------------------------------------------------------------------------------------------------
local spritePedidos = graphics.newImageSheet ("imagens/cozinha/pedidos.png", {width=56, height=60, numFrames=15})

-- Cria as opções de animações dos pedidos --------------------------------------------------------------------------------------
local spritePedidosAnimacao = {
        {name="nada", start=1, count=1, time=1000, loopCount=0},
        {name="pao", start=2, count=1, time=1000, loopCount=0},
        {name="alface", start=3, count=1, time=1000, loopCount=0},
        {name="batata", start=4, count=1, time=1000, loopCount=0},
        {name="batataFrita", start=5, count=1, time=1000, loopCount=0},
        {name="tomate", start=6, count=1, time=1000, loopCount=0},
        {name="tomateEBatata", start=7, count=1, time=1000, loopCount=0},
        {name="alfaceETomate", start=8, count=1, time=1000, loopCount=0},
        {name="alfaceTomateEBatata", start=9, count=1, time=1000, loopCount=0},
        {name="alfaceEBatata", start=10, count=1, time=1000, loopCount=0},
        {name="paoDeAlfaceETomate", start=11, count=1, time=1000, loopCount=0},
        {name="paoETomate", start=12, count=1, time=1000, loopCount=0},
        {name="paoEAlface", start=13, count=1, time=1000, loopCount=0},
        {name="macarraao", start=14, count=1, time=1000, loopCount=0},
        {name="macarraoComMolho", start=15, count=1, time=1000, loopCount=0}
}

local function removerPortaDaGeladeira ()
    display.remove (PortaDaGeladeira)
end

local function fornoPronto ()
    fornoEstaPronto = true
    forno:setSequence ("pronto")
    forno:play ()
end

local function pratoMovelCorpo ()
    pratoMovel.bodyType = "dynamic"
end

-- Função que permite mover o pratoMovel ----------------------------------------------------------------------------------------
local function moverPratoMovel (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false
            pratoMovel.bodyType = "static"
            pratoMovel.x, pratoMovel.y = -800,-800
            timer.performWithDelay( 200, pratoMovelCorpo)
        end
    end
    return true
end

local function pratoAoMonte ()
    print ("pegaum")
    if not (pratoNoMonte == 0) then
    pratoMovel.x, pratoMovel.y = pratos.x, pratos.y -20
    end
end

local function alfaceCorpo ()
    alface.bodyType = "dynamic"
end

local function moverAlface (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false
            alface.bodyType = "static"
            alface.x, alface.y = -120 + display.contentCenterX, display.contentCenterY + 78
            local PortaDaGeladeira = display.newImageRect (grupoPortaDaGeladeira, "imagens/cozinha/geladeira.png", 144, 98)
            PortaDaGeladeira.x, PortaDaGeladeira.y = -153 + display.contentCenterX, display.contentCenterY +97
            local function removerPortaDaGeladeira ()
                display.remove (PortaDaGeladeira)
            end
            PortaDaGeladeira:addEventListener ("tap", removerPortaDaGeladeira)
            timer.performWithDelay( 200, alfaceCorpo)
        end
    end
    return true
end

local function restauraAlface ()

    alface.isBodyActive = false

    transition.to (alface, {alpha=1, time=200, onComplete = function ()
        alface.isBodyActive = true
        morto = false
    end})
end

local function alfaceCortadoCorpo ()
    alfaceCortado.bodyType = "dynamic"
end

local function moverAlfaceCortado (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            alfaceCortado.bodyType = "static"
            if alfaceCortadoNaTabua == true then
                alfaceCortado.x, alfaceCortado.y = tabua.x, tabua.y
            else
                alfaceCortado.x, alfaceCortado.y = -300, -300
            end
            timer.performWithDelay( 200, alfaceCortadoCorpo)
        end
    end
    return true
end

local function alfaceCortadoATabua ()
    alfaceCortado.x, alfaceCortado.y = tabua.x, tabua.y
end

local function batataCorpo ()
    batata.bodyType = "dynamic"
end

-- Função que permite mover a batata --------------------------------------------------------------------------------------------
local function moverBatata (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            batata.bodyType = "static"
            batata.x, batata.y = -180 + display.contentCenterX, display.contentCenterY + 78
            local PortaDaGeladeira = display.newImageRect (grupoPortaDaGeladeira, "imagens/cozinha/geladeira.png", 144, 98)
            PortaDaGeladeira.x, PortaDaGeladeira.y = -153 + display.contentCenterX, display.contentCenterY +97
            local function removerPortaDaGeladeira ()
                display.remove (PortaDaGeladeira)
            end
            PortaDaGeladeira:addEventListener ("tap", removerPortaDaGeladeira)
            timer.performWithDelay( 200, batataCorpo)
        end
    end
    return true
end

local function restauraBatata ()

    batata.isBodyActive = false

    transition.to (batata, {alpha=1, time=200, onComplete = function ()
        batata.isBodyActive = true
        morto = false
    end})
end

local function batataCortadaCorpo ()
    batataCortada.bodyType = "dynamic"
end

local function moverBatataCortada (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            batataCortada.bodyType = "static"
            if batataCortadaNaTabua == true then
                batataCortada.x, batataCortada.y = tabua.x, tabua.y
            else
                batataCortada.x, batataCortada.y = -400, -400
            end
            timer.performWithDelay( 200, batataCortadaCorpo)
        end
    end
    return true
end

-- Função que faz a batata surgir na tábua --------------------------------------------------------------------------------------
local function batataCortadaATabua ()
    batataCortada.x, batataCortada.y = tabua.x, tabua.y
end

local function tomateCorpo ()
    tomate.bodyType = "dynamic"
end

-- Função que permite mover o tomate --------------------------------------------------------------------------------------------
local function moverTomate (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            tomate.bodyType = "static"
            tomate.x, tomate.y = -120 + display.contentCenterX, display.contentCenterY + 118
            local PortaDaGeladeira = display.newImageRect (grupoPortaDaGeladeira, "imagens/cozinha/geladeira.png", 144, 98)
            PortaDaGeladeira.x, PortaDaGeladeira.y = -153 + display.contentCenterX, display.contentCenterY +97
            local function removerPortaDaGeladeira ()
                display.remove (PortaDaGeladeira)
            end
            PortaDaGeladeira:addEventListener ("tap", removerPortaDaGeladeira)
            timer.performWithDelay( 200, tomateCorpo)
        end
    end
    return true
end

local function restauraTomate ()

    tomate.isBodyActive = false

    transition.to (tomate, {alpha=1, time=200, onComplete = function ()
        tomate.isBodyActive = true
        morto = false
    end})
end

local function tomateCortadoCorpo ()
    tomateCortado.bodyType = "dynamic"
end

local function moverTomateCortado (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            tomateCortado.bodyType = "static"
            if tomateCortadoATabua == true then
                tomateCortado.x, tomateCortado.y = tabua.x, tabua.y
            else
                tomateCortado.x, tomateCortado.y = -500, -500
            end
            timer.performWithDelay( 200, tomateCortadoCorpo)
        end
    end
    return true
end

local function tomateCortadoATabua ()
    tomateCortado.x, tomateCortado.y = tabua.x, tabua.y
end

local function trigoCorpo ()
    trigo.bodyType = "dynamic"
end

-- Função que permite mover o trigo ---------------------------------------------------------------------------------------------
local function moverTrigo (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            trigo.bodyType = "static"
            trigo.x, trigo.y = -180 + display.contentCenterX, display.contentCenterY + 118
            local PortaDaGeladeira = display.newImageRect (grupoPortaDaGeladeira, "imagens/cozinha/geladeira.png", 144, 98)
            PortaDaGeladeira.x, PortaDaGeladeira.y = -153 + display.contentCenterX, display.contentCenterY +97
            local function removerPortaDaGeladeira ()
                display.remove (PortaDaGeladeira)
            end
            PortaDaGeladeira:addEventListener ("tap", removerPortaDaGeladeira)
            timer.performWithDelay( 200, trigoCorpo)
        end
    end
    return true
end

local function restauraTrigo ()

    trigo.isBodyActive = false

    transition.to (trigo, {alpha=1, time=200, onComplete = function ()
        trigo.isBodyActive = true
        morto = false
    end})
end

local function paoCorpo ()
    pao.bodyType = "dynamic"
end

-- Função que permite mover o pao ----------------------------------------------------------------------------------------------
local function moverPao (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false
            pao.bodyType = "static"
            pao.x, pao.y = -200, -200
            timer.performWithDelay( 200, paoCorpo)
        end
    end
    return true
end

local function paoAoForno ()
    print ("saipao")
    if fornoEstaPronto == true then
    pao.x, pao.y = forno.x, forno.y
    end
end

local function paoCortadoCorpo ()
    paoCortado.bodyType = "dynamic"
end

-- Função que permite mover o paoCortado ----------------------------------------------------------------------------------------
local function moverPaoCortado (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            paoCortado.bodyType = "static"
            if paoCortadoNaTabua == true then
                paoCortado.x, paoCortado.y = tabua.x, tabua.y
                print ("taali")
            else
                paoCortado.x, paoCortado.y = -600, -600
            end
            timer.performWithDelay( 200, paoCortadoCorpo)
        end
    end
    return true
end

local function paoCortadoATabua ()
    paoCortado.x, paoCortado.y = tabua.x, tabua.y
end

local function luvaCorpo ()
    luva.bodyType = "dynamic"
end

-- Função que faz a luva se mover -----------------------------------------------------------------------------------------------
local function moverLuva (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            luva.bodyType = "static"
            luva.x, luva.y = display.contentWidth + letterboxWidth -32, display.contentCenterY -85
            timer.performWithDelay( 200, luvaCorpo)
        end
    end
    return true
end

local function restauraLuva ()

    luva.isBodyActive = false

    transition.to (luva, {alpha=1, time=200, onComplete = function ()
        luva.isBodyActive = true
        morto = false
    end})
end

local function colherCorpo ()
    colher.bodyType = "dynamic"
end

-- Função que faz a colher se mover ---------------------------------------------------------------------------------------------
local function moverColher (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            colher.bodyType = "static"
            colher.x, colher.y = display.contentWidth + letterboxWidth -32, display.contentCenterY -30
            timer.performWithDelay( 200, colherCorpo)
        end
    end
    return true
end

local function restauraColher ()

    colher.isBodyActive = false

    transition.to (colher, {alpha=1, time=200, onComplete = function ()
        colher.isBodyActive = true
        morto = false
    end})
end

local function facaCorpo ()
    faca.bodyType = "dynamic"
end

-- Função que faz a faca se mover -----------------------------------------------------------------------------------------------
local function moverFaca (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            faca.bodyType = "static"
            faca.x, faca.y = display.contentWidth + letterboxWidth -32, display.contentCenterY +27
            timer.performWithDelay( 200, facaCorpo)
        end
    end
    return true
end

local function restauraFaca ()

    faca.isBodyActive = false

    transition.to (faca, {alpha=1, time=200, onComplete = function ()
        faca.isBodyActive = true
        morto = false
    end})
end

local function maoCorpo ()
    mao.bodyType = "dynamic"
end

-- Função que faz a mao se mover ------------------------------------------------------------------------------------------------
local function moverMao (event)
    local body = event.target
    local phase = event.phase

    if ("began" == phase) then
        display.getCurrentStage (): setFocus (body,event.id)
        body.isFocus = true
        -- cria a junta para mover
        body.tempJoint = physics.newJoint ("touch", body, event.x, event.y)
        body.isFixedRotation = true
    elseif (body.isFocus) then
        if ("moved" == phase) then
            body.tempJoint:setTarget (event.x, event.y)
        elseif ("ended" == phase or "canceled" == phase) then
            display.getCurrentStage ():setFocus (body, nil)
            body.isFocus = false
            event.target:setLinearVelocity (0,0)
            event.target.angularVelocity = 0
            body.tempJoint:removeSelf ()
            body.isFixedRotation = false -- deve ser comentado caso não queira que o heroi gire na agua
            mao.bodyType = "static"
            mao.x, mao.y = display.contentWidth + letterboxWidth -32, display.contentCenterY +82
            timer.performWithDelay( 200, maoCorpo)
        end
    end
    return true
end

local function restauraMao ()

    mao.isBodyActive = false

    transition.to (mao, {alpha=1, time=200, onComplete = function ()
        mao.isBodyActive = true
        morto = false
    end})
end

local function voltaColisao ()
	teveColisao = false
end

local function onColision (event)
    if (event.phase == "began") then

		
			local obj1 = event.object1
			local obj2 = event.object2

			--Colisão que coloca o alface na tábua ----------------------------------------------------------------------------------
			if ((obj1.myName == "alface" and obj2.myName == "tabua") or (obj2.myName == "alface" and obj1.myName == "tabua")) then
				if (tabuaComIngrediente == false) then
					tabua:setSequence ("alface")
					tipoDoIngrediente = "alface"
					tabuaComIngrediente = true
					alface.alpha = 0
					timer.performWithDelay (100, restauraAlface)
				end
			end
			-- Colisão que coloca a batata na tábua ---------------------------------------------------------------------------------
			if ((obj1.myName == "batata" and obj2.myName == "tabua") or (obj2.myName == "batata" and obj1.myName == "tabua")) then
				if (tabuaComIngrediente == false) then
					tabua:setSequence ("batata")
					tipoDoIngrediente = "batata"
					tabuaComIngrediente = true
					batata.alpha = 0
					timer.performWithDelay (100, restauraBatata)
				end
			end
			-- Colisão que coloca o tomate na tábua ---------------------------------------------------------------------------------
			if ((obj1.myName == "tomate" and obj2.myName == "tabua") or (obj2.myName == "tomate" and obj1.myName == "tabua")) then
				if (tabuaComIngrediente == false) then
					tabua:setSequence ("tomate")
					tipoDoIngrediente = "tomate"
					tabuaComIngrediente = true
					tomate.alpha = 0
					timer.performWithDelay (100, restauraTomate)
				end
			end
			-- Colisão que faz o forno ligar quando coloca o trigo ------------------------------------------------------------------
			if ((obj1.myName == "forno" and obj2.myName == "trigo") or (obj2.myName == "forno" and obj1.myName == "trigo")) then
				if (fornoComIngrediente == false) then
					forno:setSequence ("ligado")
					fornoComIngrediente = true
					trigo.alpha = 0
					timer.performWithDelay (100, restauraTrigo)
					timer.performWithDelay (2000, fornoPronto)
				end
			end
			-- Colisão que faz o forno abrir com a luva -----------------------------------------------------------------------------
			if ((obj1.myName == "luva" and obj2.myName == "forno") or (obj2.myName == "luva" and obj1.myName == "forno")) then
				luva.alpha = 0
				timer.performWithDelay (100, restauraLuva)
				timer.performWithDelay (150, paoAoForno)
			end
			-- Colisão que coloca o pão na tábua ------------------------------------------------------------------------------------
			if ((obj1.myName == "pao" and obj2.myName == "tabua") or (obj2.myName == "pao" and obj1.myName == "tabua")) then
				if (tabuaComIngrediente == false) then
					tabua:setSequence ("pao")
					tipoDoIngrediente = "pao"
					tabuaComIngrediente = true
					fornoComIngrediente = false
					timer.performWithDelay (100, restauraPao)
					forno:setSequence ("desligado")
				end
			end
			-- Colisão que faz a faca cortas os ingredientes ------------------------------------------------------------------------
			if ((obj1.myName == "faca" and obj2.myName == "tabua") or (obj2.myName == "faca" and obj1.myName == "tabua")) then
				if (tabuaComIngrediente == true) then
					if tipoDoIngrediente == "alface" then
						tabua:setSequence ("alfacecortado")
						timer.performWithDelay (150, alfaceCortadoATabua)
						alfaceCortadoNaTabua = true
						faca.alpha = 0
						timer.performWithDelay (100, restauraFaca)
					elseif (tipoDoIngrediente == "batata") then
						tabua:setSequence ("batatacortada")
						timer.performWithDelay (150, batataCortadaATabua)
						batataCortadaNaTabua = true
						faca.alpha = 0
						timer.performWithDelay (100, restauraFaca)
					elseif (tipoDoIngrediente == "tomate") then
						tabua:setSequence ("tomatecortado")
						timer.performWithDelay (150, tomateCortadoATabua)
						tomateCortadoNaTabua = true
						faca.alpha = 0
						timer.performWithDelay (100, restauraFaca)
					elseif (tipoDoIngrediente == "pao") then
						tabua:setSequence ("paocortado")
						timer.performWithDelay (150, paoCortadoATabua)
						paoCortadoNaTabua = true
						faca.alpha = 0
						timer.performWithDelay (100, restauraFaca)
					end
				end
			end
			if teveColisao == false then
				-- Colisão que coloca o prato1 ------------------------------------------------------------------------------------------
				if ((obj1.myName == "pratoMovel" and obj2.myName == "prato1") or (obj2.myName == "pratoMovel" and obj1.myName == "prato1")) then
					
					if (jaTemPrato1 == false) then
						prato1:setSequence ("pratoVazio")
						if pratoNoMonte == 4 then
							pratos:setSequence ("3pratos")
							jaTemPrato1 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato1 = 1
						elseif pratoNoMonte == 3 then
							pratos:setSequence ("2pratos")
							jaTemPrato1 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato1 = 1
						elseif pratoNoMonte == 2 then
							pratos:setSequence ("1prato")
							jaTemPrato1 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato1 = 1
						elseif pratoNoMonte == 1 then
							pratos:setSequence ("nada")
							jaTemPrato1 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato1 = 1
						end
					end
				end
				-- Colisão que coloca o prato2 ------------------------------------------------------------------------------------------
				if ((obj1.myName == "pratoMovel" and obj2.myName == "prato2") or (obj2.myName == "pratoMovel" and obj1.myName == "prato2")) then
					if (jaTemPrato2 == false) then
						prato2:setSequence ("pratoVazio")
						if pratoNoMonte == 4 then
							pratos:setSequence ("3pratos")
							jaTemPrato2 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato2 = 1
						elseif pratoNoMonte == 3 then
							pratos:setSequence ("2pratos")
							jaTemPrato2 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato2 = 1
						elseif pratoNoMonte == 2 then
							pratos:setSequence ("1prato")
							jaTemPrato2 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato2 = 1
						elseif pratoNoMonte == 1 then
							pratos:setSequence ("nada")
							jaTemPrato2 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato2 = 1
						end
					end
				end
				-- Colisão que coloca o prato3 ------------------------------------------------------------------------------------------
				if ((obj1.myName == "pratoMovel" and obj2.myName == "prato3") or (obj2.myName == "pratoMovel" and obj1.myName == "prato3")) then
					if (jaTemPrato3 == false) then
						prato3:setSequence ("pratoVazio")
						if pratoNoMonte == 4 then
							pratos:setSequence ("3pratos")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						elseif pratoNoMonte == 3 then
							pratos:setSequence ("2pratos")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						elseif pratoNoMonte == 2 then
							pratos:setSequence ("1prato")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						elseif pratoNoMonte == 1 then
							pratos:setSequence ("nada")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						end
					end
				end
						-- Colisão que coloca o prato3 ------------------------------------------------------------------------------------------
				if ((obj1.myName == "pratoMovel" and obj2.myName == "prato3") or (obj2.myName == "pratoMovel" and obj1.myName == "prato3")) then
					if (jaTemPrato3 == false) then
						prato3:setSequence ("pratoVazio")
						if pratoNoMonte == 4 then
							pratos:setSequence ("3pratos")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						elseif pratoNoMonte == 3 then
							pratos:setSequence ("2pratos")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						elseif pratoNoMonte == 2 then
							pratos:setSequence ("1prato")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						elseif pratoNoMonte == 1 then
							pratos:setSequence ("nada")
							jaTemPrato3 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato3 = 1
						end
					end
				end
				-- Colisão que coloca o prato4 ------------------------------------------------------------------------------------------
				if ((obj1.myName == "pratoMovel" and obj2.myName == "prato4") or (obj2.myName == "pratoMovel" and obj1.myName == "prato4")) then
					if (jaTemPrato4 == false) then
						prato4:setSequence ("pratoVazio")
						if pratoNoMonte == 4 then
							pratos:setSequence ("3pratos")
							jaTemPrato4 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato4 = 1
						elseif pratoNoMonte == 3 then
							pratos:setSequence ("2pratos")
							jaTemPrato4 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato4 = 1
						elseif pratoNoMonte == 2 then
							pratos:setSequence ("1prato")
							jaTemPrato4 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato4 = 1
						elseif pratoNoMonte == 1 then
							pratos:setSequence ("nada")
							jaTemPrato4 = true
							pratoNoMonte = pratoNoMonte -1
							statusPrato4 = 1
						end
					end
				end
				-- Colisão que cria e executa as opções de comidas com alface cortado no prato1 -----------------------------------------
				if ((obj1.myName == "prato1" and obj2.myName == "alfaceCortado") or (obj2.myName == "prato1" and obj1.myName == "alfaceCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato1 = statusPrato1 * 2 --numero do ingrediente --
					print ("colidiu")
					if jaComAlface1 == false then
						if statusPrato1 == 2 then -- somente o alface
							prato1:setSequence ("pratoComAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato1 == 6 then -- alface e pão
							prato1:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato1 == 10 then -- alface e batata
							prato1:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato1 == 14 then --- alface e tomate
							prato1:setSequence ("pratoComAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato1 == 70 then -- alface, batata e tomate
							prato1:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato1 == 42 then -- alface, tomate e pão
							prato1:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						end
						jaComAlface1 = true
						print ("statusprato ".. statusPrato1)
					end
				end
				-- Colisão que cria e executa as opções de comidas com batata cortada no prato1 -----------------------------------------
				if ((obj1.myName == "prato1" and obj2.myName == "batataCortada") or (obj2.myName == "prato1" and obj1.myName == "batataCortada")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato1 = statusPrato1 * 5 --numero do ingrediente --
					print ("colidiu")
					if jaComBatata1 == false then
						if statusPrato1 == 5 then -- somente batata
							prato1:setSequence ("pratoComBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato1 == 10 then -- alface e batata
							prato1:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato1 == 35 then -- batata e tomate
							prato1:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato1 == 70 then -- alface, batata e tomate
							prato1:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						end
						jaComBatata1 = true
						print ("statusprato ".. statusPrato1)
					end
				end
				-- Colisão que cria e executa as opções de comidas com tomate cortado no prato1 -----------------------------------------
				if ((obj1.myName == "prato1" and obj2.myName == "tomateCortado") or (obj2.myName == "prato1" and obj1.myName == "tomateCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato1 = statusPrato1 * 7 --numero do ingrediente --
					print ("colidiu")
					if jaComTomate1 == false then
						if statusPrato1 == 7 then -- somente tomate
							prato1:setSequence ("pratoComTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato1 == 35 then -- tomate e batata
							prato1:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato1 == 14 then -- alface e tomate
							prato1:setSequence ("pratoComAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato1 == 70 then -- alface, batata e tomate
							prato1:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato1 == 42 then -- pão, alface e tomate
							prato1:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato1 == 21 then -- pão e tomate
							prato1:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						end
						jaComTomate1 = true
						print ("statusprato ".. statusPrato1)
					end
				end
				-- Colisão que cria e executa as opções de comidas com pão cortado no prato1 --------------------------------------------
				if ((obj1.myName == "prato1" and obj2.myName == "paoCortado") or (obj2.myName == "prato1" and obj1.myName == "paoCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato1 = statusPrato1 * 3 --numero do ingrediente --
					print ("colidiu")
					if jaComPao1 == false then
						if statusPrato1 == 3 then -- somente o pão
							prato1:setSequence ("pratoComPao")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato1 == 6 then -- alface e pão
							prato1:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato1 == 21 then -- pão e tomate
							prato1:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato1 == 42 then -- alface, tomate e pão
							prato1:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						end
						jaComPao1 = true
						print ("statusprato ".. statusPrato1)
					end
				end
				-- Colisão que cria e executa as opções de comidas com alface cortado no prato2 -----------------------------------------
				if ((obj1.myName == "prato2" and obj2.myName == "alfaceCortado") or (obj2.myName == "prato2" and obj1.myName == "alfaceCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato2 = statusPrato2 * 2 --numero do ingrediente --
					print ("colidiu")
					if jaComAlface2 == false then
						if statusPrato2 == 2 then -- somente o alface
							prato2:setSequence ("pratoComAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato2 == 6 then -- alface e pão
							prato2:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato2 == 10 then -- alface e batata
							prato2:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato2 == 14 then --- alface e tomate
							prato2:setSequence ("pratoComAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato2 == 70 then -- alface, batata e tomate
							prato2:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato2 == 42 then -- alface, tomate e pão
							prato2:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						end
						jaComAlface2 = true
						print ("statusprato ".. statusPrato2)
					end
				end
				-- Colisão que cria e executa as opções de comidas com batata cortada no prato2 -----------------------------------------
				if ((obj1.myName == "prato2" and obj2.myName == "batataCortada") or (obj2.myName == "prato2" and obj1.myName == "batataCortada")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato2 = statusPrato2 * 5 --numero do ingrediente --
					print ("colidiu")
					if jaComBatata2 == false then
						if statusPrato2 == 5 then -- somente batata
							prato2:setSequence ("pratoComBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato2 == 10 then -- alface e batata
							prato2:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato2 == 35 then -- batata e tomate
							prato2:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato2 == 70 then -- alface, batata e tomate
							prato2:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						end
						jaComBatata2 = true
						print ("statusprato ".. statusPrato2)
					end
				end
				-- Colisão que cria e executa as opções de comidas com tomate cortado no prato2 -----------------------------------------
				if ((obj1.myName == "prato2" and obj2.myName == "tomateCortado") or (obj2.myName == "prato2" and obj1.myName == "tomateCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato2 = statusPrato2 * 7 --numero do ingrediente --
					print ("colidiu")
					if jaComTomate2 == false then
						if statusPrato2 == 7 then -- somente tomate
							prato2:setSequence ("pratoComTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato2 == 14 then -- alface e tomate
							prato2:setSequence ("pratoComAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato2 == 35 then -- tomate e batata
							prato2:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato2 == 70 then -- alface, batata e tomate
							prato2:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato2 == 42 then -- pão, alface e tomate
							prato2:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato2 == 21 then -- pão e tomate
							prato2:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						end
						jaComTomate2 = true
						print ("statusprato ".. statusPrato2)
					end
				end
				-- Colisão que cria e executa as opções de comidas com pão cortado no prato2 --------------------------------------------
				if ((obj1.myName == "prato2" and obj2.myName == "paoCortado") or (obj2.myName == "prato2" and obj1.myName == "paoCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato2 = statusPrato2 * 3 --numero do ingrediente --
					print ("colidiu")
					if jaComPao2 == false then
						if statusPrato2 == 3 then -- somente o pão
							prato2:setSequence ("pratoComPao")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato2 == 6 then -- alface e pão
							prato2:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato2 == 21 then -- pão e tomate
							prato2:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato2 == 42 then -- alface, tomate e pão
							prato2:setSequence ("pratoComSanduicheDeAlfaceETomate") -- e tomate
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						end
						jaComPao2 = true
						print ("statusprato ".. statusPrato2)
					end
				end
				-- Colisão que cria e executa as opções de comidas com alface cortado no prato3 -----------------------------------------
				if ((obj1.myName == "prato3" and obj2.myName == "alfaceCortado") or (obj2.myName == "prato3" and obj1.myName == "alfaceCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato3 = statusPrato3 * 2 --numero do ingrediente --
					print ("colidiu")
					if jaComAlface3 == false then
						if statusPrato3 == 2 then -- somente o alface
							prato3:setSequence ("pratoComAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato3 == 6 then -- alface e pão
							prato3:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato3 == 10 then -- alface e batata
							prato3:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato3 == 14 then --- alface e tomate
							prato3:setSequence ("pratoComAlfaceETomate")-- coloque o nome da squencia com alface e tomate
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato3 == 70 then -- alface, batata e tomate
							prato3:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato3 == 42 then -- alface, tomate e pão
							prato3:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						end
						jaComAlface3 = true
						print ("statusprato ".. statusPrato3)
					end
				end
				-- Colisão que cria e executa as opções de comidas com batata cortada no prato3 -----------------------------------------
				if ((obj1.myName == "prato3" and obj2.myName == "batataCortada") or (obj2.myName == "prato3" and obj1.myName == "batataCortada")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato3 = statusPrato3 * 5 --numero do ingrediente --
					print ("colidiu")
					if jaComBatata3 == false then
						if statusPrato3 == 5 then -- somente batata
							prato3:setSequence ("pratoComBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato3 == 10 then -- alface e batata
							prato3:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato3 == 35 then -- tomate e batata
							prato3:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato3 == 70 then -- alface, batata e tomate
							prato3:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						end
						jaComBatata3 = true
						print ("statusprato ".. statusPrato3)
					end
				end
				-- Colisão que cria e executa as opções de comidas com tomate cortado no prato3 -----------------------------------------
				if ((obj1.myName == "prato3" and obj2.myName == "tomateCortado") or (obj2.myName == "prato3" and obj1.myName == "tomateCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato3 = statusPrato3 * 7 --numero do ingrediente --
					print ("colidiu")
					if jaComTomate3 == false then
						if statusPrato3 == 7 then -- somente tomate
							prato3:setSequence ("pratoComTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato3 == 35 then -- tomate e batata
							prato3:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato3 == 14 then -- alface e tomate
							prato3:setSequence ("pratoComAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato3 == 70 then -- alface, batata e tomate
							prato3:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato3 == 42 then -- pão, alface e tomate
							prato3:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato3 == 21 then -- pão e tomate
							prato3:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						end
						jaComTomate3 = true
						print ("statusprato ".. statusPrato3)
					end
				end
				-- Colisão que cria e executa as opções de comidas com pão cortado no prato3 --------------------------------------------
				if ((obj1.myName == "prato3" and obj2.myName == "paoCortado") or (obj2.myName == "prato3" and obj1.myName == "paoCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato3 = statusPrato3 * 3 --numero do ingrediente --
					print ("colidiu")
					if jaComPao3 == false then
						if statusPrato3 == 3 then -- somente o pão
							prato3:setSequence ("pratoComPao")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato3 == 6 then -- alface e pão
							prato3:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato3 == 21 then -- pão e tomate
							prato3:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato3 == 42 then -- alface, tomate e pão
							prato3:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						end
						jaComPao3 = true
						print ("statusprato ".. statusPrato3)
					end
				end
				-- Colisão que cria e executa as opções de comidas com alface cortado no prato4 -----------------------------------------
				if ((obj1.myName == "prato4" and obj2.myName == "alfaceCortado") or (obj2.myName == "prato4" and obj1.myName == "alfaceCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato4 = statusPrato4 * 2 --numero do ingrediente --
					print ("colidiu")
					if jaComAlface4 == false then
						if statusPrato4 == 2 then -- somente o alface
							prato4:setSequence ("pratoComAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato4 == 6 then -- alface e pão
							prato4:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato4 == 10 then -- alface e batata
							prato4:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato4 == 14 then --- alface e tomate
							prato4:setSequence ("pratoComAlfaceETomate")-- coloque o nome da squencia com alface e tomate
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato4 == 70 then -- alface, batata e tomate
							prato4:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						elseif statusPrato4 == 42 then -- alface, tomate e pão
							prato4:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							alfaceCortadoNaTabua = false
						end
						jaComAlface4 = true
						print ("statusprato ".. statusPrato4)
					end
				end
				-- Colisão que cria e executa as opções de comidas com batata cortada no prato4 -----------------------------------------
				if ((obj1.myName == "prato4" and obj2.myName == "batataCortada") or (obj2.myName == "prato4" and obj1.myName == "batataCortada")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato4 = statusPrato4 * 5 --numero do ingrediente --
					print ("colidiu")
					if jaComBatata4 == false then
						if statusPrato4 == 5 then -- somente batata
							prato4:setSequence ("pratoComBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato4 == 10 then -- alface e batata
							prato4:setSequence ("pratoComAlfaceEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						elseif statusPrato4 == 35 then -- tomate e batata
							prato4:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato4 == 70 then -- alface, batata e tomate
							prato4:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							batataCortadaNaTabua = false
						end
						jaComBatata4 = true
						print ("statusprato ".. statusPrato4)
					end
				end
				-- Colisão que cria e executa as opções de comidas com tomate cortado no prato4 -----------------------------------------
				if ((obj1.myName == "prato4" and obj2.myName == "tomateCortado") or (obj2.myName == "prato4" and obj1.myName == "tomateCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13, batata frita = 17 ----------------------------------------------------------------------------------------------------------------
					statusPrato4 = statusPrato4 * 7 --numero do ingrediente --
					print ("colidiu")
					if jaComTomate4 == false then
						if statusPrato4 == 7 then -- somente tomate
							prato4:setSequence ("pratoComTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato4 == 35 then -- tomate e batata
							prato4:setSequence ("pratoComTomateEBatata")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato4 == 14 then -- alface e tomate
							prato4:setSequence ("pratoComAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato4 == 70 then -- alface, batata e tomate
							prato4:setSequence ("pratoComAlfaceBatataETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato4 == 42 then -- pão, alface e tomate
							prato4:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						elseif statusPrato4 == 21 then -- pão e tomate
							prato4:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							tomateCortadoNaTabua = false
						end
						jaComTomate4 = true
						print ("statusprato ".. statusPrato4)
					end
				end
				-- Colisão que cria e executa as opções de comidas com pão cortado no prato4 --------------------------------------------
				if ((obj1.myName == "prato4" and obj2.myName == "paoCortado") or (obj2.myName == "prato4" and obj1.myName == "paoCortado")) then
					--nada = 0, prato=1, alface=2, pão = 3, batata = 5, tomate = 7, macarrão = 11, macarrão com molho = 13 ---
					statusPrato4 = statusPrato4 * 3 --numero do ingrediente --
					print ("colidiu")
					if jaComPao4 == false then
						if statusPrato4 == 3 then -- somente o pão
							prato4:setSequence ("pratoComPao")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato4 == 6 then -- alface e pão
							prato4:setSequence ("pratoComSanduicheDeAlface")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato4 == 21 then -- pão e tomate
							prato4:setSequence ("pratoComSanduicheDeTomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						elseif statusPrato4 == 42 then -- alface, tomate e pão
							prato4:setSequence ("pratoComSanduicheDeAlfaceETomate")
							tabua:setSequence ("nada")
							tabuaComIngrediente = false
							paoCortadoNaTabua = false
						end
						jaComPao4 = true
						print ("statusprato ".. statusPrato4)
					end
				end
			teveColisao = true
			timer.performWithDelay (100, voltaColisao)
		end
    end
end

local function entrega1 ()
    if not (statusPrato1 == 0) then
        prato1:setSequence ("nada")
        jaComPao1 = false
        jaComAlface1 = false
        jaComBatata1 = false
        jaComTomate1 = false
        jaTemPrato1 = false
        statusPrato1 = 0
        if pratosNaPia == 3 then
            pia:setSequence ("4prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 2 then
            pia:setSequence ("3prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 1 then
            pia:setSequence ("2prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 0 then
            pia:setSequence ("1prato")
            pratosNaPia = pratosNaPia +1
        end
    end
end



-- Função pra testar a entrega do prato2 ----------------------------------------------------------------------------------------
local function entrega2 ()
    if not (statusPrato2 == 0) then
        prato2:setSequence ("nada")
        jaComPao1 = false
        jaComAlface2 = false
        jaComBatata2 = false
        jaComTomate2 = false
        jaTemPrato2 = false
        statusPrato2 = 0
        if pratosNaPia == 3 then
            pia:setSequence ("4prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 2 then
            pia:setSequence ("3prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 1 then
            pia:setSequence ("2prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 0 then
            pia:setSequence ("1prato")
            pratosNaPia = pratosNaPia +1
        end
    end
end


-- Função pra testar a entrega do prato3 ----------------------------------------------------------------------------------------
local function entrega3 ()
    if not (statusPrato3 == 0) then
        prato3:setSequence ("nada")
        jaComPao3 = false
        jaComAlface3 = false
        jaComBatata3 = false
        jaComTomate3 = false
        jaTemPrato3 = false
        statusPrato3 = 0
        if pratosNaPia == 3 then
            pia:setSequence ("4prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 2 then
            pia:setSequence ("3prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 1 then
            pia:setSequence ("2prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 0 then
            pia:setSequence ("1prato")
            pratosNaPia = pratosNaPia +1
        end
    end
end



-- Função pra testar a entrega do prato4 ----------------------------------------------------------------------------------------
local function entrega4 ()
    if not (statusPrato4 == 0) then
        prato4:setSequence ("nada")
        jaComPao4 = false
        jaComAlface4 = false
        jaComBatata4 = false
        jaComTomate4 = false
        jaTemPrato4 = false
        statusPrato4 = 0
        if pratosNaPia == 3 then
            pia:setSequence ("4prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 2 then
            pia:setSequence ("3prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 1 then
            pia:setSequence ("2prato")
            pratosNaPia = pratosNaPia +1
        elseif pratosNaPia == 0 then
            pia:setSequence ("1prato")
            pratosNaPia = pratosNaPia +1
        end
    end
end



-- Função para lavar os pratos --------------------------------------------------------------------------------------------------
local function lavarPrato ()
    if pratosNaPia == 3 then
        pia:setSequence ("2prato")
        if pratoNoMonte == 3 then
            pratos:setSequence ("4pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 2 then
            pratos:setSequence ("3pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 1 then
            pratos:setSequence ("2pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 0 then
            pratos:setSequence ("1prato")
            pratoNoMonte = pratoNoMonte +1
        end
        pratosNaPia = pratosNaPia -1
    elseif pratosNaPia == 2 then
        pia:setSequence ("1prato")
        if pratoNoMonte == 3 then
            pratos:setSequence ("4pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 2 then
            pratos:setSequence ("3pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 1 then
            pratos:setSequence ("2pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 0 then
            pratos:setSequence ("1prato")
            pratoNoMonte = pratoNoMonte +1
        end
        pratosNaPia = pratosNaPia -1
    elseif pratosNaPia == 1 then
        print ("pratosnomonte".. pratoNoMonte)
        pia:setSequence ("nada")
        if pratoNoMonte == 3 then
            pratos:setSequence ("4pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 2 then
            pratos:setSequence ("3pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 1 then
            pratos:setSequence ("2pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 0 then
            pratos:setSequence ("1prato")
            pratoNoMonte = pratoNoMonte +1
        end
        pratosNaPia = pratosNaPia -1
    elseif pratosNaPia == 4 then
        pia:setSequence ("3prato")
        if pratoNoMonte == 3 then
            pratos:setSequence ("4pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 2 then
            pratos:setSequence ("3pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 1 then
            pratos:setSequence ("2pratos")
            pratoNoMonte = pratoNoMonte +1
        elseif pratoNoMonte == 0 then
            pratos:setSequence ("1prato")
            pratoNoMonte = pratoNoMonte +1
        end
        pratosNaPia = pratosNaPia -1
    end
end



local function registroDePedidos ()
    if valorPedido == statusPrato1 then
        pedidos:setSequence ("nada")
        valorPedido = -1
        pontos = pontos +100
        pontosText.text = "Pontos: " .. pontos
        entrega1 ()

    elseif valorPedido == 35 then
        pedidos:setSequence ("tomateEBatata")
    elseif valorPedido == 14 then
        pedidos:setSequence ("alfaceETomate")
    elseif valorPedido == 70 then
        pedidos:setSequence ("alfaceTomateEBatata")
    elseif valorPedido == 10 then
        pedidos:setSequence ("alfaceEBatata")
    elseif valorPedido == 42 then
        pedidos:setSequence ("paoDeAlfaceETomate")
    elseif valorPedido == 21 then
        pedidos:setSequence ("paoETomate")
    elseif valorPedido == 6 then
        pedidos:setSequence ("paoEAlface")
    end
    if valorPedido2 == statusPrato2 then
		pedidos2:setSequence ("nada")
        valorPedido2 = -1
        pontos = pontos +100
        pontosText.text = "Pontos: " .. pontos
        entrega2 ()
		contouPontoPrato2=true
    elseif valorPedido2 == 35 then
        pedidos2:setSequence ("tomateEBatata")
    elseif valorPedido2 == 14 then
        pedidos2:setSequence ("alfaceETomate")
    elseif valorPedido2 == 70 then
        pedidos2:setSequence ("alfaceTomateEBatata")
    elseif valorPedido2 == 10 then
        pedidos2:setSequence ("alfaceEBatata")
    elseif valorPedido2 == 42 then
        pedidos2:setSequence ("paoDeAlfaceETomate")
    elseif valorPedido2 == 21 then
        pedidos2:setSequence ("paoETomate")
    elseif valorPedido2 == 6 then
        pedidos2:setSequence ("paoEAlface")
    end
    if valorPedido3 == statusPrato3 then
        pedidos3:setSequence ("nada")
        valorPedido3 = -1
        pontos = pontos +100
        pontosText.text = "Pontos: " .. pontos
        entrega3 ()
		contouPontoPrato3=true
    elseif valorPedido3 == 35 then
        pedidos3:setSequence ("tomateEBatata")
    elseif valorPedido3 == 14 then
        pedidos3:setSequence ("alfaceETomate")
    elseif valorPedido3 == 70 then
        pedidos3:setSequence ("alfaceTomateEBatata")
    elseif valorPedido3 == 10 then
        pedidos3:setSequence ("alfaceEBatata")
    elseif valorPedido3 == 42 then
        pedidos3:setSequence ("paoDeAlfaceETomate")
    elseif valorPedido3 == 21 then
        pedidos3:setSequence ("paoETomate")
    elseif valorPedido3 == 6 then
        pedidos3:setSequence ("paoEAlface")
    end
    if valorPedido4 == statusPrato4 then
        pedidos4:setSequence ("nada")
        valorPedido4 = -1
        pontos = pontos +100
        pontosText.text = "Pontos: " .. pontos
        entrega4 ()
		contouPontoPrato4=true
    elseif valorPedido4 == 35 then
        pedidos4:setSequence ("tomateEBatata")
    elseif valorPedido4 == 14 then
        pedidos4:setSequence ("alfaceETomate")
    elseif valorPedido4 == 70 then
        pedidos4:setSequence ("alfaceTomateEBatata")
    elseif valorPedido4 == 10 then
        pedidos4:setSequence ("alfaceEBatata")
    elseif valorPedido4 == 42 then
        pedidos4:setSequence ("paoDeAlfaceETomate")
    elseif valorPedido4 == 21 then
        pedidos4:setSequence ("paoETomate")
    elseif valorPedido4 == 6 then
        pedidos4:setSequence ("paoEAlface")
    end
end

-- Cria um ouvinte para a função de lavarPratos ---------------------------------------------------------------------------------

local function atualizarTempo( event )

    -- Decrement the number of segundos
    segundosRestantes = segundosRestantes - 1

    -- Time is tracked in segundos; convert it to minutos and segundos
    local minutos = math.floor( segundosRestantes / 60 )
    local segundos = segundosRestantes % 60

    -- Make it a formatted string
    local timeDisplay = string.format( "%02d:%02d", minutos, segundos )

    -- Update the text object
    relogioText.text = timeDisplay
end

local function adicionarPedidos ()
    if valorPedido == -1 then
        chamadoDoPedido = math.random (1,7)
        if chamadoDoPedido == 1 then
            valorPedido = 35
        elseif chamadoDoPedido == 2 then
            valorPedido = 14
        elseif chamadoDoPedido == 3 then
            valorPedido = 70
        elseif chamadoDoPedido == 4 then
            valorPedido = 10
        elseif chamadoDoPedido == 5 then
            valorPedido = 42
        elseif chamadoDoPedido == 6 then
            valorPedido = 21
        elseif chamadoDoPedido == 7 then
            valorPedido = 6
        end
    elseif valorPedido2 == -1 then
        chamadoDoPedido = math.random (1,7)
        if chamadoDoPedido == 1 then
            valorPedido2 = 35
        elseif chamadoDoPedido == 2 then
            valorPedido2 = 14
        elseif chamadoDoPedido == 3 then
            valorPedido2 = 70
        elseif chamadoDoPedido == 4 then
            valorPedido2 = 10
        elseif chamadoDoPedido == 5 then
            valorPedido2 = 42
        elseif chamadoDoPedido == 6 then
            valorPedido2 = 21
        elseif chamadoDoPedido == 7 then
            valorPedido2 = 6
        end
    elseif valorPedido3 == -1 then
        chamadoDoPedido = math.random (1,7)
        if chamadoDoPedido == 1 then
            valorPedido3 = 35
        elseif chamadoDoPedido == 2 then
            valorPedido3 = 14
        elseif chamadoDoPedido == 3 then
            valorPedido3 = 70
        elseif chamadoDoPedido == 4 then
            valorPedido3 = 10
        elseif chamadoDoPedido == 5 then
            valorPedido3 = 42
        elseif chamadoDoPedido == 6 then
            valorPedido3 = 21
        elseif chamadoDoPedido == 7 then
            valorPedido3 = 6
        end
    elseif valorPedido4 == -1 then
        chamadoDoPedido = math.random (1,7)
        if chamadoDoPedido == 1 then
            valorPedido4 = 35
        elseif chamadoDoPedido == 2 then
            valorPedido4 = 14
        elseif chamadoDoPedido == 3 then
            valorPedido4 = 70
        elseif chamadoDoPedido == 4 then
            valorPedido4 = 10
        elseif chamadoDoPedido == 5 then
            valorPedido4 = 42
        elseif chamadoDoPedido == 6 then
            valorPedido4 = 21
        elseif chamadoDoPedido == 7 then
            valorPedido4 = 6
        end
    end
end

local function level ()
    if nivel == 1 then
        tempoNivel = 600
    elseif nivel == 2 then
        tempoNivel = 300
    elseif nivel == 3 then
        tempoNivel = 200
    elseif nivel == 4 then
        tempoNivel = 180
    elseif nivel == 5 then
        tempoNivel = 160
    elseif nivel == 6 then
        tempoNivel = 140
    elseif nivel == 7 then
        tempoNivel = 120
    elseif nivel == 8 then
        tempoNivel = 100
    elseif nivel == 9 then
        tempoNivel = 75
    elseif nivel == 10 then
        tempoNivel = 50
    end
end

local function tempo ()
    time = time +1
    if time == tempoNivel then
        adicionarPedidos ()
        time = 0
    end
end

local function endLevel ()
    if segundosRestantes == 0 then
        composer.gotoScene ("level")
    end
end

local function chamaMain ()
	pratos = display.newSprite (grupoMain, spritePratos, spritePratosAnimacao)
	pratos.x = display.contentCenterX +142
	pratos.y = display.contentCenterY +116
	physics.addBody (pratos, "static")
	pratos.myName = "pratos"
	pratos:setSequence ("4pratos")
	pratos:play ()

	prato1 = display.newSprite (grupoMain, spritePrato1, spritePrato1Animacao)
	prato1.x = display.contentCenterX -170
	prato1.y = display.contentCenterY +19
	physics.addBody (prato1, "static")
	prato1.myName = "prato1"
	prato1:setSequence ("nada")
	prato1:play ()
	
	prato2 = display.newSprite (grupoMain, spritePrato1, spritePrato1Animacao)
	prato2.x = display.contentCenterX -75
	prato2.y = display.contentCenterY +19
	physics.addBody (prato2, "static")
	prato2.myName = "prato2"
	prato2:setSequence ("nada")
	prato2:play ()

	prato3 = display.newSprite (grupoMain, spritePrato1, spritePrato1Animacao)
	prato3.x = display.contentCenterX +25
	prato3.y = display.contentCenterY +19
	physics.addBody (prato3, "static")
	prato3.myName = "prato3"
	prato3:setSequence ("nada")
	prato3:play ()
	
	-- Insere os prato4 -------------------------------------------------------------------------------------------------------------
	prato4 = display.newSprite (grupoMain, spritePrato1, spritePrato1Animacao)
	prato4.x = display.contentCenterX +120
	prato4.y = display.contentCenterY +19
	physics.addBody (prato4, "static")
	prato4.myName = "prato4"
	prato4:setSequence ("nada")
	prato4:play ()
	
	-- Insere o pratoMovel ----------------------------------------------------------------------------------------------------------
	pratoMovel = display.newSprite (grupoMain, spritePrato1, spritePrato1Animacao)
	pratoMovel.x = -800
	pratoMovel.y = -800
	physics.addBody (pratoMovel, "dynamic", {isSensor=true})
	pratoMovel.myName = "pratoMovel"
	pratoMovel:setSequence ("pratoVazio")
	pratoMovel:play ()

	alface = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/alface.png", 40, 36)
	alface.x, alface.y = -120 + display.contentCenterX, display.contentCenterY + 78
	physics.addBody (alface, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	alface.myName = "alface"

	alfaceCortado = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/sliceAlface.png", 48, 26)
	alfaceCortado.x = -300
	alfaceCortado.y = -300
	physics.addBody (alfaceCortado, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	alfaceCortado.myName = "alfaceCortado"	

	batata = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/batata.png", 48, 44)
	batata.x, batata.y = -180 + display.contentCenterX, display.contentCenterY + 78
	physics.addBody (batata, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	batata.myName = "batata"

	batataCortada = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/slicePotato.png", 48, 26)
	batataCortada.x = -400
	batataCortada.y = -400
	physics.addBody (batataCortada, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	batataCortada.myName = "batataCortada"

	tomate = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/tomate.png", 48, 44)
	tomate.x, tomate.y = -120 + display.contentCenterX, display.contentCenterY + 118
	physics.addBody (tomate, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	tomate.myName = "tomate"

	tomateCortado = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/sliceTomato.png", 38, 32)
	tomateCortado.x = -500
	tomateCortado.y = -500
	physics.addBody (tomateCortado, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	tomateCortado.myName = "tomateCortado"

	trigo = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/trigo.png", 48, 44)
	trigo.x, trigo.y = -180 + display.contentCenterX, display.contentCenterY + 116
	physics.addBody (trigo, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	trigo.myName = "trigo"

	pao = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/bread.png", 42, 22)
	pao.x = -200
	pao.y = -200
	physics.addBody (pao, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	pao.myName = "pao"

	paoCortado = display.newImageRect (grupoMain, "imagens/cozinha/ingredientes/sliceBread.png", 56, 22)
	paoCortado.x = -600
	paoCortado.y = -600
	physics.addBody (paoCortado, "dynamic", {isSensor=true, density= 1, friction= 0, bounce= 0})
	paoCortado.myName = "paoCortado"

	luva = display.newImageRect (grupoMain, "imagens/cozinha/Cozinha barra/luva.png", 48, 44)
	luva.x = display.contentWidth + letterboxWidth -32
	luva.y = display.contentCenterY -85
	physics.addBody (luva, "dynamic", {isSensor=true})
	luva.myName = "luva"

	colher = display.newImageRect (grupoMain, "imagens/cozinha/Cozinha barra/colher.png", 48, 44)
	colher.x = display.contentWidth + letterboxWidth -32
	colher.y = display.contentCenterY -30
	physics.addBody (colher, "dynamic", {isSensor=true})
	colher.myName = "colher"

	faca = display.newImageRect (grupoMain, "imagens/cozinha/Cozinha barra/faca.png", 48, 44)
	faca.x = display.contentWidth + letterboxWidth -32
	faca.y = display.contentCenterY +27
	physics.addBody (faca, "dynamic", {isSensor=true})
	faca.myName = "faca"

	mao = display.newImageRect (grupoMain, "imagens/cozinha/Cozinha barra/slecionar.png", 48, 44)
	mao.x = display.contentWidth + letterboxWidth -32
	mao.y = display.contentCenterY +82
	physics.addBody (mao, "dynamic", {isSensor=true})
	mao.myName = "mao"

	pedidos = display.newSprite (grupoUI, spritePedidos, spritePedidosAnimacao)
	pedidos.x = display.screenOriginX +38
	pedidos.y = display.screenOriginY +30
	pedidos.myName = "pedidos"
	pedidos:setSequence ("nada")
	pedidos:play ()
	
	-- Insere os pedidos2 -----------------------------------------------------------------------------------------------------------
	pedidos2 = display.newSprite (grupoUI, spritePedidos, spritePedidosAnimacao)
	pedidos2.x = display.screenOriginX +98
	pedidos2.y = display.screenOriginY +30
	pedidos2.myName = "pedidos2"
	pedidos2:setSequence ("nada")
	pedidos2:play ()
	
	-- Insere os pedidos3 -----------------------------------------------------------------------------------------------------------
	pedidos3 = display.newSprite (grupoUI, spritePedidos, spritePedidosAnimacao)
	pedidos3.x = display.screenOriginX +158
	pedidos3.y = display.screenOriginY +30
	pedidos3.myName = "pedidos3"
	pedidos3:setSequence ("nada")
	pedidos3:play ()
	
	-- Insere os pedidos4 -----------------------------------------------------------------------------------------------------------
	pedidos4 = display.newSprite (grupoUI, spritePedidos, spritePedidosAnimacao)
	pedidos4.x = display.screenOriginX +218
	pedidos4.y = display.screenOriginY +30
	pedidos4.myName = "pedidos4"
	pedidos4:setSequence ("nada")
	pedidos4:play ()

	pontosText = display.newText (grupoUI, "Pontos:" .. pontos, -130 + display.contentWidth + letterboxWidth, display.contentCenterY-140, native.systemFont, 20 )

	pontosText:setFillColor (0, 0, 0)	

	relogioText = display.newText(grupoUI ,"3:00", -50 + display.contentWidth + letterboxWidth, display.contentCenterY-140, native.systemFont, 20 )
	relogioText:setFillColor( 0, 0, 0 )

	contador = timer.performWithDelay( 1000, atualizarTempo, segundosRestantes )
end
-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	physics.pause ()

	grupoBg = display.newGroup()
	sceneGroup:insert (grupoBg)
	grupoMain = display.newGroup()
	sceneGroup:insert (grupoMain)
	grupoPortaDaGeladeira = display.newGroup()
	sceneGroup:insert (grupoPortaDaGeladeira)
	grupoUI = display.newGroup()
	sceneGroup:insert (grupoUI)

	local bg = display.newImageRect (grupoBg, "imagens/cozinha/cozinhafundo.png", 720, 480)
	bg.x, bg.y = display.contentCenterX, display.contentCenterY

	bancada = display.newImageRect (grupoMain, "imagens/cozinha/bancada.png", 402, 50)
	bancada.x, bancada.y = display.contentCenterX -25, display.contentCenterY +23

	ferramentas = display.newImageRect (grupoMain, "imagens/cozinha/Cozinha barra/ferramentas.png", 64, 272)
	ferramentas.x = -32 + display.contentWidth + letterboxWidth
	ferramentas.y = display.contentCenterY	

	barraDePedidos = display.newImageRect (grupoUI, "imagens/cozinha/barra_pedidos.png", 271, 64)
	barraDePedidos.x = display.screenOriginX +135
	barraDePedidos.y = display.screenOriginY +32

	PortaDaGeladeira = display.newImageRect (grupoPortaDaGeladeira, "imagens/cozinha/geladeira.png", 144, 98)
	PortaDaGeladeira.x, PortaDaGeladeira.y = -153 + display.contentCenterX, display.contentCenterY +97
	physics.addBody (PortaDaGeladeira, "static")

	forno = display.newSprite (grupoMain ,spriteForno, spriteFornoAnimacao)
	forno.x = display.contentCenterX -34
	forno.y = display.contentCenterY +121
	physics.addBody (forno, "static")
	forno.myName = "forno"
	forno:setSequence ("desligado")
	forno:play ()

	fogaoE = display.newSprite (grupoMain, spriteFogaoE, spriteFogaoEAnimacao)
	fogaoE.x = display.contentCenterX -59
	fogaoE.y = display.contentCenterY +73
	physics.addBody (fogaoE, "static")
	fogaoE.myName = "fogaoE"
	fogaoE:setSequence ("desligado")
	fogaoE:play ()	

	fogaoD = display.newSprite (grupoMain, spriteFogaoD, spriteFogaoDAnimacao)
	fogaoD.x = display.contentCenterX -9
	fogaoD.y = display.contentCenterY +73
	physics.addBody (fogaoD, "static")
	fogaoD.myName = "fogaoD"
	fogaoD:setSequence ("desligado")
	fogaoD:play ()

	tabua = display.newSprite (grupoMain ,spriteTabua, spriteTabuaAnimacao)
	tabua.x = display.contentCenterX + 62
	tabua.y = display.contentCenterY + 120
	physics.addBody (tabua, "static")
	tabua.myName = "tabua"
	tabua:setSequence ("nada")
	tabua:play ()	

	pia = display.newSprite (grupoMain, spritePia, spritePiaAnimacao)
	pia.x = display.contentCenterX +62
	pia.y = display.contentCenterY +73
	physics.addBody (pia, "static")
	pia.myName = "pia"
	pia:setSequence ("nada")
	pia:play ()

	chamaMain ()

	level ()
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela
		physics.start ()
		PortaDaGeladeira:addEventListener ("tap", removerPortaDaGeladeira)
		pratoMovel:addEventListener ("touch", moverPratoMovel)
		pratos:addEventListener ("tap", pratoAoMonte)
		alface:addEventListener ("touch", moverAlface)
		alfaceCortado:addEventListener ("touch", moverAlfaceCortado)
		batata:addEventListener ("touch", moverBatata)
		batataCortada:addEventListener ("touch", moverBatataCortada)
		tomate:addEventListener ("touch", moverTomate)
		tomateCortado:addEventListener ("touch", moverTomateCortado)
		trigo:addEventListener ("touch", moverTrigo)
		pao:addEventListener ("touch", moverPao)
		paoCortado:addEventListener ("touch", moverPaoCortado)
		luva:addEventListener ("touch", moverLuva)
		colher:addEventListener ("touch", moverColher)
		faca:addEventListener ("touch", moverFaca)
		mao:addEventListener ("touch", moverMao)
		Runtime:addEventListener ("collision", onColision)
		prato1:addEventListener ("tap", entrega1)
		prato2:addEventListener ("tap", entrega2)
		prato3:addEventListener ("tap", entrega3)
		prato4:addEventListener ("tap", entrega4)
		pia:addEventListener ("tap", lavarPrato)
		Runtime:addEventListener ("enterFrame", registroDePedidos)
		Runtime:addEventListener ("enterFrame", tempo)
		Runtime:addEventListener ("enterFrame", endLevel)


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
		-- PortaDaGeladeira:removeEventListener ("tap", removerPortaDaGeladeira)
		pratoMovel:removeEventListener ("touch", moverPratoMovel)
		pratos:removeEventListener ("tap", pratoAoMonte)
		alface:removeEventListener ("touch", moverAlface)
		alfaceCortado:removeEventListener ("touch", moverAlfaceCortado)
		batata:removeEventListener ("touch", moverBatata)
		batataCortada:removeEventListener ("touch", moverBatataCortada)
		tomate:removeEventListener ("touch", moverTomate)
		tomateCortado:removeEventListener ("touch", moverTomateCortado)
		trigo:removeEventListener ("touch", moverTrigo)
		pao:removeEventListener ("touch", moverPao)
		paoCortado:removeEventListener ("touch", moverPaoCortado)
		luva:removeEventListener ("touch", moverLuva)
		colher:removeEventListener ("touch", moverColher)
		faca:removeEventListener ("touch", moverFaca)
		mao:removeEventListener ("touch", moverMao)
		Runtime:removeEventListener ("collision", onColision)
		prato1:removeEventListener ("tap", entrega1)
		prato2:removeEventListener ("tap", entrega2)
		prato3:removeEventListener ("tap", entrega3)
		prato4:removeEventListener ("tap", entrega4)
		pia:removeEventListener ("tap", lavarPrato)
		Runtime:removeEventListener ("enterFrame", registroDePedidos)
		Runtime:removeEventListener ("enterFrame", tempo)
		Runtime:removeEventListener ("enterFrame", endLevel)
		physics.pause ()
		composer.removeScene ("cozinha")
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
