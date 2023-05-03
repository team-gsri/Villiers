{
	missionNamespace setVariable [_x, true]
} forEach [
	"BIS_respSpecAllowFreeCamera",
	"BIS_respSpecAllow3PPCamera",
	"BIS_respSpecShowHeader",
	"BIS_respSpecLists"
];

player addEventHandler ["Respawn", { [] call GSRI_fnc_gearAsRegular; }];

[] call GSRI_fnc_initPlayerLocalZeusActions;