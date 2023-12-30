/// ----------------------------------------------------------------------------
/// @function call_callable_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description Calls a callable using the provided options.
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// {Function} callable : Callable to be called.
///
/// {Array<Any>} [arguments=[]] : Arguments passed to the callable on call.
///
/// {Id.Instance|Struct} [scope=self] : Scope in which the callable will be called.
/// ----------------------------------------------------------------------------
/// @return {Any} Return value of the callable or undefined.
/// ----------------------------------------------------------------------------
function call_callable_generic(arguments = {}) {
    var _callable  = arguments[$ "callable"]
    var _arguments = arguments[$ "arguments"] ?? []
    var _scope     = arguments[$ "scope"] ?? self

    // ensure arguments are in an array
    if (!is_array(_arguments)) { _arguments = [_arguments] }

    // too many arguments
    var _argument_count = array_length(_arguments)
    if (_argument_count > 16) {
        show_error($"GameMaker function can't use more than 16 arguments.\n" + " arguments: {_arguments}", true)
        return undefined
    }

    // call callable in provided scope using provided arguments
    with (_scope) {
        switch (_argument_count) {
            case  0:
                return _callable()
            case  1:
                return _callable(_arguments[0])
            case  2:
                return _callable(_arguments[0], _arguments[1])
            case  3:
                return _callable(_arguments[0], _arguments[1], _arguments[2])
            case  4:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3])
            case  5:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4])
            case  6:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5])
            case  7:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6])
            case  8:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7])
            case  9:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8])
            case 10:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9])
            case 11:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9], _arguments[10])
            case 12:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9], _arguments[10], _arguments[11])
            case 13:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9], _arguments[10], _arguments[11], _arguments[12])
            case 14:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9], _arguments[10], _arguments[11], _arguments[12], _arguments[13])
            case 15:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9], _arguments[10], _arguments[11], _arguments[12], _arguments[13], _arguments[14])
            case 16:
                return _callable(_arguments[0], _arguments[1], _arguments[2], _arguments[3], _arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8], _arguments[9], _arguments[10], _arguments[11], _arguments[12], _arguments[13], _arguments[14], _arguments[15])
        }
    }

    return undefined
}
