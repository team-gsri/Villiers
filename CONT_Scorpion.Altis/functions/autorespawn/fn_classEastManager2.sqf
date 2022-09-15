_this = [] call GSRI_fnc_classEastManager;

_this set ["_geo", [position markerEast_1, position markerTarget, 100] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[east, 80] call GSRI_fnc_classInfantryFactory
]];

_this;