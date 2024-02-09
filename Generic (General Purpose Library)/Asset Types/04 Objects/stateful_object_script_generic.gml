#macro define_event_stateful_object         define_event_stateful_object_generic
#macro define_default_event_stateful_object define_default_event_stateful_object_generic

/// ----------------------------------------------------------------------------
/// @function define_event_stateful_object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct}   arguments
/// @parameter {Function} arguments.object_constructor
/// @parameter {String}   arguments.state_name
/// @parameter {String}   arguments.event_name
/// @parameter {Function} arguments.event_method
/// ----------------------------------------------------------------------------
function define_event_stateful_object_generic(arguments = {}) {
    var _object_constructor = arguments[$ "object_constructor"]
    var _state_name = arguments[$ "state_name"]
    var _event_name = arguments[$ "event_name"]
    var _event_method = arguments[$ "event_method"]

    _object_constructor.events.state_name.event_name = method(undefined, _event_method)
}

/// ----------------------------------------------------------------------------
/// @function define_default_event_stateful_object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct}   arguments
/// @parameter {Function} arguments.object_constructor
/// @parameter {String}   arguments.event_name
/// @parameter {Function} arguments.event_method
/// ----------------------------------------------------------------------------
function define_default_event_stateful_object_generic(arguments = {}) {
    var _object_constructor = arguments[$ "object_constructor"] ??
    var _event_name = arguments[$ "event_name"]
    var _event_method = arguments[$ "event_method"]
    _object_constructor.default_events.event_name = method(undefined, _event_method)
}

function get_event_method_stateful_object_generic(arguments) {
    return
}

function get_default_event_method_stateful_object_generic(arguments) {
    return
}

// adds states and events from object to finite state machine
function extend_finite_state_machine_stateful_object_generic() {

}
