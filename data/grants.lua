-- The Creative Grant Mod
-- Author: Dubpub
-- Contact: dubpub@loneboat.com
-- Version: v2.0
-- Language: data\language\base-language.txt

function CreateGrants()
	CreativeGrants()
end

-- Create the grants on load.
function CreativeGrants()
    -- 100,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money1", 100000, 0 )
    -- 250,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money2", 250000, 0 )
    -- 500,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money3", 500000, 0 )
    -- 1,000,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money4", 1000000, 0 )
    -- 5,000,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money5", 5000000, 0 )
    -- 8,500,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money6", 8500000, 0 )
    -- 10,000,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money7", 10000000, 0 )
    -- 50,000,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money8", 50000000, 0 )
    -- 85,000,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money9", 85000000, 0 )
    -- 1,000,000,000 (assumed) Dollars
	Objective.CreateGrant			( "grant_money10", 100000000, 0 )
end