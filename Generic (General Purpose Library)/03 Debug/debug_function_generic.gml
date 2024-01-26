/// ----------------------------------------------------------------------------
/// @function show_trace_debug_generic(arguments)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { debug_message : (String|Array<String>), show_popup : [Bool=false] }
/// ----------------------------------------------------------------------------
function show_trace_debug_generic(arguments) {
    arguments ??= {}
    var _debug_message = arguments[$ "debug_message"] ?? "NO_MESSAGE"
    if (!is_array(_debug_message)) { _debug_message = [_debug_message] }
    var _show_popup = arguments[$ "show_popup"] ?? false

    var _string = ""

    _string += "----------------------------------------------------------------------------"
    _string += "------------------------------ DEBUG MESSAGE -------------------------------"
    _string += "----------------------------------------------------------------------------"
    for (var i = 0; i < array_length(_debug_message); i++) { _string += _debug_message[i] }
    _string += "----------------------------------------------------------------------------"
    _string += "------------------------------- CALL STACK ---------------------------------"
    _string += "----------------------------------------------------------------------------"
    _string += string(debug_get_callstack())
    _string += "----------------------------------------------------------------------------"

    show_debug_message(_string)
    if (_show_popup) { show_error(_string, false) }
}

// variable
// allowed_type -> "real", "struct", "string"
function  is_invalid_type_debug_generic(arguments) {

}


function DebugGeneric() constructor {
    static show_trace = show_trace_debug_generic
}
