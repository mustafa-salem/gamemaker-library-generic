/*******************************************************************************/
#region    –––––––––––––––––––– DRAW RECTANGLE ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_rectangle_draw(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function draws a rectangle.
///
/// This function is a generification of the built-in functions 'draw_rectangle',
/// 'draw_rectangle_colour', 'draw_roundrect', 'draw_roundrect_colour',
/// 'draw_roundrect_ext' and 'draw_roundrect_colour_ext'.
/// ----------------------------------------------------------------------------
/// @parameter {number} x_position
/// The x position of the rectangle's origin point on the render target.
///
/// @parameter {number} y_position
/// The y position of the rectangle's origin point on the render target.
///
/// @parameter {number} x_alignment
/// The relative x alignment of the rectangle's origin point. [0 - 1]
///
/// @parameter {number} y_alignment
/// The relative y alignment of the rectangle's origin point. [0 - 1]
///
/// @parameter {number} x_dimension
/// The width of the rectangle.
///
/// @parameter {number} y_dimension
/// The height of the rectangle.
///
/// @parameter {type} blend_colour
/// The colour to blend the rectange with.
///
/// @parameter {type} blend_alpha
/// The alpha to blend the rectange with.
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_rectangle_draw(parameters) {

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

/// ----------------------------------------------------------------------------
/// @function rectangle_element_create()
/// ----------------------------------------------------------------------------
/// @return {Struct.RectangleElement}
/// ----------------------------------------------------------------------------
function rectangle_element_create() {
	return new RectangleElement()
}

/// ----------------------------------------------------------------------------
/// @function RectangleElement(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This struct offers a fluent interface to prepare a rectange for drawing.
/// It has the properties listed below. All of these are to be accessed by static
/// getter/setter functions. Properties belonging together have combined acessor
/// functions alongside their basic accessors.
///
/// @property {Struct} position { x : Real, y : Real }
/// The x and y coordinates of the rectangle origin on the render target.
///
/// @property {Struct} dimensions { x : Real, y : Real }
/// The (base) x and y dimensions of the rectangle on the render target.
///
/// @property {Struct} alignment { x : Real, y : Real }
/// The x and y alignment of the rectangle relative to it's origin. Ranges from
/// 0 to 1. 0 meaning top/left and 1 meaning bottom/right. 0.5 means centered.
///
/// @property {Struct} scale { x : Real, y : Real }
/// The x and y scaling factors applied to the rectangle's dimensional components.
///
/// @property {Struct} rotation { x : Real, y : Real, z : Real }
/// The rotation of the rectangle around it's origin around the x, y and z axis.
/// These values are normalized. 1 meaning being equal to 360° or 2pi radiants.
///
/// @property {Struct} solid_fill
/// The container for information regarding the rectangles solid fill.
///
/// @property {Struct} solid_fill.colour
/// The colour of the solid fill in GameMaker decimal format.
///
/// @property {Struct} solid_fill.alpha
/// The normalized alpha of the solid fill. 0 to 1
///
/// ----------------------------------------------------------------------------
function RectangleElement() constructor {

	/*******************************************************************************/
	#region    –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
	/*******************************************************************************/

	private = {
		position : {
			x : 0,
			y : 0,
		},
		dimensions : {
			x : 0,
			y : 0,
		},
		alignment : {
			x : 0,
			y : 0,
		},
		scale : {
			x : 1,
			y : 1,
		},
		rotation : {
			x : 0,
			y : 0,
			z : 0,
		},
		solid_fill : {
			colour : c_white,
			alpha  : 0,
		},
		gradient_fill : {
			colour : {
				top_left     : c_white,
				top_right    : c_white,
				bottom_left  : c_white,
				bottom_right : c_white,
			},
			alpha : {
				top_left     : 0,
				top_right    : 0,
				bottom_left  : 0,
				bottom_right : 0,
			},
		},
		solid_outline : {
			thickness : 0,
			alignment : 0,
			colour    : c_white,
			alpha     : 0,
		},
		alpha : 1,
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
	/*******************************************************************************/

	#region    –––––––––––––––––––– POSITION ––––––––––––––––––––

	self.get_x_position = method(self, Drawable.get_x_position)
	self.set_x_position = method(self, Drawable.get_x_position)
	self.get_y_position = method(self, Drawable.get_y_position)
	self.set_y_position = method(self, Drawable.get_x_position)
	self.get_position   = method(self, Drawable.get_position)
	self.set_position   = method(self, Drawable.set_position)

	#endregion –––––––––––––––––––– POSITION ––––––––––––––––––––

	#region    –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

	self.get_x_dimensions = method(self, Drawable.get_x_dimensions)
	self.set_x_dimensions = method(self, Drawable.set_x_dimensions)
	self.get_y_dimensions = method(self, Drawable.get_y_dimensions)
	self.set_y_dimensions = method(self, Drawable.set_y_dimensions)
	self.get_dimensions   = method(self, Drawable.get_dimensions)
	self.set_dimensions   = method(self, Drawable.set_dimensions)

	#endregion –––––––––––––––––––– DIMENSIONS ––––––––––––––––––––

	#region    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––

	self.get_x_alignment = method(self, Drawable.get_x_alignment)
	self.set_x_alignment = method(self, Drawable.set_x_alignment)
	self.get_y_alignment = method(self, Drawable.get_y_alignment)
	self.set_y_alignment = method(self, Drawable.set_y_alignment)
	self.get_alignment   = method(self, Drawable.get_alignment)
	self.set_alignment   = method(self, Drawable.set_alignment)

	#endregion –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––

	#region    –––––––––––––––––––– SCALE ––––––––––––––––––––

	self.get_x_scale = method(self, Drawable.get_x_scale)
	self.set_x_scale = method(self, Drawable.set_x_scale)
	self.get_y_scale = method(self, Drawable.get_y_scale)
	self.set_y_scale = method(self, Drawable.set_y_scale)
	self.get_scale   = method(self, Drawable.get_scale)
	self.set_scale   = method(self, Drawable.set_scale)

	#endregion –––––––––––––––––––– SCALE ––––––––––––––––––––

	/*******************************************************************************/
	#region    –––––––––––––––––––– ROTATION ––––––––––––––––––––
	/*******************************************************************************/

	#region    –––––––––––––––––––– X_ROTATION ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_x_rotation()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// x_rotation
	/// ----------------------------------------------------------------------------
	static get_x_rotation = function() {
		return private.rotation.x
	}

	/// ----------------------------------------------------------------------------
	/// @function set_x_rotation(_x_rotation)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real} _x_rotation
	/// x_rotation
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_x_rotation = function(_x_rotation) {
		if (!is_real(_x_rotation)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.rotation.x = _x_rotation
		return self
	}

	#endregion –––––––––––––––––––– X_ROTATION ––––––––––––––––––––

	#region    –––––––––––––––––––– Y_ROTATION ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_y_rotation()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// y_rotation
	/// ----------------------------------------------------------------------------
	static get_y_rotation = function() {
		return private.rotation.y
	}

	/// ----------------------------------------------------------------------------
	/// @function set_y_rotation(_y_rotation)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real} _y_rotation
	/// y_rotation
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_y_rotation = function(_y_rotation) {
		if (!is_real(_y_rotation)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.rotation.y = _y_rotation
		return self
	}

	#endregion –––––––––––––––––––– Y_ROTATION ––––––––––––––––––––

	#region    –––––––––––––––––––– Z_ROTATION ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_z_rotation()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// z_rotation
	/// ----------------------------------------------------------------------------
	static get_z_rotation = function() {
		return private.rotation.z
	}

	/// ----------------------------------------------------------------------------
	/// @function set_z_rotation(_z_rotation)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real} _z_rotation
	/// z_rotation
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_z_rotation = function(_z_rotation) {
		if (!is_real(_z_rotation)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.rotation.z = _z_rotation
		return self
	}

	#endregion –––––––––––––––––––– Z_ROTATION ––––––––––––––––––––

	#region    –––––––––––––––––––– ROTATION ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_rotation(arguments)
	/// ----------------------------------------------------------------------------
	/// @return {Struct}
	/// dimensions { x : Real, y : Real, z : Real }
	/// ----------------------------------------------------------------------------
	static get_rotation = function() {
		return private.rotation
	}

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} [arguments]
	///
	/// @parameter {Real} [arguments.x]
	/// x_dimensions
	///
	/// @parameter {Real} [arguments.y]
	/// y_dimensions
	///
	/// @parameter {Real} [arguments.z]
	/// z_dimensions
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_rotation = function(arguments) {
		if (!is_struct(arguments)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		if (arguments[$ "x"] != undefined) { set_x_rotation(arguments.x) }
		if (arguments[$ "y"] != undefined) { set_y_rotation(arguments.y) }
		if (arguments[$ "z"] != undefined) { set_z_rotation(arguments.z) }
		return self
	}

	#endregion –––––––––––––––––––– ROTATION ––––––––––––––––––––

	/*******************************************************************************/
	#endregion –––––––––––––––––––– ROTATION ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– SOLID_FILL ––––––––––––––––––––
	/*******************************************************************************/

	#region    –––––––––––––––––––– COLOUR_SOLID_FILL ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_colour_solid_fill()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// _colour_solid_fill
	/// ----------------------------------------------------------------------------
	static get_colour_solid_fill = function() {
		return private.solid_fill.colour
	}

	/// ----------------------------------------------------------------------------
	/// @function set_colour_solid_fill(_colour_solid_fill)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real}
	/// _colour_solid_fill
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement}
	/// ----------------------------------------------------------------------------
	static set_colour_solid_fill = function(_colour_solid_fill) {
		if (!is_real(_colour_solid_fill)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.solid_fill.colour = clamp(_colour_solid_fill, c_black, c_white)
		return self
	}

	#endregion –––––––––––––––––––– COLOUR_SOLID_FILL ––––––––––––––––––––

	#region    –––––––––––––––––––– ALPHA_SOLID_FILL ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_alpha_solid_fill()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// _alpha_solid_fill
	/// ----------------------------------------------------------------------------
	static get_alpha_solid_fill = function() {
		return private.solid_fill.alpha
	}

	/// ----------------------------------------------------------------------------
	/// @function set_alpha_solid_fill(_alpha_solid_fill)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real} _alpha_solid_fill
	/// _alpha_solid_fill
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_alpha_solid_fill = function(_alpha_solid_fill) {
		if (!is_real(_alpha_solid_fill)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.solid_fill.alpha = clamp(_alpha_solid_fill, 0, 1)
		return self
	}

	#endregion –––––––––––––––––––– ALPHA_SOLID_FILL ––––––––––––––––––––

	#region    –––––––––––––––––––– SOLID_FILL ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_solid_fill()
	/// ----------------------------------------------------------------------------
	static get_solid_fill = function() {
		return variable_clone(private.solid_fill)
	}

	/// ----------------------------------------------------------------------------
    /// @function set_solid_fill(arguments)
    /// ----------------------------------------------------------------------------
	static set_solid_fill = function(arguments = {}) {
		if (!is_struct(arguments)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		if (arguments[$ "colour"] != undefined) { set_colour_solid_fill(arguments.colour) }
		if (arguments[$ "alpha"]  != undefined) { set_alpha_solid_fill(arguments.alpha)   }
		return self
	}

	#endregion –––––––––––––––––––– SOLID_FILL ––––––––––––––––––––

	/*******************************************************************************/
	#endregion –––––––––––––––––––– SOLID_FILL ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– GRADIENT_FILL ––––––––––––––––––––
	/*******************************************************************************/

	#region    –––––––––––––––––––– COLOUR_GRADIENT_FILL ––––––––––––––––––––

	static get_colour_gradient_fill = function() {

	}

	static set_colour_gradient_fill = function() {

	}

	#endregion –––––––––––––––––––– COLOUR_GRADIENT_FILL ––––––––––––––––––––

	#region    –––––––––––––––––––– ALPHA_GRADIENT_FILL ––––––––––––––––––––

	static get_alpha_gradient_fill = function() {

	}

	static set_alpha_gradient_fill = function() {

	}

	#endregion –––––––––––––––––––– ALPHA_GRADIENT_FILL ––––––––––––––––––––

	#region    –––––––––––––––––––– GRADIENT_FILL ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_gradient_fill()
	/// ----------------------------------------------------------------------------
	static get_gradient_fill = function() {
		return variable_clone(private.gradient_fill)
	}

	/// ----------------------------------------------------------------------------
	/// @function set_gradient_fill(arguments)
	/// ----------------------------------------------------------------------------
	static set_gradient_fill = function(arguments = {}) {
		if (!is_struct(arguments)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		if (arguments[$ "all"] != undefined) {

		}
		if (arguments[$ "top"] != undefined) {
			arguments.top_left  = arguments.top
			arguments.top_right = arguments.top
		}
		if (arguments[$ "bottom"] != undefined) {
			arguments.bottom_left  = arguments.bottom
			arguments.bottom_right = arguments.bottom
		}
		if (arguments[$ "left"] != undefined) {
			arguments.top_left    = arguments.left
			arguments.bottom_left = arguments.left
		}
		if (arguments[$ "right"] != undefined) {
			arguments.top_right    = arguments.right
			arguments.bottom_right = arguments.right
		}
		if (arguments[$ "top_left"] != undefined)      {  }
		if (arguments[$ "top_right"]  != undefined)    {  }
		if (arguments[$ "bottom_left"] != undefined)   {  }
		if (arguments[$ "bottom_right"]  != undefined) {  }
		return self
	}

	#endregion –––––––––––––––––––– GRADIENT_FILL ––––––––––––––––––––

	/*******************************************************************************/
	#endregion –––––––––––––––––––– GRADIENT_FILL ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– SOLID_OUTLINE ––––––––––––––––––––
	/*******************************************************************************/

	#region    –––––––––––––––––––– THICKNESS_SOLID_OUTLINE ––––––––––––––––––––

	static get_thickness_solid_outline = function() {
		return private.solid_outline.thickness
	}

	static set_thickness_solid_outline = function(_thickness) {
		return self
	}

	#endregion –––––––––––––––––––– THICKNESS_SOLID_OUTLINE ––––––––––––––––––––

	#region    –––––––––––––––––––– ALIGNMENT_SOLID_OUTLINE ––––––––––––––––––––

	static get_alignment_solid_outline = function() {
		return private.solid_outline.alignment
	}

	static set_alignment_solid_outline = function(_alignment) {
		return self
	}

	#endregion –––––––––––––––––––– ALIGNMENT_SOLID_OUTLINE ––––––––––––––––––––

	#region    –––––––––––––––––––– COLOUR_SOLID_OUTLINE ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_colour_solid_outline()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// colour_solid_outline
	/// ----------------------------------------------------------------------------
	static get_colour_solid_outline = function() {
		return private.solid_outline.colour
	}

	/// ----------------------------------------------------------------------------
	/// @function set_colour_solid_outline(_colour_solid_outline)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real} _colour_solid_outline
	/// colour_solid_outline
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement}
	/// ----------------------------------------------------------------------------
	static set_colour_solid_outline = function(_colour_solid_outline) {
		if (!is_real(_colour_solid_outline)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.solid_outline.colour = clamp(_colour_solid_outline, c_black, c_white)
		return self
	}

	#endregion –––––––––––––––––––– COLOUR_SOLID_OUTLINE ––––––––––––––––––––

	#region    –––––––––––––––––––– ALPHA_SOLID_OUTLINE ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_alpha_solid_outline()
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// alpha_solid_outline
	/// ----------------------------------------------------------------------------
	static get_alpha_solid_outline = function() {
		return private.solid_outline.alpha
	}

	/// ----------------------------------------------------------------------------
	/// @function set_alpha_solid_fill(_alpha_solid_outline)
	/// ----------------------------------------------------------------------------
	/// @parameter {Real} _alpha_solid_outline
	/// alpha_solid_outline
	/// ----------------------------------------------------------------------------
	/// @return {Struct.RectangleElement} self
	/// ----------------------------------------------------------------------------
	static set_alpha_solid_outline = function(_alpha_solid_outline) {
		if (!is_real(_alpha_solid_outline)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		private.solid_outline.alpha = clamp(_alpha_solid_outline, 0, 1)
		return self
	}

	#endregion –––––––––––––––––––– ALPHA_SOLID_OUTLINE ––––––––––––––––––––

	#region    –––––––––––––––––––– SOLID_OUTLINE ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_solid_outline()
	/// ----------------------------------------------------------------------------
	static get_solid_outline = function() {
		return variable_clone(private.solid_outline)
	}

	/// ----------------------------------------------------------------------------
	/// @function set_solid_outline(arguments)
	/// ----------------------------------------------------------------------------
	static set_solid_outline = function(arguments = {}) {
		if (!is_struct(arguments)) {
			// new InvalidTypeErrorGeneric()
			return self
		}
		if (arguments[$ "thickness"] != undefined) { set_thickness_solid_outline(arguments.colour) }
		if (arguments[$ "alignment"] != undefined) { set_alignment_solid_outline(arguments.alpha)  }
		if (arguments[$ "colour"]    != undefined) { set_colour_solid_outline(arguments.colour)    }
		if (arguments[$ "alpha"]     != undefined) { set_alpha_solid_outline(arguments.alpha)      }
		return self
	}

	#endregion –––––––––––––––––––– SOLID_OUTLINE ––––––––––––––––––––

	/*******************************************************************************/
	#endregion –––––––––––––––––––– SOLID_OUTLINE ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– ALPHA ––––––––––––––––––––
	/*******************************************************************************/

	get_alpha = function() {

	}

	set_alpha = function() {

	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– ALPHA ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– DRAW ––––––––––––––––––––
	/*******************************************************************************/

	/// ----------------------------------------------------------------------------
	/// @function draw(arguments)
	/// ----------------------------------------------------------------------------
	static draw = function() {

		var _x1 = get_x_position() - get_x_alignment() * get_x_dimensions() * get_x_scale()
		var _y1 = get_y_position() - get_y_alignment() * get_y_dimensions() * get_y_scale()
		var _x2 = _x1 + get_x_dimensions() * get_x_scale()
		var _y2 = _y1 + get_y_dimensions() * get_y_scale()

		var _colour = get_colour_solid_fill()
		var _alpha  = get_alpha_solid_fill()

		var _vertices = [
			{ x : _x1, y : _y1 },
			{ x : _x1, y : _y2 },
			{ x : _x2, y : _y1 },
			{ x : _x1, y : _y2 },
			{ x : _x2, y : _y1 },
			{ x : _x2, y : _y2 },
		]

		// BEGIN_DRAW
		draw_primitive_begin(pr_trianglelist);

		for (var i = 0; i < array_length(_vertices); i++) {
			var _new_x, _new_y, _new_z, _rotation

			var _vertex = _vertices[i]

			/* –––––––––––––––––––– GLOBAL_ORIGIN –––––––––––––––––––– */
			var _x = _vertex.x
			var _y = _vertex.y
			var _z = 0

			_x -= get_x_position()
			_y -= get_y_position()

			/* –––––––––––––––––––– X_ROTATION –––––––––––––––––––– */
			_rotation = - get_x_rotation() * 2 * pi

			if (_rotation != 0) {
				_new_y = _y * cos(_rotation) - _z * sin(_rotation)
				_new_z = _y * sin(_rotation) + _z * cos(_rotation)

				_y = _new_y
				_z = _new_z

			}

			/* –––––––––––––––––––– Y_ROTATION –––––––––––––––––––– */
			_rotation = - get_y_rotation() * 2 * pi

			if (_rotation != 0) {
				_new_x =  _x * cos(_rotation) + _z * sin(_rotation)
				_new_z = -_x * cos(_rotation) + _z * cos(_rotation)

				_x = _new_x
				_z = _new_z
			}

			/* –––––––––––––––––––– Z_ROTATION –––––––––––––––––––– */
			_rotation = - get_z_rotation() * 2 * pi

			if (_rotation != 0) {
				_new_x = _x * cos(_rotation) - _y * sin(_rotation)
				_new_y = _x * sin(_rotation) + _y * cos(_rotation)

				_x = _new_x
				_y = _new_y
			}

			/* –––––––––––––––––––– LOCAL_ORIGIN –––––––––––––––––––– */
			_x += get_x_position()
			_y += get_y_position()

			_vertex.x = _x
			_vertex.y = _y

			 draw_vertex_colour(_vertex.x, _vertex.y, _colour, _alpha)
		}

		// END_DRAW
		draw_primitive_end()

		return self
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– DRAW ––––––––––––––––––––
	/*******************************************************************************/

}
