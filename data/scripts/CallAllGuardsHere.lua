--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 2:38 AM
-- Use as you please, it's LUA for christ's sake.
--

function Create()
    local NearbyGuards = this.GetNearbyObjects("Guard", 100);

    for Guard, _ in next, NearbyGuards do
        Guard.NavigateTo(this.Pos.x, this.Pos.y);
    end

    this.Delete();
end

