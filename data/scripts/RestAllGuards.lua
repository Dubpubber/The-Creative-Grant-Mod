--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/16/2015
-- Time: 2:57 AM
-- Use as you please, it's LUA for christ's sake.
--

local Type = {
    "ArmedGuard", "Guard", "DogHandler", "Dog"
}

function Create()
    for _, Type in ipairs(Type) do
        local GuardsByType = this.GetNearbyObjects(Type, 1000);
        for Entity, _ in next, GuardsByType do
            Entity.Energy = 100;
        end
    end
    this.Delete();
end

