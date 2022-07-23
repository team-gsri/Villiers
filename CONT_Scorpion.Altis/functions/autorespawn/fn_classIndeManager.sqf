_this = [] call GSRI_fnc_classEastManager;

_this set ["_geo", [position markerIndep, position markerTarget, 300] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[independent, 40] call GSRI_fnc_classInfantryFactory,
	[independent, 4, "I_APC_tracked_03_cannon_F"] call GSRI_fnc_classVehicleFactory,
	[independent, 2, "I_Heli_light_03_dynamicLoadout_F"] call GSRI_fnc_classVehicleFactory
]];

_this;