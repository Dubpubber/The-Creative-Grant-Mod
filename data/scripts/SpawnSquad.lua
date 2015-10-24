--
-- Author: Dubpub
-- Date: 10/16/2015
-- Time: 12:22 AM
--

local Time = Game.Time;
local Delay = 2;

local Ready = Time();

local Squad = {};

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-- Upon new squad creation, make sure there aren't any other squads active. Only one squad can be active at a time.
function checkForActiveEnforcement()
    if tablelength(this.GetNearbyObjects("SpawnSquad", 1000)) > 1 then
       return true;
    end
    return false;
end

-- If any guard is nearby any of the squad members, heal them up.
function findHurtGuardNearby()
    for _, v in next, Squad do
        if v.MedKits > 0 then
            local guards = v.GetNearbyObjects("Guard", 10);
            if guards then
                -- If there are guards closeby, fix em up.
                guards[1].Damage = 0.00;
                v.MedKits = v.MedKits - 1;
            end
        end
    end
end

function Create()
    if checkForActiveEnforcement() == false then
       -- No squads are currently active, safe to spawn another.
       for i = 1, 6 do
           Squad[i] = Object.Spawn("ArmedGuard", this.Pos.x, this.Pos.y);
           Squad[i].Equipment = 45;
           Object.SetProperty(Squad[i], "MedKits", 3);
           Object.SetProperty(Squad[i], "SideArms", 2);
           Object.SetProperty(Squad[i], "Extinguishers", 2);
       end
    else
        this.Delete();
    end
end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay;
    end
end

function Act( elapsedTime )

end