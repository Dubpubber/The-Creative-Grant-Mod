--
-- Author: Dubpub
-- Date: 10/9/2015
-- Time: 4:03 PM
--
local Time = Game.Time;
local Delay = 5;

local Ready = Time();
local isAvatar = false;

local selector;

function checkAvatarStatus()
    if Object.GetProperty(this, "AvatarControl") == true then
        isAvatar = true;
        this.Routine = 0;
        Game.DebugOut("Avatar found!");
        Game.DebugOut("Hey there! The below redness is intentional, please don't report it.");
        Game.DebugOut("To spawn the selector, face north for the next 5 seconds, I'll let you know.");
        print("");
    end
end

-- Naming patterns? FUCK THAT.
function GetSelectorSelection()
    local i = selector.GetProperty("Selection");
    return i;
end

function SpawnSelector()
    -- Spawns the selector. The player is then prompted to press F3 on the selector, as indicated on the sprite itself.
    selector = Object.Spawn("Selector", this.Pos.x, this.Pos.y - 1);
    selector.SetProperty("Selection", 0);
    Game.DebugOut("Don't fear this console! The above redness is not a bug!");
    Game.DebugOut("I'm the selector. I will help you pick trainer options while in escape mode.");
    Game.DebugOut("To despawn me, just punch me. I'll despawn soon.");
    Game.DebugOut("Current Selection: [0] - Nothing Will Happen");
end

function UpdateSelector()
    -- check north, if north, select this option and act accordiningly. Or.y = -1
    if this.Or.y == -1 then

    end
    -- check south, if south, move to the next option. Or.y = 1
    if this.Or.y == 1 then

    end
end

function ProcessSelection()
    -- North = next action, South = select action
end

function ProcessDanceRoutine()
    -- First the player must face north.
    local orio = math.sign(this.Or.y);
    if this.Routine == 0 and orio < 0 then
        this.Routine = 1;
        Game.DebugOut("Awesome, now keep facing north. Routine val: " .. this.Routine);
        return this.Routine;
    end

    -- Second the player must, again, face north.
    if this.Routine == 1 and orio < 0 then
        this.Routine = 2;
        Game.DebugOut("Good, now face south. Routine val: " .. this.Routine);
        return this.Routine;
    end

    -- Finally the player must face south.
    if this.Routine == 2 and orio > 0 then
        this.Routine = 3;
        Game.DebugOut("You did it! Spawning the selector! Routine val: " .. this.Routine);
        return this.Routine;
    end

end

function Create()

end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay
    end
end

-- Update following.
function Act( elapsedTime )
    -- No need to call this method after we found the player and his/her avatars.
    if isAvatar == false then
        checkAvatarStatus();
    else
        if selector then

        else
            -- Make the player dance to spawn the selector.
            -- Dance routine = North North South to Or(ientation): <0, <0, >0
            if this.Routine == 0 or this.Routine < 2 then
                if ProcessDanceRoutine() == 3 then
                    -- Spawn selector!
                    SpawnSelector();
                end
            end
        end
    end
end
