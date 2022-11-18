private _always = {
	true
};

private _baseToggle = ["GSRI_baseToggle", "Start/Stop", "", {}, _always] call ace_interact_menu_fnc_createAction;
private _basePlace = ["GSRI_basePlace", "Place", "", {}, _always] call ace_interact_menu_fnc_createAction;
private _baseSize = ["GSRI_baseSize", "Nombre", "", {}, _always] call ace_interact_menu_fnc_createAction;

private _stopEast = ["GSRI_stopEast", "Stop CSAT", "", {
	["GSRI_setManagerEnabled", [east, false]] call CBA_fnc_serverEvent;
	hint "Combat CSAT stoppé";
}, _always] call ace_interact_menu_fnc_createAction;

private _startEast = ["GSRI_startEast", "Start CSAT", "", {
	["GSRI_setManagerEnabled", [east, true]] call CBA_fnc_serverEvent;
	hint "Combat CSAT démarré";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSpawn1 = ["GSRI_eastSpawn1", "Proche", "", {
	["GSRI_setManagerGeo", [east, loc_east_1]] call CBA_fnc_serverEvent;
	hint "Respawn CSAT proche";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSpawn2 = ["GSRI_eastSpawn2", "Moyen", "", {
	["GSRI_setManagerGeo", [east, loc_east_2]] call CBA_fnc_serverEvent;
	hint "Respawn CSAT moyen";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSpawn3 = ["GSRI_eastSpawn3", "Lointain", "", {
	["GSRI_setManagerGeo", [east, loc_east_3]] call CBA_fnc_serverEvent;
	hint "Respawn CSAT lointain";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSize1 = ["GSRI_eastSize1", "Groupe", "", {
	["GSRI_setManagerSize", [east, 10]] call CBA_fnc_serverEvent;
	hint "10";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSize2 = ["GSRI_eastSize2", "Section", "", {
	["GSRI_setManagerSize", [east, 30]] call CBA_fnc_serverEvent;
	hint "30";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSize3 = ["GSRI_eastSize3", "Compagnie", "", {
	["GSRI_setManagerSize", [east, 60]] call CBA_fnc_serverEvent;
	hint "60";
}, _always] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _baseToggle] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions"], _basePlace] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions"], _baseSize] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseToggle"], _stopEast] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseToggle"], _startEast] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_basePlace"], _eastSpawn1] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_basePlace"], _eastSpawn2] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_basePlace"], _eastSpawn3] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseSize"], _eastSize1] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseSize"], _eastSize2] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseSize"], _eastSize3] call ace_interact_menu_fnc_addActionToZeus;

private _addRespawn = ["GSRI_addRespawn", "Add Pyrgos Respawn", "", {
	[west, position loc_respawn_military, "Pyrgos"] call BIS_fnc_addRespawnPosition;
}, _always] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _addRespawn] call ace_interact_menu_fnc_addActionToZeus;