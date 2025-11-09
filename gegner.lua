

local Gegner = { geschwindigkeit = 70, ziel = nil }
Gegner.__index = Gegner

function Gegner.neu()
    local self = setmetatable({}, Gegner)
    return self
end

function Gegner:update(dt, spieler)
    if (spieler.letztePositionen[10]) then
        self.ziel = {}
        self.ziel.x = spieler.letztePositionen[10].x
        self.ziel.y = spieler.letztePositionen[10].y
    end 
    
    if (self.ziel) then
        local dirX = self.ziel.x - self.x
        local dirY = self.ziel.y - self.y
        local length = math.sqrt(dirX * dirX + dirY * dirY)
        if length > 10 then
            dirX = dirX / length
            dirY = dirY / length
            self.x = self.x + dirX * self.geschwindigkeit * dt
            self.y = self.y + dirY * self.geschwindigkeit * dt
        end
    end
end

return Gegner