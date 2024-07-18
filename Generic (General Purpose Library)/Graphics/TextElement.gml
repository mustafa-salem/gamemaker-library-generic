/******************************************************************************/
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

function TextElement(arguments) constructor {

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
















/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

#macro TEXT_ELEMENT INITIALIZED_CONSTRUCTOR(TextElement)

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function draw_text_outline(argument0, argument1, argument2, argument3)
{
    resetcolor = draw_get_color()
    draw_set_color(argument3)
    draw_text((argument0 - 1), argument1, argument2)
    draw_text((argument0 - 1), (argument1 - 1), argument2)
    draw_text((argument0 - 1), (argument1 + 1), argument2)
    draw_text((argument0 + 1), argument1, argument2)
    draw_text((argument0 + 1), (argument1 + 1), argument2)
    draw_text((argument0 + 1), (argument1 - 1), argument2)
    draw_text(argument0, (argument1 + 1), argument2)
    draw_text(argument0, (argument1 - 1), argument2)
    draw_set_color(resetcolor)
    draw_text(argument0, argument1, argument2)
}

function draw_text_shadow_width(argument0, argument1, argument2, argument3)
{
    __txtcolor__ = draw_get_color()
    draw_set_color(c_black)
    draw_text_width((argument0 + 1), (argument1 + 1), string_hash_to_newline(argument2), argument3)
    draw_set_color(__txtcolor__)
    draw_text_width(argument0, argument1, string_hash_to_newline(argument2), argument3)
}

function draw_text_shadow(argument0, argument1, argument2)
{
    __txtcolor__ = draw_get_color()
    draw_set_color(c_black)
    draw_text((argument0 + 1), (argument1 + 1), string_hash_to_newline(argument2))
    draw_set_color(__txtcolor__)
    draw_text(argument0, argument1, string_hash_to_newline(argument2))
}

function draw_text_width(argument0, argument1, argument2, argument3)
{
    var _stringxscale = 1
    var _stringwidth = string_width(argument2)
    if (_stringwidth >= argument3)
        _stringxscale = (argument3 / _stringwidth)
    draw_text_transformed(argument0, argument1, argument2, _stringxscale, 1, 0)
}

function is_normalized_alignment(argument0) {
    return
}

function normalized_alignment(argument0) {
    if (array_contains([fa_left  , fa_top   ], argument0)) { return 0   }
    if (array_contains([fa_center, fa_middle], argument0)) { return 0.5 }
    if (array_contains([fa_right , fa_bottom], argument0)) { return 1   }
}

function is_horizontal_alignment(argument0) {
    return array_contains([0, 0.5, 1, fa_left, fa_center, fa_right], argument0)
}

function is_horizontal_alignment_constant(argument0) {
    return array_contains([fa_left, fa_center, fa_right], argument0)
}

function horizontal_alignment_constant(argument0) {
    if (argument0 == 0  ) { return fa_left   }
    if (argument0 == 0.5) { return fa_center }
    if (argument0 == 1  ) { return fa_right  }
}

function is_vertical_alignment(argument0) {
    return array_contains([0, 0.5, 1, fa_top, fa_middle, fa_bottom], argument0)
}

function is_vertical_alignment_constant(argument0) {
    return array_contains([fa_top, fa_middle, fa_bottom], argument0)
}

function vertical_alignment_constant() {
    if (argument0 == 0  ) { return fa_top    }
    if (argument0 == 0.5) { return fa_middle }
    if (argument0 == 1  ) { return fa_bottom }
}

function text_element_create(arguments = {}) {
    return new TextElement(arguments)
}

function set_message_sequence(_messages) {
    if (is_array(_messages)) {
        var _sequence_length = array_length(_messages)

        for (var i = 0; i <= (_sequence_length - 1); i++) {
            if (is_array(_messages[i])) {
                var _new_line_seperated_message = ""
                for (var j = 0; j <= (array_length(_messages[i]) - 2); j++) {
                    _new_line_seperated_message += _messages[i][j] + "\n"
                }
                _new_line_seperated_message += _messages[i][array_length(_messages[i] - 1)]
                _messages[i] = _new_line_seperated_message
            }
        }

        if (_sequence_length > 1 && !string_ends_with(_messages[0], "/")) { _messages[0] += "/" }
        if (!string_ends_with(_messages[_sequence_length - 1], "/%")) { _messages[_sequence_length - 1] += "/%" }
        msgset(0, _messages[0])
        if (_sequence_length > 1) {
            for (var i = 1; i <= (_sequence_length - 2); i++) {
                if (!string_ends_with(_messages[i], "/")) { _messages[i] += "/" }
                msgnext(_messages[i])
            }
            msgnext(_messages[_sequence_length - 1])
        }
    } else {
        if (!string_ends_with(_messages, "/%")) { _messages += "/%" }
        msgset(0, _messages)
    }
}

function message_sequence_to_default_battletext(_messages) {
    set_message_sequence(_messages)
    scr_battletext_default()
}

/// ----------------------------------------------------------------------------
/// @function generic_text_draw(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {string} string
/// @parameter {type} font
/// @parameter {type} colour
/// @parameter {type} x_alignment
/// @parameter {type} y_alignment
/// @parameter {type} blend_colour
/// @parameter {type} blend_alpha
/// @parameter {number} x_position
/// @parameter {number} y_position
/// @parameter {number} x_scale
/// @parameter {number} y_scale
/// @parameter {number} rotation
/// @parameter {number} rotation_degrees
/// @parameter {type} maximum_line_width
/// @parameter {type} distance_between_lines
/// ----------------------------------------------------------------------------
function generic_text_draw(arguments) {

    scribble(parameters.string)

    scribble.starting_format(parameters.font, parameters.colour)

    scribble.align(parameters.x_alignment, parameters.y_alignment)

    scribble.blend(parameters.blend_colour, parameters.blend_alpha)

    scribble.gradient(colour, blendFactor)

    scribble.transform(parameters.x_scale, parameters.y_scale, parameters.rotation * 360)

    scribble.draw(parameters.x_position, parameters.y_position)

    var parameters = {
        x : 0,
        y : 0,
        string : "STRING_MISSING",
        leading : -1, // typographical leading; -1 -> automatic default
        line_width : -1, // width before linebreak; -1 -> no inserted line breaks
        xscale : 1,
        yscale : 1,
        angle : 0,
        colour_top_left : c_white,
        colour_top_right : c_white,
        colour_bottom_right : c_white,
        colour_bottom_left : c_white,
        alpha : 1,
        halign : fa_left,
        valign : fa_top,
    }

    var _halign = draw_get_halign()
    var _valign = draw_get_valign()

    struct_transfer(arguments, parameters)

    /*******************************************************************************
    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "align")) {
        if (arguments.align == "center") {
            parameters.halign = fa_center
            parameters.valign = fa_middle
        }
    }

    draw_set_halign(parameters.halign)
    draw_set_valign(parameters.valign)

    // SOLID COLOUR
    if (variable_instance_exists(parameters, "colour")) {
        parameters.colour_top_left = parameters.colour
        parameters.colour_top_right = parameters.colour
        parameters.colour_bottom_right = parameters.colour
        parameters.colour_bottom_left = parameters.colour
    }

    if (variable_instance_exists(parameters, "compress")) {
        if (parameters.compress > 0) {
            parameters.xscale = clamp(parameters.compress / string_width(parameters.string), 0, 1)
        }
    }

    // string_hash_to_newline()

    var return_data = {
        dimensions : {},
    }
    return_data.width = string_width(parameters.string) * parameters.xscale
    if (parameters.line_width > 0) { return_data.width = max(return_data.width, parameters.line_width) }

    draw_text_ext_transformed_colour(
        parameters.x,
        parameters.y,
        parameters.string,
        parameters.leading,
        parameters.line_width,
        parameters.xscale,
        parameters.yscale,
        parameters.angle,
        parameters.colour_top_left,
        parameters.colour_top_right,
        parameters.colour_bottom_right,
        parameters.colour_bottom_left,
        parameters.alpha
    )

    draw_set_halign(_halign)
    draw_set_valign(_valign)

    return return_data
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

TEXT_ELEMENT

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { string : String }
/// ----------------------------------------------------------------------------
function TextElement(arguments) constructor {

    static private = {
        id : 0,
    }

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    static id_counter = 0

	self.private = {
		id : 0,
        font
        colour
        x_alignment
        y_alignment
        blend_colour
    }

    private.id = id_counter
    id_counter++

    // SCRIBBLE_ELEMENT
    private.scribble_text_element.scribble(private.string, private.id)

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    static create = function(arguments = {}) {
        return new TextElement(arguments)
    }

    static get_scribble_text_element = function(arguments = {}) {
        return private.scribble_text_element
    }

    /******************************************************************************/
    #region    –––––––––––––––––––– DRAWING ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function draw(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Type} x
    /// @parameter {Type} y
    /// @parameter {Type} typist
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    static draw = function(parameters) {
        private.scribble_text_element.draw(parameters.x, parameters.y, parameters.typist)
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– DRAWING ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– DEFAULT_FORMAT ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function set_default_format(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Type} font
    /// @parameter {Type} colour
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    static set_default_format = function(arguments = {}) {
        var _font_name = arguments[$ "font"]   ?? private.default_format.font_name
        var _colour    = arguments[$ "colour"] ?? private.default_format.colour
        if (!is_string(_font_name)) { font_get_name(_font_name) }
        private.default_format.font_name = _font_name
        private.default_format.colour    = _colour
        private.scribble_text_element.starting_format(_font_name, _colour)
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– DEFAULT_FORMAT ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function set_alignment(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Type} x <parameter_description>
    /// @parameter {Type} y <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    set_alignment = function(parameters = {}) {
        if (parameters[$ "x"] != undefined) { private.alignment.x = parameters.x }
        if (parameters[$ "y"] != undefined) { private.alignment.y = parameters.y }
        private.scribble_text_element.align(private.alignment.x, private.alignment.y)
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– SCALE ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function set_scale(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Type} x <parameter_description>
    /// @parameter {Type} y <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_scale = function(parameters = {}) {
        if (parameters[$ "x"] != undefined) { private.scale.x = parameters.x }
        if (parameters[$ "y"] != undefined) { private.scale.y = parameters.y }
        private.scribble_text_element.transform(private.scale.x, private.scale.y, private.rotation * 360)
        return self
    }

    self.set_scale = method(self, set_scale)

    /******************************************************************************/
    #endregion –––––––––––––––––––– SCALE ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

    static set_solid_blend = function(arguments = {}) {
        return self
    }

    static set_colour = function(arguments) {
        var _colour    = arguments[$ "colour"]
        private.colour = _alpha
        private.scribble_text_element.blend(_colour, private.alpha)
        return self
    }

    static set_alpha = function(arguments = {}) {
        var _alpha    = arguments[$ "alpha"]
        private.alpha = _alpha
        private.scribble_text_element.blend(private.colour, _alpha)
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

    static set_gradient_blend = function(arguments = {}) {
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

    static add_drop_shadow = function(arguments = {}) {
        var _colour, xoffset, yoffset
        return self
    }


    static set_position = function(arguments) {
		if (!is_undefined(arguments[$ "x"])) { private.position.x = arguments.x }
		if (!is_undefined(arguments[$ "y"])) { private.position.y = arguments.y }
        return self
    }

    #region    –––––––––––––––––––– PAGE ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_page()
    /// ----------------------------------------------------------------------------
    /// @return {integer} The page that the text element is currently on.
    /// ----------------------------------------------------------------------------
    get_page = function() {
        return private.scribble_text_element.get_page()
    }

    /// ----------------------------------------------------------------------------
    /// @function set_page(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} parameters.parameter_name
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    set_page = function(parameters = {}) {
        private.scribble_text_element.page(parameters.page)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_page_count()
    /// ----------------------------------------------------------------------------
    /// @return {integer} The total number of pages for the text element.
    /// ----------------------------------------------------------------------------
    get_page_count = function() {
        return private.scribble_text_element.get_page_count()
    }

    /// ----------------------------------------------------------------------------
    /// @function on_last_page()
    /// ----------------------------------------------------------------------------
    /// @return {boolean} Whether the current page is the last page for the text element.
    /// ----------------------------------------------------------------------------
    on_last_page = function() {
        return private.scribble_text_element.on_last_page()
    }

    #endregion –––––––––––––––––––– PAGE ––––––––––––––––––––

    #region    –––––––––––––––––––– SPACING ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function set_line_height(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} minimum
    /// <parameter_description>
    ///
    /// @parameter {type} maximum
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    set_line_height = function(parameters = {}) {
        private.scribble_text_element.line_height(parameters.minimum, parameters.maximum)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function set_leading(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} leading
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    set_leading = function(parameters = {}) {
        private.scribble_text_element.line_spacing(parameters.leading)
        return self
    }

    #endregion –––––––––––––––––––– SPACING ––––––––––––––––––––

    /******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function set_skew(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} x
    /// <parameter_description>
    ///
    /// @parameter {type} y
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement} self
    /// ----------------------------------------------------------------------------
    set_skew = function(parameters = {}) {
        private.scribble_text_element.skew(parameters.x, parameters.y)
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/



}
