BEGIN_SCRIPT_HINT_DEBUG_GENERIC

/*******************************************************************************/
#region    –––––––––––––––––––– MACROS ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– INITIALIZE_CONSTRUCTOR ––––––––––––––––––––

#macro View ViewGeneric
#macro VIEW VIEW_GENERIC

#macro VIEW_GENERIC __ViewGeneric()

function __ViewGeneric() {
    static instance = new ViewGeneric()
    return static_get(ViewGeneric)
}

__ViewGeneric()
struct_remove(static_get(__ViewGeneric), "instance")

#endregion –––––––––––––––––––– INITIALIZE_CONSTRUCTOR ––––––––––––––––––––

#macro VIEWS __VIEWS()

function __VIEWS() {
    return [
        VIEW_0,
        VIEW_1,
        VIEW_2,
        VIEW_3,
        VIEW_4,
        VIEW_5,
        VIEW_6,
        VIEW_7
    ]
}

#macro VIEW_0 CAMERA_0.get_view()
#macro VIEW_1 CAMERA_1.get_view()
#macro VIEW_2 CAMERA_2.get_view()
#macro VIEW_3 CAMERA_3.get_view()
#macro VIEW_4 CAMERA_4.get_view()
#macro VIEW_5 CAMERA_5.get_view()
#macro VIEW_6 CAMERA_6.get_view()
#macro VIEW_7 CAMERA_7.get_view()

/*******************************************************************************/
#endregion –––––––––––––––––––– MACROS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

function ViewGeneric(arguments) constructor {

    if (arguments == undefined) { return }

    private = {
        camera_id : get_id_camera_generic({ camera : arguments.camera })
    }

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    static create = function(arguments = {}) {
        return new ViewGeneric(arguments)
    }

    /*******************************************************************************/
    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_x_position(arguments)
    /// ----------------------------------------------------------------------------
    static get_x_position = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        return camera_get_view_x(_camera_id)
    }

    /// ----------------------------------------------------------------------------
    /// @function get_y_position(arguments)
    /// ----------------------------------------------------------------------------
    static get_y_position = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        return camera_get_view_y(_camera_id)
    }

    /// ----------------------------------------------------------------------------
    /// @function get_position(arguments)
    /// ----------------------------------------------------------------------------
    static get_position = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        return {
            x : camera_get_view_x(_camera_id),
            y : camera_get_view_y(_camera_id),
        }
    }

    /// ----------------------------------------------------------------------------
    /// @function set_position(arguments)
    /// ----------------------------------------------------------------------------
    static set_position = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        var _x = arguments[$ "x"] ?? camera_get_view_x(_camera_id)
        var _y = arguments[$ "y"] ?? camera_get_view_y(_camera_id)
        camera_set_view_pos(_camera_id, _x, _y)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_x_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    static get_x_dimensions = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        return camera_get_view_width(_camera_id)
    }

    /// ----------------------------------------------------------------------------
    /// @function get_y_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    static get_y_dimensions = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        return camera_get_view_height(_camera_id)
    }

    /// ----------------------------------------------------------------------------
    /// @function get_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    static get_dimensions = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        return {
            x : camera_get_view_width(_camera_id),
            y : camera_get_view_height(_camera_id),
        }
    }

    /// ----------------------------------------------------------------------------
    /// @function set_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    static set_dimensions = function(arguments = {}) {
        if (is_instanceof(self, ViewGeneric)) { arguments.camera = private.camera_id }
        var _camera_id = CAMERA.get_id({ camera : arguments.camera })
        var _x = arguments[$ "x"] ?? camera_get_view_width(_camera_id)
        var _y = arguments[$ "y"] ?? camera_get_view_height(_camera_id)
        camera_set_view_size(_camera_id, _x, _y)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– POSITION ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_x_position_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.get_x_position
/// ----------------------------------------------------------------------------
function get_x_position_view_generic(arguments = {}) {
    return VIEW_GENERIC.get_x_position(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_y_position_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.get_y_position
/// ----------------------------------------------------------------------------
function get_y_position_view_generic(arguments = {}) {
    return VIEW_GENERIC.get_y_position(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_position_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.get_position
/// ----------------------------------------------------------------------------
function get_position_view_generic(arguments = {}) {
    return VIEW_GENERIC.get_position(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_position_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.set_position
/// ----------------------------------------------------------------------------
function set_position_view_generic(arguments = {}) {
    return VIEW_GENERIC.set_position(arguments)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_x_dimensions_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.get_x_dimensions
/// ----------------------------------------------------------------------------
function get_x_dimensions_view_generic(arguments = {}) {
    return VIEW_GENERIC.get_x_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_y_dimensions_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.get_y_dimensions
/// ----------------------------------------------------------------------------
function get_y_dimensions_view_generic(arguments = {}) {
    return VIEW_GENERIC.get_y_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_dimensions_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.get_dimensions
/// ----------------------------------------------------------------------------
function get_dimensions_view_generic(arguments = {}) {
    return VIEW_GENERIC.get_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_dimensions_view_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method:
/// ViewGeneric.set_dimensions
/// ----------------------------------------------------------------------------
function set_dimensions_view_generic(arguments = {}) {
    return VIEW_GENERIC.set_dimensions(arguments)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
