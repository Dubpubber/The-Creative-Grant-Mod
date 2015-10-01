--
-- Author: Dubpub
-- Date: 9/28/2015
-- Time: 10:55 PM
--
local CTMList = {
    "AssignBodyGuard",
    "CallAllGuardsHere",
    "CureAllPrisoners",
    "InfectPatientZero",
    "Luther",
    "MakeAllAngry",
    "OpenAllDoors",
    "PlaceRandomContraband",
    "RemoveAllFires",
    "RestAllGuards",
    "SatisfyAllNeeds",
    "SpawnInmate",
    "Spawn2Inmates",
    "Spawn3Inmates",
    "SpawnFire",
    "StopEscapingPrisoners",
    "TunnelDectector",
    "StartRiot"
}

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function Create()
    for _, type in ipairs(CTMList) do
        Game.DebugOut("Type: " .. type);
        local EntityType = this.GetNearbyObjects(type, 1000);
        if tablelength(EntityType) > 0 then
            for Entity, _ in next, EntityType do
                Entity.Delete();
            end
        end
    end
    this.Delete();
end

