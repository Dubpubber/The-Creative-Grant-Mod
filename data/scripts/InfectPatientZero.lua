--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 8:21 PM
-- Use as you please, it's LUA for christ's sake.
--

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 1000);
    local index = math.random(1, tablelength(Prisoners));
    Game.DebugOut("Index: " .. index .. " Size: " .. tablelength(Prisoners));

    local PatientZero;
    local find = 1;
    for Prisoner, Range in next, Prisoners do
        -- Since we're infecting patient zero, remove all ailments from iterating prisoners.
        Prisoner.StatusEffects.virus = 0;
        if find == index then
            -- found him, return the prisoner.
            PatientZero = Prisoner;
        else
            find = find + 1;
        end
    end

    -- It appears that 1-5000 indicates the need level for virus. The more the number, the more lethal it is.
    PatientZero.StatusEffects.virus = 10000;

    this.Delete();
end