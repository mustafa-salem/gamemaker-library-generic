exists_instance_variable_generic
get_names_instance_variable_generic
get_count_instance_variable_generic
get_instance_variable_generic
set_instance_variable_generic

/*******************************************************************************/
#region    –––––––––––––––––––– GLOBAL_VARIABLE ––––––––––––––––––––
/*******************************************************************************/

// variable_global_exists
/// @function function_name(arguments)
/// @description <function_description>
/// @parameter {Struct} arguments <parameter_description>
/// @return {type} <return_description>
exists_global_variable_generic = function(arguments = {}) {
    return _return
}

// variable_global_get
/// @function function_name(arguments)
/// @description <function_description>
/// @parameter {Struct} arguments <parameter_description>
/// @return {type} <return_description>
get_global_variable_generic = function(arguments = {}) {
    return _return
}

// variable_global_set
/// @function function_name(arguments)
/// @description <function_description>
/// @parameter {Struct} arguments <parameter_description>
/// @return {type} <return_description>
set_global_variable_generic = function(arguments = {}) {
    return _return
}

/*******************************************************************************/
#endregion –––––––––––––––––––– GLOBAL_VARIABLE ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– INSTANCE_VARIABLE ––––––––––––––––––––
/*******************************************************************************/

/// @function function_name(arguments)
/// @description <function_description>
/// @parameter {Struct} arguments <parameter_description>
/// @return {type} <return_description>
function initialise_instance_variable_generic(arguments = {}) {
    var _instance
    var _variable_names
    for () {
        var _variable_name
        if (!exists_instance_variable_generic({ instance : _instance, variable_name : _variable_name })) {
            _instance[$ _variable_name] = _variable_value
        }
    }
}

/*******************************************************************************/
#endregion –––––––––––––––––––– INSTANCE_VARIABLE ––––––––––––––––––––
/*******************************************************************************/
