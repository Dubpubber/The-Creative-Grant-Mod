--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/16/2015
-- Time: 4:24 PM
-- Use as you please, it's LUA for christ's sake.
--

--[[
-- Luther's main goal is basically to f**k your prison.
-- ]]
local Time = Game.Time;
local Delay = 10;

local KillDelay = 0;
local KillTime = 60;

local Ready = Time();

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function HuntForPrisoner()
    local hunted = this.GetNearbyObjects("Prisoner", 100);
    local size = tablelength(hunted);
    local picked = math.random(1, size);
    local count = 1;
    local target;
    if size > 0 then
        for Prisoner, _ in next, hunted do
            -- Did we find him?
            if count == picked then
                target = Prisoner;
            end
            count = count + 1;
            -- Manipulate the lot!
            Prisoner.StatusEffects.angst = 2500;
            Prisoner.StatusEffects.suppressed = 0;
            Prisoner.StatusEffects.calming = 0;
            Prisoner.Needs.Freedom = 200;
            Prisoner.Needs.Food = 200;
            Prisoner.Needs.Hygiene = 200;
            Prisoner.Needs.Family = 200;
            Prisoner.BoilingPoint = 100;
            -- This particular prisoner is misbehaving in some way... MAKE HIM RIOT!
            if Object.GetProperty(Prisoner, "Misbehavior") ~= nil then
                Prisoner.Misbehavior = "Rioting";
            end
            -- If the prisoner is using held equipment... GIVE HIM A SHOTGUN!
            if Object.GetProperty(Prisoner, "Equipment") ~= nil then
                Prisoner.Equipment = "Shotgun";
            end
        end
    end

    if target == nil then
        Game.DebugOut("Target was nil...");
    end

    return target;
end

function ScareNearbyGuards( injure )
    local guards = this.GetNearbyObjects("Guard", 75);
    if tablelength(guards) > 0 then
        for Guard, _ in next, guards do
            -- Push the guards away.
            Guard.Damage = 0.85;
            Guard.Energy = 0;
        end
    end
end

function Create()
    Object.Sound("_Contraband", "SearchPrisoner");
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
    -- Get a victim
    local target = HuntForPrisoner();

    this.Pos.x = target.Pos.x;
    this.Pos.y = target.Pos.y;

    local hork = math.random(1,15);
    if hork > 1 and hork < 5 then
        -- Hurt
        target.Damage = 0.5;
    elseif hork > 5 and hork < 9 then
        -- Give them a status effect
        target.StatusEffects.virusdeadly = 1000;
    elseif hork > 9 and hork < 13 then
        target.StatusEffects.overdosed = 50;
    elseif hork == 14 then
        target.StatusEffects.wounded = 50;
    elseif hork == 15 then
        -- If kill, scare the guards.
        -- Kill
        target.Damage = 1;
    end

    local scareFactor = math.random(1,2);
    if scareFactor == 1 then
        Game.DebugOut("Scaring nearby guards!");
        ScareNearbyGuards( scareFactor );
    end

    if KillDelay == KillTime then
        this.Delete();
    end
end
