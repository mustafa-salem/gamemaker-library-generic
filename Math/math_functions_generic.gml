function is_even_generic(_number) { return (_number % 2 == 0) }

function inverse_lerp_generic(minimum, maximum, value) {
    return (value - minimum) / (maximum - minimum)
}

function clamp_generic(arguments = {}) {
    return clamp(arguments.value, arguments.minimum, arguments.maximum)
}
