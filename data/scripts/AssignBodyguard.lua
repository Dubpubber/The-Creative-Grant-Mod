--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 4:02 AM
-- Use as you please, it's LUA for christ's sake.
--

--[[
-- !!!THIS IS VERY EARLY IMPLENTATION AND HIGHLY EXPERIMENTAL!!!
--
 - I will be improving on pathfinding as more access to the api becomes avialable.
 - If you have any advice on how the code can be improved, please pm me on the introversion forums or this mods discussion page.
 - Feel free to copy, remake, do really whatever you want. Like said, be wary. This code may be determental to performance.
-- ]]

local Time = Game.Time;
local Delay = 2;
-- It's going to set the routing 30 times before deleting the guard.
local KillDelay = 0;
local KillTime = 30;

local Ready = Time();

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local bodyguard;

local function findFollower()
    local founders = this.GetNearbyObjects( "Prisoner", 15 );
    local founder

    for Prisoner, _ in next, founders do
        founder = Prisoner;
    end

    return founder;
end

local follower = findFollower();

function Create()
    bodyguard = Object.Spawn("Guard", this.Pos.x, this.Pos.y);
    if bodyguard ~= nil then
        if follower ~= nil then
            bodyguard.NavigateTo(follower.Pos.x, follower.Pos.y);
        else
            bodyguard.Delete();
        end
    end
    this.Delete();
end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay
        KillDelay = KillDelay + 1;
    end
end

-- Update following.
function Act( elapsedTime )
    bodyguard.ClearRouting();
    bodyguard.NavigateTo(follower.Pos.x, follower.Pos.y);
    if KillDelay == KillTime then
        bodyguard.ClearRouting();
        bodyguard.Delete();
    end
end