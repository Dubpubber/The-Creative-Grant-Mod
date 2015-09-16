--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 8:00 PM
-- Use as you please, it's LUA for christ's sake.
--

-- Spawns 3 inmates.
function Create()
    local i = 0;
    repeat
        Object.Spawn("Prisoner", this.Pos.x, this.Pos.y + i);
        i = i + 1;
    until i == 3;
    this.Delete();
end

