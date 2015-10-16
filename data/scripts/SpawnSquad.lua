--
-- Author: Dubpub
-- Date: 10/16/2015
-- Time: 12:22 AM
--

local Time = Game.Time;
local Delay = 3;

local Ready = Time();

local Squad = {};

function Create()
    local i = 0;
    repeat
        Squad[i] = Object.Spawn("Soldier", this.Pos.x, this.Pos.y);
        i = i + 1;
    until i < 5;
end

function Update()
    if Time() > Ready then
        Act( Delay )
        Ready = Ready + Delay;
    end
end

function Act( elapsedTime )
    
end