_this = [] call GSRI_fnc_classEastManager;

_this set ["_geo", [position markerIndep, position markerTarget, 300] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[independent, 30] call GSRI_fnc_classInfantryFactory,
	[independent, 3, "I_APC_tracked_03_cannon_F"] call GSRI_fnc_classVehicleFactory,
	[independent, 1, "I_Heli_light_03_dynamicLoadout_F"] call GSRI_fnc_classVehicleFactory
]];

_this;