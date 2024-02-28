/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro OBJECT_INSTANCE_ABSTRACTION_GENERIC                                     \
INITIALIZED_CONSTRUCTOR(ObjectInstanceAbstractionGeneric)

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro ObjectInstanceAbstraction   ObjectInstanceAbstractionGeneric
#macro OBJECT_INSTANCE_ABSTRACTION OBJECT_INSTANCE_ABSTRACTION_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

// ObjectInstanceWrapper

OBJECT_INSTANCE_ABSTRACTION_GENERIC

function ObjectInstanceAbstractionGeneric() {

    static static_initialization = true

    static private = {
        object : undefined,
        object_constructor : arguments.object_constructor,
        object_instance    : arguments[$ "object_instance"],
    }

    // object_instance not provided exist
    if (private.object_instance == undefined) {
        create(arguments[$ "arguments"] ?? {})
    // object_instance provided and exists
    } else if (exists_object_instance({ object_instance : private.object_instance })) {
        _object_instance[$ "private"] ??= {}
        _object_instance.private[$ "object_constructor"] ??= private.object_constructor
        _object_instance.private[$ "object_instance"]    ??= private.object_instance
        private = _object_instance.private
    // object_instance provided but does not exist -> nothing
    }

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.object_instance
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {Struct.ObjectInstanceAbstractionGeneric}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static create = function(arguments = {}) {
        var _object          = arguments["object"]
        var _object_instance = arguments["object_instance"]
        if (_object) {

        }
        var _object =  ?? private.object
        var _object_instance = ObjectInstanceGeneric.create({
            object : _object,
            variables : {
                public : self
            },
        })

        return _object_instance.private.public
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
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
    static exists = function(arguments) {
        var _object_instance_abstraction
        return _object_instance_abstraction.private.object_instance.exists()
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
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
    static destroy = function(arguments = {}) {
        arguments.object_instance = private.object_instance
        destroy_object_instance_generic(arguments)
    }

}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
