function create_text_renderer_generic(arguments = {}) {
    return new TextRendererGeneric(arguments)
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


function draw_text_generic(arguments) {

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
