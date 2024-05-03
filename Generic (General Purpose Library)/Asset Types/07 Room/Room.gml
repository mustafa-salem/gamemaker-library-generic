// feather disable all

// global.entrance

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/*

# IDENTIFIERS
* generic_room_get
* generic_room_get_id
* generic_room_get_handle
* generic_room_get_name

#
* generic_room_get_display_name

# EXISTANCE
* generic_room_exists
* generic_room_create

# DIMENSIONS
* generic_room_get_x_dimension
* generic_room_get_y_dimension
* generic_room_set_dimensions

# CAMERA & VIEW
*

* generic_room_get_persistent
* generic_room_set_persistent

# OTHER
* generic_room_set_event
* generic_room_go_to
* generic_room_restart

*/

/******************************************************************************/
#region    –––––––––––––––––––– IDENTIFIERS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_room_get(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {struct|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_get(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function generic_room_get_id(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {integer|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_get_id(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function generic_room_get_handle(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {handle|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_get_handle(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function generic_room_get_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {string|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_get_name(parameters = {}) {
    return _return
}

/******************************************************************************/
#endregion –––––––––––––––––––– IDENTIFIERS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_room_go_to(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {mixed} room
/// The value identifying the room to go to.
///
/// @parameter {mixed} [exit_point]
/// The value identifying the room's exit to use.
///
/// @parameter {mixed} [entry_point]
/// The value identifying the room's entrance to use.
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_go_to(parameters) {
    var _room = parameters[$ "room"]

    var _room_handle = generic_room_get_handle({ room : _room })

    room_goto(_room_handle)
}

/// ----------------------------------------------------------------------------
/// @function generic_room_get_entrance(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_get_entrance(parameters = {}) {
    Room.private.entrance = parameters.entrance
}

/// ----------------------------------------------------------------------------
/// @function generic_room_restart(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_restart(parameters = {}) {
    room_restart()
}

/// ----------------------------------------------------------------------------
/// @function generic_room_set_persistent(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {boolean} persistent
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_room_set_persistent(parameters = {}) {
    room_persistent = parameter.persistent
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

#macro ROOM INITIALIZED_CONSTRUCTOR(Room)

ROOM

function Room() constructor {

    CONSTRUCTOR_INITIALIZATION_GUARD

    /******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE ––––––––––––––––––––
    /******************************************************************************/

    static private = {
        /// @type {array<struct.Room>}
        ///
        rooms    : [],
        /// @type {number|string|undefined}
        ///
        entrance : undefined,
    }

    self.private = {
        room_start_event : undefined,
        room_end_event   : undefined,
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– CREATE ––––––––––––––––––––
    /******************************************************************************/

    /// @function create(parameters)
    static create = function(parameters) {
        return generic_room_create(parameters)
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– CREATE ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– IDENTIFIERS ––––––––––––––––––––
    /******************************************************************************/

    /// @function get(parameters)
    static get = function(parameters) {

    }

    /// @function get(parameters)
    self.get = method(self, get)

    /// @function get_id(parameters)
    static get_id = function(parameters) {
        return generic_room_get_id(parameters)
    }

    /// @function get_id(parameters)
    self.get_id = method(self, get_id)

    /// @function get_handle(parameters)
    static get_handle = function(parameters) {
        return generic_room_get_handle(parameters)
    }

    /// @function get_handle(parameters)
    self.get_handle = method(self, get_handle)

    /// @function get_name(parameters)
    static get_name = function(parameters) {
        return generic_room_get_name(parameters)
    }

    /// @function get_name(parameters)
    self.get_name = method(self, get_name)

    /******************************************************************************/
    #endregion –––––––––––––––––––– IDENTIFIERS ––––––––––––––––––––
    /******************************************************************************/

    /// @function create(parameters)
    self.create = function(parameters) {
        parameters.room = self
        return Room.create(parameters)
    }

    /// @function set_event(parameters)
    static set_event = function(arguments) {
        var _room_asset       = arguments[$ "room_asset"]
        var _room_start_event = arguments[$ "room_start_event"]
        // bind room_start_event function to room asset instance scope
        if (is_callable(_room_start_event)) {
            _room_start_event = method(_room_asset, _room_start_event)
        }
        _room_asset.private.room_start_event = _room_start_event
        return self
    }

    /// @function add_label(parameters)
    static add_label = function(arguments) {
        // add_label
        // remove_label
        // get_labels
        // set_labels
        return _return
    }

    self._ = method(self, _)

    /// @function go_to(parameters)
    static go_to = method(static_get(Room), function(parameters) {
        return generic_room_go_to(parameters)
    })

    /// @function go_to(parameters)
    self.go_to = function(parameters = {}) {
        parameters.room = self
        return Room.go_to(parameters)
    }

    /******************************************************************************/
    #region    –––––––––––––––––––– INITIALIZATION_CODE ––––––––––––––––––––
    /******************************************************************************/

    CONSTRUCTOR_INITIALIZATION_CODE(function() {
        for (var _room_index = room_first; _room_index <= room_last; _room_index++) {
            Room.create({ room_asset : _room_index })
        }
    })

    /******************************************************************************/
    #endregion –––––––––––––––––––– INITIALIZATION_CODE ––––––––––––––––––––
    /******************************************************************************/

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
