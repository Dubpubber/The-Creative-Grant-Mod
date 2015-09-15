--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 3:55 AM
-- Use as you please, it's LUA for christ's sake.
--

function Create()
    Object.Spawn("Fire", this.Pos.x, this.Pos.y);
    this.Delete();
end


