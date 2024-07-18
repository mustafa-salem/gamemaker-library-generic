/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function sprite_element_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {string|handle|integer} sprite
/// The sprite to display.
///
/// @parameter {integer} frame
/// The index of the frame of the sprite to display. Defaults to 0.
///
/// ----------------------------------------------------------------------------
/// @return {struct.SpriteElement}
/// <return_description>
/// ----------------------------------------------------------------------------
function sprite_element_create(parameters = {}) {
    return new SpriteElement()
}

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function SpriteElement()
/// ----------------------------------------------------------------------------
/// @description
///
/// ----------------------------------------------------------------------------
function SpriteElement() constructor {

    private = {}

    /// ----------------------------------------------------------------------------
    /// # position
    /// ----------------------------------------------------------------------------
    private.x_position = 0
    private.y_position = 0
    private.z_position = undefined

    self.get_x_position = method(self, Drawable.get_x_position)
    self.get_y_position = method(self, Drawable.get_y_position)
    self.get_z_position = method(self, Drawable.get_z_position)
    self.set_position   = method(self, Drawable.set_position)

    /// ----------------------------------------------------------------------------
    /// # offset
    /// ----------------------------------------------------------------------------
    private.x_offset = 0
    private.y_offset = 0

    self.x_offset = method(self, Drawable.x_offset)
    self.y_offset = method(self, Drawable.y_offset)
    self.offset   = method(self, Drawable.offset)

	/// ----------------------------------------------------------------------------
	/// # alignment
	/// ----------------------------------------------------------------------------
    private.x_alignment = 0
    private.y_alignment = 0

    self.get_x_alignment = method(self, Drawable.get_x_alignment)
	self.get_y_alignment = method(self, Drawable.get_y_alignment)
	self.set_alignment   = method(self, Drawable.set_alignment)

	/// ----------------------------------------------------------------------------
	/// # dimensions
	/// ----------------------------------------------------------------------------
    private.x_dimensions = 0
    private.y_dimensions = 0

    self.get_x_dimensions = method(self, Drawable.get_x_dimensions)
	self.get_y_dimensions = method(self, Drawable.get_y_dimensions)
	self.set_dimensions   = method(self, Drawable.set_dimensions)

    /// ----------------------------------------------------------------------------
    /// # scale
    /// ----------------------------------------------------------------------------
    private.x_scale = 0
    private.y_scale = 0

    self.get_x_scale = method(self, Drawable.get_x_scale)
    self.get_y_scale = method(self, Drawable.get_y_scale)
    self.set_scale   = method(self, Drawable.set_scale)

    /// ----------------------------------------------------------------------------
    /// # rotation
    /// ----------------------------------------------------------------------------
    private.x_rotation = 0
    private.y_rotation = 0
    private.z_rotation = 0

    self.get_x_rotation = method(self, Drawable.get_x_rotation)
    self.get_y_rotation = method(self, Drawable.get_y_rotation)
    self.get_z_rotation = method(self, Drawable.get_z_rotation)
    self.set_rotation   = method(self, Drawable.set_rotation)

    /// ----------------------------------------------------------------------------
	/// # blending
	/// ----------------------------------------------------------------------------
	private.blend_colour = 0
	private.blend_alpha  = 0
	private.blend_mode   = 0

	self.get_blend_colour = method(self, Drawable.get_blend_colour)
	self.get_blend_alpha  = method(self, Drawable.get_blend_alpha)
	self.get_blend_mode   = method(self, Drawable.get_blend_mode)
	self.set_blend        = method(self, Drawable.set_blend)

    /// ----------------------------------------------------------------------------
    /// # shading
    /// ----------------------------------------------------------------------------
    private.shader
    private.shader_variables

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
