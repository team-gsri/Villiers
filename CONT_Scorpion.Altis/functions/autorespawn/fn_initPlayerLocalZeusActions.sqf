private _stopFight = ["stopFight", "Stop fight", "", {
	GSRI_FightInProgess = false;
	publicVariable "GSRI_FightInProgess";
	hint "Combat stoppé";
}, {
	GSRI_FightInProgess
}] call ace_interact_menu_fnc_createAction;

private _startFight = ["startFight", "Start fight", "", {
	GSRI_FightInProgess = true;
	publicVariable "GSRI_FightInProgess";
	hint "Combat démarré";
}, {
	!GSRI_FightInProgess
}] call ace_interact_menu_fnc_createAction;

private _stopIndep = ["stopIndep", "Stop reinforcements", "", {
	GSRI_IndepInProgess = false;
	publicVariable "GSRI_IndepInProgess";
	hint "Renforts stoppés";
}, {
	GSRI_IndepInProgess
}] call ace_interact_menu_fnc_createAction;

private _startIndep = ["startIndep", "Start reinforcements", "", {
	GSRI_IndepInProgess = true;
	publicVariable "GSRI_IndepInProgess";
	hint "Renforts démarrés";
}, {
	!GSRI_IndepInProgess
}] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _startFight] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions"], _stopFight] call ace_interact_menu_fnc_addActionToZeus;

[["ACE_ZeusActions"], _startIndep] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions"], _stopIndep] call ace_interact_menu_fnc_addActionToZeus;
