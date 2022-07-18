params ["_vehicle"];
if !(_vehicle isKindOf "AllVehicles") then {
	["Unit %1 must be a vehicle.", _vehicle] call BIS_fnc_error;
	false;
};

private _number = 0;
if (_vehicle isKindOf "APC_Tracked_03_base_F") then {
	_number = 7;
};
if (_vehicle isKindOf "APC_Wheeled_02_base_F") then {
	_number = 8;
};

_number;