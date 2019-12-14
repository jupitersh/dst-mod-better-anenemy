name = "Better Anenemy"
description = "Anenemy won't attack players anymore."
author = "辣椒小皇纸"
version = "1.2.1"

forumthread = ""

api_version = 10

dst_compatible = true

dont_starve_compatible = false
reign_of_giants_compatible = false

all_clients_require_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

----------------------
-- General settings --
----------------------

configuration_options =
{
	{
		name = "damage_starfish",
		label = "Damage",
		hover = "Change the Damage of Anenemy",
		options =	{
						{description = "35", data = 35, hover = ""},
						{description = "40", data = 40, hover = ""},
						{description = "45", data = 45, hover = ""},
						{description = "50", data = 50, hover = ""},
						{description = "55", data = 55, hover = ""},
						{description = "60(Default)", data = 60, hover = ""},
						{description = "65", data = 65, hover = ""},
						{description = "70", data = 70, hover = ""},
						{description = "75", data = 75, hover = ""},
						{description = "80", data = 80, hover = ""},
						{description = "85", data = 85, hover = ""},
						{description = "90", data = 90, hover = ""},
						{description = "95", data = 95, hover = ""},
						{description = "100", data = 100, hover = ""},
					},
		default = 60,
	},
	{
		name = "reset_period_starfish",
		label = "Reset Period",
		hover = "Change the Reset Period of Anenemy",
		options =	{
						{description = "1", data = 1, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "10s", data = 10, hover = ""},
						{description = "20s", data = 20, hover = ""},
						{description = "30s", data = 30, hover = ""},
						{description = "40s", data = 40, hover = ""},
						{description = "50s", data = 50, hover = ""},
						{description = "60s(Default)", data = 60, hover = ""},
						{description = "70s", data = 70, hover = ""},
						{description = "80s", data = 80, hover = ""},
						{description = "90s", data = 90, hover = ""},
						{description = "100s", data = 100, hover = ""},
						{description = "110s", data = 110, hover = ""},
						{description = "120s", data = 120, hover = ""},
					},
		default = 60,
	},
}