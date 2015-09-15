--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 4:02 AM
-- Use as you please, it's LUA for christ's sake.
--

local Time = Game.Time;
local Delay = 5;
local Cutoff = 60;
local Ready = Time();

local assignedGuard;
local assignedPrisoner;

function Create()
    local Guards = this.GetNearbyObjects("Guard", 100, 100);
    local Prisoners = this.GetNearbyObjects("Prisoner", 3, 3);

    if Guards[1] ~= nil then
        assignedGuard = Guards[1];
    end

    if Prisoners[1] ~= nil then
        assignedGuard = Prisoners[1];
    end

    if assignedGuard ~= nil and assignedPrisoner ~= nil then
        assignedGuard.NavigateTo(assignedPrisoner.Pos.x, assignedPrisoner.Pos.y);
        Game.DebugOut("MAde it here.");
    end
end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay
    elseif Ready > Cutoff then
        assignedGuard.ClearRouting();
        this.Delete();
    end
end

-- Update following.
function Act( elapsedTime )
    if not assignedGuard then
        assignedGuard.NavigateTo(assignedPrisoner.Pos.x, assignedPrisoner.Pos.y);
    end
end