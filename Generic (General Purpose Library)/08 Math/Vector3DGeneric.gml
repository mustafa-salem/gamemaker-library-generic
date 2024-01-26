Vector3DGeneric
function rotate_vector_2d_generic(arguments) {
    var _x, _y, _new_x, _new_y, _xorigin, _yorigin, _xrotation_radiants, _yrotation_radiants, _zrotation_radiants

    // substract origin
    _xorigin = arguments.origin.x
    _yorigin = arguments.origin.y

    _x = arguments.vector.x
    _y = arguments.vector.y

    _xrotation_radiants = arguments.rotation.x * 2 * pi
    _yrotation_radiants = arguments.rotation.y * 2 * pi
    _zrotation_radiants = arguments.rotation.z * 2 * pi

    _x -= _xorigin
    _y -= _yorigin

    // x-rotation
    var _new_x = _x
    var _new_y = _y * cos(_xrotation_radiants)

    _x = _new_x
    _y = _new_y

    // y-rotation
    var _new_x = _x * cos(_yrotation_radiants)
    var _new_y = _y

    _x = _new_x
    _y = _new_y

    // z-rotation
    var _new_x = _x * cos(_zrotation_radiants) - _y * sin(_zrotation_radiants)
    var _new_y = _x * sin(_zrotation_radiants) + _y * cos(_zrotation_radiants)

    _x = _new_x
    _y = _new_y

    // add origin
    _x += _xorigin
    _y += _yorigin

    return { x : _x, y : _y }
}
