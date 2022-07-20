private _opforHelicopters = ["_classname", east, 2] call GSRI_fnc_ClassTypeOperation;
private _opforVehicles = ["_classname", east, 4] call GSRI_fnc_ClassTypeOperation;
private _opforInfantry = ["Man", east, 40] call GSRI_fnc_ClassTypeOperation;
private _opfor = [
	_opforHelicopters,
	_opforVehicles,
	_opforInfantry,
	position markerEast,
	position markerTarget,
	300 // radius in meters
] call GSRI_fnc_ClassSideOperation;

private _greenforHelicopters = ["_classname", east, 2] call GSRI_fnc_ClassTypeOperation;
private _greenforVehicles = ["_classname", east, 4] call GSRI_fnc_ClassTypeOperation;
private _greenforInfantry = ["Man", east, 40] call GSRI_fnc_ClassTypeOperation;
private _greenfor = [
	_greenforHelicopters,
	_greenforVehicles,
	_greenforInfantry,
	position markerIndep,
	position markerTarget,
	300 // radius in meters
] call GSRI_fnc_ClassSideOperation;

while { true } do {
	_opfor call (_opfor get "Execute");
	_greenfor call (_greenfor get "Execute");
	sleep 10;
};