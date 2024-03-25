/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro PRIMITIVE                                                               \
INITIALIZED_CONSTRUCTOR(Primitive)

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_primitive_create(parameters)
/// ----------------------------------------------------------------------------
function generic_primitive_create(parameters = {}) {

	var _primitive

	with (_primitive) { __generic_primitive_create() }

}

function __generic_primitive_create() {

	private = {
		type          : POINT_LIST_PRIMITIVE_TYPE,
		texture       : undefined,
		vertex_buffer : undefined,
	}

	/// @function create(parameters)
	create = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_create(parameters)
		return self
	}

	/// @function get_type(parameters)
	get_type = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_get_type(parameters)
		return self
	}

	/// @function set_type(parameters)
	set_type = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_set_type(parameters)
		return self
	}

	/// @function get_texture(parameters)
	get_texture = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_get_texture(parameters)
		return self
	}

	/// @function set_texture(parameters)
	set_texture = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_set_texture(parameters)
		return self
	}

	/// @function add_vertex(parameters)
    static add_vertex = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_add_vertex(parameters)
		return self
	}

	/// @function draw(parameters)
	draw = function(parameters = {}) {
		parameters.primitive = self
		generic_primitive_draw(parameters)
		return self
	}

}

/// ----------------------------------------------------------------------------
/// @function generic_primitive_get_type(parameters)
/// ----------------------------------------------------------------------------
function generic_primitive_get_type(parameters = {}) {
	static _PRIMITIVE = PRIMITIVE

	var _primitive = parameters[$ "primitive"]

	return _primitive.private.type
}

/// ----------------------------------------------------------------------------
/// @function generic_primitive_set_type(parameters)
/// ----------------------------------------------------------------------------
function generic_primitive_set_type(parameters = {}) {
	static _PRIMITIVE = PRIMITIVE

	var _primitive = parameters[$ "primitive"]
	var _type      = parameters[$ "type"]
	_primitive.private.type = _type

	return _PRIMITIVE
}

/// ----------------------------------------------------------------------------
/// @function generic_primitive_get_texture(parameters)
/// ----------------------------------------------------------------------------
function generic_primitive_get_texture(parameters = {}) {
	static _PRIMITIVE = PRIMITIVE

	var _primitive = parameters[$ "primitive"]
	return _primitive.private.texture
}

/// ----------------------------------------------------------------------------
/// @function generic_primitive_set_texture(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {struct.Primitive} primitive
/// The primitive to target.
///
/// @parameter {struct.Texture|undefined} texture
/// The texture to use when drawing the primitive or undefined to not use a texture.
/// ----------------------------------------------------------------------------
/// @return {struct} The static struct of the 'Primitive' constructor.
/// ----------------------------------------------------------------------------
function generic_primitive_set_texture(parameters = {}) {
	static _PRIMITIVE = PRIMITIVE

	var _primitive = parameters[$ "primitive"]
	var _texture   = parameters[$ "texture"]

    if (!is_texture_struct()) {}

	_primitive.private.texture = _texture

	return _PRIMITIVE
}

/// ----------------------------------------------------------------------------
/// @function generic_primitive_get_texture(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {struct.Primitive} primitive
/// The primitive to target.
/// ----------------------------------------------------------------------------
/// @return {struct.Texture}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_primitive_add_vertex(parameters = {}) {
	static _PRIMITIVE = PRIMITIVE

	var _primitive = parameters[$ "primitive"]
	var _vertex    = parameters[$ "vertex"]

	return _PRIMITIVE
}

/// ----------------------------------------------------------------------------
/// @function generic_primitive_draw(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {struct.Primitive} primitive
/// <parameter_description>
///
/// @parameter {Type} parameters.parameter_name
/// <parameter_description>
///
/// @parameter {integer} vertex_offset
/// The index of the first vertex to draw.
///
/// @parameter {integer} vertex_count
/// The number of vertices to draw. This value is clamped to the size of the vertex buffer.
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_primitive_draw(parameters = {}) {

    var _primitive = parameters[$ "primitive"]

    var _vertex_buffer_handle    =
    var _primitive_type_constant =
    var _texture_pointer         = _primitive.get_texture().get_pointer() ?? -1

	// submit vertices to gpu for drawing
	vertex_submit(
        _vertex_buffer_handle,
        _primitive_type_constant,
        _texture_pointer
    )

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

PRIMITIVE

function Primitive() constructor {

    /// @function create(parameters)
    static create = generic_primitive_create

    /// @function get_type(parameters)
    static get_type = generic_primitive_get_type

    /// @function set_type(parameters)
    static set_type = generic_primitive_set_type

    /// @function get_texture(parameters)
    static get_texture = generic_primitive_get_texture

    /// @function set_texture(parameters)
    static set_texture = generic_primitive_set_texture

	/// @function add_vertex(parameters)
    static add_vertex = generic_primitive_add_vertex

    /// @function draw(parameters)
    static draw = generic_primitive_draw

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
