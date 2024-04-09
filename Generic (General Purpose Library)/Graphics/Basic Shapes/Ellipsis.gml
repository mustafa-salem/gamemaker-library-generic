/// ----------------------------------------------------------------------------
/// @function generic_ellipsis_draw(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is a generification of the built-in functions <draw_circle>,
/// <draw_circle_colour>, <draw_ellipse> and <draw_ellipse_colour>.
/// ----------------------------------------------------------------------------
/// @parameter {type} [x_position]
/// default : 0
///
/// @parameter {type} [y_position]
/// default : 0
///
/// @parameter {type} [x_alignment]
/// default : 0
///
/// @parameter {type} [y_alignment]
/// default : 0
///
/// @parameter {type} x_dimension
/// <parameter_description>
///
/// @parameter {type} y_dimension
/// <parameter_description>
///
/// @parameter {type} outline_thickness
/// <parameter_description>
///
/// @parameter {type} blend_colour
/// <parameter_description>
///
/// @parameter {type} blend_alpha
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
function generic_ellipsis_draw(parameters) {

}

function draw_ring_generic(arguments) {

    #region    –––––––––––––––––––– PARAMETERS ––––––––––––––––––––

    var a = arguments

    var parameters = {
        x : a.x,
        y : a.y,
        radius : a.radius,
        width : a.width,

        colour : a[$ "colour"] ?? c_white,
        alpha : a[$ "alpha"] ?? 1,
        precision : a[$ "precision"],

        draw_outline : "inside",
    }

    var p = parameters

    if (p.draw_outline == "inside") {
        p.width = min(p.width, p.radius)
    }

    parameters.precision ??= round(max(24, min(128, p.width / 100 * 48)))
    parameters.precision = max(4, parameters.precision)

    #region    –––––––––––––––––––– CONVENIENCE ––––––––––––––––––––

    /*
    if (arguments[$ "image_blend"]) { p.colour = a.image_blend }
    if (arguments[$ "image_alpha"]) { p.alpha = a.image_alpha }
    if (arguments[$ "sprite_width"]) { p.radius = a.sprite_width / 2 }
    */

    #endregion –––––––––––––––––––– CONVENIENCE ––––––––––––––––––––

    #endregion –––––––––––––––––––– PARAMETERS ––––––––––––––––––––

    #region    –––––––––––––––––––– GET CURRENT DRAW SETTINGS ––––––––––––––––––––

    var preserved = {
        colour : draw_get_colour(),
        alpha : draw_get_alpha(),
    }

    var pre = preserved

    #endregion    –––––––––––––––––––– GET CURRENT DRAW SETTINGS ––––––––––––––––––––

    #region    –––––––––––––––––––– SET NEW DRAW SETTINGS ––––––––––––––––––––

    draw_set_color(p.colour)
    draw_set_alpha(p.alpha)

    #endregion –––––––––––––––––––– SET NEW DRAW SETTINGS ––––––––––––––––––––

    /*******************************************************************************/
    #region    –––––––––––––––––––– DRAW ––––––––––––––––––––
    /*******************************************************************************/

    var segment_size = 360 / p.precision

    draw_primitive_begin(pr_trianglestrip);

    for (var i = 0; i <= 360; i += segment_size) {
        draw_vertex(
           p.x + lengthdir_x(p.radius, i),
           p.y + lengthdir_y(p.radius, i)
       )
       draw_vertex(
           p.x + lengthdir_x(p.radius + p.width, i),
           p.y + lengthdir_y(p.radius + p.width, i)
       )
    }
    draw_primitive_end()

    /*******************************************************************************/
    #endregion –––––––––––––––––––– DRAW ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– RESTORE PREVIOUS DRAW SETTINGS ––––––––––––––––––––

    draw_set_color(pre.colour)
    draw_set_alpha(pre.alpha)

    #endregion    –––––––––––––––––––– RESTORE PREVIOUS DRAW SETTINGS ––––––––––––––––––––

}

function scr_draw_circle_width(argument0, argument1, argument2, argument3) {
    if (argument3 <= 1 || argument3 >= argument2) {
        draw_circle(argument0, argument1, argument2, argument3 < argument2)
        return;
    }
    ring_surf = -1
    if (!generic_surface_exists({ surface : ring_surf })) {
        ring_surf = generic_surface_create({ x_dimension : argument2 * 2, y_dimension : argument2 * 2 })
        render_target_set_surface(ring_surf)
        draw_clear_alpha(c_black, 0)
        draw_circle(argument2, argument2, argument2, 0)
        gpu_set_blendmode(bm_subtract)
        draw_circle(argument2, argument2, (argument2 - argument3), 0)
        generic_graphics_set_blend_mode({ blend_mode : DEFAULT_BLEND_MODE })
        surface_reset_target()
    }
    generic_surface_draw({
		surface    : ring_surf,
		x_position : argument0 - argument2,
		y_position : argument1 - argument2,
	})
}

function scr_draw_circle_width_qb(argument0, argument1, argument2, argument3, argument4) {
    var xx = argument0
    var yy = argument1
    var radius = argument2
    var width = argument3
    var steps = argument4
    var h = (width / 2)
    draw_primitive_begin(4)
    for (i = 0; i < steps; i += 1) {
        draw_vertex((xx + lengthdir_x((radius - h), ((360 * i) / steps))), (yy + lengthdir_y((radius - h), ((360 * i) / steps))))
        draw_vertex((xx + lengthdir_x((radius + h), ((360 * i) / steps))), (yy + lengthdir_y((radius + h), ((360 * i) / steps))))
        draw_vertex((xx + lengthdir_x((radius + h), ((360 * (i + 1)) / steps))), (yy + lengthdir_y((radius + h), ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x((radius + h), ((360 * (i + 1)) / steps))), (yy + lengthdir_y((radius + h), ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x((radius - h), ((360 * (i + 1)) / steps))), (yy + lengthdir_y((radius - h), ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x((radius - h), ((360 * i) / steps))), (yy + lengthdir_y((radius - h), ((360 * i) / steps))))
    }
    draw_primitive_end()
}

function scr_draw_circle_width_radius(argument0, argument1, argument2, argument3, argument4) {
    var xx = argument0
    var yy = argument1
    var radius = argument2
    var inner_radius = max(argument3, 0)
    var steps = argument4
    draw_primitive_begin(4)
    for (i = 0; i < steps; i += 1) {
        draw_vertex((xx + lengthdir_x(inner_radius, ((360 * i) / steps))), (yy + lengthdir_y(inner_radius, ((360 * i) / steps))))
        draw_vertex((xx + lengthdir_x(radius, ((360 * i) / steps))), (yy + lengthdir_y(radius, ((360 * i) / steps))))
        draw_vertex((xx + lengthdir_x(radius, ((360 * (i + 1)) / steps))), (yy + lengthdir_y(radius, ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x(radius, ((360 * (i + 1)) / steps))), (yy + lengthdir_y(radius, ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x(inner_radius, ((360 * (i + 1)) / steps))), (yy + lengthdir_y(inner_radius, ((360 * (i + 1)) / steps))))
        draw_vertex((xx + lengthdir_x(inner_radius, ((360 * i) / steps))), (yy + lengthdir_y(inner_radius, ((360 * i) / steps))))
    }
    draw_primitive_end()
}
