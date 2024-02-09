/*******************************************************************************/
#region    –––––––––––––––––––– CALL_LATER_WRAPPERS ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function call_later_generic(arguments)
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
function call_later_generic(arguments = {}) {
	arguments.creation_scope = other
    var _time_source = new TimeSourceGeneric(arguments).start()
	TIME_SOURCE_CONTROLLER_GENERIC.add_garbage_collection({ time_source : _time_source })
    return _time_source
}

/*******************************************************************************/
#endregion –––––––––––––––––––– CALL_LATER_WRAPPERS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    ––––––––––––––– NATIVE_TIME_SOURCE_FUNCTION_WRAPPERS –––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_id_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_id
/// ----------------------------------------------------------------------------
function get_id_time_source_generic(arguments = {}) {
    return TIME_SOURCE_GENERIC.get_id(arguments)
}

/// ----------------------------------------------------------------------------
/// @function create_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.create
/// ----------------------------------------------------------------------------
function create_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.create(arguments)
}

/// ----------------------------------------------------------------------------
/// @function exists_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.exists
/// ----------------------------------------------------------------------------
function exists_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.exists(arguments)
}

/// ----------------------------------------------------------------------------
/// @function destroy_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.destroy
/// ----------------------------------------------------------------------------
function destroy_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.destroy(arguments)
}

/// ----------------------------------------------------------------------------
/// @function start_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.start
/// ----------------------------------------------------------------------------
function start_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.start(arguments)
}

/// ----------------------------------------------------------------------------
/// @function pause_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.pause
/// ----------------------------------------------------------------------------
function pause_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.pause(arguments)
}

/// ----------------------------------------------------------------------------
/// @function stop_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.stop
/// ----------------------------------------------------------------------------
function stop_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.stop(arguments)
}

/// ----------------------------------------------------------------------------
/// @function resume_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.resume
/// ----------------------------------------------------------------------------
function resume_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.resume(arguments)
}

/// ----------------------------------------------------------------------------
/// @function reconfigure_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.reconfigure
/// ----------------------------------------------------------------------------
function reconfigure_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.reconfigure(arguments)
}

/// ----------------------------------------------------------------------------
/// @function reset_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.reset
/// ----------------------------------------------------------------------------
function reset_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.reset(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_children_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_children
/// ----------------------------------------------------------------------------
function get_children_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_children(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_parent_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_parent
/// ----------------------------------------------------------------------------
function get_parent_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_parent(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_period_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_period
/// ----------------------------------------------------------------------------
function get_period_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_period(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_state_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_state
/// ----------------------------------------------------------------------------
function get_state_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_state(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_remaining_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_remaining_time
/// ----------------------------------------------------------------------------
function get_remaining_time_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_remaining_time(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_units_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_units
/// ----------------------------------------------------------------------------
function get_units_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_units(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_completed_repetitions_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_completed_repetitions
/// ----------------------------------------------------------------------------
function get_completed_repetitions_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_completed_repetitions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_remaining_repetitions_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_remaining_repetitions
/// ----------------------------------------------------------------------------
function get_remaining_repetitions_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_remaining_repetitions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function (arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.
/// ----------------------------------------------------------------------------
function get_repetitions_time_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_repetitions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_expiry_type_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_expiry_type
/// ----------------------------------------------------------------------------
function get_expiry_type_time_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_expiry_type(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_callback_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_callback
/// ----------------------------------------------------------------------------
function get_callback_time_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_callback(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_arguments_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// TimeSourceGeneric.get_arguments
/// ----------------------------------------------------------------------------
function get_arguments_time_time_source_generic(arguments = {}) {
	return TIME_SOURCE_GENERIC.get_arguments(arguments)
}

/*******************************************************************************/
#endregion ––––––––––––––– NATIVE_TIME_SOURCE_FUNCTION_WRAPPERS –––––––––––––––
/*******************************************************************************/

END_SCRIPT_HINT_DEBUG_GENERIC
