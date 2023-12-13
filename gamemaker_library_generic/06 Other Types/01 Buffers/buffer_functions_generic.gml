/// @function (arguments)
function _buffer_generic(arguments = {}) {

}

function create_buffer_generic(arguments = {}) {

}

/// @function (arguments)
function exists_buffer_generic(arguments = {}) {
    return buffer_exists(_buffer_id)
}

/// @function (arguments)
function delete_buffer_generic(arguments = {}) {
    buffer_delete(_buffer_id)
}

/// @function (arguments)
function read_buffer_generic(arguments = {}) {
    buffer_read(_buffer_id, _buffer_data_type_constant)
}

/// @function (arguments)
function write_buffer_generic(arguments = {}) {
    buffer_write(_buffer_id, _buffer_data_type_constant, _value)
}

fill

seek

tell

peek

poke

save

load

async_group

copy

type

alignment

address

size

resize

sizeof

hash

encode/decode

used size
