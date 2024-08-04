/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

// afterimage_object
// animated_afterimage_object
// growing_afterimage_object
// partial_afterimage_object

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
enum AFTERIMAGE_TYPE {
    DEFAULT,
	ANIMATED,
	GROWING,
	PARTIAL,
}

/// ----------------------------------------------------------------------------
/// @function afterimage_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} x_position
/// <parameter_description>
///
/// @parameter {type} y_position
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function afterimage_create(_instance = self) {

    // _instance.sprite_index = _target.sprite_index
    // _instance.image_index  = _target.image_index
    // _instance.image_blend  = _target.image_blend
    // _instance.image_speed  = 0
    // _instance.depth        = _target.depth
    // _instance.image_xscale = _target.image_xscale
    // _instance.image_yscale = _target.image_yscale
    // _instance.image_angle  = _target.image_angle

	_instance = object_instance_create(_target.x, _target.y, afterimage_object)
	return _instance
}

/// ----------------------------------------------------------------------------
/// @function afterimage_destroy(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function afterimage_destroy(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function afterimage_get_instances(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function afterimage_get_instances(parameters = {}) {
    return _return
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

function Afterimage() : ObjectInstanceAbstraction() constructor {

	/// ----------------------------------------------------------------------------
	/// @function create(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {type} type
	/// <parameter_description>
	///
	/// @parameter {type} x_position
	/// <parameter_description>
	///
	/// @parameter {type} y_position
	/// <parameter_description>
	///
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {type}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static create = function(parameters = {}) {
	    return _return
	}

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

create_event : {
	// lifetime_frames
	self[$ "fadeSpeed"] ??= 0.04
	if ("animated") {
		animRate    = 1
		fade        = 0.1
		reverse     = 0
		maxalpha    = 1
		image_count = 0
		ease        = 0
		image_count = (sprite_get_number(sprite_index) - 1)
	} else if ("growing") {
		xrate = 0.2
		yrate = 0.2
		fade  = 0.1
	} else if ("partial") {
		faderate     = 0.1
		siner        = 0
		sprite_index = spr_whitepx
		image_speed  = 0
		flash        = false
		// user_event_0
		width        = sprite_get_width(sprite_index)
		height       = sprite_get_width(sprite_index)
		xo           = sprite_get_xoffset(sprite_index)
		yo           = sprite_get_yoffset(sprite_index)
	}

    fade = fadeSpeed
    fade = faderate
}

step_event : {
	if ("") {
	} else if ("growing") {
		image_xscale += xrate
		image_yscale += yrate
	} else if ("animated") {
        if (reverse == 1) {
            reverse = 0
            image_index = image_count
            maxalpha = image_alpha
            image_alpha = 0
            fade *= -1
        }
        image_index = ((1 - (image_alpha / 1)) * image_count)
        if (image_alpha < 0 || image_alpha > 1) instance_destroy()
    }

    image_alpha -= fade
    if (image_alpha < 0) instance_destroy()
}

draw_event : {
	if ("") {
		draw_self()
	} else if ("animated") {
		gpu_set_fog(true, image_blend, 0, 1)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, (image_alpha * maxalpha))
		gpu_set_fog(false, c_black, 0, 0)
	} else if ("growing") {
		draw_self()
	} else if ("partial") {
		if flash {
			gpu_set_fog(true, c_white, 0, 1)
			draw_self()
			gpu_set_fog(false, c_black, 0, 0)
			flash = false
		}
		siner++
		var hw = (width / 2)
		var hh = (height / 2)
		var m = lerp_ease_out(0, (sprite_height / 2), ((siner + 2) / 10), 1)
		draw_sprite_part_ext(sprite_index, image_index, 0, 0, hw, hh, ((x - m) - ((xo * image_xscale) / 2)), ((y - m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
		draw_sprite_part_ext(sprite_index, image_index, hw, 0, hw, hh, ((x + m) - ((xo * image_xscale) / 2)), ((y - m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
		draw_sprite_part_ext(sprite_index, image_index, 0, hh, hw, hh, ((x - m) - ((xo * image_xscale) / 2)), ((y + m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
		draw_sprite_part_ext(sprite_index, image_index, hw, hh, hw, hh, ((x + m) - ((xo * image_xscale) / 2)), ((y + m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
	}
}
