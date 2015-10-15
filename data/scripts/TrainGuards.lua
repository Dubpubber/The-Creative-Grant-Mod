--
-- Author: Dubpub
-- Date: 10/13/2015
-- Time: 3:08 PM
--

--[[
-- I'm this close to making this work, hopefully I'll figure it out soon.
-- ]]
function Create()
    local Guards = this.GetNearbyObjects("Guard", 1000);

    for Guard, _ in next, Guards do
        if tostring(Object.GetProperty(Guard, "TazerTrained")) ~= 'true' then
            local tempTable = {};
            local gtable = getmetatable(Guard);
            tempTable = gtable;
            tempTable.TazerTrained = true;
            setmetatable(gtable, tempTable);
            Game.DebugOut("Fuck you, Introversion. " .. tostring(tempTable.TazerTrained) .. " " .. tostring(gtable.TazerTrained));
            for param, i in next, Guard.WorldObjectMetaTable.ThisGetterTable do
                local prop = Object.GetProperty(Guard, param);
                Game.DebugOut("Param: " .. param .. " Property Value: " .. tostring(prop) .. " " .. tostring(i));
            end
        end
    end
end

--[[
for param, _ in next, Guard.WorldObjectMetaTable.ThisGetterTable do
    local prop = Object.GetProperty(Prisoner, param);
    Game.DebugOut("Param: " .. param .. " Property Value: " .. tostring(prop));
end
]]
