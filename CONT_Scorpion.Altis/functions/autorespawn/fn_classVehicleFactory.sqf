params ["_side", "_number", "_classname"];

_this = createHashMap;
_this set ["_side", _side];
_this set ["_number", _number];
_this set ["_classname", _classname];
_this set ["_logger", ["VehicleFactory"] call LOG_fnc_classLogger];

_this set ["+Reinforce", {
	params ["_geo", "_this"];
	private _side = _this get "_side";
	private _expected = _this get "_number";
	private _classname = _this get "_classname";
	private _count = [_this] call (_this get "#Count");

	private _logger = _this get "_logger";
	private _message = format ["Side %1, Class %2, Count %3/%4", _side, _classname, _count, _expected];
	[_message, _logger] call (_logger get "+DEBUG");

	if (_count < _expected) then {
		["Missing assets, spawning reinforcements", _logger] call (_logger get "+TRACE");
		[_geo, _this] call (_this get "#Spawn");
	}
}];

_this set ["#Count", {
	{
		private _logger = _this get "_logger";
		["Counting vehicles", _logger] call (_logger get "+TRACE");
		alive _x && side _x == _this get "_side" && _x isKindOf _this get "_classname";
	} count vehicles;
}];

_this set ["#Spawn", {
	params ["_geo", "_this"];
	private _logger = _this get "_logger";
	["Spawning vehicle", _logger] call (_logger get "+TRACE");
	private _vehicle = (_this get "_classname") createVehicle (_geo get "_home");
	private _crew = createVehicleCrew _vehicle;
	[_crew, _geo] call (_geo get "+AddWaypoint");
}];

_this;