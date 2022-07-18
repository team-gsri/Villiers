params ["_vehicle"];
if !(_vehicle isKindOf "AllVehicles") then {
	["Unit %1 must be a vehicle.", _vehicle] call BIS_fnc_error;
	false;
};

createVehicleCrew _vehicle;
private _number = [_vehicle] call GSRI_fnc_getPassengerCount;
private _group = [position _vehicle, side _vehicle, _number] call BIS_fnc_spawnGroup;
private _getIn = _group addWaypoint [position _vehicle, -1];
private _guard = _group addWaypoint [position _vehicle, -1];
_getIn setWaypointType "GETIN";
_guard setWaypointType "GUARD";
_getIn waypointAttachVehicle _vehicle;
_guard waypointAttachVehicle _vehicle;
crew _vehicle join _group;