params ["_side", "_number"];

_this = [_side, _number, "Man"] call GSRI_fnc_classVehicleFactory;
_this set ["_logger", ["InfantryFactory"] call LOG_fnc_classLogger];

_this set ["#Count", {
	private _logger = _this get "_logger";
	["Counting infantry", _logger] call (_logger get "+TRACE");
	count units (_this get "_side");
}];

_this set ["#Spawn", {
	params ["_geo", "_this"];
	private _logger = _this get "_logger";
	["Spawning infantry", _logger] call (_logger get "+TRACE");
	private _origin = _geo call (_geo get "+GetRandomOrigin");
	private _group = [_origin, (_this get "_side"), 8] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	[_group, _geo] call (_geo get "+AddWaypoint");
}];

_this;