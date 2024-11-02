/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function construct_instance_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function construct_instance_create(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function construct_instance_destroy(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to destroy construct instances.
/// ----------------------------------------------------------------------------
/// @parameter {struct} parameters
///
/// @parameter {type} parameters.instance
/// <parameter_description>
///
/// @parameter {type} parameters.parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function construct_instance_destroy(parameters) {
    return undefined
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
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function construct_instance_execute_parent_event(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function construct_instance_get_object_instance(parameters)
/// ----------------------------------------------------------------------------
function construct_instance_get_object_instance(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function construct_instance_get_object_instance_handle(parameters)
/// ----------------------------------------------------------------------------
function construct_instance_get_object_instance_handle(parameters = {}) {
    return _return
}

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

function ConstructInstance() constructor {

    self.private = {}

    self.collision = function() {

    }

    self.execute_parent_event = function() {

    }

    self.get_object_instance = construct_instance_get_object_instance

    self.get_object_instance_handle = construct_instance_get_object_instance_handle

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
