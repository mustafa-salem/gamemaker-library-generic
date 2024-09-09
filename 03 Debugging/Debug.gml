#macro BEGIN_SCRIPT_HINT_DEBUG_GENERIC show_debug_message("BEGIN_SCRIPT:\n" + string(debug_get_callstack()))
#macro   END_SCRIPT_HINT_DEBUG_GENERIC show_debug_message("END_SCRIPT:\n"   + string(debug_get_callstack()))

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

function debug_event_type_name() {
    switch (event_type) {
        // CREATE EVENT
        case ev_create:
            _event_name = "create"
        break;
        // DESTROY EVENT
        case ev_destroy:
            _event_name = "destroy"
        break;
        // CLEANUP EVENT
        case ev_cleanup:
            _event_name = "cleanup"
        break;
        // STEP EVENTS
        case ev_step:
            _event_name = "step"
            switch (event_number) {
                case ev_step_normal:
                    _sub_event_name = "step_normal"
                break;
                case ev_step_begin:
                    _sub_event_name = "begin_step"
                break;
                case ev_step_end:
                    _sub_event_name = "end_step"
                break;
            }
        break;
        // ALARM EVENT
        case ev_alarm:
            _event_name = "alarm"
            _sub_event_name = string(event_number) // ALARM NUMBER 0...11
        break;
        // KEY DOWN EVENT
        case ev_keyboard:
            _event_name = "key_down"
            _sub_event_name = string(event_number) // KEYCODE
        break;
        // KEY PRESS EVENT
        case ev_keypress:
            _event_name = "key_press"
            _sub_event_name = string(event_number) // KEYCODE
        break;
        // KEY RELEASE EVENT
        case ev_keyrelease:
            _event_name = "key_release"
            _sub_event_name = string(event_number) // KEYCODE
        break;
        case ev_mouse:
            _event_name = "mouse"
            // TODO: EXPAND
            _sub_event_name = string(event_number)
        break;
        // COLLISION EVENTS
        case ev_collision:
            _event_name = "collision"
            _sub_event_name = object_get_name(event_number) // INDEX COLLISION OBJECT -> NAME COLLISION OBJECT
        break;
        // OTHER EVENTS
        case ev_other:
            _event_name = "other"
            // TODO: EXPAND
            _sub_event_name = string(event_number)
        break;
        // GESTURE EVENTS
        case ev_gesture:
            _event_name = "gesture"
            // TODO: EXPAND
            _sub_event_name = string(event_number)
        break;
        // DRAW EVENTS
        case ev_draw:
            _event_name = "draw"
            switch (event_number) {
                case ev_draw_begin:
                    _sub_event_name = "draw_begin"
                break;
                case ev_draw_end:
                    _sub_event_name = "draw_end"
                break;
                case ev_draw_pre:
                    _sub_event_name = "pre_draw"
                break;
                case ev_draw_post:
                    _sub_event_name = "post_draw"
                break;
                case ev_gui:
                    _sub_event_name = "gui"
                break;
                case ev_gui_begin:
                    _sub_event_name = "gui_begin"
                break;
                case ev_gui_end:
                    _sub_event_name = "gui_end"
                break;
                default:
                    _sub_event_name = "draw_normal"
            }
        break;
        default:
            _event_name = "unknown"
            _sub_event_name = "unknown"
    }
}

function debug_log_event(_debug_note = "") {
	if (global.debug_setting_log_events == true) {

        _event_name = ""
        _sub_event_name = ""

        // EVENT ID -> STRING
        debug_event_type_name()

        _debug_message = "event log: " + object_get_name(object_index) + "." + _event_name
        if (_sub_event_name != "") { _debug_message = _debug_message + "." + _sub_event_name }
        if (_debug_note != "") { _debug_message = _debug_message + " -> " + _debug_note}

        show_debug_message(_debug_message)
	}
}

function debug_printline(argument0, argument1)
{

}

function debug_printxy(argument0, argument1, argument2)
{

}

my_debug_skip_contact = false
my_debug_skip_intro = false
my_debug_draw_room_name = true
my_debug_draw_skip_audiogroup_load = true
my_debug_room_goto_next_key = true
my_debug_goto_dojo = true
my_debug_print_code_location = true

debug_setting_log_events = false

// MESSES UP SAVE POINTS
debug_setting_toggle_solid_blocks = false
debug_setting_draw_solid_blocks = false

debug_skip_legend = true
debug_skip_intro = true

debug_setting_draw_fps = true
debug_setting_draw_path = false
debug_setting_draw_grid = false

// version = "1.10"

/*

variable      : arguments,
variable_name : "arguments",
expected_type : "struct",

*/
// InvalidTypeErrorGeneric
