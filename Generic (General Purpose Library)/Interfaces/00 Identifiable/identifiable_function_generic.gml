/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {String} Key
/// ----------------------------------------------------------------------------
function get_key_keyed_generic(_identifiable) {
    if (is_string(_identifiable)) { return _identifiable }
    return _identifiable.get_key()
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {Real} Id
/// ----------------------------------------------------------------------------
function get_id_identifiable_generic(_identifiable) {
    if (is_real(_identifiable)) { return _identifiable }
    return _identifiable.get_id()
}
