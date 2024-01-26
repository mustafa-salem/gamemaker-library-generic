// feather disable all

#macro RoomAsset        RoomAssetGeneric
#macro go_to_room_asset go_to_room_asset_generic

new RoomAssetGeneric()

function RoomAssetGeneric() constructor {

    private = {
        id = -1,
    }

    /// ----------------------------------------------------------------------------
    /// @function get_id(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This is a wrapper function for get_id_room_asset_generic. When called on
    /// an instance of RoomAssetGeneric, its id is returned.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} [arguments]
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// ----------------------------------------------------------------------------
    static get_id = function(arguments = {}) {
        if (self[$ "private"] != undefined) { return private.id }
        return get_id_room_asset_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function go_to(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This is a wrapper function for go_to_room_asset_generic. When called on
    /// an instance of RoomAssetGeneric, its relevent properties are passed to
    /// the function per default.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} [arguments]
    /// ----------------------------------------------------------------------------
    /// @return {Undefined}
    /// ----------------------------------------------------------------------------
    static go_to = function(arguments = {}) {
        if (self[$ "private"] != undefined) { arguments.room_asset = get }
        go_to_room_asset_generic(arguments)
    }

}

// In case of failure -1 is returned.
function get_id_room_asset_generic() {

}

/// ----------------------------------------------------------------------------
/// @function go_to_room_asset_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
///
/// ----------------------------------------------------------------------------
/// @parameter {Struct}      arguments
/// @parameter {Real|String} arguments.room_asset - Id or name of room asset to
/// go to.
/// ----------------------------------------------------------------------------
/// @return {Undefined}
/// ----------------------------------------------------------------------------
function go_to_room_asset_generic(arguments) {
    // declare local variables
    var _room, _room_id

    _room = arguments.room

    if (is_real(_room))   { _room_id = _room }
    if (is_string(_room)) { _room_id = asset_get_index(_room) }

    // use built-in function
    room_goto(_room_id)
}
