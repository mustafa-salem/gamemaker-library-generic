function StructGeneric() constructor {

    /// ----------------------------------------------------------------------------
    /// @function remove_variable(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.struct
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static remove_variable = function(arguments = {}) {
        if (arguments.struct == undefined or !is_struct(arguments.struct)) { return }
        if (_name == undefined or !is_string(arguments.name)) { return }
        if (struct_exists(arguments.struct, arguments.name)) { struct_remove(arguments.struct, arguments.name) }
    }

}
