GENERIC = {}
CONTROLLERS_GENERIC = {}
LOOKUP_TABLES_GENERIC = {}

system_controller_generic = new SystemControllerGeneric()

function SystemControllerGeneric() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– TIME_SOURCES ––––––––––––––––––––
    /*******************************************************************************/

    // time source that runs every frame
    time_source = new TimeSourceGeneric({
        parent : time_source_global,
        period_frames : 1,
        repetitions : infinity,
        callback : function() {
			// make sure that an instance of system_controller_object_generic exists
            if (!instance_exists(system_controller_object_generic)) { create_object_instance_generic(system_controller_object_generic) }
        },
    })

	time_source.start()

    /*******************************************************************************/
    #endregion –––––––––––––––––––– TIME_SOURCES ––––––––––––––––––––
    /*******************************************************************************/

	/*******************************************************************************/
    #region    –––––––––––––––––––– CONTROLLER_STRUCTS ––––––––––––––––––––
    /*******************************************************************************/

    // create controller structs in order
    font_controller = new FontController()
    room_controller = new RoomControllerGeneric()

    #region    –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––

    object_event_controllers = {
        begin_step_event     : [ ],
        step_event           : [ ],
        end_step_event       : [ ],
        pre_draw_event       : [ ],
        draw_begin_event     : [ ],
        draw_event           : [ ],
        draw_end_event       : [ ],
        post_draw_event      : [ ],
        draw_gui_begin_event : [ ],
        draw_gui_event       : [ ],
        draw_gui_end_event   : [ ],
        game_start_event     : [ ],
        game_end_event       : [ ],
        room_start_event     : [ ],
        room_end_event       : [ ],
    }

    var _controller_names   = struct_get_names(GENERIC.controllers)
    var _object_event_names = struct_get_names(object_event_controllers)
    for (var i = 0; i < array_length(_object_event_names); i++) {
        for (var j = 0; j < array_length(_controller_names); j++) {
            if (_controller_names[j] == "system") { continue }
            var _controller = GENERIC.controllers[$ _controller_names[j]].finite_state_machine
            if (_controller[$ _object_event_names[i]] != undefined) {
                array_push(object_event_controllers[$ _object_event_names[i]], _controller)
            }
        }
    }

    execute_controller_object_events = function(_object_event_name) {
        var _current_object_event_controllers = object_event_controllers[$ _object_event_name]
        for (var i = 0; i < array_length(_current_object_event_controllers); i++) {
            _current_object_event_controllers[i][$ _object_event_name]()
        }
    }

    #endregion –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CONTROLLER_STRUCTS ––––––––––––––––––––
    /*******************************************************************************/

	/*******************************************************************************/
    #region    –––––––––––––––––––– SYSTEM_OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

	finite_state_machine = new FiniteStateMachine("default")
    finite_state_machine.add("default")

    finite_state_machine.define_default_event_function({
        event_name : _object_event_names
        event_function : function() {
            execute_controller_object_events(finite_state_machine.get_event_name())
        }
    })

    /************* ******************************************************************/
    #endregion –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

}
