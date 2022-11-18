{
	missionNamespace setVariable [_x, true]
} forEach [
	"BIS_respSpecAllowFreeCamera",
	"BIS_respSpecAllow3PPCamera",
	"BIS_respSpecShowHeader",
	"BIS_respSpecLists"
];

player addEventHandler ["Respawn", {
	player setUnitLoadout ([
		[], [], [], ["amf_uniform_01_DA", []],
		[], [], "AMF_BERET_INFANTERIE", "", [],
		["ItemMap", "", "TFAR_anprc152", "", "ACE_Altimeter", ""]
	]);
}];