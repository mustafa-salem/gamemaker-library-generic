function draw_surface_generic(arguments) {

    /*******************************************************************************
    –––––––––––––––––––– INTERNAL: DRAW METHODS ––––––––––––––––––––
    *******************************************************************************/

    /* –––––––––––––––––––– DEFAULT DRAW METHOD –––––––––––––––––––– */
    static draw_method_default = function(arguments) {
        draw_surface_general(
            arguments.surface,
            arguments.fragment.x,
            arguments.fragment.y,
            arguments.fragment.width,
            arguments.fragment.height,
            arguments.x,
            arguments.y,
            arguments.xscale,
            arguments.yscale,
            arguments.rotation,
            arguments.gradient.top_left,
            arguments.gradient.top_right,
            arguments.gradient.bottom_right,
            arguments.gradient.bottom_left,
            arguments.alpha
        )
    }

    /*******************************************************************************
    –––––––––––––––––––– FUNCTION PARAMETERS ––––––––––––––––––––
    *******************************************************************************/

    var a = arguments

    var parameters = {
        surface : arguments.surface,
        x : arguments[$ "x"] ?? 0,
        y : arguments[$ "y"] ?? 0,
        xscale : arguments[$ "xscale"] ?? 1,
        yscale : arguments[$ "yscale"] ?? 1,
        rotation : arguments[$ "rotation"] ?? 0,
        alpha : arguments[$ "alpha"] ?? 1,

        fragment : arguments[$ "fragment"] ?? {
            x : 0,
            y : 0,
            width : surface_get_width(arguments.surface),
            height : surface_get_height(arguments.surface),
        },

        colour : arguments[$ "colour"] ?? c_white,
        gradient : arguments[$ "gradient"] ?? {
            top_left : c_white,
            top_right : c_white,
            bottom_right : c_white,
            bottom_left : c_white,
        },
    }

    var p = parameters

    /*******************************************************************************
    –––––––––––––––––––– SCALING ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "scale")) {
        parameters.xscale = arguments.scale
        parameters.yscale = arguments.scale
    }


    /*******************************************************************************
    –––––––––––––––––––– DRAWING ––––––––––––––––––––
    *******************************************************************************/

    draw_method_default(parameters)

}
