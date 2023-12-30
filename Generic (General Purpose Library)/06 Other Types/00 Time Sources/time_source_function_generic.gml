/*******************************************************************************/
#region    ––––––––––––––– NATIVE_TIME_SOURCE_FUNCTION_WRAPPERS –––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function create_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {Struct.TimeSourceGeneric} <return_description>
/// ----------------------------------------------------------------------------
create_time_source_generic = function(arguments = {}) {
    return new TimeSourceGeneric(arguments)
}

/// ----------------------------------------------------------------------------
/// @function destroy_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
///
/// destroy_children: [bool=false]
/// ----------------------------------------------------------------------------
destroy_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    var _destroy_children  = arguments[$ "destroy_children"] ?? false
    time_source_destroy(_time_source_id, _destroy_children)
}

/// ----------------------------------------------------------------------------
/// @function exists_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {bool} <return_description>
/// ----------------------------------------------------------------------------
exists_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_exists(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function start_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
start_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    time_source_start(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function stop_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
stop_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    time_source_stop(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function pause_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
pause_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    time_source_pause(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function resume_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
resume_time_source_generic = function(arguments = {}) {
    time_source_resume(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function reconfigure_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
reconfigure_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    time_source_reconfigure(_time_source_id, period, units, callback, [args, repetitions, expiry_type]);
}

/// ----------------------------------------------------------------------------
/// @function reset_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
reset_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    time_source_reset(_time_source_id);
}

/// ----------------------------------------------------------------------------
/// @function get_children_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {array<Struct.TimeSourceGeneric>} <return_description>
/// ----------------------------------------------------------------------------
get_children_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
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
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {Struct.TimeSourceGeneric} <return_description>
/// ----------------------------------------------------------------------------
get_parent_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    var _parent_id = time_source_get_parent(_time_source_id)
    return new TimeSourceGeneric({ time_source_id : _parent_id })
}

/// ----------------------------------------------------------------------------
/// @function get_period_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {real} <return_description>
/// ----------------------------------------------------------------------------
get_period_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_get_period(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_completed_repetitions_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {real} <return_description>
/// ----------------------------------------------------------------------------
get_completed_repetitions_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_get_reps_completed(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_remaining_repetitions_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {real} <return_description>
/// ----------------------------------------------------------------------------
get_remaining_repetitions_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_get_reps_remaining(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_state_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
get_state_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_get_state(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_remaining_time_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {real} <return_description>
/// ----------------------------------------------------------------------------
get_remaining_time_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_get_time_remaining(_time_source_id)
}

/// ----------------------------------------------------------------------------
/// @function get_units_time_source_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// time_source: (Id.TimeSource or Struct.TimeSourceGeneric)
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
get_units_time_source_generic = function(arguments = {}) {
    var _time_source_id = get_id_time_source_generic(arguments)
    return time_source_get_units(_time_source_id)
}

/*******************************************************************************/
#endregion ––––––––––––––– NATIVE_TIME_SOURCE_FUNCTION_WRAPPERS –––––––––––––––
/*******************************************************************************/

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
    var _time_source = new TimeSourceGeneric(arguments)
    _time_source.start()
    array_push(time_source_controller_generic.call_later_time_sources, _time_source)
    return _time_source
}

/*******************************************************************************/
#endregion –––––––––––––––––––– CALL_LATER_WRAPPERS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– NEW_FUNCTIONS ––––––––––––––––––––
/*******************************************************************************/

/// @function function_name(arguments)
/// @description <function_description>
/// @parameter {Struct} arguments <parameter_description>
/// @return {type} <return_description>
function get_id_time_source_generic(arguments = {}) {
    return is_struct(arguments.time_source) ? arguments.time_source.get_id() : arguments.time_source
}

/*******************************************************************************/
#endregion –––––––––––––––––––– NEW_FUNCTIONS ––––––––––––––––––––
/*******************************************************************************/
