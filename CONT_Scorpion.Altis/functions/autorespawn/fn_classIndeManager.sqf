_this = createHashMap;

_this set ["_geo", [position markerIndep, position markerTarget, 300] call GSRI_fnc_classSideGeo];
_this set ["_factories", [
	[east, 40] call GSRI_fnc_classInfantryFactory,
	[east, 4, "I_APC_tracked_03_cannon_F"] call GSRI_fnc_classVehicleFactory,
	[east, 2, "I_Heli_light_03_dynamicLoadout_F"] call GSRI_fnc_classVehicleFactory
]];

_this set ["+Reinforce", {
	private _geo = _this get "_geo";
	{
		[_geo, _x] call (_x get "+Reinforce");
	} forEach _this get "_factories";
}];

_this;