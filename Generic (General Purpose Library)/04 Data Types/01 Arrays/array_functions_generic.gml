function array_index_valid(_index, _array) {
    return (_index > 0 and _index < array_length(_array))
}

function is_index_in_range_array_generic() {

}

/// @parameter {struct} arguments
/// @parameter {array} array
/// @parameter {integer} index
/// @parameter {any} [out_of_range_return]
/// @parameter {any} [below_lower_bound_return]
/// @parameter {any} [above_upper_bound_return]
function get_entry_array_generic(arguments = {}) {

    if (is_index_in_range_array_generic({ array : arguments.array, index : arguments.index })) {
        return arguments.array[arguments.index]
    }

    // BELOW_LOWER_BOUND
    if () {

    }

    // ABOVE_UPPER_BOUND
    if () {

    }

}
