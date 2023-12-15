function create_time_source_generic(arguments) {
	return new TimeSourceGeneric(arguments)
}

function call_later_generic(_function, _frames) {
    return call_later(_frames, time_source_units_frames, _function)
}

/// @description call function via time_source
function do_later_generic(frames, callback, arguments = []) {
	return timed_call_generic({ frames, callback, arguments })
}

/// @description call function via time_source
function timed_call_generic(arguments = {}) {
	var _callback  = arguments[$ "callback"]
	var _frames	   = arguments[$ "frames"]
	var _arguments = arguments[$ "arguments"]
	var _time_source_identifier = DoLater(_frames, _callback, _arguments)
	return new TimeSourceGeneric(_time_source_identifier)
}
