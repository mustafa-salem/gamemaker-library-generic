/*******************************************************************************/
#region    –––––––––––––––––––– CAPTION ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function set_default_caption_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function set_default_caption_window_generic(arguments = {}) {
    return WINDOW.set_default_caption(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_caption_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function set_caption_window_generic(arguments = {}) {
    return WINDOW.set_caption(arguments)
}

/// ----------------------------------------------------------------------------
/// @function reset_caption_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function reset_caption_window_generic(arguments = {}) {
    return WINDOW.reset_caption(arguments)
}


/*******************************************************************************/
#endregion –––––––––––––––––––– CAPTION ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_x_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function get_x_dimensions_window_generic(arguments = {}) {
    return WINDOW.get_x_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_y_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function get_y_dimensions_window_generic(arguments = {}) {
    return WINDOW.get_y_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function get_dimensions_window_generic(arguments = {}) {
    return WINDOW.get_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function set_dimensions_window_generic(arguments = {}) {
    return WINDOW.set_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function get_aspect_ratio_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function get_aspect_ratio_window_generic(arguments = {}) {
    return WINDOW.get_aspect_ratio(arguments)
}


/*******************************************************************************/
#endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– MINIMUM_DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function set_x_minimum_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function set_x_minimum_dimensions_window_generic(arguments = {}) {
    return WINDOW.set_x_minimum_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_y_minimum_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function set_y_minimum_dimensions_window_generic(arguments = {}) {
    return WINDOW.set_y_minimum_dimensions(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_minimum_dimensions_window_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function set_minimum_dimensions_window_generic(arguments = {}) {
    return WINDOW.set_minimum_dimensions(arguments)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– MINIMUM_DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/


/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
function _window_generic(arguments = {}) {
    return WINDOW.(arguments)
}
