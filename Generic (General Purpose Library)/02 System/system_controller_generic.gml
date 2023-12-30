/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
system_controller_generic.gml

@overview
Defines and initializes system_controller_generic. This struct is responsible
for initializing and controlling the other controllers in the generic library.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– LIBRARY_INITIALIZATION ––––––––––––––––––––
/*******************************************************************************/

GENERIC = {}
CONTROLLERS_GENERIC = {}
LOOKUP_TABLES_GENERIC = {}

CONTROLLERS_GENERIC.system = new SystemControllerGeneric()

// permanently add an instance of system_controller_object_generic to the first room
room_instance_add(room_first, 0, 0, system_controller_object_generic)

/*******************************************************************************/
#endregion –––––––––––––––––––– LIBRARY_INITIALIZATION ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– SYSTEM_CONTROLLER ––––––––––––––––––––
/*******************************************************************************/

function SystemControllerGeneric() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– SUBSYSTEM_CONTROLLERS ––––––––––––––––––––
    /*******************************************************************************/

    /* –––––––––––––––––––– INITIALIZE –––––––––––––––––––– */
    with (CONTROLLERS_GENERIC) {
        time_source     = new TimeSourceControllerGeneric()
        // animation_curve = new AnimationCurveControllerGeneric()
        // extension       = new ExtensionControllerGeneric()
        // font            = new FontControllerGeneric()
        // note            = new NoteControllerGeneric()
        // particle_system = new ParticleSystemControllerGeneric()
        // path            = new PathControllerGeneric()
        // room            = new RoomControllerGeneric()
        // script          = new ScriptControllerGeneric()
        // sequence        = new SequenceControllerGeneric()
        // shader          = new ShaderControllerGeneric()
        // sound           = new SoundControllerGeneric()
        // sprite          = new SpriteControllerGeneric()
        // tileset         = new TileSetControllerGeneric()
    }

    /* –––––––––––––––––––– OBJECT_EVENT_ARRAY –––––––––––––––––––– */
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

    var _controller_names   = struct_get_names(CONTROLLERS_GENERIC)
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

    /* –––––––––––––––––––– EXECUTE_OBJECT_EVENT_FUNCTION –––––––––––––––––––– */
    call_object_event_method_of_subsystem_controllers = function(_object_event_name) {
        var _current_object_event_controllers = object_event_controllers[$ _object_event_name]
        for (var i = 0; i < array_length(_current_object_event_controllers); i++) {
            _current_object_event_controllers[i][$ _object_event_name]()
        }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SUBSYSTEM_CONTROLLERS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– SYSTEM_TIME_SOURCE ––––––––––––––––––––
    /*******************************************************************************/

    // this time_source ensures that an istance of system_controller_object_generic exists
    system_time_source = new TimeSourceGeneric({
        parent : time_source_global,
        period_frames : 1,
        repetitions : infinity,
        callback : function() {
            // make sure that an instance of system_controller_object_generic exists
            if (!instance_exists(system_controller_object_generic)) {
                create_object_instance_generic(system_controller_object_generic)
            }
        },
    })

    system_time_source.start()

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SYSTEM_TIME_SOURCE ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– SYSTEM_OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

    finite_state_machine = new FiniteStateMachineGeneric({ initial_state_name : "default" })
    finite_state_machine.define_state({ state_name : "default" })

    var _object_events = {}

    // create_event : system_controller_object_generic
    // exactly one instance of system_controller_object_generic should exist at any time
    // self-destruct if another instance of system_controller_object_generic already exists
    _object_events.create_event = function() {
        if (instance_number(object_index) > 1) { instance_destroy() }
    }

    // other object events : system_controller_object_generic
    // call the corresponding object event method on all subsystem_controllers
    var _object_event_names =
    for (var i = 0; i < array_length(_object_event_names); i++) {
        _object_events[$ _object_event_names[i]] = function() {
            call_object_event_method_of_subsystem_controllers({
                object_event_name : finite_state_machine.get_method_name()
            })
        }
    }

    finite_state_machine.define_default_event({ event : _object_events })

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SYSTEM_OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

}

/*******************************************************************************/
#endregion –––––––––––––––––––– SYSTEM_CONTROLLER ––––––––––––––––––––
/*******************************************************************************/
