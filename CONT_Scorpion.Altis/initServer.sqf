GSRI_FightInProgess = false;
GSRI_RenfoInProgess = false;
GSRI_IndepInProgess = false;
publicVariable "GSRI_FightInProgess";
publicVariable "GSRI_RenfoInProgess";
publicVariable "GSRI_IndepInProgess";

private _eastClass = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad");
private _indepClass = (configfile >> "CfgGroups" >> "Indep" >> "IND_E_F" >> "Mechanized" >> "I_E_MechInfSquad");

private _managers = [];
_managers pushBack ([east, markerEast, _eastClass, 80] call GSRI_fnc_classSideManager);
_managers pushBack ([east, markerEastRenfo, _eastClass, 80] call GSRI_fnc_classSideManager);
_managers pushBack ([independent, markerIndep, _indepClass, 12] call GSRI_fnc_classSideManager);

while { true } do {
	sleep 10;
	if (GSRI_FightInProgess) then {
		private _manager = _managers select 0;
		(_manager) call (_manager get "+Reinforce");
	};
	if (GSRI_RenfoInProgess) then {
		private _manager = _managers select 1;
		(_manager) call (_manager get "+Reinforce");
	};
	if (GSRI_IndepInProgess) then {
		private _manager = _managers select 2;
		(_manager) call (_manager get "+Reinforce");
	};
};