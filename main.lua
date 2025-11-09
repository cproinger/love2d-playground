

function love.load()
    local Spieler = require("spieler")
    spieler = Spieler.neu(100, 200);

    local Gegner = require("gegner")
    gegner = Gegner.neu()
    gegner.x = 600
    gegner.y = 200
end

function love.update(dt)
    spieler:bewege(dt, love.keyboard)
    
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
