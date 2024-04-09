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
