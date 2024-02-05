show_debug_message("Script.ViewPortGeneric")

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––

#macro ViewPort  ViewPortGeneric
#macro VIEW_PORT VIEW_PORT_GENERIC

#macro VIEW_PORT_GENERIC __ViewPortGeneric()

function __ViewPortGeneric() {
    static instance = new ViewPortGeneric()
    return static_get(ViewPortGeneric)
}

__ViewPortGeneric()
struct_remove(static_get(__ViewPortGeneric), "instance")

#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––

#macro VIEW_PORTS global.view_ports

VIEW_PORTS = array_create(8)

for (var i = 0; i < 8; i++) {
    VIEW_PORTS[i] = new ViewPortGeneric({ view_port_index : i })
}

#macro VIEW_PORT_0 VIEW_PORTS[0]
#macro VIEW_PORT_1 VIEW_PORTS[1]
#macro VIEW_PORT_2 VIEW_PORTS[2]
#macro VIEW_PORT_3 VIEW_PORTS[3]
#macro VIEW_PORT_4 VIEW_PORTS[4]
#macro VIEW_PORT_5 VIEW_PORTS[5]
#macro VIEW_PORT_6 VIEW_PORTS[6]
#macro VIEW_PORT_7 VIEW_PORTS[7]

#macro get_visible_view_port      get_visible_view_port_generic
#macro set_visible_view_port      set_visible_view_port_generic
#macro get_surface_view_port      get_surface_view_port_generic
#macro set_surface_view_port      set_surface_view_port_generic
#macro get_camera_view_port       get_camera_view_port_generic
#macro set_camera_view_port       set_camera_view_port_generic
#macro get_x_position_view_port   get_x_position_view_port_generic
#macro set_x_position_view_port   set_x_position_view_port_generic
#macro get_y_position_view_port   get_y_position_view_port_generic
#macro set_y_position_view_port   set_y_position_view_port_generic
#macro get_position_view_port     get_position_view_port_generic
#macro set_position_view_port     set_position_view_port_generic
#macro get_x_dimensions_view_port get_x_dimensions_view_port_generic
#macro set_x_dimensions_view_port set_x_dimensions_view_port_generic
#macro get_y_dimensions_view_port get_y_dimensions_view_port_generic
#macro set_y_dimensions_view_port set_y_dimensions_view_port_generic
#macro get_dimensions_view_port   get_dimensions_view_port_generic
#macro set_dimensions_view_port   set_dimensions_view_port_generic

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

function ViewPortGeneric(arguments) constructor {

    if (arguments == undefined) { return }

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE ––––––––––––––––––––
    /*******************************************************************************/

    private = {
        view_port_index : arguments.view_port_index,
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE ––––––––––––––––––––
    /*******************************************************************************/

    get_index = function() {
        return private.view_port_index
    }

    /*******************************************************************************/
    #region    –––––––––––––––––––– VISIBLE ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_visible(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy for get_visible_view_port_generic
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// ----------------------------------------------------------------------------
    static get_visible = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_visible_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_visible(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy for set_visible_view_port_generic
    /// ----------------------------------------------------------------------------
    /// @return {Struct.ViewPortGeneric} self
    /// ----------------------------------------------------------------------------
    static set_visible = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_visible_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– VISIBLE ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– SURFACE ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_surface(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy for get_surface_view_port_generic
    /// ----------------------------------------------------------------------------
    /// @return {Struct.SurfaceGeneric|Undefined}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_surface = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_surface_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_surface(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy for set_surface_view_port_generic
    /// ----------------------------------------------------------------------------
    /// @return {Struct.ViewPortGeneric} self
    /// ----------------------------------------------------------------------------
    static set_surface = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_surface_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SURFACE ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– CAMERA ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_camera(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy for get_camera_view_port_generic
    /// ----------------------------------------------------------------------------
    /// @return {Struct.CameraGeneric|Undefined}
    /// ----------------------------------------------------------------------------
    static get_camera = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_camera_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_camera(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy for set_camera_view_port_generic
    /// ----------------------------------------------------------------------------
    /// @return {Struct.ViewPortGeneric} self
    /// ----------------------------------------------------------------------------
    static set_camera = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_camera_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CAMERA ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– X_POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_position()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_x_position = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_x_position_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_x_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_x_position = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_x_position_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    #endregion –––––––––––––––––––– X_POSITION ––––––––––––––––––––

    #region    –––––––––––––––––––– Y_POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_y_position()
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_y_position = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_y_position_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_y_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_y_position = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_y_position_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    #endregion –––––––––––––––––––– Y_POSITION ––––––––––––––––––––

    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_position()
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_position = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_position_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.x
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.y
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_position = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_position_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    #endregion –––––––––––––––––––– POSITION ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– X_DIMENSIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_x_dimensions = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_x_dimensions_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_x_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_x_dimensions = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_x_dimensions_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    #endregion –––––––––––––––––––– X_DIMENSIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– Y_DIMENSIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_y_dimensions()
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_y_dimensions = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_y_dimensions_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_y_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_y_dimensions = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_y_dimensions_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    #endregion –––––––––––––––––––– Y_DIMENSIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_dimensions()
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_dimensions = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        return get_dimensions_view_port_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.x
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.y
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_dimensions = function(arguments = {}) {
        var _is_instance_scope = is_instanceof(self, ViewPortGeneric)
        if (_is_instance_scope) { arguments.view_port = self }
        set_dimensions_view_port_generic(arguments)
        if (_is_instance_scope) { return self }
    }

    #endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

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

function get_index_view_port_generic(arguments = {}) {
    var _view_port_index = arguments.view_port
    if (is_struct(arguments.view_port)) {
        _view_port_index = arguments.view_port.get_index()
    }
    return _view_port_index
}

/*******************************************************************************/
#region    –––––––––––––––––––– VISIBLE ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_visible_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// wrapper function for view_get_visible
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Bool}
///  Whether the view port with the provided index is visible.
/// ----------------------------------------------------------------------------
function get_visible_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return view_get_visible(_view_port_index)
}

/// ----------------------------------------------------------------------------
/// @function set_visible_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.visible
/// Whether the view port should be visible.
/// ----------------------------------------------------------------------------
function set_visible_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    view_set_visible(_view_port_index, arguments.visible)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– VISIBLE ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– SURFACE ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_surface_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function get_surface_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return view_get_surface_id(_view_port_index)
}

/// ----------------------------------------------------------------------------
/// @function set_surface_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.surface_id
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function set_surface_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    view_set_surface_id(_view_port_index, arguments.surface_id)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– SURFACE ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– CAMERA ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_camera_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Struct.CameraGeneric|Undefined}
/// The camera assigned to the view port with the provided index.
/// If no camera is assigned, undefined will be returned.
/// ----------------------------------------------------------------------------
function get_camera_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    var _camera_id = view_get_camera(_view_port_index)
    if (_camera_id = -1) { return undefined }
    return create_camera_generic({ camera_id : _camera_id })
}

/// ----------------------------------------------------------------------------
/// @function set_camera_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// Assigns the provided camera to the view port with the provided index.
/// If undefined or -1 is provided as a reference to the camera then the current
/// camera will be removed from the view port without a new camera replacing it.
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Struct.CameraGeneric|Real|Undefined} arguments.camera
/// The camera to use or it
/// ----------------------------------------------------------------------------
function set_camera_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    var _camera_id = get_id_camera_generic({ camera : arguments.camera })
    view_set_camera(_view_port_index, _camera_id)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– CAMERA ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– POSITION ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– X_POSITION ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_x_position_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Real}
