Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		objName = 'v_ilev_ph_door01',
		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
		textCoords = {x = 434.747, y = -981.50, z = 31.50},
		authorizedJobs = {'police', 'offpolice', 'secretary'},
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_door002',
		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
		textCoords = {x = 434.747, y = -982.50, z = 31.50},
		authorizedJobs = {'police', 'offpolice', 'secretary'},
		locked = false,
		distance = 2.5
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 31.739},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 44.834},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.50, y = -986.00, z = 31.50},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 31.739},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 31.739},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 31.739},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 31.739},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 4
	},

	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.30, y = -992.686, z = 25.10},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.308, z = 25.064},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.800, z = 25.064},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1002.450, z = 25.064},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.00, y = -1003.50, z = 25.50},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.1362},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.136},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 4
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.894, y = -1020.210, z = 30.00},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 14,
		size = 2
	},

	-- Interrogation room door
	{
		objName = 'V_ILev_PH_GenDoor006',
		objCoords  = {x = 470.34, y = -993.66, z = 25.10},
		textCoords = {x = 470.36, y = -994.62, z = 25.10},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 2,
	},

	-- Outer interrogation room door
	{
		objName = 'V_ILev_PH_GenDoor006',
		objCoords  = {x = 468.73, y = -992.75, z = 25.10},
		textCoords = {x = 467.71, y = -992.69, z = 25.10},
		authorizedJobs = { 'police', 'offpolice' },
		locked = false,
		distance = 1,
	},

	-- Evidence room door
	{
		objName = 'V_ILev_PH_GenDoor006',
		objCoords  = {x = 478.42, y = -987.25, z = 25.10},
		textCoords = {x = 477.59, y = -987.28, z = 25.10},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
		distance = 2,
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		authorizedJobs = { 'police', 'offpolice' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'police', 'offpolice' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'police', 'offpolice' },
		locked = false,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1799.608, y = 2616.975, z = 44.60325},
		textCoords = {x = 1795.998, y = 2616.55, z = 45.56},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1835.285, y = 2689.104, z = 44.4467},
		textCoords = {x = 1835.285, y = 2689.104, z = 44.4467},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1830.134, y = 2703.499, z = 44.4467},
		textCoords = {x = 1830.134, y = 2703.499, z = 44.4467},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1776.701, y = 2747.148, z = 44.44669},
		textCoords = {x = 1776.701, y = 2747.148, z = 44.44669},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1762.196, y = 2752.489, z = 44.44669},
		textCoords = {x = 1762.196, y = 2752.489, z = 44.44669},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1662.011, y = 2748.703, z = 44.44669},
		textCoords = {x = 1662.011, y = 2748.703, z = 44.44669},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1648.411, y = 2741.668, z = 44.44669},
		textCoords = {x = 1648.411, y = 2741.668, z = 44.44669},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1584.653, y = 2679.75, z = 44.50947},
		textCoords = {x = 1584.653, y = 2679.75, z = 44.50947},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1575.719, y = 2667.152, z = 44.50947},
		textCoords = {x = 1575.719, y = 2667.152, z = 44.50947},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1547.706, y = 2591.282, z = 44.50947},
		textCoords = {x = 1547.706, y = 2591.282, z = 44.50947},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1546.983, y = 2576.13, z = 44.39033},
		textCoords = {x = 1546.983, y = 2576.13, z = 44.39033},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1550.93, y = 2482.743, z = 44.39529},
		textCoords = {x = 1550.93, y = 2482.743, z = 44.39529},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1558.221, y = 2469.349, z = 44.39529},
		textCoords = {x = 1558.221, y = 2469.349, z = 44.39529},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1652.984, y = 2409.571, z = 44.44308},
		textCoords = {x = 1652.984, y = 2409.571, z = 44.44308},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1667.669, y = 2407.648, z = 44.42879},
		textCoords = {x = 1667.669, y = 2407.648, z = 44.42879},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1749.142, y = 2419.812, z = 44.42517},
		textCoords = {x = 1749.142, y = 2419.812, z = 44.42517},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1762.542, y = 2426.507, z = 44.43787},
		textCoords = {x = 1762.542, y = 2426.507, z = 44.43787},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1808.992, y = 2474.545, z = 44.48077},
		textCoords = {x = 1808.992, y = 2474.545, z = 44.48077},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1813.749, y = 2488.907, z = 44.46368},
		textCoords = {x = 1813.749, y = 2488.907, z = 44.46368},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},


	{
		objName = 'prop_fnclink_03gate5',
		objCoords  = {x = 1798.09, y = 2591.687, z = 46.41784},
		textCoords = {x = 1798.09, y = 2591.687, z = 46.41784},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 3,
		size = 2
	},

	{
		objName = 'prop_fnclink_03gate5',
		objCoords  = {x = 1797.761, y = 2596.565, z = 46.38731},
		textCoords = {x = 1797.761, y = 2596.565, z = 46.38731},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 3,
		size = 2
	},

	-- Prison Cell doors
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x = 1798.450, y=2479.150, z = -122.540},
		textCoords = {x = 1799.61, y=2479.150, z = -122.540},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
	},
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x=1795.290, y=2479.180, z=-122.550},
		textCoords = {x=1796.340, y=2479.160, z=-122.550},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
	},
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x=1792.130, y=2479.210, z=-122.550},
		textCoords = {x=1793.290, y=2479.170, z=-122.550},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
	},
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x=1788.950, y=2479.180, z=-122.550},
		textCoords = {x=1790.01, y=2479.130, z=-122.550},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
	},
	{
		objName = 'Prop_LD_jail_door',
		objCoords  = {x=1785.790, y=2479.210, z=-122.550},
		textCoords = {x=1787.000, y=2479.130, z=-122.550},
		authorizedJobs = { 'police', 'offpolice' },
		locked = true,
	},

	-- Pillbox Hospital Inner Doors

	{
		objName = 'v_ilev_cor_firedoor',
		objCoords  = {x=328.62, y=-585.20, z=43.33},
		textCoords = {x=329.39, y=-585.44, z=43.33},
		authorizedJobs = {'ambulance', 'police'},
		locked = true,
		distance = 4
	},
	{
		objName = 'v_ilev_cor_firedoor',
		objCoords  = {x=330.79, y=-585.99, z=43.33},
		textCoords = {x=330.13, y=-585.74, z=43.33},
		authorizedJobs = {'ambulance', 'police'},
		locked = true,
		distance = 4
	},
}