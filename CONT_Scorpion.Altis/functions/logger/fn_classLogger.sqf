params ["_name"];

// ["TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"]

_this = createHashMap;
_this set ["_name", _name];

_this set ["+TRACE", {
	params ["_message", "_this"];
	[_message, 0, _this] call (_this get "-Log");
}];

_this set ["+DEBUG", {
	params ["_message", "_this"];
	[_message, 1, _this] call (_this get "-Log");
}];

_this set ["+INFO", {
	params ["_message", "_this"];
	[_message, 2, _this] call (_this get "-Log");
}];

_this set ["+WARN", {
	params ["_message", "_this"];
	[_message, 3, _this] call (_this get "-Log");
}];

_this set ["+ERROR", {
	params ["_message", "_this"];
	[_message, 4, _this] call (_this get "-Log");
}];

_this set ["+FATAL", {
	params ["_message", "_this"];
	[_message, 5, _this] call (_this get "-Log");
}];

_this set ["-Log", {
	params ["_message", "_severity", "_this"];
	private _event = [_message, _severity] call LOG_fnc_classEvent;
	if (_event call (_event get "+IsLoggable")) then {
		private _handler = _this call (_this get "-GetHandler");
		[_this, _event, _handler] call (_handler get "+Handle");
	};
}];

_this set ["-GetHandler", {
	if (isNil "LOG_handler") then {
		LOG_handler = [] call LOG_fnc_classEventHandler;
	};
	LOG_handler;
}];

_this;