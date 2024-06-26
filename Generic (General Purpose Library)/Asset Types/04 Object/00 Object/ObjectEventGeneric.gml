/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro CREATE_EVENT_OBJECT_EVENT_GENERIC                                       \
OBJECT_EVENT_GENERIC.get({ object_event : "create_event" })

OBJECT_EVENT_GENERIC.create({ name : "create_event" })
.set_object_event_script_contents({ object_event_script_contents : function() {
    ObjectInstance.initialize({ object_instance : id })
    private.finite_state_machine.create_event()
}})

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DESTROY_EVENT_OBJECT_EVENT_GENERIC                                      \
OBJECT_EVENT_GENERIC.get({ object_event : "destroy_event" })

OBJECT_EVENT_GENERIC.create({ name : "destroy_event" })

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro CLEAN_UP_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "cleanup_event" })

/******************************************************************************/
#region    –––––––––––––––––––– STEP_EVENTS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro BEGIN_STEP_EVENT_OBJECT_EVENT_GENERIC                                   \
OBJECT_EVENT_GENERIC.get({ object_event : "begin_step_event" })

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro STEP_EVENT_OBJECT_EVENT_GENERIC                                         \
OBJECT_EVENT_GENERIC.get({ object_event : "step_event" })

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro END_STEP_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "end_step_event" })

/******************************************************************************/
#endregion –––––––––––––––––––– STEP_EVENTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– DRAW_EVENTS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro PRE_DRAW_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "pre_draw_event" })

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DRAW_BEGIN_EVENT_OBJECT_EVENT_GENERIC                                   \
OBJECT_EVENT_GENERIC.get({ object_event : "draw_begin_event" })


/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DRAW_END_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "draw_end_event" })


/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro POST_DRAW_EVENT_OBJECT_EVENT_GENERIC                                    \
OBJECT_EVENT_GENERIC.get({ object_event : "post_draw_event" })


/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DRAW_GUI_BEGIN_EVENT_OBJECT_EVENT_GENERIC                               \
OBJECT_EVENT_GENERIC.get({ object_event : "draw_gui_begin_event" })


/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DRAW_GUI_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "draw_gui_event" })


/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DRAW_GUI_END_EVENT_OBJECT_EVENT_GENERIC                                 \
OBJECT_EVENT_GENERIC.get({ object_event : "draw_gui_end_event" })

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro WINDOW_RESIZE_EVENT_OBJECT_EVENT_GENERIC                                \
OBJECT_EVENT_GENERIC.get({ object_event : "window_resize_event" })

/******************************************************************************/
#endregion –––––––––––––––––––– DRAW_EVENTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– COLLISION_EVENT ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// Collision Event
/// ----------------------------------------------------------------------------
#macro COLLISION_EVENT_OBJECT_EVENT_GENERIC                                    \
OBJECT_EVENT_GENERIC.get({ object_event : "collision_event" })

/******************************************************************************/
#endregion –––––––––––––––––––– COLLISION_EVENT ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– OTHER_EVENTS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// Game Start Event
/// ----------------------------------------------------------------------------
#macro GAME_START_EVENT_OBJECT_EVENT_GENERIC                                   \
OBJECT_EVENT_GENERIC.get({ object_event : "game_start_event" })

/// ----------------------------------------------------------------------------
/// @description
/// Game End Event
/// ----------------------------------------------------------------------------
#macro GAME_END_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "game_end_event" })

/// ----------------------------------------------------------------------------
/// @description
/// Room Start Event
/// ----------------------------------------------------------------------------
#macro ROOM_START_EVENT_OBJECT_EVENT_GENERIC                                   \
OBJECT_EVENT_GENERIC.get({ object_event : "room_start_event" })

/// ----------------------------------------------------------------------------
/// @description
/// Room End Event
/// ----------------------------------------------------------------------------
#macro ROOM_END_EVENT_OBJECT_EVENT_GENERIC                                     \
OBJECT_EVENT_GENERIC.get({ object_event : "room_end_event" })

/******************************************************************************/
#endregion –––––––––––––––––––– OTHER_EVENTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro CURRENT_OBJECT_EVENT_GENERIC <expression>

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro OBJECT_EVENT_GENERIC <expression>

#macro CURRENT_OBJECT_EVENT CURRENT_OBJECT_EVENT_GENERIC
#macro OBJECT_EVENT OBJECT_EVENT_GENERIC

static event_script_content = {}
event_script_content[event_type][event_number]()
// private.finite_state_machine

// variable_get_hash

array[ev_create] =  CREATE_EVENT_OBJECT_EVENT_GENERIC
array[ev_create] = DESTROY_EVENT_OBJECT_EVENT_GENERIC

event_type ==     -> "create_event"
event_type == ev_destroy   -> "destroy_event"
event_type == ev_cleanup   -> "cleanup_event"
event_type == ev_collision -> "collision_event"


event_type_callables[$ ] = function() {
    private
}
event_type_callables[$ ev_step] = "step_event_type"
event_type_callables[$ ev_alarm] = function() {
    private.alarm_0()
}
event_type_callables[$ ev_keyboard]   =
event_type_callables[$ ev_keypress]   =
event_type_callables[$ ev_keyrelease] =
event_type_callables[$ ev_mouse]      =
event_type_callables[$ ev_gesture]    =
event_type_callables[$ ev_collision] = function() {

}
event_type_callables[$ ev_other]      = "other_event_type"
event_type_callables[$ ev_draw] = function() {
    event_callables[event_number]
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function ObjectEventGeneric() constructor {

    static get = function() {

    }

    static get_name = function() {
        return private.name
    }

    static get_name_hash = function() {
        return private.name_hash
    }

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
