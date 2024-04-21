/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

#macro ROOM_CONTROLLER_GENERIC INITIALIZED_CONSTRUCTOR(RoomControllerGeneric)

ROOM_CONTROLLER_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro RoomController  RoomControllerGeneric
#macro ROOM_CONTROLLER ROOM_CONTROLLER_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

/*

#macro room_controller_generic CONTROLLERS_GENERIC.room_controller

*/

function RoomControllerGeneric() constructor {

    /// @type {Struct.RoomPatternGeneric}
    static current_room_pattern = undefined

    /// @type {Struct.RoomPatternGeneric}
    static next_room_pattern = undefined

    static update_room_pattern = function() {

    }

    /// ----------------------------------------------------------------------------
    /// @function room_start_event()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    static room_start_event = function() {
        current_room_pattern = next_room_pattern
        next_room_pattern = undefined

        if (current_room_pattern != undefined) { current_room_pattern.room_start_event() }
    }

    /// ----------------------------------------------------------------------------
    /// @function room_end_event()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    static room_end_event = function() {

        if (current_room_pattern != undefined) { current_room_pattern.room_end_event() }

        current_room_pattern = undefined
    }

}
