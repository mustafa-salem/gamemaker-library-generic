/******************************************************************************/
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

#macro TIME_SOURCE_GENERIC INITIALIZED_CONSTRUCTOR(TimeSourceGeneric)

TIME_SOURCE_GENERIC

/// #macro time_source_controller time_source_controller_generic

#macro TimeSource  TimeSourceGeneric
#macro TIME_SOURCE TIME_SOURCE_GENERIC

#macro TIME_SOURCE_CONTROLLER_GENERIC INITIALIZED_CONSTRUCTOR(TimeSourceControllerGeneric)

TIME_SOURCE_CONTROLLER_GENERIC

#macro DEFAULT_PARENT_TIME_SOURCE_GENERIC      time_source_global
#macro DEFAULT_PERIOD_TIME_SOURCE_GENERIC      1
#macro DEFAULT_UNITS_TIME_SOURCE_GENERIC       time_source_units_frames
#macro DEFAULT_REPETITIONS_TIME_SOURCE_GENERIC 1
#macro DEFAULT_EXPIRY_TYPE_TIME_SOURCE_GENERIC time_source_expire_after

#macro TimeSourceController   TimeSourceControllerGeneric
#macro TIME_SOURCE_CONTROLLER TIME_SOURCE_CONTROLLER_GENERIC
/*

#macro time_source_controller time_source_controller_generic

*/

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

#region    –––––––––––––––––––– CALL_LATER_WRAPPERS ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function gpl_call_later(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// Creates a time source that calls the specified callback function after the
/// specified time. This time source is automatically destroyed afterwards.
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// Arguments used in the creation of the time source. Refer to Struct.TimeSourceGeneric.
/// ----------------------------------------------------------------------------
/// @return {Struct.TimeSourceGeneric}
/// The time source calling the callback function.
/// ----------------------------------------------------------------------------
function gpl_call_later(arguments = {}) {
	arguments.creation_scope = other
    var _time_source = new TimeSourceGeneric(arguments).start()
	TIME_SOURCE_CONTROLLER_GENERIC.add_garbage_collection({ time_source : _time_source })
    return _time_source
}

#endregion –––––––––––––––––––– CALL_LATER_WRAPPERS ––––––––––––––––––––

