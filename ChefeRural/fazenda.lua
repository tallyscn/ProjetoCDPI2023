
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("normal")

local backGroup
local mainGroup
local UIGroup

display.setStatusBar (display.HiddenStatusBar)

local letterboxWidth = (display.actualContentWidth-display.contentWidth)/2

local posicaoxDireita = display.contentWidth + letterboxWidth

local letterboxHeight = (display.actualContentHeight-display.contentHeight)/2

local posicaoyDireita = display.contentHeight + letterboxHeight

local parametros = {halfWidth=15, halfHeight =10, x = 0, y = 22}

local quantidade
local sementeAlface
local sementeBatata
local sementeTrigo
local sementeTomate
local menuSementes
local menuAberto = false
local ferramentas
local botaoSemente
local adubo
local agua
local selecao
local terra1
local terra2
local terra3
local terra4
local terra5
local terra6
local terra7
local terra8
local terra9
local terra10
local terra11
local terra12
local terra13
local terra14
local terra15

local tipoSemente1 = "nada"
local tipoSemente2 = "nada"
local tipoSemente3 = "nada"
local tipoSemente4 = "nada"
local tipoSemente5 = "nada"
local tipoSemente6 = "nada"
local tipoSemente7 = "nada"
local tipoSemente8 = "nada"
local tipoSemente9 = "nada"
local tipoSemente10 = "nada"
local tipoSemente12 = "nada"
local tipoSemente13 = "nada"
local tipoSemente14 = "nada"
local tipoSemente15 = "nada"

local statusTerra1 = "nada"
local statusTerra2 = "nada"
local statusTerra3 = "nada"
local statusTerra4 = "nada"
local statusTerra5 = "nada"
local statusTerra6 = "nada"
local statusTerra7 = "nada"
local statusTerra8 = "nada"
local statusTerra9 = "nada"
local statusTerra10 = "nada"
local statusTerra11 = "nada"
local statusTerra12 = "nada"
local statusTerra13 = "nada"
local statusTerra14 = "nada"
local statusTerra15 = "nada"

local tempo = 3000
local alfacePlacar
local batataPlacar
local trigoPlacar
local tomatePlacar
local valorAlface = 0
local valorBatata = 0
local valorTrigo = 0
local valorTomate = 0

local textoPlacarAlface
local textoPlacarBatata
local textoPlacarTrigo
local textoPlacarTomate

local nivel = 1

local plantas = graphics.newImageSheet ("imagens/fazenda/fazendaSprites/seedsgrow.png", {width = 48, height = 72, numFrames = 8})

-- animação
local spritePlantas = {
    {name="terra", start=1, count=1, time=1000, loopCount=0},
    {name="crescer1", start=2, count=1, time=1000, loopCount=0},
    {name="crescer2", start=3, count=1, time=1000, loopCount=0},
    {name="muda", start=4, count=1, time=1000, loopCount=0},
    {name="batata", start=5, count=1, time=1000, loopCount=0},
    {name="tomate", start=6, count=1, time=1000, loopCount=0},
    {name="alface", start=7, count=1, time=1000, loopCount=0},
    {name="trigo", start=8, count=1, time=1000, loopCount=0}
}

local function sementeAlfaceCorpo ()
    sementeAlface.bodyType = "dynamic"
end

local function moverSementeAlface (event)
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
            sementeAlface.bodyType = "static"
            sementeAlface.x, sementeAlface.y = display.contentWidth + letterboxWidth - 265, display.contentCenterY  - 87
            timer.performWithDelay( 200, sementeAlfaceCorpo) 
        end
    end
    return true
end

local function sementeBatataCorpo ()
    sementeBatata.bodyType = "dynamic"
end

local function moverSementeBatata (event)
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
            sementeBatata.bodyType = "static"
            sementeBatata.x, sementeBatata.y = display.contentWidth + letterboxWidth - 210, display.contentCenterY  - 87
            timer.performWithDelay( 200, sementeBatataCorpo) 
        end
    end
    return true
end

local function sementeTrigoCorpo ()
    sementeTrigo.bodyType = "dynamic"
end

local function moverSementeTrigo (event)
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
            sementeTrigo.bodyType = "static"
            sementeTrigo.x, sementeTrigo.y = display.contentWidth + letterboxWidth - 153, display.contentCenterY  - 87
            timer.performWithDelay( 200, sementeTrigoCorpo) 
        end
    end
    return true
end

local function sementeTomateCorpo ()
    sementeTomate.bodyType = "dynamic"
end

local function moverSementeTomate (event)
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
            sementeTomate.bodyType = "static"
            sementeTomate.x, sementeTomate.y = display.contentWidth + letterboxWidth - 97, display.contentCenterY  - 85
            timer.performWithDelay( 200, sementeTomateCorpo) 
        end
    end
    return true
end

