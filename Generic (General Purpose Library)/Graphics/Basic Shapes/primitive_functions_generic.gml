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

/*******************************************************************************/
#endregion –––––––––––––––––––– DRAW_SURFACE ––––––––––––––––––––
/*******************************************************************************/
