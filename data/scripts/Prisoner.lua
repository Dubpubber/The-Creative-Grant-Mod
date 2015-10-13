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

local commands = {
    [1] = {'Give Shotgun'},
    [2] = {'Start Riot'},
    [3] = {'Heal'}
}

function checkAvatarStatus()
    if Object.GetProperty(this, "AvatarControl") == true then
        isAvatar = true;
        this.Routine = 0;
        Game.DebugOut("Avatar found!");
        Game.DebugOut("|=|=|-Creative Trainer Mod by Dubpub-|=|=|");
        Game.DebugOut("Hey there! The below redness is intentional, please don't report it.");
        Game.DebugOut("To spawn the selector, face north for the next 5 seconds, I'll let you know.");
        print("");
        Game.DebugOut("|=|=|-ABOVE ERROR IS INTENTIONAL. DO NOT REPORT IT!!!-|=|=|");
    end
end

function DeleteSelector()
    selector.Delete();
    selector = nil;
    Game.DebugOut("Deleting the selector.");
    Delay = 5;
end

function SpawnSelector()
    -- Spawns the selector. The player is then prompted to press F3 on the selector, as indicated on the sprite itself.
    selector = Object.Spawn("Selector", this.Pos.x, this.Pos.y - 1);
    selector.Selection = 0;
    Game.DebugOut("|=|=|-------------------------------------|=|=|");
    Game.DebugOut("I'm the selector. I will help you pick trainer options while in escape mode.");
    Game.DebugOut("To despawn me, just punch me. I'll despawn soon.");
    Game.DebugOut("-INSTRUCTIONS ON USAGE-");
    Game.DebugOut(" - The Selector will print out options to this console, so don't close it.");
    Game.DebugOut(" - SELECTING A COMMAND: Face NORTH (UP) and wait.");
    Game.DebugOut(" - SKIPPING TO NEXT COMMAND: Face SOUTH (DOWN) and wait.");
    Game.DebugOut("Current Selection: [0] - Nothing Will Happen");
    Game.DebugOut("|=|=|-------------------------------------|=|=|");
end

function UpdateSelector()

    -- If the selector is dead, despawn him and reset the delay.
    if selector.Damage > 0.80 then
        DeleteSelector();
    end

    -- check north, if north, select this option and act accordiningly. Or.y = -1
    if this.Or.y < 0 then
        -- Activate the selected command. Lack of switch statements make me fucking gag.
        -- Sorry to have to do this, I sweawr if there was any other way, I would.
        local selection = selector.Selection;
        if selection == 1 then
            -- Give Shotgun
            this.Equipment = 42;
        elseif selection == 2 then
            -- Start Riot
            Object.Spawn("StartRiot", this.Pos.x, this.Pos.y);
        elseif selection == 3 then
            -- Heal
            this.Damage = 0;
        end
        -- After the player selects, delete the selector.
        DeleteSelector();
    end
    -- check south, if south, move to the next option. Or.y = 1
    if this.Or.y > 0 then
        if selector.Selection + 1 <= 3 then
            selector.Selection = selector.Selection + 1;
            Game.DebugOut("Current selection: " .. selector.Selection .. ". Command: " .. commands[selector.Selection][1]);
        else
            -- Reset the selection.
            selector.Selection = 0;
        end
    end
end

function ProcessDanceRoutine()
    -- First the player must face north.
    local orio = this.Or.y;
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
        if selector ~= nil then
            Game.DebugOut("Updating selector!");
            UpdateSelector();
            -- Don't want to make too many calls.
            if Delay ~= 2 then
                Delay = 2;
            end
        else
            -- Make the player dance to spawn the selector.
            -- Dance routine = North North South to Or(ientation): <0, <0, >0
            if this.Routine == 0 or this.Routine < 3 then
                if ProcessDanceRoutine() == 3 then
                    -- Spawn selector!
                    SpawnSelector();
                end
            end
        end
    end
end
