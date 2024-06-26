/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

function Drawable() constructor {
    /*******************************************************************************/
    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– X_POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_position()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// x_position
    /// ----------------------------------------------------------------------------
    static get_x_position = function() {
        return private.position.x
    }

    /// ----------------------------------------------------------------------------
    /// @function set_x_position(_x_position)
    /// ----------------------------------------------------------------------------
    /// @parameter {Real} _x_position
    /// x_position
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_x_position = function(_x_position) {
        if (!is_real(_x_position)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.position.x = _x_position
        return self
    }

    #endregion –––––––––––––––––––– X_POSITION ––––––––––––––––––––

    #region    –––––––––––––––––––– Y_POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_y_position()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// y_position
    /// ----------------------------------------------------------------------------
    static get_y_position = function() {
        return private.position.y
    }

    /// ----------------------------------------------------------------------------
    /// @function set_y_position(_y_position)
    /// ----------------------------------------------------------------------------
    /// @parameter {Real} _y_position
    /// y_position
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_y_position = function(_y_position) {
        if (!is_real(_y_position)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.position.y = _y_position
        return self
    }

    #endregion –––––––––––––––––––– Y_POSITION ––––––––––––––––––––

    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_position()
    /// ----------------------------------------------------------------------------
    /// @return {Struct}
    /// position { x : Real, y : Real }
    /// ----------------------------------------------------------------------------
    static get_position = function() {
        return variable_clone(private.position)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} [arguments]
    ///
    /// @parameter {Real} [arguments.x]
    /// x_position
    ///
    /// @parameter {Real} [arguments.y]
    /// y_position
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_position = function(arguments = {}) {
        if (!is_struct(arguments)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        if (arguments[$ "x"] != undefined) { set_x_position(arguments.x) }
        if (arguments[$ "y"] != undefined) { set_y_position(arguments.y) }
        return self
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
    /// @function get_x_dimensions()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// x_dimensions
    /// ----------------------------------------------------------------------------
    static get_x_dimensions = function() {
        return private.dimensions.x
    }

    /// ----------------------------------------------------------------------------
    /// @function set_x_dimensions(_x_dimensions)
    /// ----------------------------------------------------------------------------
    /// @parameter {Real} _x_dimensions
    /// x_dimensions
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_x_dimensions = function(_x_dimensions) {
        if (!is_real(_x_dimensions)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.dimensions.x = _x_dimensions
        return self
    }

    #endregion –––––––––––––––––––– X_DIMENSIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– Y_DIMENSIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_y_dimensions()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// y_dimensions
    /// ----------------------------------------------------------------------------
    static get_y_dimensions = function() {
        return private.dimensions.y
    }

    /// ----------------------------------------------------------------------------
    /// @function set_y_dimensions(_y_dimensions)
    /// ----------------------------------------------------------------------------
    /// @parameter {Real} _y_dimensions
    /// y_dimensions
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_y_dimensions = function(_y_dimensions) {
        if (!is_real(_y_dimensions)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.dimensions.y = _y_dimensions
        return self
    }

    #endregion –––––––––––––––––––– Y_DIMENSIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_dimensions()
    /// ----------------------------------------------------------------------------
    /// @return {Struct}
    /// dimensions { x : Real, y : Real }
    /// ----------------------------------------------------------------------------
    static get_dimensions = function() {
        return private.dimensions
    }

    /// ----------------------------------------------------------------------------
    /// @function set_dimensions(arguments)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} [arguments]
    ///
    /// @parameter {Real} [arguments.x]
    /// x_dimensions
    ///
    /// @parameter {Real} [arguments.y]
    /// y_dimensions
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_dimensions = function(arguments = {}) {
        if (!is_struct(arguments)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        if (arguments[$ "x"] != undefined) { set_x_dimensions(arguments.x) }
        if (arguments[$ "y"] != undefined) { set_y_dimensions(arguments.y) }
        return self
    }

    #endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– X_ALIGNMENT ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_alignment()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// x_alignment
    /// ----------------------------------------------------------------------------
    static get_x_alignment = function() {
        return private.alignment.x
    }

    /// ----------------------------------------------------------------------------
    /// @function set_x_alignment(_x_alignment)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} _x_alignment
    /// x_alignment
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement}
    /// ----------------------------------------------------------------------------
    static set_x_alignment = function(_x_alignment) {
        if (!is_real(_x_alignment)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.alignment.x = clamp(_x_alignment, 0, 1)
        return self
    }

    #endregion –––––––––––––––––––– X_ALIGNMENT ––––––––––––––––––––

    #region    –––––––––––––––––––– Y_ALIGNMENT ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_y_alignment()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// y_alignment
    /// ----------------------------------------------------------------------------
    static get_y_alignment = function() {
        return private.alignment.y
    }

    /// ----------------------------------------------------------------------------
    /// @function set_y_alignment(_y_alignment)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} _y_alignment
    /// y_alignment
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement}
    /// ----------------------------------------------------------------------------
    static set_y_alignment = function(_y_alignment) {
        if (!is_real(_y_alignment)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.alignment.y = clamp(_y_alignment, 0, 1)
        return self
    }

    #endregion –––––––––––––––––––– Y_ALIGNMENT ––––––––––––––––––––

    #region    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_alignment()
    /// ----------------------------------------------------------------------------
    /// @return {Struct}
    /// alignment { x : Real, y : Real }
    /// ----------------------------------------------------------------------------
    static get_alignment = function() {
        return private.alignment
    }

    /// ----------------------------------------------------------------------------
    /// @function set_alignment(arguments)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} [arguments]
    ///
    /// @parameter {Real} [arguments.x]
    /// x_alignment
    ///
    /// @parameter {Real} [arguments.y]
    /// y_alignment
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_alignment = function(arguments = {}) {
        if (!is_struct(arguments)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        if (arguments[$ "x"] != undefined) { set_x_alignment(arguments.x) }
        if (arguments[$ "y"] != undefined) { set_y_alignment(arguments.y) }
        return self
    }

    #endregion –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– SCALE ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– X_SCALE ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_scale()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// x_scale
    /// ----------------------------------------------------------------------------
    static get_x_scale = function() {
        return private.scale.x
    }

    /// ----------------------------------------------------------------------------
    /// @function set_x_scale(_x_scale)
    /// ----------------------------------------------------------------------------
    /// @parameter {Real} _x_scale
    /// x_scale
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_x_scale = function(_x_scale) {
        if (!is_real(_x_scale)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.scale.x = _x_scale
        return self
    }

    #endregion –––––––––––––––––––– X_SCALE ––––––––––––––––––––

    #region    –––––––––––––––––––– Y_SCALE ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_y_scale()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// y_scale
    /// ----------------------------------------------------------------------------
    static get_y_scale = function() {
        return private.scale.y
    }

    /// ----------------------------------------------------------------------------
    /// @function set_y_scale(_y_scale)
    /// ----------------------------------------------------------------------------
    /// @parameter {Real} _y_scale
    /// y_scale
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_y_scale = function(_y_scale) {
        if (!is_real(_y_scale)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        private.scale.y = _y_scale
        return self
    }

    #endregion –––––––––––––––––––– Y_SCALE ––––––––––––––––––––

    #region    –––––––––––––––––––– SCALE ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_scale()
    /// ----------------------------------------------------------------------------
    /// @return {Struct}
    /// scale { x : Real, y : Real }
    /// ----------------------------------------------------------------------------
    static get_scale = function() {
        return variable_clone(private.scale)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_scale(arguments)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} [arguments]
    ///
    /// @parameter {Real} [arguments.x]
    /// x_scale
    ///
    /// @parameter {Real} [arguments.y]
    /// y_scale
    /// ----------------------------------------------------------------------------
    /// @return {Struct.RectangleElement} self
    /// ----------------------------------------------------------------------------
    static set_scale = function(arguments = {}) {
        if (!is_struct(arguments)) {
            // new InvalidTypeErrorGeneric()
            return self
        }
        if (arguments[$ "x"] != undefined) { set_x_scale(arguments.x) }
        if (arguments[$ "y"] != undefined) { set_y_scale(arguments.y) }
        return self
    }

    #endregion –––––––––––––––––––– SCALE ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SCALE ––––––––––––––––––––
    /*******************************************************************************/


}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
