private _eastClass = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad");
private _indepClass = (configfile >> "CfgGroups" >> "Indep" >> "IND_E_F" >> "Mechanized" >> "I_E_MechInfSquad");

GSRI_managers = createHashMap;
GSRI_managers set [east, [east, position loc_east_1, position loc_target, _eastClass, 10] call GSRI_fnc_classSideManager];

["GSRI_setManagerGeo", {
	params ["_side", "_position"];
	private _logger = ["initServer"] call LOG_fnc_classLogger;
	private _message = format ["GSRI_setManagerGeo: Side %1, Position %2", _side, _position];
	[_message, _logger] call (_logger get "+TRACE");
	private _manager = GSRI_managers get _side;
	private _geo = _manager get "_geo";
	_geo set ["_home", position _position];
}] call CBA_fnc_addEventHandler;

["GSRI_setManagerSize", {
	params ["_side", "_size"];
	private _logger = ["initServer"] call LOG_fnc_classLogger;
	private _message = format ["GSRI_setManagerSize: Side %1, Size %2", _side, _size];
	[_message, _logger] call (_logger get "+TRACE");
	private _manager = GSRI_managers get _side;
	private _factory = (_manager get "_factories") select 0;
	_factory set ["_number", _size];
}] call CBA_fnc_addEventHandler;

["GSRI_setManagerEnabled", {
	params ["_side", "_enabled"];
	private _logger = ["initServer"] call LOG_fnc_classLogger;
	private _message = format ["GSRI_setManagerEnabled: Side %1, Enabled %2", _side, _enabled];
	[_message, _logger] call (_logger get "+TRACE");
	private _manager = GSRI_managers get _side;
	_manager set ["_enabled", _enabled];
}] call CBA_fnc_addEventHandler;

while { true } do {
	sleep 10;
	{
		(_y) call (_y get "+Reinforce");
	} forEach GSRI_managers;
};