#region    ––––––––––––––– NATIVE_TIME_SOURCE_FUNCTION_WRAPPERS –––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_id_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_id
/// ----------------------------------------------------------------------------
function get_id_time_source_generic(arguments = {}) {
	return time_source_id
	return is_struct(arguments.time_source) ? arguments.time_source.get_id() : arguments.time_source
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_create(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.create
/// ----------------------------------------------------------------------------
function gpl_time_source_create(arguments = {}) {
	arguments.creation_scope = other
	return new TimeSourceGeneric(arguments)
}

/// ----------------------------------------------------------------------------
/// @function exists_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.exists
/// ----------------------------------------------------------------------------
function exists_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	return time_source_exists(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_destroy(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This is a generification of <time_source_destroy>.
/// ----------------------------------------------------------------------------
/// @parameter {mixed} time_source
/// The time source(s) to destroy.
///
/// @parameter {boolean} destroy_children
/// Whether to destroy child Time Sources as well.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function gpl_time_source_destroy(parameters = {}) {
	time_source_destroy(parameters.time_source, parameters.destroy_children)
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_start(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.start
/// ----------------------------------------------------------------------------
function gpl_time_source_start(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	time_source_start(_time_source_id)
	return self
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_is_active(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} time_source
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {boolean|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function gpl_time_source_is_active(parameters = {}) {
	if (not is_struct(parameters)) {
		throw new InvalidArgumentException({ message : "<parameters> must be a struct." })
	}
	return time_source_get_state(time_source) == time_source_state_active
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_pause(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.pause
/// ----------------------------------------------------------------------------
function gpl_time_source_pause(parameters = {}) {
	if (not is_struct(parameters)) {
		throw new InvalidArgumentException({ message : "<parameters> must be a struct." })
	}
	var _time_sources = parameters[$ "time_source"]
	if (not is_array(_time_sources)) {
		_time_sources = [_time_sources]
	}
	for (var i = 0; i < array_length(_time_sources); i++) {
		if (gpl_time_source_is_active(_time_sources[i]) == true) {
			time_source_pause(_time_sources[i])
		}
	}
	return undefined
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_is_paused(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} time_source
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {boolean|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function gpl_time_source_is_paused(parameters = {}) {
	if (not is_struct(parameters)) {
		throw new InvalidArgumentException({ message : "<parameters> must be a struct." })
	}
	return time_source_get_state(time_source) == time_source_state_paused
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_stop(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.stop
/// ----------------------------------------------------------------------------
function gpl_time_source_stop(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	time_source_stop(_time_source_id)
	return self
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_is_stopped(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} time_source
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {boolean|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function gpl_time_source_is_stopped(parameters = {}) {
	if (not is_struct(parameters)) {
		throw new InvalidArgumentException({ message : "<parameters> must be a struct." })
	}
	return time_source_get_state(time_source) == time_source_state_stopped
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function gpl_time_source_resume(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.resume
/// ----------------------------------------------------------------------------
function gpl_time_source_resume(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	time_source_resume(_time_source_id)
	return self
}

/// ----------------------------------------------------------------------------
/// @function reconfigure_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.reconfigure
/// ----------------------------------------------------------------------------
function reconfigure_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	var _arguments = private_static.reconfigure_arguments(arguments)
	time_source_reconfigure(
		_arguments.time_source_id,
		_arguments.period,
		_arguments.units,
		_arguments.callback,
		_arguments.arguments,
		_arguments.repetitions,
		_arguments.expiry_type,
	)
}

/// ----------------------------------------------------------------------------
/// @function reset_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.reset
/// ----------------------------------------------------------------------------
function reset_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	time_source_reset(_time_source_id)
	return self
}

/// ----------------------------------------------------------------------------
/// @function get_children_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_children
/// ----------------------------------------------------------------------------
function get_children_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	var _children_ids = time_source_get_children(_time_source_id)
	var _children = []
	for (var i = 0; i < array_length; i++) {
		array_push(_children, new TimeSourceGeneric({ time_source_id : _children_ids[i] }))
	}
	return _children
}

/// ----------------------------------------------------------------------------
/// @function get_parent_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_parent
/// ----------------------------------------------------------------------------
function get_parent_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	var _parent_id = time_source_get_parent(_time_source_id)
	return new TimeSourceGeneric({ time_source_id : _parent_id })
}

/// ----------------------------------------------------------------------------
/// @function get_period_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_period
/// ----------------------------------------------------------------------------
function get_period_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	return time_source_get_period(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_state_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_state
/// ----------------------------------------------------------------------------
function get_state_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	return time_source_get_state(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_remaining_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_remaining_time
/// ----------------------------------------------------------------------------
function get_remaining_time_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	return time_source_get_time_remaining(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_units_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_units
/// ----------------------------------------------------------------------------
function get_units_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	return time_source_get_units(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_completed_repetitions_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_completed_repetitions
/// ----------------------------------------------------------------------------
function get_completed_repetitions_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	return time_source_get_reps_completed(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_remaining_repetitions_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_remaining_repetitions
/// ----------------------------------------------------------------------------
function get_remaining_repetitions_time_source_generic(arguments = {}) {
	if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source_id = get_id(arguments)
	var _remaining_repetitions = time_source_get_reps_remaining(_time_source_id)
	return _remaining_repetitions == undefined ? infinity : _remaining_repetitions
}

/// ----------------------------------------------------------------------------
/// @function (arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.
/// ----------------------------------------------------------------------------
function get_repetitions_time_time_source_generic(arguments = {}) {
	if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source = arguments[$ "time_source"]
	var _remaining_repetitions = time_source_get_reps_remaining(_time_source_id)
	if (_remaining_repetitions == undefined) { return infinity }
	var _completed_repetitions = time_source_get_reps_completed(_time_source_id)
	return _completed_repetitions + _remaining_repetitions
}

/// ----------------------------------------------------------------------------
/// @function get_expiry_type_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_expiry_type
/// ----------------------------------------------------------------------------
function get_expiry_type_time_time_source_generic(arguments = {}) {
	if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source = arguments[$ "time_source"]
	return is_struct(_time_source) ? _time_source.private.expiry_type : undefined
}

/// ----------------------------------------------------------------------------
/// @function get_callback_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_callback
/// ----------------------------------------------------------------------------
function get_callback_time_time_source_generic(arguments = {}) {
	if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source = arguments[$ "time_source"]
	return is_struct(_time_source) ? _time_source.private.callback : undefined
}

/// ----------------------------------------------------------------------------
/// @function get_arguments_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// TimeSourceGeneric.get_arguments
/// ----------------------------------------------------------------------------
function get_arguments_time_time_source_generic(arguments = {}) {
	if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
	var _time_source = arguments[$ "time_source"]
	return is_struct(_time_source) ? _time_source.private.arguments : undefined
}

#endregion ––––––––––––––– NATIVE_TIME_SOURCE_FUNCTION_WRAPPERS –––––––––––––––

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function TimeSourceGeneric(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
/// <parameter_description>
///
/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.parent
/// The parent time source of the new time source.
///
/// @parameter {Real} arguments.period
/// The period that the time source runs for.
///
/// @parameter {Constant.TimeSourceUnit} arguments.units
/// The units that the given period is in.
///
/// @parameter {Real|Infinity} arguments.repetitions
/// The number of times the Time Source should repeat,
/// or infinity for indefinite repetition.
///
/// @parameter {Constant.TimeSourceExpiry} arguments.expiry_type
/// Whether the Time Source expires on the frame nearest to its expiry,
/// or on the next frame.
///
/// @parameter {Function} arguments.callback
/// The method or script function to call when the Time Source expires.
///
/// @parameter {Array<Any>} arguments.arguments
/// An array containing the arguments to pass into the method
///
/// @parameter {} arguments.scope
///
/// ----------------------------------------------------------------------------
function TimeSourceGeneric(arguments = {}) constructor {

	CONSTRUCTOR_INITIALIZATION_GUARD

	#region    –––––––––––––––––––– PUBLIC_STATIC ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_id(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {type}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_id = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function create(arguments)
	/// ----------------------------------------------------------------------------
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_create
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// <parameter_description>
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.parent
	/// The parent time source of the new time source.
	///
	/// @parameter {Real} arguments.period
	/// The period that the time source runs for.
	///
	/// @parameter {Constant.TimeSourceUnit} arguments.units
	/// The units that the given period is in.
	///
	/// @parameter {Real|Infinity} arguments.repetitions
	/// The number of times the Time Source should repeat,
	/// or infinity for indefinite repetition.
	///
	/// @parameter {Constant.TimeSourceExpiry} arguments.expiry_type
	/// Whether the Time Source expires on the frame nearest to its expiry,
	/// or on the next frame.
	///
	/// @parameter {Function} arguments.callback
	/// The method or script function to call when the Time Source expires.
	///
	/// @parameter {Array<Any>} arguments.arguments
	/// An array containing the arguments to pass into the method
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric}
	/// The created time source.
	/// ----------------------------------------------------------------------------
	function create(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function exists(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_exists
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Bool}
	/// Whether the time source exists.
	/// ----------------------------------------------------------------------------
	static exists = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function destroy(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This method calls <gpl_time_source_destroy> on self.
	/// ----------------------------------------------------------------------------
	/// @return {struct} self
	/// ----------------------------------------------------------------------------
	static destroy = function(parameters = {}) {
		parameters.time_source = self
		gpl_time_source_destroy(parameters)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function start()
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @return {struct} self
	/// ----------------------------------------------------------------------------
	static start = function() {
		gpl_time_source_start({ time_source : self })
	    return self
	}

	self.start = method(self, start)

	/// ----------------------------------------------------------------------------
	/// @function pause()
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @return {struct} self
	/// ----------------------------------------------------------------------------
	static pause = function() {
		gpl_time_source_pause({ time_source : self })
	    return self
	}

	self.pause = method(self, pause)

	/// ----------------------------------------------------------------------------
	/// @function stop()
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @return {struct} self
	/// ----------------------------------------------------------------------------
	static stop = function() {
		gpl_time_source_stop({ time_source : self })
	    return self
	}

	self.stop = method(self, stop)

	/// ----------------------------------------------------------------------------
	/// @function resume()
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @return {struct} self
	/// ----------------------------------------------------------------------------
	static resume = function() {
		gpl_time_source_resume({ time_source : self })
		return self
	}

	self.resume = method(self, resume)

	/// ----------------------------------------------------------------------------
	/// @function reconfigure(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_reconfigure
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// <parameter_description>
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.parent
	/// The parent time source of the new time source.
	///
	/// @parameter {Real} arguments.period
	/// The period that the time source runs for.
	///
	/// @parameter {Constant.TimeSourceUnit} arguments.units
	/// The units that the given period is in.
	///
	/// @parameter {Real|Infinity} arguments.repetitions
	/// The number of times the Time Source should repeat,
	/// or infinity for indefinite repetition.
	///
	/// @parameter {Constant.TimeSourceExpiry} arguments.expiry_type
	/// Whether the Time Source expires on the frame nearest to its expiry,
	/// or on the next frame.
	///
	/// @parameter {Function} arguments.callback
	/// The method or script function to call when the Time Source expires.
	///
	/// @parameter {Array<Any>} arguments.arguments
	/// An array containing the arguments to pass into the method
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static reconfigure = function(arguments = {}) {

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function reset(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// get_id_time_source_generic
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static reset = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_children(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_children
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Array<Struct.TimeSourceGeneric>}
	/// An array containing the Time Sources children.
	/// ----------------------------------------------------------------------------
	static get_children = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_parent(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_parent
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_parent = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_period(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_period
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// The period value set for the given Time Source
	/// ----------------------------------------------------------------------------
	static get_period = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_state(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_state
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Constant.TimeSourceState}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_state = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_remaining_time(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_time_remaining
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_remaining_time = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_units(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_units
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Constant.TimeSourceUnit}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_units = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_completed_repetitions(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_reps_completed
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_completed_repetitions = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_remaining_repetitions(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_reps_remaining
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_remaining_repetitions = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_repetitions(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_repetitions = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_expiry_type(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Constant.TimeSourceExpiry|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_expiry_type = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_callback(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Function|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_callback = function(arguments = {}) {

	}

	/// ----------------------------------------------------------------------------
	/// @function get_arguments(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Array<Any>|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_arguments = function(arguments = {}) {

	}

	#endregion –––––––––––––––––––– PUBLIC_STATIC ––––––––––––––––––––

	#region    –––––––––––––––––––– PRIVATE_STATIC ––––––––––––––––––––

	CONSTRUCTOR_INITIALIZATION_CODE(function() {
		private = {}

		/// ----------------------------------------------------------------------------
		/// @function creation_arguments(arguments)
		/// ----------------------------------------------------------------------------
		private.creation_arguments = function(arguments) {
			var _parent      = arguments[$ "parent"]      ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_parent()
			var _period      = arguments[$ "period"]      ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_period()
			var _units       = arguments[$ "units"]       ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_units()
			var _callback    = arguments[$ "callback"]
			var _arguments   = arguments[$ "arguments"]   ?? []
			var _repetitions = arguments[$ "repetitions"] ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_repetitions()
			var _expiry_type = arguments[$ "expiry_type"] ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_expiry_type()

			// shortform
			var _period_seconds = arguments[$ "period_seconds"]
			// shortform
			var _period_frames  = arguments[$ "period_frames"]
			// ensures correct scoping of callback function
			var _creation_scope = arguments[$ "creation_scope"] ?? other

			// PARENT
			if (is_struct(_parent)) { _parent = _parent.get_id() }
			// PERIOD and UNITS
			if (_period_seconds != undefined) {
				var _period = _period_seconds
				var _units  = time_source_units_seconds
			} else if (_period_frames != undefined) {
				var _period = _period_frames
				var _units  = time_source_units_frames
			}
			// REPETITIONS
			if (_repetitions == infinity) { _repetitions = -1 }
			// CALLBACK
			if (!is_method(_callback) or method_get_self(_callback) == arguments) {
				_callback = method(_creation_scope, _callback)
			}

			return {
				parent      : _parent,
				period      : _period,
				units       : _units,
				callback    : _callback,
				arguments   : _arguments,
				repetitions : _repetitions,
				expiry_type : _expiry_type,
			}
		}

		/// ----------------------------------------------------------------------------
		/// @function creation_arguments(arguments)
		/// ----------------------------------------------------------------------------
		private.reconfigure_arguments = function(arguments) {
			arguments[$ "time_source_id"] ??= get_id(arguments)
			arguments[$ "parent"]         ??= get_parent(arguments)
			arguments[$ "period"]         ??= get_period(arguments)
			arguments[$ "units"]          ??= get_units(arguments)
			arguments[$ "callback"]	      ??= get_callback(arguments)
			arguments[$ "arguments"]      ??= get_arguments(arguments)
			arguments[$ "repetitions"]    ??= get_repetitions(arguments)
			arguments[$ "expiry_type"]    ??= get_expiry_type(arguments)

			return creation_arguments(arguments)
		}

	})

	#endregion –––––––––––––––––––– PRIVATE_STATIC ––––––––––––––––––––

	#region    –––––––––––––––––––– PRIVATE_INSTANCE ––––––––––––––––––––

	private = {
		time_source_id : arguments[$ "time_source_id"],
		parent         : undefined,
		period         : undefined,
		units          : undefined,
		callback       : undefined,
		arguments      : undefined,
		repetitions    : undefined,
		expiry_type    : undefined,
	}

	#endregion –––––––––––––––––––– PRIVATE_INSTANCE ––––––––––––––––––––

	#region    –––––––––––––––––––– NEW_INSTANCE ––––––––––––––––––––

	if (private.time_source_id == undefined) {
		var _arguments = TimeSourceGeneric.private.creation_arguments(arguments)
		private.time_source_id = time_source_create(
			_arguments.parent,
			_arguments.period,
			_arguments.units,
			_arguments.callback,
			_arguments.arguments,
			_arguments.repetitions,
			_arguments.expiry_type,
		)
	}

	#endregion –––––––––––––––––––– NEW_INSTANCE ––––––––––––––––––––

}

/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
time_source_controller_generic.gml

@overview
This file defines the constructor for the TimeSourceControllerGeneric struct.
This struct caches time sources created by gpl_call_later and automatically
garbage collects them once they have called their callback method. This struct
is initialized by SystemControllerGeneric.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

/// @function TimeSourceControllerGeneric()
/// @description
/// Creates a controller struct for time sources used by the generic general
/// purpose library. Do not call this function.
function TimeSourceControllerGeneric() constructor {

    SYSTEM_CONTROLLER.set_default_controller({
        controller_name   : "time_source_controller",
        controller_struct : static_get(TimeSourceControllerGeneric),
    })

    static default_parent       = DEFAULT_PARENT_TIME_SOURCE_GENERIC
    static default_period       = DEFAULT_PERIOD_TIME_SOURCE_GENERIC
    static default_units        = DEFAULT_UNITS_TIME_SOURCE_GENERIC
    static default_repetitions  = DEFAULT_REPETITIONS_TIME_SOURCE_GENERIC
    static default_expiry_type  = DEFAULT_EXPIRY_TYPE_TIME_SOURCE_GENERIC

    static time_sources = []

    /// @type {Array<Struct.TimeSourceGeneric>}
    /// caches time sources created by gpl_call_later
    static call_later_time_sources = []

    #region    –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––

    static step_event = function() {
        // remove time sources used with gpl_call_later once they have run their callback method
        for (var i = 0; i < array_length(call_later_time_sources); i++) {
            var _time_source = call_later_time_sources[i]
            // destroy stopped time sources
            if (!_time_source.get_state() == time_source_state_stopped) {
                _time_source.destroy()
            }
            // delete destroyed time sources from array
            if (!_time_source.exists()) {
                array_delete(call_later_time_sources, i, 1)
            }
        }
    }

    #endregion –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––

    static get_default_parent = function() {
        return default_parent
    }

    /// ----------------------------------------------------------------------------
    /// @function set_default_parent_time_source(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// Sets the default value used for the parent time source when creating a time source.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    /// {Id.TimeSource or Struct.TimeSourceGeneric} time_source
    /// ----------------------------------------------------------------------------
    static set_default_parent = function(arguments = {}) {
        if (is_struct(arguments.time_source)) {
            default_parent = arguments.time_source
        } else {
            default_parent = new TimeSourceGeneric({ time_source_id : arguments.time_source })
        }
    }

    static get_default_period = function() {
        return default_period
    }

    static get_default_units = function() {
        return default_units
    }

    static get_default_repetitions = function() {
        return default_repetitions
    }

    static get_default_expiry_type = function() {
        return default_expiry_type
    }

    static add_garbage_collection = function(arguments = {}) {
        array_push(call_later_time_sources, arguments.time_source)
    }

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/******************************************************************************/
