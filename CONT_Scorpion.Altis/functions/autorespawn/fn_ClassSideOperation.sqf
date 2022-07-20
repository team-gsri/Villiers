params ["_helicopters", "_vehicles", "_infantry", "_origin", "_target", "_radius"];

_this = createHashMap;
_this set ["_helicopters", _helicopters];
_this set ["_vehicles", _vehicles];
_this set ["_infantry", _infantry];
_this set ["_origin", _origin];
_this set ["_target", _target];
_this set ["_radius", _radius];

_this set ["Execute", {
	private _helicopters = _this get "_helicopters";
	private _vehicles = _this get "_vehicles";
	private _infantry = _this get "_infantry";
	private _origin = _this get "_origin";
	private _target = _this get "_target";
	private _radius = _this get "_radius";
	{
		_x set ["_origin", _origin];
		_x set ["_target", _target];
		_x call (_x get "SpawnIfNeeded");
	} forEach [_helicopter, _vehicles, _infantry];
}];

_this;