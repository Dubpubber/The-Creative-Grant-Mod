--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 2:24 AM
-- Use as you please, it's LUA for christ's sake.
--


-- On creation, since this is just a placeable so we can use it's position to iterate over what we need, delete it as soon as it's created.
function Create()
    -- Get all the prisoners hopefully in the prison.
    local prisoners = this.GetNearbyObjects("Prisoner", 10000);

    -- Iterate over the list of objects.
    for Prisoner, _ in next, prisoners do
        for Need, _ in next, Prisoner.Needs.NeedsMetaTable.SetterTable do
            Prisoner.Needs[Need] = 0;
        end
    end

    this.Delete();
end