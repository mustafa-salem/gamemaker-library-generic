/*******************************************************************************/
#region    –––––––––––––––––––– DRAW TRIANGLE ––––––––––––––––––––
/*******************************************************************************/

function draw_triangle_generic(arguments = {}) {

    /*******************************************************************************
    –––––––––––––––––––– PARAMETERS ––––––––––––––––––––
    *******************************************************************************/

	var a = arguments

    var parameters = {
		// BASIC
        vertices : a.vertices,
        colours : a[$ "colours"] ?? array_create(3, c_white),
        outline : false,

		// ADDITIONAL
		alpha : a[$ "alpha"] ?? 1,
    }

	var p = parameters

	/*******************************************************************************
	–––––––––––––––––––– RESCALE ––––––––––––––––––––
	*******************************************************************************/

	if (struct_exists(arguments, "canvas_scale")) {

		for (var i = 0; i < 3; i++) {
			p.vertices[i][0] *= a.canvas_scale
			p.vertices[i][1] *= a.canvas_scale
		}

		var _xmin = min(p.vertices[0][0], p.vertices[1][0], p.vertices[2][0])
		var _xmax = max(p.vertices[0][0], p.vertices[1][0], p.vertices[2][0])
		var _ymin = min(p.vertices[0][1], p.vertices[1][1], p.vertices[2][1])
		var _ymax = max(p.vertices[0][1], p.vertices[1][1], p.vertices[2][1])

		/*
		for (var i = 0; i < 3; i++) {
			// X
			if (p.vertices[i][0] == _xmax) {
				p.vertices[i][0] += (a.canvas_scale - 1)
			} else if (p.vertices[i][0] != _xmin) {
				p.vertices[i][0] += inverse_lerp(_xmin, _xmax, p.vertices[i][0]) * (a.canvas_scale - 1)
			}
			// Y
			if (p.vertices[i][1] == _ymax) {
				p.vertices[i][1] += (a.canvas_scale - 1)
			} else if (p.vertices[i][1] != _ymin) {
				p.vertices[i][1] += inverse_lerp(_ymin, _ymax, p.vertices[i][1]) * (a.canvas_scale - 1)
			}
		}
		*/
	}

    /*******************************************************************************
    –––––––––––––––––––– CONVENIENCE ––––––––––––––––––––
    *******************************************************************************/

    /* –––––––––––––––––––– COLOUR –––––––––––––––––––– */
    if (struct_exists(a, "colour")) { p.colours = array_create(3, a.colour) }

    /*******************************************************************************
    –––––––––––––––––––– PRE-DRAW ––––––––––––––––––––
    *******************************************************************************/

	var preserved = {
		alpha : draw_get_alpha(),
	}

	draw_set_alpha(p.alpha)

    /*******************************************************************************
    –––––––––––––––––––– DRAWING ––––––––––––––––––––
    *******************************************************************************/

    draw_triangle_colour(
        parameters.vertices[0][0],
        parameters.vertices[0][1],
		parameters.vertices[1][0],
		parameters.vertices[1][1],
		parameters.vertices[2][0],
		parameters.vertices[2][1],
        parameters.colours[0],
		parameters.colours[1],
		parameters.colours[2],
        parameters.outline
    )

    /*******************************************************************************
    –––––––––––––––––––– POST-DRAW ––––––––––––––––––––
    *******************************************************************************/

	draw_set_alpha(preserved.alpha)

}


/*******************************************************************************/
#endregion –––––––––––––––––––– DRAW TRIANGLE ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DRAW RECTANGLE ––––––––––––––––––––
/*******************************************************************************/

