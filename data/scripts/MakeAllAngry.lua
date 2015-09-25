--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 8:53 PM
-- Use as you please, it's LUA for christ's sake.
--

--[[
-- My most favorite script. Makes all the prisoners in your prison extremely angry! Might cause riot! BEWARE!
-- ]]
function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 1000);
    for Prisoner, _ in next, Prisoners do
        Prisoner.StatusEffects.angst = 2500;
        Prisoner.StatusEffects.suppressed  = 0;

        Prisoner.Needs.Bowels = 200;
        Prisoner.Needs.Bladder = 200;
        Prisoner.Needs.Clothing = 200;
        Prisoner.Needs.Comfot = 200;
        Prisoner.Needs.Enviroment = 200;
        Prisoner.Needs.Excercise = 200;
        Prisoner.Needs.Family = 200;
        Prisoner.Needs.Food = 200;
        Prisoner.Needs.Freedom = 200;
        Prisoner.Needs.Hygiene = 200;
        Prisoner.Needs.Literacy = 200;
        Prisoner.Needs.Privacy = 200;
        Prisoner.Needs.Recreation = 200;
        Prisoner.Needs.Safety = 200;
        Prisoner.Needs.Spirituality = 200;

        -- Found a fix, thanks @Reddit:User[RunOutOfNames]
        if Object.GetProperty(Prisoner, "Needs.Alcohol") ~= nil then
            Prisoner.Needs.Alchohol = 200;
        end

        if Object.GetProperty(Prisoner, "Needs.Drugs") ~= nil then
            Prisoner.Needs.Drugs = 200;
        end

        Prisoner.BoilingPoint = 100;
    end
    this.Delete();
end