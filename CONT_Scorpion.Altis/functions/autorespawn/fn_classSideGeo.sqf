params ["_home", "_target", "_radius"];

_this = createHashMap;
_this set ["_home", _home];
_this set ["_target", _target];
_this set ["_radius", _radius];

_this set ["+AddWaypoint", {
	params ["_group", "_this"];
	private _waypoint = _group addWaypoint [_this get "_target", _this get "_radius"];
	_waypoint setWaypointType "SAD";
	_waypoint;
}];

_this;