function criarMenu ()
    menuSementes = display.newImageRect (mainGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/barra_Sementes.png", 292, 64)
    menuSementes.x, menuSementes.y = menuSementes.width + 380, display.contentCenterY  - 85
end

function abrirMenu ()
    transition.to(menuSementes, {time = 500, x = display.contentWidth + letterboxWidth - 150, y = display.contentCenterY  - 85, onComplete = function ()
    sementeAlface.alpha = 1
    sementeBatata.alpha = 1
    sementeTomate.alpha = 1
    sementeTrigo.alpha = 1
    end
    })
    menuAberto = true
end

function fecharMenu ()
    sementeAlface.alpha = 0.01
    sementeBatata.alpha = 0.01
    sementeTomate.alpha = 0.01
    sementeTrigo.alpha = 0.01
    transition.to(menuSementes, {time = 500,x= menuSementes.width + 378})
    menuAberto = false
end

function clickBotao (event)
    if menuAberto == true then
        fecharMenu ()
        else
        abrirMenu ()
    end  
end

local function aduboCorpo ()
    adubo.bodyType = "dynamic"
end

local function moverAdubo (event)
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
            adubo.bodyType = "static"
            adubo.x, adubo.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY - 30
            timer.performWithDelay( 200, aduboCorpo) 
        end
    end
    return true
end

local function aguaCorpo ()
    agua.bodyType = "dynamic"
end

local function moverAgua (event)
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
            agua.bodyType = "static"
            agua.x, agua.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 26
            timer.performWithDelay( 200, aguaCorpo) 
        end
    end
    return true
end

local function selecaoCorpo ()
    selecao.bodyType = "dynamic"
end

local function moverSelecao (event)
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
            selecao.bodyType = "static"
            selecao.x, selecao.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 81
            timer.performWithDelay( 200, selecaoCorpo) 
        end
    end
    return true
end

local function colheita1 ()
    if tipoSemente1 == "alface" then
        terra1:setSequence ("alface")
        statusTerra1 = "pronto"

    elseif tipoSemente1 == "tomate" then
        terra1:setSequence ("tomate")
        statusTerra1 = "pronto"

    elseif tipoSemente1 == "batata" then
        terra1:setSequence ("batata")
        statusTerra1 = "pronto"

    elseif tipoSemente1 == "trigo" then
        terra1:setSequence ("trigo")
        statusTerra1 = "pronto"
    end
end

local function colheita2 ()
    if tipoSemente2 == "alface" then
        terra2:setSequence ("alface")
        statusTerra2 = "pronto"

    elseif tipoSemente2 == "tomate" then
        terra2:setSequence ("tomate")
        statusTerra2 = "pronto"

    elseif tipoSemente2 == "batata" then
        terra2:setSequence ("batata")
        statusTerra2 = "pronto"

    elseif tipoSemente2 == "trigo" then
        terra2:setSequence ("trigo")
        statusTerra2 = "pronto"
    end
end

local function colheita3 ()
    if tipoSemente3 == "alface" then
        terra3:setSequence ("alface")
        statusTerra3 = "pronto"

    elseif tipoSemente3 == "tomate" then
        terra3:setSequence ("tomate")
        statusTerra3 = "pronto"

    elseif tipoSemente3 == "batata" then
        terra3:setSequence ("batata")
        statusTerra3 = "pronto"

    elseif tipoSemente3 == "trigo" then
        terra3:setSequence ("trigo")
        statusTerra3 = "pronto"
    end
end

local function colheita4 ()
    if tipoSemente4 == "alface" then
        terra4:setSequence ("alface")
        statusTerra4 = "pronto"

    elseif tipoSemente4 == "tomate" then
        terra4:setSequence ("tomate")
        statusTerra4 = "pronto"

    elseif tipoSemente4 == "batata" then
        terra4:setSequence ("batata")
        statusTerra4 = "pronto"

    elseif tipoSemente4 == "trigo" then
        terra4:setSequence ("trigo")
        statusTerra4 = "pronto"
    end
end

local function colheita5 ()
    if tipoSemente5 == "alface" then
        terra5:setSequence ("alface")
        statusTerra5 = "pronto"

    elseif tipoSemente5 == "tomate" then
        terra5:setSequence ("tomate")
        statusTerra5 = "pronto"

    elseif tipoSemente5 == "batata" then
        terra5:setSequence ("batata")
        statusTerra5 = "pronto"

    elseif tipoSemente5 == "trigo" then
        terra5:setSequence ("trigo")
        statusTerra5 = "pronto"
    end
end

local function colheita6 ()
    if tipoSemente6 == "alface" then
        terra6:setSequence ("alface")
        statusTerra6 = "pronto"

    elseif tipoSemente6 == "tomate" then
        terra6:setSequence ("tomate")
        statusTerra6 = "pronto"

    elseif tipoSemente6 == "batata" then
        terra6:setSequence ("batata")
        statusTerra6 = "pronto"

    elseif tipoSemente6 == "trigo" then
        terra6:setSequence ("trigo")
        statusTerra6 = "pronto"
    end
end

local function colheita7 ()
    if tipoSemente7 == "alface" then
        terra7:setSequence ("alface")
        statusTerra7 = "pronto"

    elseif tipoSemente7 == "tomate" then
        terra7:setSequence ("tomate")
        statusTerra7 = "pronto"

    elseif tipoSemente7 == "batata" then
        terra7:setSequence ("batata")
        statusTerra7 = "pronto"

    elseif tipoSemente7 == "trigo" then
        terra7:setSequence ("trigo")
        statusTerra7 = "pronto"
    end
end

local function colheita8 ()
    if tipoSemente8 == "alface" then
        terra8:setSequence ("alface")
        statusTerra8 = "pronto"

    elseif tipoSemente8 == "tomate" then
        terra8:setSequence ("tomate")
        statusTerra8 = "pronto"

    elseif tipoSemente8 == "batata" then
        terra8:setSequence ("batata")
        statusTerra8 = "pronto"

    elseif tipoSemente8 == "trigo" then
        terra8:setSequence ("trigo")
        statusTerra8 = "pronto"
    end
end

local function colheita9 ()
    if tipoSemente9 == "alface" then
        terra9:setSequence ("alface")
        statusTerra9 = "pronto"

    elseif tipoSemente9 == "tomate" then
        terra9:setSequence ("tomate")
        statusTerra9 = "pronto"

    elseif tipoSemente9 == "batata" then
        terra9:setSequence ("batata")
        statusTerra9 = "pronto"

    elseif tipoSemente9 == "trigo" then
        terra9:setSequence ("trigo")
        statusTerra9 = "pronto"
    end
end

local function colheita10 ()
    if tipoSemente10 == "alface" then
        terra10:setSequence ("alface")
        statusTerra10 = "pronto"

    elseif tipoSemente10 == "tomate" then
        terra10:setSequence ("tomate")
        statusTerra10 = "pronto"

    elseif tipoSemente10 == "batata" then
        terra10:setSequence ("batata")
        statusTerra10 = "pronto"

    elseif tipoSemente10 == "trigo" then
        terra10:setSequence ("trigo")
        statusTerra10 = "pronto"
    end
end

local function colheita11 ()
    if tipoSemente11 == "alface" then
        terra11:setSequence ("alface")
        statusTerra11 = "pronto"

    elseif tipoSemente11 == "tomate" then
        terra11:setSequence ("tomate")
        statusTerra11 = "pronto"

    elseif tipoSemente11 == "batata" then
        terra11:setSequence ("batata")
        statusTerra11 = "pronto"

    elseif tipoSemente11 == "trigo" then
        terra11:setSequence ("trigo")
        statusTerra11 = "pronto"
    end
end

local function colheita12 ()
    if tipoSemente12 == "alface" then
        terra12:setSequence ("alface")
        statusTerra12 = "pronto"

    elseif tipoSemente12 == "tomate" then
        terra12:setSequence ("tomate")
        statusTerra12 = "pronto"

    elseif tipoSemente12 == "batata" then
        terra12:setSequence ("batata")
        statusTerra12 = "pronto"

    elseif tipoSemente12 == "trigo" then
        terra12:setSequence ("trigo")
        statusTerra12 = "pronto"
    end
end

local function colheita13 ()
    if tipoSemente13 == "alface" then
        terra13:setSequence ("alface")
        statusTerra13 = "pronto"

    elseif tipoSemente13 == "tomate" then
        terra13:setSequence ("tomate")
        statusTerra13 = "pronto"

    elseif tipoSemente13 == "batata" then
        terra13:setSequence ("batata")
        statusTerra13 = "pronto"

    elseif tipoSemente13 == "trigo" then
        terra13:setSequence ("trigo")
        statusTerra13 = "pronto"
    end
end

local function colheita14 ()
    if tipoSemente14 == "alface" then
        terra14:setSequence ("alface")
        statusTerra14 = "pronto"

    elseif tipoSemente14 == "tomate" then
        terra14:setSequence ("tomate")
        statusTerra14 = "pronto"

    elseif tipoSemente14 == "batata" then
        terra14:setSequence ("batata")
        statusTerra14 = "pronto"

    elseif tipoSemente14 == "trigo" then
        terra14:setSequence ("trigo")
        statusTerra14 = "pronto"
    end
end

local function colheita15 ()
    if tipoSemente15 == "alface" then
        terra15:setSequence ("alface")
        statusTerra15 = "pronto"

    elseif tipoSemente15 == "tomate" then
        terra15:setSequence ("tomate")
        statusTerra15 = "pronto"

    elseif tipoSemente15 == "batata" then
        terra15:setSequence ("batata")
        statusTerra15 = "pronto"

    elseif tipoSemente15 == "trigo" then
        terra15:setSequence ("trigo")
        statusTerra15 = "pronto"
    end
end


-- FUNÇÕES GERMINAR MUDA

local function muda1 ()
    terra1:setSequence ("muda")
    statusTerra1 = "muda"
end

local function muda2 ()
    terra2:setSequence ("muda")
    statusTerra2 = "muda"
end

local function muda3 ()
    terra3:setSequence ("muda")
    statusTerra3 = "muda"
end

local function muda4 ()
    terra4:setSequence ("muda")
    statusTerra4 = "muda"
end

local function muda5 ()
    terra5:setSequence ("muda")
    statusTerra5 = "muda"
end

local function muda6 ()
    terra6:setSequence ("muda")
    statusTerra6 = "muda"
end

local function muda7 ()
    terra7:setSequence ("muda")
    statusTerra7 = "muda"
end

local function muda8 ()
    terra8:setSequence ("muda")
    statusTerra8 = "muda"
end

local function muda9 ()
    terra9:setSequence ("muda")
    statusTerra9 = "muda"
end

local function muda10 ()
    terra10:setSequence ("muda")
    statusTerra10 = "muda"
end

local function muda11 ()
    terra11:setSequence ("muda")
    statusTerra11 = "muda"
end

local function muda12 ()
    terra12:setSequence ("muda")
    statusTerra12 = "muda"
end

local function muda13 ()
    terra13:setSequence ("muda")
    statusTerra13 = "muda"
end

local function muda14 ()
    terra14:setSequence ("muda")
    statusTerra14 = "muda"
end

local function muda15 ()
    terra15:setSequence ("muda")
    statusTerra15 = "muda"
end

local function onColision (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        -- terra 1

        if ((obj1.myName == "terra1" and obj2.myName == "sementeAlface") or (obj2.myName == "terra1" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra1 == "nada" then
                    terra1:setSequence ("crescer1")
                    tipoSemente1 = "alface"
                    statusTerra1 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra1" and obj2.myName == "sementeBatata") or (obj2.myName == "terra1" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra1 == "nada" then
                    terra1:setSequence ("crescer1")
                    tipoSemente1 = "batata"
                    statusTerra1 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra1" and obj2.myName == "sementeTomate") or (obj2.myName == "terra1" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra1 == "nada" then
                    terra1:setSequence ("crescer1")
                    tipoSemente1 = "tomate"
                    statusTerra1 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra1" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra1" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra1 == "nada" then
                    terra1:setSequence ("crescer1")
                    tipoSemente1 = "trigo"
                    statusTerra1 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra1" and obj2.myName == "adubo") or (obj2.myName == "terra1" and obj1.myName == "adubo")) then
            if statusTerra1 == "crescer1" then
                terra1:setSequence ("crescer2")
                statusTerra1 = "crescer2"
            end
        end

        if ((obj1.myName == "terra1" and obj2.myName == "agua") or (obj2.myName == "terra1" and obj1.myName == "agua")) then
            if statusTerra1 == "crescer2" then
                timer.performWithDelay (tempo, muda1)
                timer.performWithDelay (tempo*2, colheita1)
            end
        end
    
        if ((obj1.myName == "terra1" and obj2.myName == "selecao") or (obj2.myName == "terra1" and obj1.myName == "selecao")) then
            if statusTerra1 == "pronto" then
                terra1:setSequence ("terra")
                statusTerra1 = "nada"
                

                if tipoSemente1 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente1 = "nada"
                    end

                elseif tipoSemente1 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente1 = "nada"
                    end

                elseif tipoSemente1 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente1 = "nada"
                    end

                elseif tipoSemente1 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente1 = "nada"
                    end
                
                end
               
               -- timer.performWithDelay (100, placar)
           
            end
            
        end


        -- terra 2

        if ((obj1.myName == "terra2" and obj2.myName == "sementeAlface") or (obj2.myName == "terra2" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra2 == "nada" then
                    terra2:setSequence ("crescer1")
                    tipoSemente2 = "alface"
                    statusTerra2 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra2" and obj2.myName == "sementeBatata") or (obj2.myName == "terra2" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra2 == "nada" then
                    terra2:setSequence ("crescer1")
                    tipoSemente2 = "batata"
                    statusTerra2 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra2" and obj2.myName == "sementeTomate") or (obj2.myName == "terra2" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra2 == "nada" then
                    terra2:setSequence ("crescer1")
                    tipoSemente2 = "tomate"
                    statusTerra2 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra2" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra2" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra2 == "nada" then
                    terra2:setSequence ("crescer1")
                    tipoSemente2 = "trigo"
                    statusTerra2 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra2" and obj2.myName == "adubo") or (obj2.myName == "terra2" and obj1.myName == "adubo")) then
            if statusTerra2 == "crescer1" then
                terra2:setSequence ("crescer2")
                statusTerra2 = "crescer2"
            end
        end

        if ((obj1.myName == "terra2" and obj2.myName == "agua") or (obj2.myName == "terra2" and obj1.myName == "agua")) then
            if statusTerra2 == "crescer2" then
                timer.performWithDelay (tempo, muda2)
                timer.performWithDelay (tempo*2, colheita2)
            end
        end
    
        if ((obj1.myName == "terra2" and obj2.myName == "selecao") or (obj2.myName == "terra2" and obj1.myName == "selecao")) then
            if statusTerra2 == "pronto" then
                terra2:setSequence ("terra")
                statusTerra2 = "nada"


                if tipoSemente2 == "alface" then
                    if not (valorAlface == 0) then
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente2 = "nada"
                    end

                elseif tipoSemente2 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente2 = "nada"
                    end

                elseif tipoSemente2 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente2 = "nada"
                    end

                elseif tipoSemente2 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente2 = "nada"
                    end
                

                end
               -- timer.performWithDelay (100, placar)
            end
        end
    end 
end

local function onColision1 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        -- terra 3

        if ((obj1.myName == "terra3" and obj2.myName == "sementeAlface") or (obj2.myName == "terra3" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra3 == "nada" then
                    terra3:setSequence ("crescer1")
                    tipoSemente3 = "alface"
                    statusTerra3 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra3" and obj2.myName == "sementeBatata") or (obj2.myName == "terra3" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra3 == "nada" then
                    terra3:setSequence ("crescer1")
                    tipoSemente3 = "batata"
                    statusTerra3 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra3" and obj2.myName == "sementeTomate") or (obj2.myName == "terra3" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra3 == "nada" then
                    terra3:setSequence ("crescer1")
                    tipoSemente3 = "tomate"
                    statusTerra3 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra3" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra3" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra3 == "nada" then
                    terra3:setSequence ("crescer1")
                    tipoSemente3 = "trigo"
                    statusTerra3 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra3" and obj2.myName == "adubo") or (obj2.myName == "terra3" and obj1.myName == "adubo")) then
            if statusTerra3 == "crescer1" then
                terra3:setSequence ("crescer2")
                statusTerra3 = "crescer2"
            end
        end

        if ((obj1.myName == "terra3" and obj2.myName == "agua") or (obj2.myName == "terra3" and obj1.myName == "agua")) then
            if statusTerra3 == "crescer2" then
                timer.performWithDelay (tempo, muda3)
                timer.performWithDelay (tempo*2, colheita3)
            end
        end
    
        if ((obj1.myName == "terra3" and obj2.myName == "selecao") or (obj2.myName == "terra3" and obj1.myName == "selecao")) then
            if statusTerra3 == "pronto" then
                terra3:setSequence ("terra")
                statusTerra3 = "nada"

                if tipoSemente3 == "alface" then
                    if not (valorAlface == 0) then
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente3 = "nada"
                    end

                elseif tipoSemente3 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente3 = "nada"
                    end

                elseif tipoSemente3 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente3 = "nada"
                    end

                elseif tipoSemente3 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente3 = "nada"
                    end               

                end
               -- timer.performWithDelay (100, placar)
            end
        end


        -- terra 4
        if ((obj1.myName == "terra4" and obj2.myName == "sementeAlface") or (obj2.myName == "terra4" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra4 == "nada" then
                    terra4:setSequence ("crescer1")
                    tipoSemente4 = "alface"
                    statusTerra4 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra4" and obj2.myName == "sementeBatata") or (obj2.myName == "terra4" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra4 == "nada" then
                    terra4:setSequence ("crescer1")
                    tipoSemente4 = "batata"
                    statusTerra4 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra4" and obj2.myName == "sementeTomate") or (obj2.myName == "terra4" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra4 == "nada" then
                    terra4:setSequence ("crescer1")
                    tipoSemente4 = "tomate"
                    statusTerra4 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra4" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra4" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra4 == "nada" then
                    terra4:setSequence ("crescer1")
                    tipoSemente4 = "trigo"
                    statusTerra4 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra4" and obj2.myName == "adubo") or (obj2.myName == "terra4" and obj1.myName == "adubo")) then
            if statusTerra4 == "crescer1" then
                terra4:setSequence ("crescer2")
                statusTerra4 = "crescer2"
            end
        end

        if ((obj1.myName == "terra4" and obj2.myName == "agua") or (obj2.myName == "terra4" and obj1.myName == "agua")) then
            if statusTerra4 == "crescer2" then
                timer.performWithDelay (tempo, muda4)
                timer.performWithDelay (tempo*2, colheita4)
            end
        end
    
        if ((obj1.myName == "terra4" and obj2.myName == "selecao") or (obj2.myName == "terra4" and obj1.myName == "selecao")) then
            if statusTerra4 == "pronto" then
                terra4:setSequence ("terra")
                statusTerra4 = "nada"

                if tipoSemente4 == "alface" then
                    if not (valorAlface == 0) then
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente4 = "nada"
                    end

                elseif tipoSemente4 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente4 = "nada"
                    end

                elseif tipoSemente4 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente4 = "nada"
                    end

                elseif tipoSemente4 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente4 = "nada"
                    end                

                end
               -- timer.performWithDelay (100, placar)
            end
        end

    end
end

local function onColision2 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        -- terra 5
        if ((obj1.myName == "terra5" and obj2.myName == "sementeAlface") or (obj2.myName == "terra5" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra5 == "nada" then
                    terra5:setSequence ("crescer1")
                    tipoSemente5 = "alface"
                    statusTerra5 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra5" and obj2.myName == "sementeBatata") or (obj2.myName == "terra5" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra5 == "nada" then
                    terra5:setSequence ("crescer1")
                    tipoSemente5 = "batata"
                    statusTerra5 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra5" and obj2.myName == "sementeTomate") or (obj2.myName == "terra5" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra5 == "nada" then
                    terra5:setSequence ("crescer1")
                    tipoSemente5 = "tomate"
                    statusTerra5 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra5" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra5" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra5 == "nada" then
                    terra5:setSequence ("crescer1")
                    tipoSemente5 = "trigo"
                    statusTerra5 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra5" and obj2.myName == "adubo") or (obj2.myName == "terra5" and obj1.myName == "adubo")) then
            if statusTerra5 == "crescer1" then
                terra5:setSequence ("crescer2")
                statusTerra5 = "crescer2"
            end
        end

        if ((obj1.myName == "terra5" and obj2.myName == "agua") or (obj2.myName == "terra5" and obj1.myName == "agua")) then
            if statusTerra5 == "crescer2" then
                timer.performWithDelay (tempo, muda5)
                timer.performWithDelay (tempo*2, colheita5)
            end
        end
    
        if ((obj1.myName == "terra5" and obj2.myName == "selecao") or (obj2.myName == "terra5" and obj1.myName == "selecao")) then
            if statusTerra5 == "pronto" then
                terra5:setSequence ("terra")
                statusTerra5 = "nada"

                if tipoSemente5 == "alface" then
                    if not (valorAlface == 0) then
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente5 = "nada"
                    end

                elseif tipoSemente5 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente5 = "nada"
                    end

                elseif tipoSemente5 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente5 = "nada"
                    end

                elseif tipoSemente5 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente5 = "nada"
                    end                

                end
               -- timer.performWithDelay (100, placar)
            end
        end
    

        --terra 6
        if ((obj1.myName == "terra6" and obj2.myName == "sementeAlface") or (obj2.myName == "terra6" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra6 == "nada" then
                    terra6:setSequence ("crescer1")
                    tipoSemente6 = "alface"
                    statusTerra6 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra6" and obj2.myName == "sementeBatata") or (obj2.myName == "terra6" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra6 == "nada" then
                    terra6:setSequence ("crescer1")
                    tipoSemente6 = "batata"
                    statusTerra6 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra6" and obj2.myName == "sementeTomate") or (obj2.myName == "terra6" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra6 == "nada" then
                    terra6:setSequence ("crescer1")
                    tipoSemente6 = "tomate"
                    statusTerra6 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra6" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra6" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra6 == "nada" then
                    terra6:setSequence ("crescer1")
                    tipoSemente6 = "trigo"
                    statusTerra6 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra6" and obj2.myName == "adubo") or (obj2.myName == "terra6" and obj1.myName == "adubo")) then
            if statusTerra6 == "crescer1" then
                terra6:setSequence ("crescer2")
                statusTerra6 = "crescer2"
            end
        end

        if ((obj1.myName == "terra6" and obj2.myName == "agua") or (obj2.myName == "terra6" and obj1.myName == "agua")) then
            if statusTerra6 == "crescer2" then
                timer.performWithDelay (tempo, muda6)
                timer.performWithDelay (tempo*2, colheita6)
            end
        end
    
        if ((obj1.myName == "terra6" and obj2.myName == "selecao") or (obj2.myName == "terra6" and obj1.myName == "selecao")) then
            if statusTerra6 == "pronto" then
                terra6:setSequence ("terra")
                statusTerra6 = "nada"

                if tipoSemente6 == "alface" then
                    if not (valorAlface == 0) then
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente6 = "nada"
                    end

                elseif tipoSemente6 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente6 = "nada"
                    end

                elseif tipoSemente6 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente6 = "nada"
                    end

                elseif tipoSemente6 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente6 = "nada"
                    end                

                end
               -- timer.performWithDelay (100, placar)
            end
        end

    end
end

local function onColision3 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        -- terra 7
        if ((obj1.myName == "terra7" and obj2.myName == "sementeAlface") or (obj2.myName == "terra7" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra7 == "nada" then
                    terra7:setSequence ("crescer1")
                    tipoSemente7 = "alface"
                    statusTerra7 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra7" and obj2.myName == "sementeBatata") or (obj2.myName == "terra7" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra7 == "nada" then
                    terra7:setSequence ("crescer1")
                    tipoSemente7 = "batata"
                    statusTerra7 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra7" and obj2.myName == "sementeTomate") or (obj2.myName == "terra7" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra7 == "nada" then
                    terra7:setSequence ("crescer1")
                    tipoSemente7 = "tomate"
                    statusTerra7 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra7" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra7" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra7 == "nada" then
                    terra7:setSequence ("crescer1")
                    tipoSemente7 = "trigo"
                    statusTerra7 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra7" and obj2.myName == "adubo") or (obj2.myName == "terra7" and obj1.myName == "adubo")) then
            if statusTerra7 == "crescer1" then
                terra7:setSequence ("crescer2")
                statusTerra7 = "crescer2"
            end
        end

        if ((obj1.myName == "terra7" and obj2.myName == "agua") or (obj2.myName == "terra7" and obj1.myName == "agua")) then
            if statusTerra7 == "crescer2" then
                timer.performWithDelay (tempo, muda7)
                timer.performWithDelay (tempo*2, colheita7)
            end
        end
    
        if ((obj1.myName == "terra7" and obj2.myName == "selecao") or (obj2.myName == "terra7" and obj1.myName == "selecao")) then
            if statusTerra7 == "pronto" then
                terra7:setSequence ("terra")
                statusTerra7 = "nada"

                if tipoSemente7 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente7 = "nada"
                    end

                elseif tipoSemente7 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente7 = "nada"
                    end

                elseif tipoSemente7 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente7 = "nada"
                    end

                elseif tipoSemente7 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente7 = "nada"
                    end
                
                end
               -- timer.performWithDelay (100, placar)
            end
        end

        --terra 8
        if ((obj1.myName == "terra8" and obj2.myName == "sementeAlface") or (obj2.myName == "terra8" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra8 == "nada" then
                    terra8:setSequence ("crescer1")
                    tipoSemente8 = "alface"
                    statusTerra8 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra8" and obj2.myName == "sementeBatata") or (obj2.myName == "terra8" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra1 == "nada" then
                    terra8:setSequence ("crescer1")
                    tipoSemente8 = "batata"
                    statusTerra8 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra8" and obj2.myName == "sementeTomate") or (obj2.myName == "terra8" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra8 == "nada" then
                    terra8:setSequence ("crescer1")
                    tipoSemente8 = "tomate"
                    statusTerra8 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra8" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra8" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra8 == "nada" then
                    terra8:setSequence ("crescer1")
                    tipoSemente8 = "trigo"
                    statusTerra8 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra8" and obj2.myName == "adubo") or (obj2.myName == "terra8" and obj1.myName == "adubo")) then
            if statusTerra8 == "crescer1" then
                terra8:setSequence ("crescer2")
                statusTerra8 = "crescer2"
            end
        end

        if ((obj1.myName == "terra8" and obj2.myName == "agua") or (obj2.myName == "terra8" and obj1.myName == "agua")) then
            if statusTerra8 == "crescer2" then
                timer.performWithDelay (tempo, muda8)
                timer.performWithDelay (tempo*2, colheita8)
            end
        end
    
        if ((obj1.myName == "terra8" and obj2.myName == "selecao") or (obj2.myName == "terra8" and obj1.myName == "selecao")) then
            if statusTerra8 == "pronto" then
                terra8:setSequence ("terra")
                statusTerra8 = "nada"

                if tipoSemente8 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente8 = "nada"
                    end

                elseif tipoSemente8 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente8 = "nada"
                    end

                elseif tipoSemente8 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente8 = "nada"
                    end

                elseif tipoSemente8 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente7 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end
    end
end

local function onColision4 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

         -- terra 9
         if ((obj1.myName == "terra9" and obj2.myName == "sementeAlface") or (obj2.myName == "terra9" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra9 == "nada" then
                    terra9:setSequence ("crescer1")
                    tipoSemente9 = "alface"
                    statusTerra9 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra9" and obj2.myName == "sementeBatata") or (obj2.myName == "terra9" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra9 == "nada" then
                    terra9:setSequence ("crescer1")
                    tipoSemente9 = "batata"
                    statusTerra9 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra9" and obj2.myName == "sementeTomate") or (obj2.myName == "terra9" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra9 == "nada" then
                    terra9:setSequence ("crescer1")
                    tipoSemente9 = "tomate"
                    statusTerra9 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra9" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra9" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra9 == "nada" then
                    terra9:setSequence ("crescer1")
                    tipoSemente9 = "trigo"
                    statusTerra9 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra9" and obj2.myName == "adubo") or (obj2.myName == "terra9" and obj1.myName == "adubo")) then
            if statusTerra9 == "crescer1" then
                terra9:setSequence ("crescer2")
                statusTerra9 = "crescer2"
            end
        end

        if ((obj1.myName == "terra9" and obj2.myName == "agua") or (obj2.myName == "terra9" and obj1.myName == "agua")) then
            if statusTerra9 == "crescer2" then
                timer.performWithDelay (tempo, muda9)
                timer.performWithDelay (tempo*2, colheita9)
            end
        end
    
        if ((obj1.myName == "terra9" and obj2.myName == "selecao") or (obj2.myName == "terra9" and obj1.myName == "selecao")) then
            if statusTerra9 == "pronto" then
                terra9:setSequence ("terra")
                statusTerra9 = "nada"

                if tipoSemente9 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente9 = "nada"
                    end

                elseif tipoSemente9 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente9 = "nada"
                    end

                elseif tipoSemente9 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente9 = "nada"
                    end

                elseif tipoSemente9 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente9 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end      

        -- terra 10
        if ((obj1.myName == "terra10" and obj2.myName == "sementeAlface") or (obj2.myName == "terra10" and obj1.myName == "sementeAlface")) then

            if (menuAberto == true) then
                if statusTerra10 == "nada" then
                    terra10:setSequence ("crescer1")
                    tipoSemente10 = "alface"
                    statusTerra10 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra10" and obj2.myName == "sementeBatata") or (obj2.myName == "terra10" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra10 == "nada" then
                    terra10:setSequence ("crescer1")
                    tipoSemente10 = "batata"
                    statusTerra10 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra10" and obj2.myName == "sementeTomate") or (obj2.myName == "terra10" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra10 == "nada" then
                    terra10:setSequence ("crescer1")
                    tipoSemente10 = "tomate"
                    statusTerra10 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra10" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra10" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra10 == "nada" then
                    terra10:setSequence ("crescer1")
                    tipoSemente10 = "trigo"
                    statusTerra10 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra10" and obj2.myName == "adubo") or (obj2.myName == "terra10" and obj1.myName == "adubo")) then
            if statusTerra10 == "crescer1" then
                terra10:setSequence ("crescer2")
                statusTerra10 = "crescer2"
            end
        end

        if ((obj1.myName == "terra10" and obj2.myName == "agua") or (obj2.myName == "terra10" and obj1.myName == "agua")) then
            if statusTerra10 == "crescer2" then
                timer.performWithDelay (tempo, muda10)
                timer.performWithDelay (tempo*2, colheita10)
            end
        end
    
        if ((obj1.myName == "terra10" and obj2.myName == "selecao") or (obj2.myName == "terra10" and obj1.myName == "selecao")) then
            if statusTerra10 == "pronto" then
                terra10:setSequence ("terra")
                statusTerra10 = "nada"

                if tipoSemente10 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente10 = "nada"
                    end

                elseif tipoSemente10 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente10 = "nada"
                    end

                elseif tipoSemente10 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente10 = "nada"
                    end

                elseif tipoSemente10 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente10 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end
    
    end
end

local function onColision5 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2


        -- terra 11
        if ((obj1.myName == "terra11" and obj2.myName == "sementeAlface") or (obj2.myName == "terra11" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra11 == "nada" then
                    terra11:setSequence ("crescer1")
                    tipoSemente11 = "alface"
                    statusTerra11 = "crescer1"
                end
            end
        end

        if ((obj1.myName == "terra11" and obj2.myName == "sementeBatata") or (obj2.myName == "terra11" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra11 == "nada" then
                    terra11:setSequence ("crescer1")
                    tipoSemente11 = "batata"
                    statusTerra11 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra11" and obj2.myName == "sementeTomate") or (obj2.myName == "terra11" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra11 == "nada" then
                    terra11:setSequence ("crescer1")
                    tipoSemente11 = "tomate"
                    statusTerra11 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra11" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra11" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra11 == "nada" then
                    terra11:setSequence ("crescer1")
                    tipoSemente11 = "trigo"
                    statusTerra11 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra11" and obj2.myName == "adubo") or (obj2.myName == "terra11" and obj1.myName == "adubo")) then
            if statusTerra11 == "crescer1" then
                terra11:setSequence ("crescer2")
                statusTerra11 = "crescer2"
            end
        end

        if ((obj1.myName == "terra11" and obj2.myName == "agua") or (obj2.myName == "terra11" and obj1.myName == "agua")) then
            if statusTerra11 == "crescer2" then
                timer.performWithDelay (tempo, muda11)
                timer.performWithDelay (tempo*2, colheita11)
            end
        end
    
        if ((obj1.myName == "terra11" and obj2.myName == "selecao") or (obj2.myName == "terra11" and obj1.myName == "selecao")) then
            if statusTerra11 == "pronto" then
                terra11:setSequence ("terra")
                statusTerra11 = "nada"

                if tipoSemente11 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente11 = "nada"
                    end

                elseif tipoSemente11 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente11 = "nada"
                    end

                elseif tipoSemente11 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente11 = "nada"
                    end

                elseif tipoSemente11 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente11 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end


        --terra 12
        if ((obj1.myName == "terra12" and obj2.myName == "sementeAlface") or (obj2.myName == "terra12" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra12 == "nada" then
                    terra12:setSequence ("crescer1")
                    tipoSemente12 = "alface"
                    statusTerra12 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra12" and obj2.myName == "sementeBatata") or (obj2.myName == "terra12" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra12 == "nada" then
                    terra12:setSequence ("crescer1")
                    tipoSemente12 = "batata"
                    statusTerra12 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra12" and obj2.myName == "sementeTomate") or (obj2.myName == "terra12" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra12 == "nada" then
                    terra12:setSequence ("crescer1")
                    tipoSemente12 = "tomate"
                    statusTerra12 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra12" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra12" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra12 == "nada" then
                    terra12:setSequence ("crescer1")
                    tipoSemente12 = "trigo"
                    statusTerra12 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra12" and obj2.myName == "adubo") or (obj2.myName == "terra12" and obj1.myName == "adubo")) then
            if statusTerra12 == "crescer1" then
                terra12:setSequence ("crescer2")
                statusTerra12 = "crescer2"
            end
        end

        if ((obj1.myName == "terra12" and obj2.myName == "agua") or (obj2.myName == "terra12" and obj1.myName == "agua")) then
            if statusTerra12 == "crescer2" then
                timer.performWithDelay (tempo, muda12)
                timer.performWithDelay (tempo*2, colheita12)
            end
        end
    
        if ((obj1.myName == "terra12" and obj2.myName == "selecao") or (obj2.myName == "terra12" and obj1.myName == "selecao")) then
            if statusTerra12 == "pronto" then
                terra12:setSequence ("terra")
                statusTerra12 = "nada"

                if tipoSemente12 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente12 = "nada"
                    end

                elseif tipoSemente12 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente12 = "nada"
                    end

                elseif tipoSemente12 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente12 = "nada"
                    end

                elseif tipoSemente12 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente12 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end

    end
end


local function onColision6 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        --terra 13
        if ((obj1.myName == "terra13" and obj2.myName == "sementeAlface") or (obj2.myName == "terra13" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra13 == "nada" then
                    terra13:setSequence ("crescer1")
                    tipoSemente13 = "alface"
                    statusTerra13 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra13" and obj2.myName == "sementeBatata") or (obj2.myName == "terra13" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra13 == "nada" then
                    terra13:setSequence ("crescer1")
                    tipoSemente13 = "batata"
                    statusTerra13 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra13" and obj2.myName == "sementeTomate") or (obj2.myName == "terra13" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra13 == "nada" then
                    terra13:setSequence ("crescer1")
                    tipoSemente13 = "tomate"
                    statusTerra13 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra13" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra13" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra13 == "nada" then
                    terra13:setSequence ("crescer1")
                    tipoSemente13 = "trigo"
                    statusTerra13 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra13" and obj2.myName == "adubo") or (obj2.myName == "terra13" and obj1.myName == "adubo")) then
            if statusTerra13 == "crescer1" then
                terra13:setSequence ("crescer2")
                statusTerra13 = "crescer2"
            end
        end

        if ((obj1.myName == "terra13" and obj2.myName == "agua") or (obj2.myName == "terra13" and obj1.myName == "agua")) then
            if statusTerra13 == "crescer2" then
                timer.performWithDelay (tempo, muda13)
                timer.performWithDelay (tempo*2, colheita13)
            end
        end
    
        if ((obj1.myName == "terra13" and obj2.myName == "selecao") or (obj2.myName == "terra13" and obj1.myName == "selecao")) then
            if statusTerra13 == "pronto" then
                terra13:setSequence ("terra")
                statusTerra13 = "nada"

                if tipoSemente13 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente13 = "nada"
                    end

                elseif tipoSemente13 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente13 = "nada"
                    end

                elseif tipoSemente13 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente13 = "nada"
                    end

                elseif tipoSemente13 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente13 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end

        --terra 14
        if ((obj1.myName == "terra14" and obj2.myName == "sementeAlface") or (obj2.myName == "terra14" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra14 == "nada" then
                    terra14:setSequence ("crescer1")
                    tipoSemente14 = "alface"
                    statusTerra14 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra14" and obj2.myName == "sementeBatata") or (obj2.myName == "terra14" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra14 == "nada" then
                    terra14:setSequence ("crescer1")
                    tipoSemente14 = "batata"
                    statusTerra14 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra14" and obj2.myName == "sementeTomate") or (obj2.myName == "terra14" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra14 == "nada" then
                    terra14:setSequence ("crescer1")
                    tipoSemente14 = "tomate"
                    statusTerra14 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra14" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra14" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra14 == "nada" then
                    terra14:setSequence ("crescer1")
                    tipoSemente14 = "trigo"
                    statusTerra14 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra14" and obj2.myName == "adubo") or (obj2.myName == "terra14" and obj1.myName == "adubo")) then
            if statusTerra14 == "crescer1" then
                terra14:setSequence ("crescer2")
                statusTerra14 = "crescer2"
            end
        end

        if ((obj1.myName == "terra14" and obj2.myName == "agua") or (obj2.myName == "terra14" and obj1.myName == "agua")) then
            if statusTerra14 == "crescer2" then
                timer.performWithDelay (tempo, muda14)
                timer.performWithDelay (tempo*2, colheita14)
            end
        end
    
        if ((obj1.myName == "terra14" and obj2.myName == "selecao") or (obj2.myName == "terra14" and obj1.myName == "selecao")) then
            if statusTerra14 == "pronto" then
                terra14:setSequence ("terra")
                statusTerra14 = "nada"

                if tipoSemente14 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente14 = "nada"
                    end

                elseif tipoSemente14 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente14 = "nada"
                    end

                elseif tipoSemente14 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente14 = "nada"
                    end

                elseif tipoSemente14 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente14 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end

    end
end

local function onColision7 (event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2


        -- terra 15
        if ((obj1.myName == "terra15" and obj2.myName == "sementeAlface") or (obj2.myName == "terra15" and obj1.myName == "sementeAlface")) then
            if (menuAberto == true) then
                if statusTerra15 == "nada" then
                    terra15:setSequence ("crescer1")
                    tipoSemente15 = "alface"
                    statusTerra15 = "crescer1"
                end
            end
        end
        
        if ((obj1.myName == "terra15" and obj2.myName == "sementeBatata") or (obj2.myName == "terra15" and obj1.myName == "sementeBatata")) then
            if (menuAberto == true) then
                if statusTerra15 == "nada" then
                    terra15:setSequence ("crescer1")
                    tipoSemente15 = "batata"
                    statusTerra15 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra15" and obj2.myName == "sementeTomate") or (obj2.myName == "terra15" and obj1.myName == "sementeTomate")) then
            if (menuAberto == true) then
                if statusTerra15 == "nada" then
                    terra15:setSequence ("crescer1")
                    tipoSemente15 = "tomate"
                    statusTerra15 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra15" and obj2.myName == "sementeTrigo") or (obj2.myName == "terra15" and obj1.myName == "sementeTrigo")) then
            if (menuAberto == true) then
                if statusTerra15 == "nada" then
                    terra15:setSequence ("crescer1")
                    tipoSemente15 = "trigo"
                    statusTerra15 = "crescer1"
                end
            end
        end
    
        if ((obj1.myName == "terra15" and obj2.myName == "adubo") or (obj2.myName == "terra15" and obj1.myName == "adubo")) then
            if statusTerra15 == "crescer1" then
                terra15:setSequence ("crescer2")
                statusTerra15 = "crescer2"
            end
        end

        if ((obj1.myName == "terra15" and obj2.myName == "agua") or (obj2.myName == "terra15" and obj1.myName == "agua")) then
            if statusTerra15 == "crescer2" then
                timer.performWithDelay (tempo, muda15)
                timer.performWithDelay (tempo*2, colheita15)
            end
        end
    
        if ((obj1.myName == "terra15" and obj2.myName == "selecao") or (obj2.myName == "terra15" and obj1.myName == "selecao")) then
            if statusTerra15 == "pronto" then
                terra15:setSequence ("terra")
                statusTerra15 = "nada"

                if tipoSemente15 == "alface" then
                    if not (valorAlface ==0) then 
                    valorAlface = valorAlface - 1
                    textoPlacarAlface.text = valorAlface
                    tipoSemente15 = "nada"
                    end

                elseif tipoSemente15 == "batata" then
                    if not (valorBatata == 0) then
                    valorBatata = valorBatata - 1
                    textoPlacarBatata.text = valorBatata
                    tipoSemente15 = "nada"
                    end

                elseif tipoSemente15 == "tomate" then
                    if not (valorTomate == 0) then
                    valorTomate = valorTomate - 1
                    textoPlacarTomate.text = valorTomate
                    tipoSemente15 = "nada"
                    end

                elseif tipoSemente15 == "trigo" then
                    if not (valorTrigo == 0) then
                    valorTrigo = valorTrigo - 1
                    textoPlacarTrigo.text = valorTrigo
                    tipoSemente15 = "nada"
                    end
                end
               -- timer.performWithDelay (100, placar)
            end
        end

    end
end

local function level ()
    if nivel == 1 then
        valorAlface = 5
        valorTomate = 5

        textoPlacarAlface.text = valorAlface
        textoPlacarTomate.text = valorTomate

    elseif nivel == 2 then
        valorAlface = 30
        valorTomate = 30
        valorBatata = 20
        valorTrigo = 20

        textoPlacarAlface.text = valorAlface
        textoPlacarTomate.text = valorTomate
        textoPlacarBatata.text = valorBatata
        textoPlacarTrigo.text = valorTrigo


    elseif nivel == 3 then
        valorAlface = 50
        valorTomate = 45
        valorBatata = 30
        valorTrigo = 30

        textoPlacarAlface.text = valorAlface
        textoPlacarTomate.text = valorTomate
        textoPlacarBatata.text = valorBatata
        textoPlacarTrigo.text = valorTrigo

    elseif nivel == 4 then
        valorAlface = 55
        valorTomate = 60
        valorBatata = 55
        valorTrigo = 40

        textoPlacarAlface.text = valorAlface
        textoPlacarTomate.text = valorTomate
        textoPlacarBatata.text = valorBatata
        textoPlacarTrigo.text = valorTrigo


    elseif nivel == 5 then
        valorAlface = 70
        valorTomate = 65
        valorBatata = 75
        valorTrigo = 60

        textoPlacarAlface.text = valorAlface
        textoPlacarTomate.text = valorTomate
        textoPlacarBatata.text = valorBatata
        textoPlacarTrigo.text = valorTrigo
    

    end
end

local function endLevel ()
    if (valorAlface == 0) and (valorTomate == 0) and (valorBatata == 0) and (valorTrigo == 0)then
        composer.gotoScene ("cozinha")
    end
end
-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	physics.pause ()

	backGroup = display.newGroup ()
	sceneGroup:insert (backGroup)
	mainGroup = display.newGroup ()
	sceneGroup:insert (mainGroup)
	uiGroup = display.newGroup ()
	sceneGroup:insert (uiGroup)

	local bg = display.newImageRect (backGroup, "imagens/fazenda/fazendaSprites/fazendaFundo.png", 720, 480)
	bg.x, bg.y = display.contentCenterX, display.contentCenterY
	quantidade = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/pedidos.png", 192, 48)
	quantidade.x, quantidade.y = display.screenOriginX + 95, display.screenOriginY+23
	
	sementeAlface = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/alface.png", 48, 44)
	sementeAlface.x, sementeAlface.y = display.contentWidth + letterboxWidth - 265, display.contentCenterY  - 87
	sementeAlface.myName = "sementeAlface"
	physics.addBody (sementeAlface, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	sementeAlface.alpha = 0.01

	sementeBatata = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/batata.png", 48, 44)
	sementeBatata.x, sementeBatata.y = display.contentWidth + letterboxWidth - 210, display.contentCenterY  - 87
	sementeBatata.myName = "sementeBatata"
	physics.addBody (sementeBatata, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	sementeBatata.alpha = 0.01

	sementeTrigo = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/trigo.png", 48, 44)
	sementeTrigo.x, sementeTrigo.y = display.contentWidth + letterboxWidth - 153, display.contentCenterY  - 87
	sementeTrigo.myName = "sementeTrigo"
	physics.addBody (sementeTrigo, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	sementeTrigo.alpha = 0.01

	sementeTomate = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/tomate.png", 48, 44)
	sementeTomate.x, sementeTomate.y = display.contentWidth + letterboxWidth - 97, display.contentCenterY  - 85
	sementeTomate.myName = "sementeTomate"
	physics.addBody (sementeTomate, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	sementeTomate.alpha = 0.01

	criarMenu ()

	ferramentas = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/ferramentas.png", 64, 272)
	ferramentas.x, ferramentas.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY

	botaoSemente = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sacoSemente.png", 38, 34)
	botaoSemente.x, botaoSemente.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY  - 85
	botaoSemente.myName = "botaoSemente"

	adubo = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/adubo.png", 48, 44)
	adubo.x, adubo.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY - 30
	physics.addBody (adubo, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	adubo.myName = "adubo"

	agua = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/agua.png", 48, 44)
	agua.x, agua.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 26
	physics.addBody (agua, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	agua.myName = "agua"

	selecao = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/selecionar.png", 48, 44)
	selecao.x, selecao.y = display.contentWidth + letterboxWidth - 32, display.contentCenterY + 81
	physics.addBody (selecao, "dynamic", {density= 1, friction= 0, bounce= 0, isSensor = true})
	selecao.myName = "selecao"

	terra1 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra1.x, terra1.y = display.contentCenterX - 160, display.contentCenterY - 20
	terra1:setSequence ("terra")
	terra1:play ()
	physics.addBody (terra1, "static", {box = parametros})
	terra1.myName = "terra1"

	terra2 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra2.x, terra2.y = display.contentCenterX - 96, display.contentCenterY - 20
	terra2:setSequence ("terra")
	terra2:play ()
	physics.addBody (terra2, "static", {box = parametros})
	terra2.myName = "terra2"

	terra3 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra3.x, terra3.y = display.contentCenterX - 32, display.contentCenterY - 20
	terra3:setSequence ("terra")
	terra3:play ()
	physics.addBody (terra3, "static", {box = parametros})
	terra3.myName = "terra3"

	terra4 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra4.x, terra4.y = display.contentCenterX +32, display.contentCenterY - 20
	terra4:setSequence ("terra")
	terra4:play ()
	physics.addBody (terra4, "static", {box = parametros})
	terra4.myName = "terra4"

	terra5 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra5.x, terra5.y = display.contentCenterX +96, display.contentCenterY - 20
	terra5:setSequence ("terra")
	terra5:play ()
	physics.addBody (terra5, "static", {box = parametros})
	terra5.myName = "terra5"

	terra6 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra6.x, terra6.y = display.contentCenterX - 160, display.contentCenterY + 44
	terra6:setSequence ("terra")
	terra6:play ()
	physics.addBody (terra6, "static", {box = parametros})
	terra6.myName = "terra6"

	terra7 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra7.x, terra7.y = display.contentCenterX - 96, display.contentCenterY + 44
	terra7:setSequence ("terra")
	terra7:play ()
	physics.addBody (terra7, "static", {box = parametros})
	terra7.myName = "terra7"

	terra8 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra8.x, terra8.y = display.contentCenterX - 32, display.contentCenterY + 44
	terra8:setSequence ("terra")
	terra8:play ()
	physics.addBody (terra8, "static", {box = parametros})
	terra8.myName = "terra8"

	terra9 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra9.x, terra9.y = display.contentCenterX +32, display.contentCenterY + 44
	terra9:setSequence ("terra")
	terra9:play ()
	physics.addBody (terra9, "static", {box = parametros})
	terra9.myName = "terra9"

	terra10 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra10.x, terra10.y = display.contentCenterX +96, display.contentCenterY + 44
	terra10:setSequence ("terra")
	terra10:play ()
	physics.addBody (terra10, "static", {box = parametros})
	terra10.myName = "terra10"

	terra11 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra11.x, terra11.y = display.contentCenterX -160, display.contentCenterY + 108
	terra11:setSequence ("terra")
	terra11:play ()
	physics.addBody (terra11, "static", {box = parametros})
	terra11.myName = "terra11"

	terra12 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra12.x, terra12.y = display.contentCenterX - 96, display.contentCenterY + 108
	terra12:setSequence ("terra")
	terra12:play ()
	physics.addBody (terra12, "static", {box = parametros})
	terra12.myName = "terra12"

	terra13 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra13.x, terra13.y = display.contentCenterX - 32, display.contentCenterY + 108
	terra13:setSequence ("terra")
	terra13:play ()
	physics.addBody (terra13, "static", {box = parametros})
	terra13.myName = "terra13"

	terra14 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra14.x, terra14.y = display.contentCenterX +32, display.contentCenterY + 108
	terra14:setSequence ("terra")
	terra14:play ()
	physics.addBody (terra14, "static", {box = parametros})
	terra14.myName = "terra14"

	terra15 = display.newSprite (mainGroup, plantas, spritePlantas)
	terra15.x, terra15.y = display.contentCenterX +96, display.contentCenterY + 108
	terra15:setSequence ("terra")
	terra15:play ()
	physics.addBody (terra15, "static", {box = parametros})
	terra15.myName = "terra15"

	alfacePlacar = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/alface.png", 36, 33)
	alfacePlacar.x, alfacePlacar.y = display.screenOriginX + 30, display.screenOriginY+14

	batataPlacar = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/batata.png", 36, 33)
	batataPlacar.x, batataPlacar.y = display.screenOriginX + 70, display.screenOriginY+14

	trigoPlacar = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/trigo.png", 36, 33)
	trigoPlacar.x, trigoPlacar.y = display.screenOriginX + 112, display.screenOriginY+14

	tomatePlacar = display.newImageRect (uiGroup, "imagens/fazenda/fazendaSprites/fazendaBarra/sementes/tomate.png", 36, 33)
	tomatePlacar.x, tomatePlacar.y = display.screenOriginX + 150, display.screenOriginY+14

	textoPlacarAlface = display.newText (uiGroup, valorAlface, display.screenOriginX + 30, display.screenOriginY+36, native.systemFont, 18)
	textoPlacarAlface:setFillColor (0, 0, 0)

	textoPlacarBatata = display.newText (uiGroup, valorAlface, display.screenOriginX + 70, display.screenOriginY+36, native.systemFont, 18)
	textoPlacarBatata:setFillColor (0, 0, 0)

	textoPlacarTrigo = display.newText (uiGroup, valorAlface, display.screenOriginX + 110, display.screenOriginY+36, native.systemFont, 18)
	textoPlacarTrigo:setFillColor (0, 0, 0)

	textoPlacarTomate = display.newText (uiGroup, valorAlface, display.screenOriginX + 150, display.screenOriginY+36, native.systemFont, 18)
	textoPlacarTomate:setFillColor (0, 0, 0)

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
		sementeAlface:addEventListener ("touch", moverSementeAlface)
		sementeBatata:addEventListener ("touch", moverSementeBatata)
		sementeTrigo:addEventListener ("touch", moverSementeTrigo)
		sementeTomate:addEventListener ("touch", moverSementeTomate)
		botaoSemente:addEventListener ("tap", clickBotao)
		adubo:addEventListener ("touch", moverAdubo)
		agua:addEventListener ("touch", moverAgua)
		selecao:addEventListener ("touch", moverSelecao)
		Runtime:addEventListener ("collision", onColision)
		Runtime:addEventListener ("collision", onColision1)
		Runtime:addEventListener ("collision", onColision2)
		Runtime:addEventListener ("collision", onColision3)
		Runtime:addEventListener ("collision", onColision4)
		Runtime:addEventListener ("collision", onColision5)
		Runtime:addEventListener ("collision", onColision6)
		Runtime:addEventListener ("collision", onColision7)
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
		sementeAlface:removeEventListener ("touch", moverSementeAlface)
		sementeBatata:removeEventListener ("touch", moverSementeBatata)
		sementeTrigo:removeEventListener ("touch", moverSementeTrigo)
		sementeTomate:removeEventListener ("touch", moverSementeTomate)
		botaoSemente:removeEventListener ("tap", clickBotao)
		adubo:removeEventListener ("touch", moverAdubo)
		agua:removeEventListener ("touch", moverAgua)
		selecao:removeEventListener ("touch", moverSelecao)
		Runtime:removeEventListener ("collision", onColision)
		Runtime:removeEventListener ("collision", onColision1)
		Runtime:removeEventListener ("collision", onColision2)
		Runtime:removeEventListener ("collision", onColision3)
		Runtime:removeEventListener ("collision", onColision4)
		Runtime:removeEventListener ("collision", onColision5)
		Runtime:removeEventListener ("collision", onColision6)
		Runtime:removeEventListener ("collision", onColision7)
		Runtime:removeEventListener ("enterFrame", endLevel)
		physics.pause ()
		composer.removeScene ("fazenda")
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
