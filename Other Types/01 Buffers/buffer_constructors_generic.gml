/// @function function_name(arguments)
/// @description <function_description>
/// @parameter {Struct} arguments <parameter_description>
function BufferGeneric(arguments = {}) constructor {

    /// @function function_name(arguments)
    /// @description <function_description>
    /// @parameter {Struct} arguments <parameter_description>
    /// @return {type} <return_description>
    exists = function(arguments = {}) {
        arguments.buffer = self
        return exists_buffer_generic(arguments)
    }

    /// @function function_name(arguments)
    /// @description <function_description>
    /// @parameter {Struct} arguments <parameter_description>
    /// @return {type} <return_description>
    delete = function(arguments = {}) {
        arguments.buffer = self
        delete_buffer_generic(arguments)
    }

    /// @function function_name(arguments)
    /// @description <function_description>
    /// @parameter {Struct} arguments <parameter_description>
    /// @return {type} <return_description>
    read = function(arguments = {}) {
        arguments.buffer = self
        read_buffer_generic(arguments)
    }

    /// @function function_name(arguments)
    /// @description <function_description>
    /// @parameter {Struct} arguments <parameter_description>
    /// @return {type} <return_description>
    write = function(arguments = {}) {
        arguments.buffer = self
        write_buffer_generic(arguments)
    }

}
