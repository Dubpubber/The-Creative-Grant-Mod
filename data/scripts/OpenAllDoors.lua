--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/16/2015
-- Time: 3:41 AM
-- Use as you please, it's LUA for christ's sake.
--

local Time = Game.Time;
-- Times this by 2 to get the actual value, so six seconds in game time.
local Delay = 3;
-- This needs to change. (Basically trying to prevent it from running immeaditaly)
local RunCount = 0;

local Ready = Time();


local DoorType = {
    "JailDoor", "JailDoorLarge", "SolitaryDoor", "RemoteDoor", "RoadGate", "Door", "StaffDoor"
}

function toggleDoors( open )
    for _, Type in ipairs(DoorType) do
        local DoorsByType = this.GetNearbyObjects(Type, 1000);
        for Door, _ in next, DoorsByType do
            Door.Open = open;
        end
    end
end

function Create()
    toggleDoors(1);
end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay
        RunCount = RunCount + 1;
    end
end

-- Update following.
function Act( elapsedTime )
    if RunCount > 1 then
        toggleDoors(0);
        this.Delete();
    end
end
