/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro SURFACE INITIALIZED_CONSTRUCTOR(Surface)

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro APPLICATION_SURFACE                                                     \
generic_surface_get({ surface : application_surface })

#macro ENABLE_COMBATIBILITY_SIZE_SURFACE_GENERIC false
#macro ENSURE_EXISTS_SURFACE_GENERIC true
#macro DEFAULT_FORMAT_SURFACE_GENERIC RGBA_8BIT_UINT_NORMALIZED

enum SURFACE_FORMAT {
    RGBA_8BIT_UINT_SHADER_UNIFORM_NORMALIZED = surface_rgba8unorm, // FOUR_CHANNEL_8BIT_UINT_NORMALIZED
    R_8BIT_UINT_SHADER_UNIFORM_NORMALIZED = surface_r8unorm,    // ONE_CHANNEL_8BIT_UINT_NORMALIZED
    RG_8BIT_UINT_SHADER_UNIFORM_NORMALIZED = surface_rg8unorm,
    RGBA_4BIT_UINT_SHADER_UNIFORM_NORMALIZED = surface_rgba4unorm,
    RGBA_16BIT_FLOAT_SHADER_UNIFORM_NOT_NORMALIZED = surface_rgba16float,
    R_16BIT_FLOAT_SHADER_UNIFORM_NOT_NORMALIZED = surface_r16float,
    RGBA_32BIT_FLOAT_SHADER_UNIFORM_NOT_NORMALIZED = surface_rgba32float,
    R_32BIT_FLOAT_SHADER_UNIFORM_NOT_NORMALIZED = surface_r32float,
}

function SurfaceFormatGeneric() {
    channel_count
    type
    bit_depth
    is_normalize

    constants = {
        channel_count : {
            1 : {
                bit_depth : {

                },
            },
            2 : {
                bit_depth : {

                },
            },
            4 : {
                bit_depth : {

                },
            },
        }
    }

    get_constant = function() {
        var _constant = get_struct_member(constants, ["channel_count", "bit_depth", "type", "is_normalized"])
        return _constant
    }
}

/******************************************************************************/
#region    –––––––––––––––––––– DEFAULT_VALUES ––––––––––––––––––––
/******************************************************************************/

#macro SURFACE_DEFAULT_BLEND_ALPHA 1

