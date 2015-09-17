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
    "WoodenPickAxe", "Spade", "Axe", "AssaultRifle", "Shotgun", "Gun", "Drill", "Hammer", "Sheers", "Scissors", "Medicine", "Drugs", "Screwdriver", "Lighter", "MobilePhone",
    "Cigs", "Saw", "JailKeys", "Posion", "Booze", "Needle", "Spoon", "Fork", "Knife", "Shank", "Baton", "Club"
}

function Create()
    local tempGuard = Object.Spawn("ArmedGuard", this.Pos.x, this.Pos.y);

    if tempGuard ~= nil then
        tempGuard.Damage = 0.85;
        Object.SetProperty(tempGuard, "SecondaryEquipment", ContrabandList[math.random(#ContrabandList)]);
        tempGuard.Delete();
    end
    this.Delete();
end
