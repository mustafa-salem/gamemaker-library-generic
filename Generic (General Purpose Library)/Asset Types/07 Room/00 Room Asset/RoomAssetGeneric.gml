// feather disable all

#macro __IF_INSTANCE_SCOPE_SET_ROOM_ASSET_ARGUMENT_TO_SELF_ROOM_ASSET_GENERIC                    \
if (is_instanceof(self, RoomAssetGeneric)) { arguments.room_asset = self }

function RoomAssetGeneric() constructor {

    static private = {
        room_assets : [],
    }

    /// ----------------------------------------------------------------------------
    /// @function get(arguments)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Real|String|Struct} arguments.room_assets
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get = function(arguments) {
        if (is_instanceof(self, RoomAssetGeneric)) { arguments.room_asset = self }
        var _room_asset = arguments[$ "room_asset"]
        if (is_string(_room_asset)) {
            _room_asset = asset_get_index(_room_asset)
        }
        if (is_real(_room_asset)) {
            _room_asset = RoomAssetGeneric.private.room_assets[_room_asset]
        }
        if (is_struct(_room_asset)) {
            return _room_asset
        }
    }

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static create = function(arguments) {
        var _room_asset = new RoomAssetGeneric()

        _room_asset.private = {
            id   : ,
            name : ,
            display_name : ,
            labels : [], // -> tag?
            room_start_event : undefined,
            room_end_event   : undefined,
        }

        RoomAssetGeneric.private.room_assets = _room_asset
        return _room_asset
    }

    /// ----------------------------------------------------------------------------
    /// @function set_room_start_event(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Real|String|Struct} arguments.room_asset
    /// <parameter_description>
    ///
    /// @parameter {Undefined|Function} arguments.room_start_event
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_room_start_event = function(arguments) {
        __IF_INSTANCE_SCOPE_SET_ROOM_ASSET_ARGUMENT_TO_SELF_ROOM_ASSET_GENERIC
        var _room_asset       = arguments[$ "room_asset"]
        var _room_start_event = arguments[$ "room_start_event"]
        // bind room_start_event function to room asset instance scope
        if (is_callable(_room_start_event)) {
            _room_start_event = method(_room_asset, _room_start_event)
        }
        _room_asset.private.room_start_event = _room_start_event
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static add_label = function(arguments) {
        // add_label
        // remove_label
        // get_labels
        // set_labels
        return _return
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

    /*******************************************************************************/
    #region    –––––––––––––––––––– CONSTRUCTOR_INITIALIZATION_CODE ––––––––––––––––––––
    /*******************************************************************************/

    CONSTRUCTOR_INITIALIZATION_CODE(function() {
        for (var _room_index = room_first; _room_index <= room_last; _room_index++) {
            RoomAssetGeneric.create({ room_asset : _room_index })
        }
    })

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CONSTRUCTOR_INITIALIZATION_CODE ––––––––––––––––––––
    /*******************************************************************************/

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
