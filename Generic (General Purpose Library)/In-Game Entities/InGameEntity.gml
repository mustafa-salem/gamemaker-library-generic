/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function ingame_entity_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} type
/// <parameter_description>
///
/// @parameter {type} x_position
/// <parameter_description>
///
/// @parameter {type} y_position
/// <parameter_description>
///
/// @parameter {type} z_position
/// <parameter_description>
///
/// @parameter {type} layer
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {struct}
/// ----------------------------------------------------------------------------
function ingame_entity_create(parameters = {}) {
    var _ingame_entity = new InGameEntity()
    var _object_instance = object_instance_create({ x : 0, y : 0 })
    _ingame_entity.private.object_instance = _object_instance
    return _ingame_entity
}

/// ----------------------------------------------------------------------------
/// @function ingame_entity_get(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} ingame_entity
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {struct|undefined}
/// ----------------------------------------------------------------------------
function ingame_entity_get(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function ingame_entity_reconfigure(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {struct|undefined}
/// ----------------------------------------------------------------------------
function ingame_entity_reconfigure(parameters = {}) {
    var _instances = <expression>
    for (var i = 0; i < array_length(_instances); i++) {
        var _instance = _instances[i]
        _instance.reconfigure(parameters)
    }
}

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

/// ObjectInstanceAbstraction

function InGameEntity() constructor {

    exists = function() {}

    destroy = function() {}

    reconfigure = function() {}

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

gpl_object_get({ object : ingame_entity_object })
.set_event({ event : "create_event", callable : function(parameters = {}) {
    if (self[$ "ingame_entity"] == undefined) {
        ingame_entity = ingame_entity_create({ object_instance : self })
    }
}})
.set_event({ event : "step_event", callable : function(parameters = {}) {
    ingame_entity.execute_event({ event : "step_event" })
}})
.set_event({ event : "draw_event", callable : function(parameters = {}) {
    ingame_entity.execute_event({ event : "draw_event" })
}})