function draw_rectangle_generic(arguments = {}) {

    /*******************************************************************************
    –––––––––––––––––––– PARAMETERS ––––––––––––––––––––
    *******************************************************************************/

	var a = arguments

    var parameters = {
        x1 : a[$ "x"] ?? 0,
        y1 : a[$ "y"] ?? 0,
        x2 : a[$ "x2"] ?? 0,
        y2 : a[$ "y2"] ?? 0,

        colour : a[$ "colour"] ?? c_white,
		alpha : a[$ "alpha"] ?? 1,
        gradient : a[$ "gradient"] ?? {
            top_left : c_white,
            top_right : c_white,
            bottom_right : c_white,
            bottom_left : c_white,
        },

        outline : false,

		canvas_scale : a[$ "canvas_scale"] ?? 1,
    }

	var p = parameters

	/*******************************************************************************
	–––––––––––––––––––– RESCALE ––––––––––––––––––––
	*******************************************************************************/

	if (struct_exists(arguments, "canvas_scale")) {
		p.x1 *= a.canvas_scale
		a.width *= a.canvas_scale

		p.y1 *= a.canvas_scale
		a.height *= a.canvas_scale
	}

    /*******************************************************************************
    –––––––––––––––––––– EFFECTS ––––––––––––––––––––
    *******************************************************************************/

    /* –––––––––––––––––––– HOVER –––––––––––––––––––– */
    if (struct_exists(arguments, "yhover")) {
        parameters.y1 += sin(((get_timer() / 1000000) * (2 * pi) * a.yhover.frequency)) * a.yhover.amplitude
    }

    /*******************************************************************************
    –––––––––––––––––––– CONVENIENCE ––––––––––––––––––––
    *******************************************************************************/

    /* –––––––––––––––––––– FILL VIEW –––––––––––––––––––– */
    if (is_struct_instance({ instance : a[$ "fill_view"], constructor : View })) {
        with (a.fill_view) {
            p.x1 = x1()
            p.x2 = x2()
            p.y1 = y1()
            p.y2 = y2()
        }
    }

	/* –––––––––––––––––––– SCALE –––––––––––––––––––– */
	if (struct_exists(arguments, "scale")) {
		a.width *= a.scale
		a.height *= a.scale
	}

	/* –––––––––––––––––––– ALIGNMENT –––––––––––––––––––– */
	if (struct_exists(arguments, "align")) {
		if (arguments.align == "center") {
			a.halign = fa_center
			a.valign = fa_middle
		}
	}
	if (struct_exists(arguments, "halign")) {
		if (arguments.halign == fa_center) {
			p.x1 -= a.width / 2
		}
	}
	if (struct_exists(arguments, "valign")) {
		if (arguments.valign == fa_middle) {
			p.y1 -= a.height / 2
		}
	}

    /* –––––––––––––––––––– WIDTH & HEIGHT –––––––––––––––––––– */
    if (struct_exists(arguments, "width")) { parameters.x2 = p.x1 + (a.width - 1) }
    if (struct_exists(arguments, "height")) { parameters.y2 = p.y1 + (a.height - 1) }


    /* –––––––––––––––––––– GRADIENT –––––––––––––––––––– */
    with (p.gradient) {
        if (struct_exists(self, "top")) {
            top_left = top
            top_right = top
        }
        if (struct_exists(self, "bottom")) {
            bottom_right = bottom
            bottom_left = bottom
        }
        if (struct_exists(self, "left")) {
            top_left = left
            bottom_left = left
        }
        if (struct_exists(self, "right")) {
            top_right = right
            bottom_right = right
        }
    }

    /* –––––––––––––––––––– COLOUR –––––––––––––––––––– */
    if (struct_exists(arguments, "colour")) {
        with (parameters.gradient) {
            top_left = a.colour
            top_right = a.colour
            bottom_right = a.colour
            bottom_left = a.colour
        }
    }

    /*******************************************************************************
    –––––––––––––––––––– PRE-DRAW ––––––––––––––––––––
    *******************************************************************************/

	var preserved = {
		alpha : draw_get_alpha(),
	}

	draw_set_alpha(p.alpha)

    /*******************************************************************************
    –––––––––––––––––––– DRAWING ––––––––––––––––––––
    *******************************************************************************/

    draw_rectangle_colour(
        parameters.x1,
        parameters.y1,
        parameters.x2,
        parameters.y2,
        parameters.gradient.top_left,
        parameters.gradient.top_right,
        parameters.gradient.bottom_right,
        parameters.gradient.bottom_left,
        parameters.outline
    )

    /*******************************************************************************
    –––––––––––––––––––– POST-DRAW ––––––––––––––––––––
    *******************************************************************************/

	draw_set_alpha(preserved.alpha)

}


/*******************************************************************************/
#endregion –––––––––––––––––––– DRAW RECTANGLE ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DRAW_RING ––––––––––––––––––––
/*******************************************************************************/

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

