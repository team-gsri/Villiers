_this = createHashMap;

_this set ["_geo", [position markerEast, position markerTarget, 300] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[east, 4, "O_APC_Wheeled_02_rcws_v2_F"] call GSRI_fnc_classVehicleFactory,
	[east, 1, "O_Heli_Light_02_dynamicLoadout_F"] call GSRI_fnc_classVehicleFactory
]];

_this set ["+Reinforce", {
	private _geo = _this get "_geo";
	{
		[_geo, _x] call (_x get "+Reinforce");
	} forEach (_this get "_factories");
}];

_this;