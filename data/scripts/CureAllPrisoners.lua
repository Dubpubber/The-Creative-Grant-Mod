--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 8:49 PM
-- Use as you please, it's LUA for christ's sake.
--

function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 10000);

    for Prisoner, _ in next, Prisoners do
        Prisoner.StatusEffects.virus = 0;
    end
end

