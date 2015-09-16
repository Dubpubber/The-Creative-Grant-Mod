--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 8:00 PM
-- Use as you please, it's LUA for christ's sake.
--

function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 100);
    for Prisoner, _ in next, Prisoners do
        local misb = Prisoner.Misbehavior;
        if misb ~= nil and misb == "Escaping" then
            Prisoner.StatusEffects.tazed = 1;
        end
    end
    this.Delete();
end

