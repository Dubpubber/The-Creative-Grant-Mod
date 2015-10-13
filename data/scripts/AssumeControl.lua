--
-- Author: Dubpub
-- Date: 10/10/2015
-- Time: 10:04 PM
--
function Create()
    -- find inmate, attempt control.
    local target = this.GetNearbyObjects(5);
    target.AvatarControl = 1;
    target.AvatarControl = true;
    this.Delete();
end

