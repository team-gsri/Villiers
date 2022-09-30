params ["_side", "_markerStart", "_groupClass", "_treshold"];

_this = createHashMap;

_this set ["_geo", [position _markerStart, position markerTarget, 100] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[_side, _groupClass, _treshold] call GSRI_fnc_classInfantryFactory
]];

_this set ["+Reinforce", {
	private _geo = _this get "_geo";
	{
		[_geo, _x] call (_x get "+Reinforce");
	} forEach (_this get "_factories");
}];

_this;