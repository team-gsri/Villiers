_this = createHashMap;

_this set ["+Handle", {
	params ["_logger", "_event", "_this"];
	private _formatter = _this call (_this get "-GetFormatter");
	private _sinks = _this call (_this get "-GetSinks");
	private _rawData = [_logger, _event, _formatter] call (_formatter get "+FormatMessage");
	{
		[_rawData, _x] call (_x get "+WriteMessage");
	} forEach _sinks;
}];

_this set ["-GetFormatter", {
	if !("_formatter" in _this) then {
		private _formatterName = getText(missionConfigFile >> "CfgLogger" >> "formatter");
		private _formatterFactory = format ["call %1", _formatterName];
		private _formatter = call compile _formatterFactory;
		_this set ["_formatter", _formatter];
	};
	_this get "_formatter";
}];

_this set ["-GetSinks", {
	if !("_sinks" in _this) then {
		private _sinkNames = getArray(missionConfigFile >> "CfgLogger" >> "sinks");
		private _sinks = [];
		{
			private _factory = format ["call %1", _x];
			private _sink = call compile _factory;
			_sinks pushBack _sink;
		} forEach _sinkNames;
		_this set ["_sinks", _sinks];
	};
	_this get "_sinks";
}];

_this;