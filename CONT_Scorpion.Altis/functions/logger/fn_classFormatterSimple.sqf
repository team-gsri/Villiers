_this = createHashMap;

_this set ["+FormatMessage", {
	params ["_logger", "_event", "_this"];
	private _loggerName = _logger get "_name";
	private _message = _event get "_message";
	private _severity = _event call (_event get "+GetSeverityName");
	format [
		"[%2] %1: %3",
		_loggerName,
		_severity,
		_message
	];
}];

_this;