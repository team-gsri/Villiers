{
    missionnamespace setVariable [_x, true];
} forEach [
	"BIS_respSpecallow3PPCamera", 		// Allow 3rd person camera
	"BIS_respSpecShowHeader", 			// top bar of the spectator UI including mission time
	"BIS_respSpeclists"					// Show list of available units and locations on the left hand side
];

player addEventHandler ["Respawn", {
	player setUnitLoadout ([
		[], [], [], ["amf_uniform_01_DA", []],
		[], [], "AMF_BERET_INFANTERIE", "", [],
		["ItemMap", "", "TFAR_anprc152", "", "ACE_Altimeter", ""]
	]);
}];