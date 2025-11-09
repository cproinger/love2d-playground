

function love.load()
    player = {}
    player.x = 100
    player.y = 200
    player.locationHistory = {}
    player.speed = 100

    local Enemy = require("enemy")
    enemy = Enemy.new()
    enemy.x = 800
    enemy.y = 200
end

function love.update(dt)
    
    if (love.keyboard.isDown("right")) then
        player.x = player.x + player.speed * dt
    end
    if (love.keyboard.isDown("left")) then
        player.x = player.x - player.speed * dt
    end
    if (love.keyboard.isDown("down")) then
        player.y = player.y + player.speed * dt
    end
    if (love.keyboard.isDown("up")) then
        player.y = player.y - player.speed * dt
    end
    
    table.insert(player.locationHistory, 1, {x = player.x, y = player.y})
    table.remove(player.locationHistory, 11)  -- Keep only the last 10 positions
    if (player.locationHistory[10]) then
        enemy.target = {}
        enemy.target.x = player.locationHistory[10].x
        enemy.target.y = player.locationHistory[10].y
    end 

    enemy:update(dt, player)
end

function love.draw()
    love.graphics.setColor(0, 1, 0)  -- Set color to green for the player
    love.graphics.rectangle("fill", player.x, player.y, 50, 50)

    love.graphics.setColor(1, 0, 0)  -- Set color to red for the enemy
    love.graphics.rectangle("fill", enemy.x, enemy.y, 50, 50)
end
