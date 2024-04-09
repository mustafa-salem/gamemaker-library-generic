/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

BEGIN_SCRIPT_HINT_DEBUG_GENERIC

/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

#macro SYSTEM_CONTROLLER_GENERIC INITIALIZED_CONSTRUCTOR(SystemControllerGeneric)

SYSTEM_CONTROLLER_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– NAMESPACES ––––––––––––––––––––
/*******************************************************************************/

#macro GENERIC               global.generic_general_purpose_library_gamemaker
#macro LOOKUP_TABLES_GENERIC GENERIC.lookup_tables

/*******************************************************************************/
#endregion –––––––––––––––––––– NAMESPACES ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro SystemController  SystemControllerGeneric
#macro SYSTEM_CONTROLLER SYSTEM_CONTROLLER_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

END_SCRIPT_HINT_DEBUG_GENERIC

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
system_controller_generic.gml

@overview
Defines and initializes system_controller_generic. This struct is responsible
for initializing and controlling the other controllers in the generic library.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

function SystemControllerGeneric() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– LIBRARY_INITIALIZATION ––––––––––––––––––––
    /*******************************************************************************/

    // adds an instance of system_controller_object_generic to the first room (permanently)
    room_instance_add(room_first, 0, 0, system_controller_object_generic)

    /*******************************************************************************/
    #endregion –––––––––––––––––––– LIBRARY_INITIALIZATION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– CONTROLLERS ––––––––––––––––––––
    /*******************************************************************************/

    static default_controllers = {}

    static controllers = {}

    static set_default_controller = function(arguments = {}) {
        var _controller_name   = arguments.controller_name
        var _controller_struct = arguments.controller_struct
        default_controllers[$ _controller_name] = _controller_struct
        if (controllers[$ _controller_name] == undefined) {
            controllers[$ _controller_name] = _controller_struct
        }
    }

    static set_controller = function(arguments = {}) {

    }

    static execute_event_controllers = function(_event_name) {
        var _controller_names = struct_get_names(controllers)
        for (var i = 0; i < array_length(_controller_names); i++) {
            var _controller = controllers[$ _controller_names[i]]
            if (!is_callable(_controller[$ _event_name])) { continue }
            with (_controller) { self[$ _event_name]() }
        }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CONTROLLERS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function create_event()
    /// ----------------------------------------------------------------------------
    static create_event = function() {
        // game_launch_event
        static _ = game_launch_event()

        with (other) {
            if (instance_number(self) > 1) { instance_destroy() }
        }
    }

    /// ----------------------------------------------------------------------------
    /// @function create_event()
    /// ----------------------------------------------------------------------------
    static clean_up_event = function() {
        if (instance_number > 1) { return }
        call_later_generic({ delay_frames : 1, callable : function() {
            if (!instance_exists(system_controller_object_generic)) {
                instance_create_depth(0, 0, 0, system_controller_object_generic)
            }
        }})
    }

    /// ----------------------------------------------------------------------------
    /// @function begin_step_event()
    /// ----------------------------------------------------------------------------
    static begin_step_event = function() {
        static _event_name = "begin_step_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function step_event()
    /// ----------------------------------------------------------------------------
    static step_event = function() {
        static _event_name = "step_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function end_step_event()
    /// ----------------------------------------------------------------------------
    static end_step_event = function() {
        static _event_name = "end_step_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function pre_draw_event()
    /// ----------------------------------------------------------------------------
    static pre_draw_event = function() {
        static _event_name = "pre_draw_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function draw_begin_event()
    /// ----------------------------------------------------------------------------
    static draw_begin_event = function() {
        static _event_name = "draw_begin_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function draw_event()
    /// ----------------------------------------------------------------------------
    static draw_event = function() {
        static _event_name = "draw_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function draw_end_event()
    /// ----------------------------------------------------------------------------
    static draw_end_event = function() {
        static _event_name = "draw_end_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function post_draw_event()
    /// ----------------------------------------------------------------------------
    static post_draw_event = function() {
        static _event_name = "post_draw_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function draw_gui_begin_event()
    /// ----------------------------------------------------------------------------
    static draw_gui_begin_event = function() {
        static _event_name = "draw_gui_begin_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function draw_gui_event()
    /// ----------------------------------------------------------------------------
    static draw_gui_event = function() {
        static _event_name = "draw_gui_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function draw_gui_end_event()
    /// ----------------------------------------------------------------------------
    static draw_gui_end_event = function() {
        static _event_name = "draw_gui_end_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function game_launch_event()
    /// ----------------------------------------------------------------------------
    static game_launch_event = function() {
        static _event_name = "game_launch_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function game_start_event()
    /// ----------------------------------------------------------------------------
    static game_start_event = function() {
        static _event_name = "game_start_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function game_end_event()
    /// ----------------------------------------------------------------------------
    static game_end_event = function() {
        static _event_name = "game_end_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function room_start_event()
    /// ----------------------------------------------------------------------------
    static room_start_event = function() {
        static _event_name = "room_start_event"
        execute_event_controllers(_event_name)
    }

    /// ----------------------------------------------------------------------------
    /// @function room_end_event()
    /// ----------------------------------------------------------------------------
    static room_end_event = function() {
        static _event_name = "room_end_event"
        execute_event_controllers(_event_name)
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

}
