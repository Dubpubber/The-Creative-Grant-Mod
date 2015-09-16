--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 7:48 PM
-- Use as you please, it's LUA for christ's sake.
--
-- Self explanitory, no?
function Create()
    local fires = this.GetNearbyObjects("Fire", 10000);
    for Fire, _ in next, fires do
        Fire.Delete();
    end
    this.Delete();
end

