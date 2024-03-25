/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { string : String }
/// ----------------------------------------------------------------------------
function TextRendererGeneric(arguments) constructor {

    GUARD_INITIALIZED_CONSTRUCTOR_GENERIC

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    static id_counter = 0

	private = {
		id : 0,
        default_format : {
            font_name : undefined,
            colour    : undefined,
        },
		colour           : c_white,
        rotation         : 0,
        typist           : undefined,
        position : {
            x : 0,
            y : 0,
        }
    }

    private.id = id_counter
    id_counter++

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PUBLIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    static create = function(arguments = {}) {
        return new TextRendererGeneric(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_scribble_element = function(arguments = {}) {
        return private.scribble_element
    }

    /// ----------------------------------------------------------------------------
    /// @function set_default_format(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.font
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.colour
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_default_format = function(arguments = {}) {
        var _font_name = arguments[$ "font"]   ?? private.default_format.font_name
        var _colour    = arguments[$ "colour"] ?? private.default_format.colour
        if (!is_string(_font_name)) { font_get_name(_font_name) }
        private.default_format.font_name = _font_name
        private.default_format.colour    = _colour
        get_scribble_element().starting_format(_font_name, _colour)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function set_solid_blend(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_solid_blend = function(arguments = {}) {
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function set_gradient_blend(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.colour
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.alpha
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_gradient_blend = function(arguments = {}) {
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    static set_colour = function(arguments) {
		var _colour    = arguments[$ "colour"]
		private.colour = _alpha
		private.scribble_element.blend(_colour, private.alpha)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    static set_alpha = function(arguments = {}) {
		var _alpha    = arguments[$ "alpha"]
		private.alpha = _alpha
		private.scribble_element.blend(private.colour, _alpha)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    static set_alignment = function(arguments = {}) {
        private.scribble_element.align(halign, valign)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
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
    ///
    /// @parameter {Type} arguments.scale
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextRendererGeneric} self
    /// ----------------------------------------------------------------------------
    static set_scale = function(arguments = {}) {
        var _x = 1
        var _y = 1
        var _rotation_degrees = private.rotation * 360
        private.scribble_element.transform(_x, _y, _rotation_degrees)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { colour : Real, xoffset : Real, yoffset : Real }
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    static add_drop_shadow = function(arguments = {}) {
        var _colour, xoffset, yoffset
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Real} arguments.x
    /// The x position on the render target.
    ///
    /// @parameter {Real} arguments.y
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextRendererGeneric} self
    /// ----------------------------------------------------------------------------
    static set_position = function(arguments) {
		if (!is_undefined(arguments[$ "x"])) { private.position.x = arguments.x }
		if (!is_undefined(arguments[$ "y"])) { private.position.y = arguments.y }
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------

    /// ----------------------------------------------------------------------------
    /// @function draw(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { x : Real, y : Real , typewriter : Typewriter}
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    static draw = function(arguments) {

        var _string
        var _id

        var _scribble_element = scribble(_string, _id)

		var _x_position = arguments[$ "x"] ?? private.position.x
		var _y_position = arguments[$ "y"] ?? private.position.y
        var _typist     = arguments[$ "typist"] ?? private.typist
        private.scribble_element.draw(_x_position, _y_position, _typist)
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PUBLIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

}
