--
-- Author: Dubpub
-- Date: 10/13/2015
-- Time: 3:08 PM
--

function Create()
    -- Start, lile always, by getting the nearby prisoners.
    local Prisoners = this.GetNearbyObjects("Guard", 10);

    for Prisoner, _ in next, Prisoners do
        for param, _ in next, Prisoner.WorldObjectMetaTable.ThisGetterTable do
            local prop = Object.GetProperty(Prisoner, param);
            Game.DebugOut("Param: " .. param .. " Property Value: " .. tostring(prop));
        end
    end
end