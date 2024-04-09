/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro CONSTRUCTOR_INITIALIZATION_GUARD                                 \
if (other == static_get(__INITIALIZED_CONSTRUCTOR_GENERIC)) { return }

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro INITIALIZED_CONSTRUCTOR __INITIALIZED_CONSTRUCTOR_GENERIC

/// ----------------------------------------------------------------------------
/// @function __INITIALIZED_CONSTRUCTOR_GENERIC(_constructor)
/// ----------------------------------------------------------------------------
/// @description
/// Makes sure the provided constructor is initialized before returning
/// its static struct.
/// ----------------------------------------------------------------------------
/// @parameter {Function} constructor
///
/// ----------------------------------------------------------------------------
/// @return {Struct|Undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function __INITIALIZED_CONSTRUCTOR_GENERIC(_constructor) {
    static is_initialized = {}
    if (is_initialized[$ script_get_name(_constructor)] != true) {
        is_initialized[$ script_get_name(_constructor)]  = true
        with (static_get(__INITIALIZED_CONSTRUCTOR_GENERIC)) {
            new _constructor()
        }
    }
    return static_get(_constructor)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTOR_INITIALIZATION_CODE ––––––––––––––––––––
/*******************************************************************************/

#macro CONSTRUCTOR_INITIALIZATION_CODE                                     \
static ____CONSTRUCTOR_INITIALIZATION_CODE = __CONSTRUCTOR_INITIALIZATION_CODE

function __CONSTRUCTOR_INITIALIZATION_CODE(_initialization_code) {
    _initialization_code()
}

/*******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTOR_INITIALIZATION_CODE ––––––––––––––––––––
/*******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function remove_variable_struct_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// StructGeneric.remove_variable
/// ----------------------------------------------------------------------------
function remove_variable_struct_generic(arguments = {}) {
    return STRUCT_GENERIC.remove_variable(arguments)
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

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

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
