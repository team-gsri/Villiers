GSRI_FightInProgess = false;
publicVariable "GSRI_FightInProgess";

private _eastManager = [] call GSRI_fnc_classEastManager;
private _eastManager2 = [] call GSRI_fnc_classEastManager2;
private _indeManager = [] call GSRI_fnc_classIndeManager;

while { true } do {
	sleep 10;
	{
		if (GSRI_FightInProgess) then {
			_x call (_x get "+Reinforce");
		};
	} forEach [_eastManager, _eastManager2, _indeManager];
};
