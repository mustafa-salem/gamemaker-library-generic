// TODO : REPLACE
// function array_index_valid(_index, _array) { return (_index > 0 and _index < array_length(_array)) }

/// @function is_index_out_of_range_array_generic(arguments)
/// @parameter {struct} arguments { array, index }
/// @return {bool}
function is_index_out_of_range_array_generic(arguments = {}) {
    return arguments.index < 0 or arguments.index >= array_length(arguments.array)
}
<<<<<<< Updated upstream
=======

/// @parameter {struct} arguments { array, index, [out_of_range_return_value], [below_lower_bound_return_value], [above_upper_bound_return_value] }
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
>>>>>>> Stashed changes
