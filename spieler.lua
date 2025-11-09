local Spieler = { geschwindigkeit = 100}
Spieler.__index = Spieler

function Spieler.neu(x, y)
    local self = setmetatable({}, Spieler)
    self.x = x or 100
    self.y = y or 200
    self.letztePositionen = {}
    return self
end

function Spieler:bewege(dt, keyboard)
    if (keyboard.isDown("right")) then
        self.x = self.x + self.geschwindigkeit * dt
    end
    if (keyboard.isDown("left")) then
        self.x = self.x - self.geschwindigkeit * dt
    end
    if (keyboard.isDown("down")) then
        self.y = self.y + self.geschwindigkeit * dt
    end
    if (keyboard.isDown("up")) then
        self.y = self.y - self.geschwindigkeit * dt
    end
end

return Spieler
