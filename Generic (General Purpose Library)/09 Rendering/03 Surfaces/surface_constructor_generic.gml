/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
surface_constructor_generic.gml

This file defines the constructor for SurfaceGeneric, a wrapper struct for native
GameMaker surfaces.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

function SurfaceGeneric(arguments = {}) constructor {

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

    draw = function(arguments = {}) {
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

}
