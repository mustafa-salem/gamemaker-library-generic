function WindowGeneric() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE ––––––––––––––––––––
    /*******************************************************************************/

    private = {
        default_caption : undefined,
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    window_center
    window_handle
    window_has_focus

    /*******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    window_set_showborder
    window_get_showborder

    /*******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    window_get_visible_rects
    window_set_rectangle

    /*******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– CAPTION ––––––––––––––––––––
    /*******************************************************************************/

    static set_default_caption = function(arguments = {}) {
        private.default_caption = arguments.caption
        return self
    }

    static set_caption = function(arguments = {}) {
        window_set_caption(arguments.caption)
        return self
    }

    static reset_caption = function(arguments = {}) {
        if (private.default_caption != undefined) {
            window_set_caption(private.default_caption)
        }
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CAPTION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– BACKGROUND_COLOUR ––––––––––––––––––––
    /*******************************************************************************/

    static get_background_colour = function(arguments = {}) {
        return window_get_colour()
    }

    static set_background_colour = function(arguments = {}) {
        window_set_colour(arguments.background_colour)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– BACKGROUND_COLOUR ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– FULLSCREEN ––––––––––––––––––––
    /*******************************************************************************/

    static get_fullscreen = function(arguments = {}) {
        window_get_fullscreen(full)
        return
    }

    static set_fullscreen = function(arguments = {}) {
        window_set_fullscreen(full)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– FULLSCREEN ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    static get_x_position = function(arguments = {}) {
        return window_get_x()
    }

    static get_y_position = function(arguments = {}) {
        return window_get_y()
    }

    static get_dimensions = function(arguments = {}) {
        return {
            x : window_get_x(),
            y : window_get_y(),
        }
    }

    static set_position = function(arguments = {}) {
        var _x = arguments[$ "x"] ?? window_get_x()
        var _y = arguments[$ "y"] ?? window_get_y()
        window_set_position(_x, _y)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    static get_x_dimensions = function(arguments = {}) {
        return window_get_width()
    }

    static get_y_dimensions = function(arguments = {}) {
        return window_get_height()
    }

    static get_dimensions = function(arguments = {}) {
        return {
            x : window_get_width(),
            y : window_get_height(),
        }
    }

    static set_dimensions = function(arguments = {}) {
        var _x = arguments[$ "x"] ?? window_get_width()
        var _y = arguments[$ "y"] ?? window_get_height()
        window_set_size(_x, _y)
        return self
    }

    static get_aspect_ratio = function(arguments = {}) {
        return window_get_width() / window_get_height()
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– MINIMUM_DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    static set_x_minimum_dimensions = function(arguments = {}) {
        window_set_min_width(width)
        return self
    }

    static set_y_minimum_dimensions = function(arguments = {}) {
        window_set_min_height(height)
        return self
    }

    static set_minimum_dimensions = function(arguments = {}) {
        if (struct_exists(arguments, "x")) {
            window_set_min_width(arguments.x)
        }
        if (struct_exists(arguments, "y")) {
            window_set_min_height(arguments.y)
        }
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– MINIMUM_DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– MAXIMUM_DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    static set_x_maximum_dimensions = function(arguments = {}) {
        window_set_max_width(width)
        return self
    }

    static set_y_maximum_dimensions = function(arguments = {}) {
        window_set_max_height(height)
        return self
    }

    static set_maximum_dimensions = function(arguments = {}) {
        if (struct_exists(arguments, "x")) {
            window_set_max_width(arguments.x)
        }
        if (struct_exists(arguments, "y")) {
            window_set_max_height(arguments.y)
        }
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– MAXIMUM_DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/


}
