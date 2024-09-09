/// ----------------------------------------------------------------------------
/// @function get_static_variable(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This function checks the static struct of the specified owner for a variable
/// with the specified name and returns its value. If no such variable exists or
/// an error occurs undefind is returned instead.
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Function|Struct} arguments.owner
/// The owner of the static variable to get. This can be a script function,
/// a method, or a struct. If a struct is provided the constructor function used
/// to create the struct will be used as owner.
///
/// @parameter {String} arguments.variable_name
/// The name of the static variable to check for.
///
/// ----------------------------------------------------------------------------
/// @return {Any}
/// The value of the static variable to get or undefined.
/// ----------------------------------------------------------------------------
function get_static_variable(arguments) {

	// type_check : arguments
	if (!is_struct(arguments)) { return undefined }

	// type_check : arguments.owner
	var _owner = arguments[$ "owner"]
	if (!is_callable(_owner) and !is_struct(_owner)) { return undefined }

	// type_check : arguments.variable_name
	var _variable_name = arguments[$ "variable_name"]
	if (!is_string(_variable_name)) { return undefined }
	

	var _static_struct = static_get(_owner)
	if (_static_struct == undefined) { return undefined }

	return _static_struct[$ _variable_name]

}
