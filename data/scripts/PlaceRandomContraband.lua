--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/16/2015
-- Time: 4:01 AM
-- Use as you please, it's LUA for christ's sake.
--

--[[
-- Simply put, this will place a random bit of contraband on the ground where clicked. Have Fun!
-- ]]

local ContrabandList = {
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 28, 29, 30, 32, 33, 37, 42, 43, 44, 45, 46, 47
}

function Create()
    local temp = Object.Spawn("Workman", this.Pos.x, this.Pos.y);

    if temp ~= nil then
        temp.Damage = 0.85;
        temp.Equipment = ContrabandList[math.random(#ContrabandList)];
        temp.Delete();
    end
    this.Delete();
end
