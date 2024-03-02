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
