--
-- Author: Dubpub
-- Date: 10/12/2015
-- Time: 10:46 PM
--

function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 1000);
    for Prisoner, _ in next, Prisoners do
        Prisoner.Misbehavior = 0;
    end
    this.Delete();
end