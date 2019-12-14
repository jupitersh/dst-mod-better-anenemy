if not GLOBAL.TheNet:GetIsServer() then 
    return
end

local assert = GLOBAL.assert
local debug = GLOBAL.debug

local UpvalueHacker = {}

local function GetUpvalueHelper(fn, name)
    local i = 1
    while debug.getupvalue(fn, i) and debug.getupvalue(fn, i) ~= name do
        i = i + 1
    end
    local name, value = debug.getupvalue(fn, i)
    return value, i
end

UpvalueHacker.GetUpvalue = function(fn, ...)
    local prv, i, prv_var = nil, nil, "(the starting point)"
    for j,var in ipairs({...}) do
        assert(type(fn) == "function", "We were looking for "..var..", but the value before it, "
            ..prv_var..", wasn't a function (it was a "..type(fn)
            .."). Here's the full chain: "..table.concat({"(the starting point)", ...}, ", "))
        prv = fn
        prv_var = var
        fn, i = GetUpvalueHelper(fn, var)
    end
    return fn, i, prv
end

UpvalueHacker.SetUpvalue = function(start_fn, new_fn, ...)
    local _fn, _fn_i, scope_fn = UpvalueHacker.GetUpvalue(start_fn, ...)
    debug.setupvalue(scope_fn, _fn_i, new_fn)
end

--To make starfish not attack players
AddPrefabPostInit("trap_starfish", function(inst)
	if inst.components.mine then
	   	inst.components.mine:SetAlignment("player")
	end
end)

local mine_test_tags = { "monster", "animal", "pig", "merm" }

AddPrefabPostInit("world", function(inst)
UpvalueHacker.SetUpvalue(GLOBAL.Prefabs.trap_starfish.fn, mine_test_tags, "on_explode", "do_snap", "mine_test_tags")
end)

--To change the paraments of starfish
if GetModConfigData("damage_starfish") ~= 60 then
	GLOBAL.TUNING.STARFISH_TRAP_DAMAGE = GetModConfigData("damage_starfish")
end

if GetModConfigData("reset_period_starfish") ~= 60 then
	GLOBAL.TUNING.STARFISH_TRAP_NOTDAY_RESET =
        {
            BASE = GetModConfigData("reset_period_starfish"),
            VARIANCE = 2,
        }
end




--crafting enenemy should be a all-client-required mod, so it's disabled for now
--[[
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

if GetModConfigData("language") == "en" then
    STRINGS.RECIPE_DESC.DUG_TRAP_STARFISH = "Let's make the anenemy!"
else
    STRINGS.RECIPE_DESC.DUG_TRAP_STARFISH = "制作海星啦！"
end

if GetModConfigData("craft_starfish") then
	AddRecipe(
		"dug_trap_starfish",
		{
		Ingredient("moon_tree_blossom", 6),	
		Ingredient("livinglog", 2),
		Ingredient("moonglass", 1),
		},
		RECIPETABS.MOON_ALTAR, TECH.MOON_ALTAR_TWO
	)
end
]]