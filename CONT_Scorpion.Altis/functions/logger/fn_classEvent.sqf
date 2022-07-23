params ["_message", ["_severity", 2]];

if (_severity < 0 || _severity > 5) then {
	["ArgumentException: _severity must be within range [0-5]"] call BIS_fnc_error;
	false;
};

_this = createHashMap;
_this set ["_message", _message];
_this set ["_severity", _severity];

_this set ["+IsLoggable", {
	private _severity = _this get "_severity";
	private _tresholdLevel = getText(missionConfigFile >> "CfgLogger" >> "severityThreshold");
	private _treshold = ["TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"] find _tresholdLevel;
	_severity >= _treshold;
}];

_this set ["+GetSeverityName", {
	private _severity = _this get "_severity";
	["TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"] select _severity;
}];

_this;