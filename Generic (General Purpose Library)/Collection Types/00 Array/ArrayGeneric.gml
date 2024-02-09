function ArrayGeneric() constructor {

    /// ----------------------------------------------------------------------------
    /// @function get_element(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.array
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.index
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_element = function(arguments = {}) {
        return arguments.array[arguments.index]
    }

    /// ----------------------------------------------------------------------------
    /// @function exists_element(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.array
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.index
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static exists_element = function(arguments = {}) {
        return arguments.index < 0 or arguments.index >= array_length(arguments.array)
    }

}
