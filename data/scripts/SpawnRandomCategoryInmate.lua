--
-- Author: Dubpub
-- Date: 10/16/2015
-- Time: 10:44 PM
--

function Create()
    local prisoner = Object.Spawn("Prisoner", this.Pos.x, this.Pos.y);
    prisoner.Category = math.random(1, 4);
end