/*******************************************************************************/
#endregion –––––––––––––––––––– DRAW_RING ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DRAW_SURFACE ––––––––––––––––––––
/*******************************************************************************/

function draw_surface_generic(arguments = {}) {
    var parameters = {
        // DEFAULTS TO SURFACE DRAWING TO ITESELF
        surface : arguments[$ "surface"] ?? surface_get_target(),
        target_surface : arguments[$ "surface"] ?? surface_get_target(),
        x : arguments[$ "x"] ?? 0,
        y : arguments[$ "y"] ?? 0,
        xscale : arguments[$ "xscale"] ?? 1,
        yscale : arguments[$ "yscale"] ?? 1,
        rotation : arguments[$ "rotation"] ?? 0,
        colour : arguments[$ "colour"] ?? c_white,
        alpha : arguments[$ "alpha"] ?? 1,
        shaders : arguments[$ "shaders"] ?? undefined,
        clear : arguments[$ "clear"] ?? undefined,
        clear_colour : arguments[$ "clear_colour"] : undefined,
        clear_alpha : arguments[$ "clear_alpha"] : 1,
    }

    if (is_undefined(parameters.clear)) {
        parameters.clear = (parameters.target_surface == application_surface) ? false : true,
    }

    if (is_undefined(parameters.clear_colour) {
        parameters.clear_colour = c_white
        parameters.clear_alpha = 0
    }

    /*******************************************************************************
    –––––––––––––––––––– CONVERT SHADERS INTO SINGLE GENERIC SHADERS ––––––––––––––––––––
    *******************************************************************************/

    if (is_array(shaders)) {
        var _shader_count = array_length(parameters.shaders)
        if (_shader_count > 0) {
            var _shader_chains = []
            var _shader_subchain = []
            var _subchain_index = 0

            for (var i = 0; i < _shader_count; i++) {
                var _shader = parameters.shaders[i]
                if (!_shader.chainable() && _subchain_index != 0) {
                    array_push(_shader_chains, _shader_subchain)
                    _shader_subchain = []
                    _subchain_index = 0
                }
                array_push(_shader_subchain, _shader)
                _subchain_index++
            }

            var _chain_count = array_length(_shader_chains)

            var _surface = surface_create(surface_get_width(target_surface), surface_get_height(target_surface))
            var _surface2 = surface_create(surface_get_width(target_surface), surface_get_height(target_surface))
            if (_surface == -1 || _surface2 == -1) {
                show_debug_message("draw_surface_generic: surface creation failed")
            } else {
                var i = 0
                draw_surface_generic({
                    surface : parameters.surface,
                    target_surface : _surface,
                    shaders : GenericShader({ shaders : _shader_chains[0] }),
                })

                for (i = 1; i < _chain_count; i++) {
                    draw_surface_generic({
                        surface : is_even(i) ? _surface : _surface2,
                        target_surface : is_even(i) ? _surface2 : _surface,
                        shaders : GenericShader({ shaders : _shader_chains[i] }),
                    })
                }

                parameters.surface = is_even(i) ? _surface : _surface2
            }
        }
    }

    /*******************************************************************************
    –––––––––––––––––––– PRE-DRAW ––––––––––––––––––––
    *******************************************************************************/

    surface_set_target(parameters.target_surface)
    if (!is_undefined(parameters.shaders)) { parameters.shaders.activate() }
    if (parameters.clear) { draw_clear_alpha(parameters.clear_colour, parameters.clear_alpha) }

    /*******************************************************************************
    –––––––––––––––––––– DRAW ––––––––––––––––––––
    *******************************************************************************/

    draw_surface_ext(
        parameters.surface,
        parameters.x,
        parameters.y,
        parameters.xscale,
        parameters.yscale,
        parameters.rotation,
        parameters.colour,
        parameters.alpha
    )

    /*******************************************************************************
    –––––––––––––––––––– POST-DRAW ––––––––––––––––––––
    *******************************************************************************/

    surface_reset_target()
    if (!is_undefined(parameters.shaders)) { parameters.shaders.deactivate() }

}

/*******************************************************************************/
#endregion –––––––––––––––––––– DRAW_SURFACE ––––––––––––––––––––
/*******************************************************************************/
