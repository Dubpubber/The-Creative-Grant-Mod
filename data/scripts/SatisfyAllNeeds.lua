--
-- I never tread... lightly.
-- Author: Dubpub
-- Date: 9/15/2015
-- Time: 2:24 AM
-- Use as you please, it's LUA for christ's sake.
--


-- On creation, since this is just a placeable so we can use it's position to iterate over what we need, delete it as soon as it's created.
function Create()
    -- Get all the prisoners hopefully in the prison.
    local prisoners = this.GetNearbyObjects("Prisoner", 10000);

    -- Iterate over the list of objects.
    for Prisoner, _ in next, prisoners do
        Prisoner.Needs.Bowels = 0;
        Prisoner.Needs.Bladder = 0;
        Prisoner.Needs.Clothing = 0;
        Prisoner.Needs.Comfot = 0;
        Prisoner.Needs.Enviroment = 0;
        Prisoner.Needs.Excercise = 0;
        Prisoner.Needs.Family = 0;
        Prisoner.Needs.Food = 0;
        Prisoner.Needs.Freedom = 0;
        Prisoner.Needs.Hygiene = 0;
        Prisoner.Needs.Literacy = 0;
        Prisoner.Needs.Privacy = 0;
        Prisoner.Needs.Recreation = 0;
        Prisoner.Needs.Safety = 0;
        Prisoner.Needs.Sleep = 0;
        Prisoner.Needs.Spirituality = 0;

        -- Found a fix, thanks @Reddit:User[RunOutOfNames]
        if Object.GetProperty(Prisoner, "Needs.Alcohol") ~= nil then
            Prisoner.Needs.Alchohol = 0;
        end

        if Object.GetProperty(Prisoner, "Needs.Drugs") ~= nil then
            Prisoner.Needs.Drugs = 0;
        end
    end

    this.Delete();
end