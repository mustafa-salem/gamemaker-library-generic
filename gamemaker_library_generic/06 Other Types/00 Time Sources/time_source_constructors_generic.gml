function TimeSourceGeneric(arguments) constructor {

	/*******************************************************************************/
	#region    –––––––––––––––––––– CREATION_ARGUMENTS ––––––––––––––––––––
	/*******************************************************************************/

	if (is_numeric(arguments)) {
		time_source_id = arguments
	} else if (is_struct(arguments)) {
		// PARENT
		var _parent = arguments[$ "parent"] ?? TIME_SOURCE_PARENT_DEFAULT_GENERIC
		if (is_struct(arguments[$ "parent"])) {
			_parent = arguments[$ "parent"].time_source_id
		}
		// PERIOD, UNITS
		var _period = arguments[$ "period"] ?? TIME_SOURCE_PERIOD_DEFAULT_GENERIC
		var _units  = arguments[$ "units"] ?? TIME_SOURCE_UNITS_DEFAULT_GENERIC
		if (arguments[$ "period_seconds"] != undefined) {
			var _period = arguments[$ "period_seconds"]
			var _units  = time_source_units_seconds
		} else if (arguments[$ "period_frames"] != undefined) {
			var _period = arguments[$ "period_frames"]
			var _units  = time_source_units_frames
		}
		// CALLBACK
		var _callback = arguments[$ "callback"]
		// ARGS
		var _args = arguments[$ "arguments"] ?? [ ]
		// REPETITIONS
		var _repetitions = arguments[$ "repetitions"] ?? TIME_SOURCE_REPETITIONS_DEFAULT_GENERIC
		if (_repetitions == infinity) { _repetitions = -1 }
		// EXPIRY_TYPE
		var _expiry_type = arguments[$ "expiry_type"] ?? TIME_SOURCE_EXPIRY_TYPE_DEFAULT_GENERIC

		// CREATE TIME_SOURCE
		time_source_id = time_source_create(_parent, _period, _units, _callback, _args, _repetitions, _expiry_type)
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– CREATION_ARGUMENTS ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– METHODS ––––––––––––––––––––
	/*******************************************************************************/

	destroy = function(_destroy_children = false) { time_source_destroy(time_source_id, _destroy_children) }
	start = function() { time_source_start(time_source_id) }
	stop = function() { time_source_stop(time_source_id) }
	pause = function() { time_source_pause(time_source_id) }
	resume = function() { time_source_resume(time_source_id) }
	// reconfigure -> time_source_reconfigure(time_source_id, period, units, callback, [args, repetitions, expiry_type])
	reset = function() { time_source_reset(time_source_id) }
	children = function() { return time_source_get_children(time_source_id) }
	parent = function() { return time_source_get_parent(time_source_id) }
	period = function() { return time_source_get_period(time_source_id) }
	completed_repetitions = function() { return time_source_get_reps_completed(time_source_id) }
	remaining_repetitions = function() { return time_source_get_reps_remaining(time_source_id) }
	state = function() { return time_source_get_state(time_source_id) }
	remaining_time = function() { return time_source_get_time_remaining(time_source_id) }
	units = function() { return time_source_get_units(time_source_id) }
	exists = function() { return time_source_exists(time_source_id) }

	/*******************************************************************************/
	#endregion –––––––––––––––––––– METHODS ––––––––––––––––––––
	/*******************************************************************************/

}