/// The x position of the given view port
/// ----------------------------------------------------------------------------
function get_x_position_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return view_get_xport(_view_port_index)
}

/// ----------------------------------------------------------------------------
/// @function set_x_position_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
function set_x_position_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    view_set_xport(_view_port_index, arguments.x_position)
}

#endregion –––––––––––––––––––– X_POSITION ––––––––––––––––––––

#region    –––––––––––––––––––– Y_POSITION ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_y_position_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function get_y_position_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return view_get_yport(_view_port_index)
}

/// ----------------------------------------------------------------------------
/// @function set_y_position_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
function set_y_position_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    view_set_yport(_view_port_index, arguments.y_position)
}

#endregion –––––––––––––––––––– Y_POSITION ––––––––––––––––––––

#region    –––––––––––––––––––– POSITION ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_position_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Struct}
/// <return_description>
/// ----------------------------------------------------------------------------
function get_position_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return {
        x : view_get_xport(_view_port_index),
        y : view_get_yport(_view_port_index),
    }
}

/// ----------------------------------------------------------------------------
/// @function set_position_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.parameter_name
/// <parameter_description>
///
/// @parameter {Type} arguments.parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
function set_position_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    if (arguments[$ "x"] != undefined) {
        view_set_xport(_view_port_index, arguments.x)
    }
    if (arguments[$ "y"] != undefined) {
        view_set_yport(_view_port_index, arguments.y)
    }
}

#endregion –––––––––––––––––––– POSITION ––––––––––––––––––––

/*******************************************************************************/
#endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– X_DIMENSIONS ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_x_dimensions_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// wrapper for view_get_wport
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Real}
/// The x dimensions of the view port with the provided index on its render target.
/// ----------------------------------------------------------------------------
function get_x_dimensions_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return view_get_wport(_view_port_index)
}

/// ----------------------------------------------------------------------------
/// @function set_x_dimensions_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.x_dimensions
/// The x dimensions of the view port on its render target.
/// ----------------------------------------------------------------------------
function set_x_dimensions_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    view_set_wport(_view_port_index, arguments.x_dimensions)
}

#endregion –––––––––––––––––––– X_DIMENSIONS ––––––––––––––––––––

#region    –––––––––––––––––––– Y_DIMENSIONS ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_y_dimensions_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Real}
/// <return_description>
/// ----------------------------------------------------------------------------
function get_y_dimensions_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return view_get_hport(_view_port_index)
}

/// ----------------------------------------------------------------------------
/// @function set_y_dimensions_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Type} arguments.parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
function set_y_dimensions_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    view_set_hport(_view_port_index, arguments.y_dimensions)
}

#endregion –––––––––––––––––––– Y_DIMENSIONS ––––––––––––––––––––

#region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function get_dimensions_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
/// ----------------------------------------------------------------------------
/// @return {Struct}
/// { x : Real, y : Real }
/// ----------------------------------------------------------------------------
function get_dimensions_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    return {
        x : view_get_wport(_view_port_index),
        y : view_get_hport(_view_port_index),
    }
}

/// ----------------------------------------------------------------------------
/// @function set_dimensions_view_port_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.ViewPortGeneric|Real} arguments.view_port
/// The view port to target or its index (0 - 7).
///
/// @parameter {Real} arguments.x
/// <parameter_description>
///
/// @parameter {Real} arguments.y
/// <parameter_description>
/// ----------------------------------------------------------------------------
function set_dimensions_view_port_generic(arguments = {}) {
    var _view_port_index = get_index_view_port_generic({ view_port : arguments.view_port })
    if (arguments[$ "x"] != undefined) {
        view_set_wport(_view_port_index, arguments.x)
    }
    if (arguments[$ "y"] != undefined) {
        view_set_hport(_view_port_index, arguments.y)
    }
}

#endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

/*******************************************************************************/
#endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
