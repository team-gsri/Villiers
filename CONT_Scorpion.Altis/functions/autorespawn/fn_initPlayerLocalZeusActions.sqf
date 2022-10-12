private _always = {
	true
};

private _baseEast = ["GSRI_baseEast", "CSAT", "", {}, _always] call ace_interact_menu_fnc_createAction;
private _baseGuer = ["GSRI_baseGuer", "LDF", "", {}, _always] call ace_interact_menu_fnc_createAction;

private _stopEast = ["GSRI_stopEast", "Stop CSAT", "", {
	["GSRI_setManagerEnabled", [east, false]] call CBA_fnc_serverEvent;
	hint "Combat CSAT stoppé";
}, _always] call ace_interact_menu_fnc_createAction;

private _startEast = ["GSRI_startEast", "Start CSAT", "", {
	["GSRI_setManagerEnabled", [east, true]] call CBA_fnc_serverEvent;
	hint "Combat CSAT démarré";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSpawn1 = ["GSRI_eastSpawn1", "Proche", "", {
	["GSRI_setManagerGeo", [east, markerEast1]] call CBA_fnc_serverEvent;
	hint "Respawn CSAT proche";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSpawn2 = ["GSRI_eastSpawn2", "Moyen", "", {
	["GSRI_setManagerGeo", [east, markerEast2]] call CBA_fnc_serverEvent;
	hint "Respawn CSAT moyen";
}, _always] call ace_interact_menu_fnc_createAction;

private _eastSpawn3 = ["GSRI_eastSpawn3", "Lointain", "", {
	["GSRI_setManagerGeo", [east, markerEast3]] call CBA_fnc_serverEvent;
	hint "Respawn CSAT lointain";
}, _always] call ace_interact_menu_fnc_createAction;

private _stopGuer = ["GSRI_stopGuer", "Stop LDF", "", {
	["GSRI_setManagerEnabled", [independent, false]] call CBA_fnc_serverEvent;
	hint "Combat LDF stoppé";
}, _always] call ace_interact_menu_fnc_createAction;

private _startGuer = ["GSRI_startGuer", "Start LDF", "", {
	["GSRI_setManagerEnabled", [independent, true]] call CBA_fnc_serverEvent;
	hint "Combat LDF démarré";
}, _always] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _baseEast] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseEast"], _stopEast] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseEast"], _startEast] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseEast"], _eastSpawn1] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseEast"], _eastSpawn2] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseEast"], _eastSpawn3] call ace_interact_menu_fnc_addActionToZeus;

[["ACE_ZeusActions"], _baseGuer] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseGuer"], _stopGuer] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "GSRI_baseGuer"], _startGuer] call ace_interact_menu_fnc_addActionToZeus;