#macro create_text_renderer create_text_renderer_generic

function create_text_renderer_generic(arguments = {}) {
    return new TextRendererGeneric(arguments)
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { string : String }
/// ----------------------------------------------------------------------------
function TextElementGeneric(arguments) constructor {

    var _string = arguments[$ "string"]
    var _scribble_element = scribble(_string, [uniqueID]) // scribble(string, [uniqueID])

    private = {}

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    private.scribble_element  = _scribble_element
    private.default_font_name =
    private.default_colour    =

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PUBLIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    set_default_font = function(_font) {
        var _default_font_name = is_string(_font) ? _font : font_get_name(_font)
        private.default_font_name = _default_font_name
        private.scribble_element.starting_format(private.default_font_name, private.default_colour)
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
    set_default_colour = function(_colour) {
        private.default_colour = _colour
        private.scribble_element.starting_format(private.default_font_name, private.default_colour)
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
    set_alpha = function(arguments = {}) {
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
    set_horizontal_alignment = function(arguments = {}) {
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
    set_vertical_alignment = function(arguments = {}) {
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
    set_default_alignment = function(arguments = {}) {
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
    function_name = function(arguments = {}) {
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
    add_drop_shadow = function(arguments = {}) {
        var _colour, xoffset, yoffset
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function draw(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { x : Real, y : Real , typewriter : Typewriter}
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TextElementGeneric} self
    /// ----------------------------------------------------------------------------
    draw = function(arguments) {
        var _x, _y, _typist = undefined
        private.scribble_element.draw()
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PUBLIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

}
