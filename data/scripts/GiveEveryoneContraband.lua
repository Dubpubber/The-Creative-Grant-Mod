--
-- Author: Dubpub
-- Date: 10/12/2015
-- Time: 10:52 PM
--

local ContrabandList = {
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 28, 29, 30, 32, 33, 37, 42, 43, 44, 45, 46, 47
}

function Create()
    local Prisoners = this.GetNearbyObjects("Prisoner", 1000);
    for Prisoner, _ in next, Prisoners do
        Prisoner.Equipment = ContrabandList[math.random(#ContrabandList)];
    end
    this.Delete();
end

