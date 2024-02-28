BEGIN_SCRIPT_HINT_DEBUG_GENERIC

/*

* camera_get_default
* camera_set_default
* camera_get_active

* camera_get_view_mat
* camera_set_view_mat
* camera_get_proj_mat
* camera_set_proj_mat

*/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#region    –––––––––––––––––––– INITIALIZE_CONSTRUCTOR ––––––––––––––––––––

#macro Camera CameraGeneric
#macro CAMERA CAMERA_GENERIC

#macro CAMERA_GENERIC __CameraGeneric()

function __CameraGeneric() {
    static instance = new CameraGeneric()
    return static_get(CameraGeneric)
}

__CameraGeneric()
struct_remove(static_get(__CameraGeneric), "instance")

#endregion –––––––––––––––––––– INITIALIZE_CONSTRUCTOR ––––––––––––––––––––

#macro CAMERAS __CAMERAS()

function __CAMERAS() {
    return [
        CAMERA_0,
        CAMERA_1,
        CAMERA_2,
        CAMERA_3,
        CAMERA_4,
        CAMERA_5,
        CAMERA_6,
        CAMERA_7
    ]
}

#macro CAMERA_0 VIEW_PORT_0.get_camera()
#macro CAMERA_1 VIEW_PORT_1.get_camera()
#macro CAMERA_2 VIEW_PORT_2.get_camera()
#macro CAMERA_3 VIEW_PORT_3.get_camera()
#macro CAMERA_4 VIEW_PORT_4.get_camera()
#macro CAMERA_5 VIEW_PORT_5.get_camera()
#macro CAMERA_6 VIEW_PORT_6.get_camera()
#macro CAMERA_7 VIEW_PORT_7.get_camera()

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

function CameraGeneric(arguments) constructor {

    if (arguments == undefined) { return }

    var _camera_id = arguments.camera_id

    private = {
        camera_id : _camera_id,
        view      : undefined,
    }

    var _self = self
    private.view = VIEW_GENERIC.create({ camera : _self })

    /// ----------------------------------------------------------------------------
    /// @function (arguments)
    /// ----------------------------------------------------------------------------
    static get_id = function(arguments = {}) {
        if (is_instanceof(self, CameraGeneric)) { return private.camera_id }
        // CAMERA_ID
        if (is_real(arguments.camera)) {
            return arguments.camera
        }
        // CAMERA_STRUCT
        if (is_struct(arguments.camera)) {
            return arguments.camera.get_id()
        }
        // UNDEFINED
        return -1
    }

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    static create = function(arguments = {}) {
        return new CameraGeneric({ camera_id : arguments[$ "camera_id"] ?? camera_create() })
        // camera_create
        // camera_create_view(room_x, room_y, width, height, [angle, object, x_speed, y_speed, x_border, y_border])
    }

    /// ----------------------------------------------------------------------------
    /// @function destroy(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// proxy : destroy_camera_generic
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static destroy = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        camera_destroy(_camera_id)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function apply(arguments)
    /// ----------------------------------------------------------------------------
    static apply = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        camera_apply(_camera_id)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function (arguments)
    /// ----------------------------------------------------------------------------
    static copy_transforms = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        camera_copy_transforms(dest_camera, _camera_id)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_view(arguments)
    /// ----------------------------------------------------------------------------
    /// @return {Struct.ViewGeneric}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_view = function(arguments = {}) {
        if (is_instanceof(self, CameraGeneric)) { return private.view }
        return VIEW_GENERIC.create({ camera : arguments.camera })
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------

    /*******************************************************************************/
    #region    –––––––––––––––––––– ATTACHED_FUNCTIONS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_update_script(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// wrapper : camera_get_update_script
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|Real} arguments.camera
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Function|Undefined}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_update_script = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        var _script_function = camera_get_update_script(_camera_id)
        return (_script_function == -1) ? undefined : _script_function
    }

    /// ----------------------------------------------------------------------------
    /// @function set_update_function(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// wrapper : camera_set_update_script
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|Real} arguments.camera
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.script_function
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_update_function = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        var _script_function = arguments.script_function ?? -1
        camera_set_update_script(_camera_id, _script_function)
        return self
	}

    /// ----------------------------------------------------------------------------
    /// @function get_begin_function(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// wrapper : camera_get_begin_script
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|Real} arguments.camera
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Function|Undefined}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_begin_function = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        var _script_function = camera_get_begin_script(_camera_id)
        return (_script_function == -1) ? undefined : _script_function
    }

    /// ----------------------------------------------------------------------------
    /// @function set_begin_function(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// wrapper : camera_set_begin_script
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|Real} arguments.camera
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.script_function
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_begin_function = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        var _script_function = arguments.script_function ?? -1
        camera_set_begin_script(_camera_id, _script_function)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_end_function(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// wrapper : camera_get_end_script
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|Real} arguments.camera
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Function|Undefined}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_end_function = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        var _script_function = camera_get_end_script(_camera_id)
        return (_script_function == -1) ? undefined : _script_function
    }

    /// ----------------------------------------------------------------------------
    /// @function set_end_function(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// wrapper : camera_set_end_script
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|Real} arguments.camera
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.script_function
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_end_function = function(arguments = {}) {
        var _camera_id = get_id({ camera : arguments.camera })
        var _script_function = arguments.script_function ?? -1
        camera_set_end_script(_camera_id, _script_function)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– ATTACHED_FUNCTIONS ––––––––––––––––––––
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

/// ----------------------------------------------------------------------------
/// @function get_id_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.
/// ----------------------------------------------------------------------------
function get_id_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.get_id(arguments)
}

/// ----------------------------------------------------------------------------
/// @function create_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.
/// ----------------------------------------------------------------------------
function create_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.create(arguments)
}

/// ----------------------------------------------------------------------------
/// @function destroy_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.
/// ----------------------------------------------------------------------------
function destroy_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.destroy(arguments)
}

/// ----------------------------------------------------------------------------
/// @function apply_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.
/// ----------------------------------------------------------------------------
function apply_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.apply(arguments)
}

/// ----------------------------------------------------------------------------
/// @function copy_transforms_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.
/// ----------------------------------------------------------------------------
function copy_transforms_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.copy_transforms(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_view_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Type} arguments.camera
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {Struct.ViewGeneric}
/// <return_description>
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.
/// ----------------------------------------------------------------------------
function get_view_camera_generic(arguments = {}) {
    if (is_struct(arguments.camera)) {
        return arguments.camera.private.view
    } else {
        return new ViewGeneric({ camera : arguments.camera })
    }
}

/*******************************************************************************/
#region    –––––––––––––––––––– ATTACHED_FUNCTIONS ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_update_function_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.get_update_function
/// ----------------------------------------------------------------------------
function get_update_function_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.get_update_function(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_update_function_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.set_update_function
/// ----------------------------------------------------------------------------
function set_update_function_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.set_update_function(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_begin_function_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.get_begin_function
/// ----------------------------------------------------------------------------
function get_begin_function_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.get_begin_function(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_begin_function_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.set_begin_function
/// ----------------------------------------------------------------------------
function set_begin_function_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.set_begin_function(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_end_function_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.get_end_function
/// ----------------------------------------------------------------------------
function get_end_function_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.get_end_function(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_end_function_camera_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// CameraGeneric.set_end_function
/// ----------------------------------------------------------------------------
function set_end_function_camera_generic(arguments = {}) {
    return CAMERA_GENERIC.set_end_function(arguments)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– ATTACHED_FUNCTIONS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
