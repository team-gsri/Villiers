params ["_classname", "_side", "_count"];

_this = createHashMap;
_this set ["_classname", _classname];
_this set ["_count", _count];
_this set ["_side", _side];

_this set ["SpawnIfNeeded", {
	private _classname = _this get "_classname";
	private _count = _this get "_count";
	private _side = _this get "_side";
	private _actual = {
		_x isKindOf _classname
	} count units _side;
	if (_actual < _count) then {
		_x call (_x get "Spawn");
	}
}];

_this set ["Spawn", {
	private _classname = _this get "_classname";
	private _target = _this get "_target";
	private _radius = _this get "_radius";
	private _group = if (_classname is "Man") then {
		_this call (_this get "SpawnInfGroup");
	} else {
		_this call (_this get "SpawnSingle");
	};
	private _waypoint = _group addWaypoint [_target, _radius];
	_waypoint setWaypointType "SAD";
}];

_this set ["SpawnSingle", {
	private _classname = _this get "_classname";
	private _origin = _this get "_origin";
	private _vehicle = _classname createVehicle _origin;
	private _crew = createVehicleCrew _vehicle;
	_crew;
}];

_this set ["SpawnInfGroup", {
	private _side = _this get "_side";
	private _origin = _this get "_origin";
	private _group = [_origin, _side, 8] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	_group;
}];

_this;