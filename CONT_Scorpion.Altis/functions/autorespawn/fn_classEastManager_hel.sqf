_this = [] call GSRI_fnc_classEastManager_veh;

_this set ["_geo", [position markerEast_hel, position markerTarget, 300] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[east, 1, "O_Heli_Light_02_dynamicLoadout_F"] call GSRI_fnc_classVehicleFactory
]];

_this;