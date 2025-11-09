

local Enemy = { speed = 70, target = nil }
Enemy.__index = Enemy

function Enemy.new()
    local self = setmetatable({}, Enemy)
    return self
end

function Enemy:update(dt, player)
    if (player.locationHistory[10]) then
        self.target = {}
        self.target.x = player.locationHistory[10].x
        self.target.y = player.locationHistory[10].y
    end 
    
    if (self.target) then
        local dirX = self.target.x - self.x
        local dirY = self.target.y - self.y
        local length = math.sqrt(dirX * dirX + dirY * dirY)
        if length > 10 then
            dirX = dirX / length
            dirY = dirY / length
            self.x = self.x + dirX * self.speed * dt
            self.y = self.y + dirY * self.speed * dt
        end
    end
end

return Enemy