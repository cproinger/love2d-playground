

function love.load()
    player = {}
    player.x = 100
    player.y = 200
    player.locationHistory = {}
    player.speed = 100

    enemy = {}
    enemy.x = 800
    enemy.y = 200
    enemy.speed = 70

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
    
    if (enemy.target) then
        local dirX = enemy.target.x - enemy.x
        local dirY = enemy.target.y - enemy.y
        local length = math.sqrt(dirX * dirX + dirY * dirY)
        if length > 10 then
            dirX = dirX / length
            dirY = dirY / length
            enemy.x = enemy.x + dirX * enemy.speed * dt
            enemy.y = enemy.y + dirY * enemy.speed * dt
        end
    end
end

function love.draw()
    love.graphics.setColor(0, 1, 0)  -- Set color to green for the player
    love.graphics.rectangle("fill", player.x, player.y, 50, 50)

    love.graphics.setColor(1, 0, 0)  -- Set color to red for the enemy
    love.graphics.rectangle("fill", enemy.x, enemy.y, 50, 50)
end
