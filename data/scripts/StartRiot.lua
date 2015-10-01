--
-- Author: Dubpub
-- Date: 9/30/2015
-- Time: 8:12 PM
--

function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 1000);
    for Prisoner, _ in next, Prisoners do
        Prisoner.Misbehavior = 6;
    end
    this.Delete();
end

