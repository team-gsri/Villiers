_this = [] call GSRI_fnc_classEastManager_veh;

_this set ["_geo", [position markerEast_inf, position markerTarget, 100] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[east, 100] call GSRI_fnc_classInfantryFactory
]];

_this;