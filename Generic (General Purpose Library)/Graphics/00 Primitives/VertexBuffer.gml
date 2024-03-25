/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro VERTEX_BUFFER                                                           \
VertexBuffer

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
/// @function generic_vertex_buffer_get_handle(parameters)
/// ----------------------------------------------------------------------------
function generic_vertex_buffer_get_handle(parameters) {

    var _vertex_buffer = parameters.vertex_buffer

    // struct.VertexBuffer -> handle.VertexBuffer
    if (is_vertex_buffer_struct(_vertex_buffer)) {
        return _vertex_buffer.private.handle
    }

    // handle.VertexBuffer -> handle.VertexBuffer
    if (is_vertex_buffer_handle(_vertex_buffer)) {
        return _vertex_buffer
    }

    // id.VertexBuffer -> handle.VertexBuffer
    if (is_vertex_buffer_id(_vertex_buffer)) {
        return handle_parse($"ref vertex buffer {_vertex_buffer}")
    }

    return undefined
}

/// ----------------------------------------------------------------------------
/// @function generic_vertex_buffer_get_index(parameters)
/// ----------------------------------------------------------------------------
function generic_vertex_buffer_get_index(parameters) {
    return parameters.vertex_buffer.private.index
}

/// ----------------------------------------------------------------------------
/// @function generic_vertex_buffer_create(parameters)
/// ----------------------------------------------------------------------------
function generic_vertex_buffer_create(parameters) {
    if (<condition>) {
        if (<condition>) {
            vertex_create_buffer_from_buffer_ext(buffer, format, src_offset, vert_num)
        } else {
            vertex_create_buffer_from_buffer(buffer, format)
        }
    } else {
        if (<condition>) {
            vertex_create_buffer_ext(size)
        } else {
            vertex_create_buffer()
        }
    }

    return
}

/// ----------------------------------------------------------------------------
/// @function generic_vertex_buffer_destroy(parameters)
/// ----------------------------------------------------------------------------
function generic_vertex_buffer_destroy(parameters) {
    var _vertex_buffer_handle = generic_vertex_buffer_get_handle({ vertex_buffer : parameters.vertex_buffer })
    vertex_delete_buffer(_vertex_buffer_handle)
}

/// ----------------------------------------------------------------------------
/// @function generic_vertex_buffer_update(parameters)
/// ----------------------------------------------------------------------------
function generic_vertex_buffer_update(parameters) {
    vertex_update_buffer_from_vertex(dest_vbuff, dest_vert, src_vbuff[, src_vert, src_vert_num])
    vertex_update_buffer_from_buffer(dest_vbuff, dest_offset, src_buffer[, src_offset, src_size])
}

function generic_vertex_buffer_get_size_bytes(parameters) {
    vertex_get_buffer_size(parameters.vertex_buffer.get_handle())
}

function generic_vertex_buffer_get_vertex_count(parameters) {
    vertex_get_number(parameters.vertex_buffer.get_handle())
}

function generic_vertex_buffer_freeze(parameters) {
    vertex_freeze(parameters.vertex_buffer.get_handle())
}

function generic_vertex_buffer_add_vertex(parameters) {

}

function generic_vertex_buffer_draw(parameters) {
    vertex_submit(buffer, primitive, texture)
    vertex_submit_ext(buffer, primtype, texture, offset, number)
}

function generic_vertex_buffer_(parameters) {

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

function VertexBuffer() constructor {

    /// @type {function}
    static get_handle = method(static_get(VertexBuffer), generic_vertex_buffer_get_handle)

    /// @type {function}
    static get_index = method(static_get(VertexBuffer), generic_vertex_buffer_get_index)

	/// @type {function}
	static create = method(static_get(VertexBuffer), function(arguments = {}) {

    })

	/// @type {function}
	static destroy = method(static_get(VertexBuffer), function(arguments = {}) {

    })

	/// @type {function}
	static duplicate = method(static_get(VertexBuffer), function(arguments = {}) {

    })

	/// @type {function}
	static update = method(static_get(VertexBuffer), function(arguments = {}) {

    })

	/// @type {function}
	static add_vertex = method(static_get(VertexBuffer), function(arguments = {}) {

    })

	/// @type {function}
	static get_byte_count = method(static_get(VertexBuffer), function(arguments = {}) {

    })

	/// @type {function}
	static get_vertex_count = method(static_get(VertexBuffer), generic_vertex_buffer_get_vertex_count)

	/// @type {function}
	static freeze = method(static_get(VertexBuffer), function(arguments = {}) {

    })

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
