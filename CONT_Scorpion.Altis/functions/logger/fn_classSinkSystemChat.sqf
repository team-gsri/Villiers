_this = createHashMap;

_this set ["+WriteMessage", {
	params ["_message", "_this"];
	systemChat _message;
}];

_this;