/******************************************************************************/
#endregion –––––––––––––––––––– DEFAULT_VALUES ––––––––––––––––––––
/******************************************************************************/

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
/// @function function_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {mixed} surface
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {handle.surface|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_surface_get_handle(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function generic_surface_get_id(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {mixed} surface
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {id.surface|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_surface_get_id(parameters = {}) {
    // exception: variable 'parameters' isn't a struct
    if (!is_struct(parameters)) {
        throw Exception({
            message : "The 'parameters' struct must be a struct.",
        })
    }

    if (!struct_exists(parameters, "surface")) {
        throw Exception({
            message : "The parameter 'surface' is required.",
        })
    }

    var _surface = parameters.surface

    if (!is_surface(_surface)) {
        throw Exception({
            message : "The parameter 'surface' must be of type 'struct', 'handle' or 'id'.",
        })
    }

    var _surface_id = undefined

    if (is_surface_struct(_surface)) {
        _surface_id = _surface.private.id
    } else if (is_surface_handle(_surface)) {
        _surface_id = int64(_surface)
    } else if (is_surface_id(_surface)) {
        _surface_id = int64(_surface)
    }

    if (!is_surface_id(is_surface_id)) {
        throw Exception({
            message : "surface_id must be a surface_id.",
        })
    }

    return _surface_id

}

function generic_surface_get_default_blend_alpha() {
    static _SURFACE = SURFACE
    return _SURFACE.private.default_blend_alpha
}

function generic_surface_get(arguments = {}) {
    SURFACE.get
}

surface_get_target_ext
surface_reset_target

function create_surface_generic(arguments = {}) {
    surface_create_ext
}

/// @function exists_surface_generic(arguments)
/// @parameter {Struct} arguments
/// @return {Bool}
function exists_surface_generic(arguments = {}) {
    return surface_exists(arguments.surface.surface_id)
}

/// @function free_surface_generic(arguments)
/// @parameter {Struct} arguments
function free_surface_generic(arguments = {}) {
    surface_free(arguments.surface.surface_id)
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function resize_surface_generic(arguments = {}) {
    surface_resize(arguments.surface.surface_id, arguments.width, arguments.height)
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function get_target_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function set_target_surface_generic(arguments = {}) {
    // surface_set_target
    // surface_set_target_ext
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function is_target_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function get_height_surface_generic(arguments = {}) {
    var _surface_id = arguments.get_surface_id()
    return surface_get_height(_surface_id)
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function set_height_surface_generic(arguments = {}) {
    var _surface_id = arguments.get_surface_id()
    resize_surface_generic({})
}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function get_width_surface_generic(arguments = {}) {}

/// @function (arguments)
/// @parameter {Struct} arguments
/// @return {}
function set_width_surface_generic(arguments = {}) {}

/// ----------------------------------------------------------------------------
/// @function generic_surface_get_texture(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Mixed} surface
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {struct.Texture|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_surface_get_texture_id(parameters = {}) {
    generic_surface_get_texture_id()
}

/// ----------------------------------------------------------------------------
/// @function generic_surface_get_texture_id(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Mixed} surface
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_surface_get_texture_id(parameters = {}) {

    try {

    } catch(_exception) {
        return undefined
    }

    /// @type {int64}
    var _surface_id

    !is_numeric() { return undefined }

    // This function expects a numeric value referencing a surface and will return
    // -1 if the surface doesn't exist.
    surface_get_texture(_surface_id)

    var _texture_id

    if (_texture_id == -1) { _texture_id = undefined }

    return _texture_id
}

generic_surface_draw({
    surface : <value>,
    position : {
        x : <value>,
        y : <value>,
    },
    scale : {
        x : <value>,
        y : <value>,
    },
    blend : {
        colour : <value>,
        alpha  : <value>,
        mode   : <value>,
    },
})

/// ----------------------------------------------------------------------------
/// @function generic_surface_draw(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// Draws a surface using any combination of parameters passed through the
/// "parameters" struct. (argument0)
///
/// There are no required parameters; however, setting any parameter to an
/// invalid value may cause an exception of type struct.Exception to be thrown.
///
/// The static struct of the "Surface" constructor function is returned for the
/// purpose of implementing a fluent interface.
/// ----------------------------------------------------------------------------
/// @parameter {mixed} surface
/// The surface to draw.
///
/// @parameter {type} vertices
/// Can be used instead of [position, alignment, dimension, scale] to directly set
/// where the surface is drawn.
/// { x_position : , y_position : , x_texture_coordinate : , y_texture_coordinate : , blend_colour : , blend_alpha : }
///
/// @parameter {number} x_position
/// The x position where to draw the surface onto the render target.
///
/// @parameter {number} y_position
/// The y position where to draw the surface onto the render target.
///
/// @parameter {number} x_alignment
/// valid range : [0, 1]
///
/// @parameter {number} y_alignment
/// valid range : [0, 1]
///
/// @parameter {number} x_dimension
/// The x dimensions the surface should be drawn with.
///
/// @parameter {number} y_dimension
/// The y dimensions the surface should be drawn with.
///
/// @parameter {number} x_scale
/// -> calculates x_dimension
///
/// @parameter {number} y_scale
/// -> calculates y_dimension
///
/// @parameter {type} x_rotation
/// valid range : [0, 1]
///
/// @parameter {type} y_rotation
/// valid range : [0, 1]
///
/// @parameter {type} z_rotation
/// valid range : [0, 1]
///
/// @parameter {type} fragment_vertices
/// Can be used instead of [position, alignment, dimension, scale] to directly set
/// what part of the surface is drawn.
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
/// @parameter {type} blend_colour
/// <parameter_description>
///
/// @parameter {type} blend_alpha
/// <parameter_description>
///
/// @parameter {type} blend_gradient
/// <parameter_description>
///
/// @parameter {boolean} tiled
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_surface_draw(parameters) {

    // x : [100, 200] or [0.1, 0.2]
    // y : [0, 50] or [0, 0.1]
    // x_

    static _SURFACE = SURFACE

    // surface
    var _surface

    // early return: surface doesn't exist
    if (!surface_exists(_surface)) {
        // if (!exists_surface_generic({ surface : _surface })) { return _SURFACE }
    }

    // position
    var _x_position = parameters[$ "x_position"] ?? 0
    var _y_position = parameters[$ "y_position"] ?? 0
    // alignment
    var _x_alignment = parameters[$ "x_alignment"] ?? 0
    var _y_alignment = parameters[$ "y_alignment"] ?? 0
    // scale
    var _x_scale = parameters[$ "x_scale"] ?? 1
    var _y_scale = parameters[$ "y_scale"] ?? 1
    // dimension
    var _x_dimension = parameters[$ "x_dimension"] ?? _x_scale * surface_get_width(_surface)
    var _y_dimension = parameters[$ "y_dimension"] ?? _y_scale * surface_get_height(_surface)
    // rotation
    var _x_rotation = parameters[$ "x_rotation"] ?? 0
    var _y_rotation = parameters[$ "y_rotation"] ?? 0
    var _z_rotation = parameters[$ "z_rotation"] ?? 0
    // blend
    var _blend_colour = parameters[$ "blend_colour"] ?? c_white
    var _blend_alpha  = parameters[$ "blend_alpha"]  ?? 1

    var _vertices = []

    _vertices[0] = {
        x_position           : _x_position,
        y_position           : _y_position,
        x_texture_coordinate : 0,
        y_texture_coordinate : 0,
        blend_colour         : _blend_colour,
        blend_alpha          : _blend_alpha,
    }

    _vertices[1] = {
        x_position           : _x_position + _x_dimension,
        y_position           : _y_position,
        x_texture_coordinate : 1,
        y_texture_coordinate : 0,
        blend_colour         : _blend_colour,
        blend_alpha          : _blend_alpha,
    }

    _vertices[2] = {
        x_position           : _x_position,
        y_position           : _y_position + _y_dimension,
        x_texture_coordinate : 0,
        y_texture_coordinate : 1,
        blend_colour         : _blend_colour,
        blend_alpha          : _blend_alpha,
    }

    _vertices[3] = {
        x_position           : _x_position + _x_dimension,
        y_position           : _y_position + _y_dimension,
        x_texture_coordinate : 1,
        y_texture_coordinate : 1,
        blend_colour         : _blend_colour,
        blend_alpha          : _blend_alpha,
    }

    // draw primitive
    draw_primitive_begin_texture(pr_trianglestrip, surface_get_texture(_surface))
    for (var i = 0; i < 4; i++) { with (_vertices[i]) { draw_vertex_texture_colour(x_position, y_position, x_texture_coordinate, y_texture_coordinate, blend_colour, blend_alpha) } }
    draw_primitive_end()

    _blend_mode.set()
    _shader.set()

    // DRAW SURFACE TEXTURE

    var _primitive = new Primitive({
        type : TRIANGLE_STRIP_PRIMITIVE_TYPE,
        texture : generic_surface_get_texture({ surface : _surface }),
    })

    var _position = {
        left   : ,
        right  : ,
        top    : ,
        bottom : ,
    }

    var _texture_coordinates = {
        left   : ,
        right  : ,
        top    : ,
        bottom : ,
    }

    var _colour = {
        left   : ,
        right  : ,
        top    : ,
        bottom : ,
    }

    var _alpha = {
        left   : ,
        right  : ,
        top    : ,
        bottom : ,
    }

    vb = vertex_create_buffer();

    _primitive
    .add_vertex({
        position : { x : _position.left, y : _position.top },
        texture_coordinates : { x : _texture_coordinates.left, y : _texture_coordinates.top },
        blend : { colour : , alpha  :  },
    })
    .add_vertex({
        position : { x : _position.left, y : _position.bottom },
        texture_coordinates : { x : _texture_coordinates.left, y : _texture_coordinates.bottom },
        blend : { colour : , alpha  :  },
    })
    .add_vertex({
        position : { x : _position.right, y : _position.top },
        texture_coordinates : { x : _texture_coordinates.right, y : _texture_coordinates.top },
        blend : { colour : , alpha  :  },
    })
    .add_vertex({
        position : { _position.right, y : _position.bottom },
        texture_coordinates : { _texture_coordinates.right, y : _texture_coordinates.bottom },,
        blend : { colour : , alpha  :  },
    })

    _primitive.draw()

    _blend_mode.unset()
    _shader.unset()

    return _SURFACE

    return _return
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
surface_constructor_generic.gml

This file defines the constructor for Surface, a wrapper struct for native
GameMaker surfaces.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

function Surface(arguments = {}) constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_STRUCT_MEMBERS ––––––––––––––––––––
    /*******************************************************************************/

    private = {}

    // index of native GameMaker surface
    private.surface_id = is_numeric(arguments) ? arguments : create_surface_generic(arguments)

    private.cached = {
        width  : get_width(),
        height : get_height(),
        format : get_format(),
        depth_buffer_enabled : true,
    }

    surface_existance_ensurance_enabled = true

    private.ensure_surface_exists = function() {
        if (exists() or !surface_existance_ensurance_enabled) { return }

        private.surface_id = create_surface_generic({
            width  : private.cached.width,
            height : private.cached.height,
            format : private.cached.format,
            depth_buffer_enabled : private.cached.depth_buffer_enabled,
        })
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_STRUCT_MEMBERS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PUBLIC_STRUCT_MEMBERS ––––––––––––––––––––
    /*******************************************************************************/

    /// @function (arguments)
    /// @parameter {Struct} arguments
    /// @return {}
    function(arguments = {}) {}

    /// @function exists(arguments)
    /// @description Calls exists_surface_generic on self using provided arguments.
    /// @parameter {Struct} [arguments]
    /// @return {Bool}
    exists = function(arguments = {}) {
        arguments.surface = self
        return exists_surface_generic(arguments)
    }

    /// @function resize(arguments)
    /// @description Calls resize_surface_generic on self using provided arguments.
    /// @parameter {Struct} arguments
    resize = function(arguments = {}) {
        arguments.surface = self
        arguments[$ "width"]  ??= get_width()
        arguments[$ "height"] ??= get_height()
        resize_surface_generic(arguments)
    }

    /// @function set_target(arguments)
    /// @description Calls set_target_surface_generic on self using provided arguments.
    /// @parameter {Struct} [arguments]
    set_target = function(arguments = {}) {
        private.ensure_surface_exists()
        arguments.surface = self
        set_target_surface_generic(arguments)
    }

    is_target = function(arguments = {}) {
        arguments.surface = self
    }

    = function(arguments = {}) {
        arguments.surface = self
        surface_copy_part
    }

    = function(arguments = {}) {
        arguments.surface = self
        surface_depth_disable
    }

    /// @function get_width(arguments)
    /// @description Calls ___________________ on self using provided arguments.
    /// @parameter {Struct} arguments
    /// @return {Real}
    get_width = function(arguments = {}) {
        if (exists()) {
            arguments.surface = self
            private.cached_width = get_width_surface_generic(arguments)
        }
        return private.cached_width
    }

    /// @function set_width(arguments)
    /// @description Calls ___________________ on self using provided arguments.
    /// @parameter {Struct} arguments
    set_width = function(arguments = {}) {
        resize(arguments)
        arguments.surface = self
        set_width_surface_generic(arguments)
    }

    /// @function get_height(arguments)
    /// @description Calls ___________________ on self using provided arguments.
    /// @parameter {Struct} arguments
    /// @return {Real}
    get_height = function(arguments = {}) {
        arguments.surface = self
        return get_height_surface_generic(arguments)
    }

    /// @function set_height(arguments)
    /// @description Calls ___________________ on self using provided arguments.
    /// @parameter {Struct} arguments
    set_height = function(arguments = {}) {
        arguments.surface = self
        set_height_surface_generic(arguments)
    }

    get_texture = function(arguments = {}) {
        arguments.surface = self
        surface_get_texture
    }

    get_depth_disable = function(arguments = {}) {
        arguments.surface = self
        surface_get_depth_disable
    }


    get_pixel = function(arguments = {}) {
        arguments.surface = self
        surface_getpixel_ext
    }

    get_format = function(arguments = {}) {
        arguments.surface = self
        surface_get_format
    }

    is_format_supported = function(arguments = {}) {
        arguments.surface = self
        surface_format_is_supported
    }

    /// @function free(arguments)
    /// @parameter {Struct} arguments
    free = function(arguments = {}) {
        arguments.surface = self
        free_surface_generic(arguments)
    }

    save = function(arguments = {}) {
        arguments.surface = self
        surface_save_part
    }

    /// ----------------------------------------------------------------------------
    /// @function draw(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static draw = function(arguments = {}) {
        arguments.surface = self
        draw_surface_part_ext
        draw_surface_stretched_ext
        draw_surface_tiled_ext
        draw_surface_general
    }

    load_contents_from_buffer = function(arguments = {}) {
        arguments.surface = self

    }

    load_contents_from_buffer = function(arguments = {}) {
        buffer_get_surface(_buffer_id, _surface_id, _offset_bytes)
    }


    save_contents_to_buffer = function(arguments = {}) {
        arguments.surface = self

    }

    save_contents_to_buffer = function(arguments = {}) {

        var _buffer = is_struct(arguments.buffer) ? arguments.buffer : create_buffer_generic({  })

        var _buffer_id    = _buffer.get_id()
        var _surface_id   = is_numeric(arguments.surface) ? arguments.surface : arguments.surface.get_id()
        var _offset_bytes =
        buffer_set_surface(_buffer_id, _surface_id, _offset_bytes)

        return _buffer
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PUBLIC_STRUCT_MEMBERS ––––––––––––––––––––
    /*******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

    static private = {
        default_blend_alpha : SURFACE_DEFAULT_BLEND_ALPHA,
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /******************************************************************************/

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
