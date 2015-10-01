--
-- Author: Dubpub
-- Date: 9/30/2015
-- Time: 8:25 PM
--

function Create()
    local Spawnee = Object.Spawn("Guard", this.Pos.x, this.Pos.y);
    local Prisoners = this.GetNearbyObjects("Guard", 50);
    for Prisoner, _ in next, Prisoners do
        Prisoner.FollowId.i = Spawnee.Id.i;
        Prisoner.FollowId.u = Spawnee.Id.u;
    end
    this.Delete();
end

