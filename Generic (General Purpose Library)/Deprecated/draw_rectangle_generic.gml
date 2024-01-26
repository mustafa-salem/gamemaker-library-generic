/*******************************************************************************/
#region    –––––––––––––––––––– DRAW RECTANGLE ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function draw_rectangle_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// {Real} x1 : The x coordinate of the top left corner of the rectangle.
///
/// {Real} x2 : The x coordinate of the bottom right corner of the rectangle.
///
/// {Real} y1 : The y coordinate of the top left corner of the rectangle.
///
/// {Real} y2 : The y coordinate of the bottom right corner of the rectangle.
///
/// {Real} colour : Draw Colour
///
/// {Real} alpha : Draw Alpha
///
/// {Real} outline_width : Draw the rectangle as an outline with the given width.
///
/// ----------------------------------------------------------------------------
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
