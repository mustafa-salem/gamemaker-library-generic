// feather disable all

#macro RoomPattern RoomPatternGeneric
#macro go_to_room_pattern go_to_room_pattern_generic

new RoomPatternGeneric()

function RoomPatternGeneric() constructor {

    private = {
        name : undefined,
    }

    static get_name = function() {

    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    go_to = function(arguments = {}) {
        if (self[$ "private"] != undefined) { arguments[$ "room_pattern"] ??= get_name() }

        // declare local variables
        var _room, _room_id

        _room = arguments.room

        // room id specified
        if (is_real(_room)){
            _room_id = _room
        // room name specified
        } else if (is_string(_room)) {
            _room_id = asset_get_index(_room)
        }

        // use built-in function
        room_goto(_room_id)
    }

}

/// ----------------------------------------------------------------------------
/// @function go_to_room_pattern_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Real|String} arguments.room_pattern
/// What room pattern to go to. Can be a room pattern struct or an id or name
/// reference to a room pattern.
///
/// @parameter {Real|String} arguments.entrance
/// What entrance to use. Can be the index or name of an entrance. The entrance
/// with index 0 is used per default or when specified entrance isn't found.
/// ----------------------------------------------------------------------------
/// @return {Undefined}
/// ----------------------------------------------------------------------------
function go_to_room_pattern_generic(arguments) {
    var _room_pattern

    if (is_struct(arguments.room_pattern)) {
        _room_pattern = arguments.room_pattern
    } else {
        _room_pattern = room_controller_generic.get_room_pattern({ arguments.room_pattern })
    }

    _room_pattern.go_to(arguments)
}
