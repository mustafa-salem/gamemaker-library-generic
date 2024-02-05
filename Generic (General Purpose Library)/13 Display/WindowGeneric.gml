/*******************************************************************************/
#region    –––––––––––––––––––– MACROS ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––

#macro Window WindowGeneric
#macro WINDOW WINDOW_GENERIC

#macro WINDOW_GENERIC __WindowGeneric()

function __WindowGeneric() {
    static instance = new WindowGeneric()
    return WindowGeneric
}

__WindowGeneric()
struct_remove(static_get(__WindowGeneric), "instance")

#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––

#macro set_x_minimum_dimensions_window set_x_minimum_dimensions_window_generic
#macro set_y_minimum_dimensions_window set_y_minimum_dimensions_window_generic
#macro set_minimum_dimensions_window   set_minimum_dimensions_window_generic
#macro set_caption_window              set_caption_window_generic
/* –––––––––––––––––––– DIMENSIONS –––––––––––––––––––– */
#macro get_x_dimensions_window get_x_dimensions_window_generic
#macro get_y_dimensions_window get_y_dimensions_window_generic
#macro get_dimensions_window   get_dimensions_window_generic
#macro set_dimensions_window   set_dimensions_window_generic
#macro get_aspect_ratio_window get_aspect_ratio_window_generic


/*******************************************************************************/
#endregion –––––––––––––––––––– MACROS ––––––––––––––––––––
/*******************************************************************************/

function WindowGeneric() constructor {
    static set_x_minimum_dimensions = set_x_minimum_dimensions_window_generic
    static set_y_minimum_dimensions = set_y_minimum_dimensions_window_generic
    static set_minimum_dimensions   = set_minimum_dimensions_window_generic
    static set_caption              = set_caption_window_generic
    /* –––––––––––––––––––– DIMENSIONS –––––––––––––––––––– */
    static get_x_dimensions = get_x_dimensions_window_generic
    static get_y_dimensions = get_y_dimensions_window_generic
    static get_dimensions   = get_dimensions_window_generic
    static set_dimensions   = set_dimensions_window_generic
    static get_aspect_ratio = get_aspect_ratio_window_generic
}

/*******************************************************************************/
#region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

function get_x_dimensions_window_generic() {
    return window_get_width()
}

function get_y_dimensions_window_generic() {
    return window_get_height()
}

function get_dimensions_window_generic() {
    return {
        x : window_get_width(),
        y : window_get_height(),
    }
}

function set_dimensions_window_generic(arguments = {}) {
    var _x = arguments[$ "x"] ?? window_get_width()
    var _y = arguments[$ "y"] ?? window_get_height()
    window_set_size(_x, _y)
}

function get_aspect_ratio_window_generic() {
    return window_get_width() / window_get_height()
}

/*******************************************************************************/
#endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
/*******************************************************************************/

function set_x_minimum_dimensions_window_generic(arguments = {}) {
    window_set_min_width(width)
}

function set_y_minimum_dimensions_window_generic(arguments = {}) {
    window_set_min_height(height)
}

function set_minimum_dimensions_window_generic(arguments = {}) {
    if (struct_exists(arguments, "x")) {
        window_set_min_width(arguments.x)
    }
    if (struct_exists(arguments, "y")) {
        window_set_min_height(arguments.y)
    }
}

function set_caption_window_generic(arguments = {}) {
    window_set_caption(arguments.caption)
}
