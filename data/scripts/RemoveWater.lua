--
-- Author: Dubpub
-- Date: 4/5/2016
-- Time: 5:50 PM
--
function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function Create()
    local waters = this.GetNearbyObjects("Water", 1);
    if tablelength(waters) > 0 then
        for water, _ in next, waters do
            water.Delete();
        end
    end
    this.Delete();
end

function Update() end