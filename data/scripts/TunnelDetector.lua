--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/17/2015
-- Time: 3:21 PM
-- Use as you please, it's LUA for christ's sake.
--

--[[
-- Currently nonfunctional. It appears that tunnels are not objects.
-- ]]
local Time = Game.Time;
local Delay = 5;

local Ready = Time();

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function Create()
    local tunnels = this.GetNearbyObjects("Tunnels", 20);
    if tablelength(tunnels) > 0 then
        Game.DebugOut("There are " .. tablelength(tunnels) .. " tunnels nearby this location.");
        Game.DebugOut("This window will close in 5 seconds.");
    end
end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay
    end
end

local runCount = 0;

-- Update following.
function Act( elapsedTime )
    if runCount > 0 then
        this.Delete();
    else
        runCount = runCount + 1;
    end
end