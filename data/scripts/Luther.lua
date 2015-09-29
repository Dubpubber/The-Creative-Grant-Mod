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
    local target;
    if size > 0 then
        local picked = math.random(1, size);
        local count = 1;
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

function ScareNearbyGuards()
    local guards = this.GetNearbyObjects("Guard", 10);
    if tablelength(guards) > 0 then
        for Guard, _ in next, guards do
            local eventID = math.random(1, 3);
            if eventID == 1 then
                -- RUN AWAY!
                Guard.ClearRouting();
                Guard.NavigateTo(this.Pos.x + 10, this.Pos.y);
            elseif eventID == 2 then
                -- Teleport to front of prison property
                Guard.Pos.x = 50;
                Guard.Pos.y = 50;
            else
               -- Knock out guard.
                Guard.Damage = 0.85;
            end
        end
    end
end

function Create()

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
    if target ~= nil then
        -- Teleport to victim
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

        local eventID = math.random(1,4);
        if eventID == 1 then
            Game.DebugOut("Scaring nearby guards!");
            ScareNearbyGuards();
        elseif eventID == 2 then
            Game.DebugOut("Spawn new, angry, inmates!");
            local count = 0;
            repeat
                local Prisoner = Object.Spawn("Prisoner", this.Pos.x, this.Pos.y);
                Prisoner.StatusEffects.angst = 2500;
                Prisoner.StatusEffects.suppressed  = 0;
                Prisoner.BoilingPoint = 100;
                count = count + 1;
            until(count == hork);
        elseif eventID == 3 then
            Game.DebugOut("Spawn some tasty contraband.");
            local tempGuard = Object.Spawn("ArmedGuard", this.Pos.x, this.Pos.y);
            local tempDoc = Object.Spawn("Doctor", this.Pos.x, this.Pos.y);
            if tempGuard ~= nil and tempDoc ~= nil then
                tempGuard.Damage = 0.85;
                tempGuard.Delete();

                tempDoc.Damage = 0.85;
                tempDoc.Delete();
            end
        elseif eventID == 4 then
            Game.DebugOut("Set all status effects to rioting!");
            local prisoners = this.GetNearbyObjects("Prisoner", 50);
            for Prisoner, _ in next, prisoners do
                local misb = Prisoner.Misbehavior;
                if misb ~= nil then
                    Prisoner.StatusEffects.rioting = 1;
                end
            end
        end
    end
    if KillDelay == KillTime then
        this.Delete();
    end
end
