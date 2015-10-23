--
-- Author: Dubpub
-- Date: 10/22/2015
-- Time: 11:35 PM
--

function Create()
    inmates = math.random(1, 120);
    for i = 1, inmates do
        -- Count to the random variable
        Object.Spawn("Prisoner", this.Pos.x, this.Pos.y);
    end
end

