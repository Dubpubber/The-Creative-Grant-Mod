--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 8:00 PM
-- Use as you please, it's LUA for christ's sake.
--
-- Spawns a single inmate, obviously. I mean, look at the code dude.
function Create()
    Object.Spawn("Prisoner", this.Pos.x, this.Pos.y);
    this.Delete();
end

