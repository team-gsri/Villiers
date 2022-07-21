private _eastManager = [] call GSRI_fnc_classEastManager;
private _indeManager = [] call GSRI_fnc_classIndeManager;

while { true } do {
	sleep 10;
	{
		_x call (_x get "+Reinforce");
	} forEach [_eastManager, _indeManager];
};