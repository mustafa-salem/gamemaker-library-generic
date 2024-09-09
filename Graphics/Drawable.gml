/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

function Drawable() constructor {

    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_position(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {number} alignment
    /// 0 to 1
    /// ----------------------------------------------------------------------------
    /// @return {number}
    /// ----------------------------------------------------------------------------
    static get_x_position = function(parameters = {}) {
        return private.position.x
    }

    /// ----------------------------------------------------------------------------
    /// @function get_y_position(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {number} alignment
    /// 0 to 1
    /// ----------------------------------------------------------------------------
    /// @return {number}
    /// ----------------------------------------------------------------------------
    static get_y_position = function(parameters = {}) {
        return private.position.y
    }

    /// ----------------------------------------------------------------------------
    /// @function set_position(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} x
    /// <parameter_description>
    ///
    /// @parameter {type} y
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct} self
    /// ----------------------------------------------------------------------------
    static set_position = function(parameters = {}) {
        if (arguments[$ "x"] != undefined) { set_x_position(arguments.x) }
        if (arguments[$ "y"] != undefined) { set_y_position(arguments.y) }
        return self
    }

    #endregion –––––––––––––––––––– POSITION ––––––––––––––––––––

    #region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

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

    #region    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––

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

    #region    –––––––––––––––––––– SCALE ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_x_scale(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This function is used to get the x component of the scale of the element.
    /// ----------------------------------------------------------------------------
    /// @return {number}
    /// ----------------------------------------------------------------------------
    static get_x_scale = function() {
        return private.x_scale
    }

    /// ----------------------------------------------------------------------------
    /// @function get_y_scale(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This function is used to get the y component of the scale of the element.
    /// ----------------------------------------------------------------------------
    /// @return {number}
    /// ----------------------------------------------------------------------------
    static get_y_scale = function() {
        return private.y_scale
    }

    /// ----------------------------------------------------------------------------
    /// @function set_scale(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This function is used to set the scale properties of the element.
    /// ----------------------------------------------------------------------------
    /// @parameter {number} x
    /// The scaling on the x axis.
    ///
    /// @parameter {number} y
    /// The scaling on the y axis.
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct} self
    /// ----------------------------------------------------------------------------
    static set_scale = function(parameters = {}) {
        if (parameters[$ "x"] != undefined) { private.x_scale = parameters.x }
        if (parameters[$ "y"] != undefined) { private.y_scale = parameters.y }
        return self
    }

    #endregion –––––––––––––––––––– SCALE ––––––––––––––––––––

	#region    –––––––––––––––––––– ROTATION ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_x_rotation()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// x_rotation
	/// ----------------------------------------------------------------------------
	static get_x_rotation = function() {
		return private.rotation.x
	}

	/// ----------------------------------------------------------------------------
	/// @function get_y_rotation()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// y_rotation
	/// ----------------------------------------------------------------------------
	static get_y_rotation = function() {
		return private.rotation.y
	}

	/// ----------------------------------------------------------------------------
	/// @function get_z_rotation()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// z_rotation
	/// ----------------------------------------------------------------------------
	static get_z_rotation = function() {
		return private.rotation.z
	}

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} [arguments]
	///
	/// @parameter {Real} [arguments.x]
	/// x_dimensions
	///
	/// @parameter {Real} [arguments.y]
	/// y_dimensions
	///
	/// @parameter {Real} [arguments.z]
	/// z_dimensions
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_rotation = function(arguments) {
		if (!is_struct(arguments)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		if (arguments[$ "x"] != undefined) { set_x_rotation(arguments.x) }
		if (arguments[$ "y"] != undefined) { set_y_rotation(arguments.y) }
		if (arguments[$ "z"] != undefined) { set_z_rotation(arguments.z) }
		return self
	}

	#endregion –––––––––––––––––––– ROTATION ––––––––––––––––––––

    #region    –––––––––––––––––––– BLEND ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
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
    get_blend_colour = function(parameters = {}) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function get_blend_alpha(parameters)
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
    get_blend_alpha = function(parameters = {}) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function get_blend_mode(parameters)
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
    get_blend_mode = function(parameters = {}) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function set_blend(parameters)
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
    set_blend = function(parameters = {}) {
        return _return
    }

    #endregion –––––––––––––––––––– BLEND ––––––––––––––––––––

    #region    –––––––––––––––––––– SHADER ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
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
    get_shader = function(parameters = {}) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
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
    get_shader_variables = function(parameters = {}) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
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
    set_shader = function(parameters = {}) {
        return _return
    }

    #endregion –––––––––––––––––––– SHADER ––––––––––––––––––––

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
