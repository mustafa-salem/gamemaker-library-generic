surface_get_target_ext
surface_reset_target

function create_surface_generic(arguments = {}) {
    surface_create_ext
}

/// @function exists_surface_generic(arguments)
/// @parameter {Struct} arguments
/// @return {Bool}
function exists_surface_generic(arguments = {}) {
    return surface_exists(arguments.surface.surface_id)
}

/// @function free_surface_generic(arguments)
/// @parameter {Struct} arguments
function free_surface_generic(arguments = {}) {
    surface_free(arguments.surface.surface_id)
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function resize_surface_generic(arguments = {}) {
    surface_resize(arguments.surface.surface_id, arguments.width, arguments.height)
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function get_target_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function set_target_surface_generic(arguments = {}) {
    // surface_set_target
    // surface_set_target_ext
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function is_target_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function get_height_surface_generic(arguments = {}) {
    var _surface_id = arguments.get_surface_id()
    return surface_get_height(_surface_id)
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function set_height_surface_generic(arguments = {}) {
    var _surface_id = arguments.get_surface_id()
    resize_surface_generic({})
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function get_width_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function set_width_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function _surface_generic(arguments = {}) {}
