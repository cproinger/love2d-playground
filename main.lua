

function love.load()
    spieler = {}
    spieler.x = 100
    spieler.y = 200
    spieler.letztePositionen = {}
    spieler.geschwindigkeit = 100

    local Gegner = require("gegner")
    gegner = Gegner.neu()
    gegner.x = 600
    gegner.y = 200
end

function love.update(dt)
    
    if (love.keyboard.isDown("right")) then
        spieler.x = spieler.x + spieler.geschwindigkeit * dt
    end
    if (love.keyboard.isDown("left")) then
        spieler.x = spieler.x - spieler.geschwindigkeit * dt
    end
    if (love.keyboard.isDown("down")) then
        spieler.y = spieler.y + spieler.geschwindigkeit * dt
    end
    if (love.keyboard.isDown("up")) then
        spieler.y = spieler.y - spieler.geschwindigkeit * dt
    end
    
    table.insert(spieler.letztePositionen, 1, {x = spieler.x, y = spieler.y})
    table.remove(spieler.letztePositionen, 11)  -- Keep only the last 10 positions

    gegner:update(dt, spieler)
end

function love.draw()
    love.graphics.setColor(0, 1, 0)  -- Set color to green for the player
    love.graphics.rectangle("fill", spieler.x, spieler.y, 50, 50)

    love.graphics.setColor(1, 0, 0)  -- Set color to red for the enemy
    love.graphics.rectangle("fill", gegner.x, gegner.y, 50, 50)
end
