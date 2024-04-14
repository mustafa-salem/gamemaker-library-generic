function yarn_get_content_string(arguments) {
    ChatterboxGetAllContentString(chatterbox, [separator])
}

/// ----------------------------------------------------------------------------
/// @function define_function(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// Defines association between function name used in yarn script and a GML
/// callable.
///
/// ChatterboxAddFunction(name, function)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { name : String, callable : Function }
/// ----------------------------------------------------------------------------
static define_function = function(arguments) {

}

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
function yarn_define_function(parameters) {
    ChatterboxAddFunction(parameters.name, parameters.callable)
}
