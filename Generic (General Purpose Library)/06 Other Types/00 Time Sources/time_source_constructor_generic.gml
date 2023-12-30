/// ----------------------------------------------------------------------------
/// @function TimeSourceGeneric(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// time_source_id: [Id.TimeSource]
///
/// parent: [(Id.TimeSource or Struct.TimeSourceGeneric)]
///
/// period: Real
///
/// units:
///
/// period_seconds:
///
/// period_frames:
///
/// callback: Function
///
/// arguments: [Any]
///
/// repetitions: [Real=TIME_SOURCE_REPETITIONS_DEFAULT_GENERIC]
///
/// expiry_type:
/// ----------------------------------------------------------------------------
function TimeSourceGeneric(arguments = {}) constructor {

	/*******************************************************************************/
	#region    –––––––––––––––––––– CREATION_ARGUMENTS ––––––––––––––––––––
	/*******************************************************************************/

	// time_source_id provided
	time_source_id = arguments["time_source_id"]

	// creation arguments provided
	if (time_source_id == undefined) {
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

	/// @function get_id(arguments)
	/// @return {Id.TimeSource} time_source_id
	get_id = function(arguments = {}) {
		return time_source_id
	}

	/// @function exists(arguments)
	/// @return {type} <return_description>
	exists = function(arguments = {}) {
		arguments.time_source = self
		return exists_time_source_generic(arguments)
	}

	/// @function destroy(arguments)
	destroy = function(arguments = {}) {
		arguments.time_source = self
		destroy_time_source_generic(arguments)
	}

	/// @function start(arguments)
	start = function(arguments = {}) {
		arguments.time_source = self
		start_time_source_generic(arguments)
	}

	/// @function stop(arguments)
	stop = function(arguments = {}) {
		arguments.time_source = self
		stop_time_source_generic(arguments)
	}

	/// @function pause(arguments)
	pause = function(arguments = {}) {
		arguments.time_source = self
		pause_time_source_generic(arguments)
	}

	/// @function resume(arguments)
	resume = function(arguments = {}) {
		arguments.time_source = self
		resume_time_source_generic(arguments)
	}

	/// @function reconfigure(arguments)
	reconfigure = function(arguments = {}) {
		arguments.time_source = self
		reconfigure_time_source_generic(arguments)
	}

	/// @function reset(arguments)
	reset = function(arguments = {}) {
		arguments.time_source = self
		reset_time_source_generic(arguments)
	}

	/// @function children(arguments)
	/// @return {array<struct.TimeSourceGeneric>} <return_description>
	get_children = function(arguments = {}) {
		arguments.time_source = self
		return get_children_time_source_generic(arguments)
	}

	/// @function parent(arguments)
	/// @return {struct.TimeSourceGeneric} <return_description>
	get_parent = function(arguments = {}) {
		arguments.time_source = self
		return get_parent_time_source_generic(arguments)
	}

	/// @function period(arguments)
	/// @return {real} <return_description>
	get_period = function(arguments = {}) {
		arguments.time_source = self
		return get_period_time_source_generic(arguments)
	}

	/// @function completed_repetitions(arguments)
	/// @return {real} <return_description>
	get_completed_repetitions = function(arguments = {}) {
		arguments.time_source = self
		return get_completed_repetitions_time_source_generic(arguments)
	}

	/// @function remaining_repetitions(arguments)
	/// @return {real} <return_description>
	get_remaining_repetitions = function(arguments = {}) {
		arguments.time_source = self
		return get_remaining_repetitions_time_source_generic(arguments)
	}

	/// @function state(arguments)
	/// @return {type} <return_description>
	get_state = function(arguments = {}) {
		arguments.time_source = self
		return get_state_time_source_generic(arguments)
	}

	/// @function remaining_time(arguments)
	/// @return {real} <return_description>
	get_remaining_time = function(arguments = {}) {
		arguments.time_source = self
		return get_remaining_time_time_source_generic(arguments)
	}

	/// @function units(arguments)
	/// @return {type} <return_description>
	get_units = function(arguments = {}) {
		arguments.time_source = self
		return get_units_time_source_generic(arguments)
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– METHODS ––––––––––––––––––––
	/*******************************************************************************/

}
