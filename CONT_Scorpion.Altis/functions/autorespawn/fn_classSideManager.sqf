params ["_side", "_markerStart", "_groupClass", "_treshold"];

_this = createHashMap;

_this set ["_enabled", false];
_this set ["_side", _side];
_this set ["_geo", [position _markerStart, position markerTarget, 100] call GSRI_fnc_classSideGeo];
_this set ["_logger", ["SideManager"] call LOG_fnc_classLogger];
_this set ["_factories", [
	[_side, _groupClass, _treshold] call GSRI_fnc_classInfantryFactory
]];

_this set ["+Reinforce", {
	private _enabled = _this get "_enabled";
	private _logger = _this get "_logger";
	private _side = _this get "_side";
	private _message = format ["Side %1, Enabled %2", _side, _enabled];
	[_message, _logger] call (_logger get "+DEBUG");

	if (_enabled) then {
		private _geo = _this get "_geo";
		{
			[_geo, _x] call (_x get "+Reinforce");
		} forEach (_this get "_factories");
	}
}];

_this;