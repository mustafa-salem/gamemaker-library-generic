#macro Object ObjectGeneric

ObjectGeneric()

function ObjectGeneric() constructor {

    // TODO
    static current_event = function() {

        var _object_instance, _event_name, _event_method

        _event_name   = get_event_name()
        _event_method = _object_instance[$ _event_name]


        // call event method if present
        if (_current_method != undefined) {
            _event_method()
            return
        }
        /* –––––––––––––––––––– EARLY_RETURN –––––––––––––––––––– */

        // check if event is missing
        var _constructor =
        if (!_constructor.has_event(_event_name)) {
            // EVENT MISSING
        }

        /* –––––––––––––––––––– EARLY_RETURN –––––––––––––––––––– */

        // initialize
        _constructor.initialize_instance()

    }

    static initialize_instance = function() {

    }

    static is_parent = is_parent_object_generic
}

ObjectGeneric.get_parent_object_index = function(arguments) {
    var _object_index        = arguments[$ "object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index

    return object_get_parent(_object_index)
}

#macro is_parent_object is_parent_object_generic
#macro is_instance_of_object is_instance_of_object_generic

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function get_parent_object_index_object_generic(arguments) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function is_parent_object_generic(arguments) {
    var _object_index        = arguments[$ "object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index

    return ObjectGeneric.get_parent_object_index(arguments) == _parent_object_index
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function is_instance_of_object_generic(arguments) {
    var _child_object_index  = arguments[$ "child_object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index
}

/// ----------------------------------------------------------------------------
/// @function is_child_of(arguments)
/// ----------------------------------------------------------------------------
/// @description This function returns whether the given object is a direct or
/// indirect child of the given parent_object.
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// @parameter {Asset.GMObject} [arguments.object=object_index] - Object
/// @parameter {Asset.GMObject}  arguments.parent_object        - Parent Object
/// ----------------------------------------------------------------------------
/// @return {Bool}
/// ----------------------------------------------------------------------------
ObjectGeneric.is_child_of = function(arguments) {
    var _object        = arguments[$ "object"] ?? object_index
    var _parent_object = arguments.parent_object

    var _object_index = _object

    // go up the inheritance tree
    while (_object_index >= 0) {
        var _object_index = object_get_parent(_object_index)
        if (_object_index == _parent_object) { return true }
    }

    return false
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function inherits_from_object_generic(arguments) {
    var _child_object_index  = arguments[$ "child_object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index
}
