GSRI_FightInProgess = false;
publicVariable "GSRI_FightInProgess";

private _managers = [];
_managers pushBack ([] call GSRI_fnc_classEastManager_inf);
_managers pushBack ([] call GSRI_fnc_classEastManager_veh);
// _managers pushBack ([] call GSRI_fnc_classEastManager_hel);


while { true } do {
	sleep 10;
	{
		if (GSRI_FightInProgess) then {
			_x call (_x get "+Reinforce");
		};
	} forEach _managers;
};
