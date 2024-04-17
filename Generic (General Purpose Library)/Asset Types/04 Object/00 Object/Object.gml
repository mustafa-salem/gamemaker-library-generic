/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– EVENT_SCRIPT ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
///
/// PURPOSE
/// Calls the callable associated with the object event of the event script that
/// it is placed in from the instance of Object that is associated with
/// the object of the executing object instance.
///
/// USAGE
/// Must be included in all event scripts of objects that should derive the
/// code executed for their objects events from their instance of Object.
///
/// ----------------------------------------------------------------------------
#macro OBJECT_EVENT_SCRIPT_CONTENTS                                    \
__OBJECT_EVENT_SCRIPT_CONTENTS_GENERIC()

function __OBJECT_EVENT_SCRIPT_CONTENTS_GENERIC() {

    // Static Struct
    static _static = static_get(__OBJECT_EVENT_SCRIPT_CONTENTS_GENERIC)

    // Create Event
    static create_event = method(undefined, function() {
        ObjectInstance.initialize({ object_instance : id })
        private.finite_state_machine.create_event()
    })

    // Collision Event
    static collision_event = method(undefined, function() {
        private.finite_state_machine.collision_event({ collidee : event_number })
    })

    // try getting deviating event method
    var _event_name   =  CURRENT_OBJECT_EVENT.get_name()
    var _event_method = _static[_event_name]

    // deviating behaviour
    if (_event_method != undefined) {
        _event_method()
    // default behaviour
    } else {
        private.finite_state_machine[$ _event_name]()
    }
}

/******************************************************************************/
#endregion –––––––––––––––––––– EVENT_SCRIPT ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– DEFAULTS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DEFAULT_DEPTH_OBJECT_GENERIC 0

/******************************************************************************/
#endregion –––––––––––––––––––– DEFAULTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– GENERAL ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function object_get(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function returns the 'Object' struct instance associated with the
/// targeted object. In case of failure 'undefined' is returned instead.
/// ----------------------------------------------------------------------------
/// @parameter {mixed} object
/// The value identifying the object to target.
/// ----------------------------------------------------------------------------
/// @return {struct.Object|undefined}
/// ----------------------------------------------------------------------------
function object_get(parameters) {
    var _object_id = object_get_id(parameters)
    return is_numeric(_object_id) ? OBJECT.private.objects[_object_id] : undefined
}

/// ----------------------------------------------------------------------------
/// @function object_get_name_generic(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is a generification of the built-in function 'object_get_name'.
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function object_get_name_generic(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function object_get_handle(parameters)
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
function object_get_handle(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function object_get_id(parameters)
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
function object_get_id(parameters = {}) {
    return _return
}

/******************************************************************************/
#endregion –––––––––––––––––––– GENERAL ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– DEPTH ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function get_depth_object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// Object.get_depth
/// ----------------------------------------------------------------------------
function get_depth_object_generic(arguments) {
    return OBJECT.get_depth(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_depth_object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// Object.set_depth
/// ----------------------------------------------------------------------------
function set_depth_object_generic(arguments) {
    return OBJECT.set_depth(arguments)
}

/******************************************************************************/
#endregion –––––––––––––––––––– DEPTH ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– EVENTS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_object_set_default_event(parameters)
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
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_object_set_default_event(parameters) {
    for (var i = 0; i < ; i++) {
        .set_default_event(parameters)
    }
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
function generic_object_get_event_callable(parameters) {
    return _return
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
function generic_object_execute_event(parameters) {
    return _return
}

/******************************************************************************/
#endregion –––––––––––––––––––– EVENTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– EVENT_HANDLERS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function object_set_event_handler(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} object
/// <parameter_description>
///
/// @parameter {type} event_handler
/// <parameter_description>
///
/// @parameter {type} event
/// <parameter_description>
///
/// @parameter {type} callable
/// <parameter_description>
///
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
function object_set_event_handler(parameters = {}) {
    object.private.events[_event].handlers[_event_handler] = parameters.callable
}

/******************************************************************************/
#endregion –––––––––––––––––––– EVENT_HANDLERS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

#macro OBJECT INITIALIZED_CONSTRUCTOR(Object)

OBJECT

function Object() : AssetGeneric() constructor {

    CONSTRUCTOR_INITIALIZATION_GUARD

    /// @type {struct}
    ///
    static private = {

    }

    /******************************************************************************/
    #region    –––––––––––––––––––– GENERAL ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_id(parameters)
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
    static get_id = function(parameters = {}) {
        return private.id
    }

    self.get_id = method(self, get_id)

    /// ----------------------------------------------------------------------------
    /// @function get_handle(parameters)
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
    static get_handle = function(parameters = {}) {
        return private.handle
    }

    self.get_handle = method(self, get_handle)

    /// ----------------------------------------------------------------------------
    /// @function get(parameters)
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
    static get = function(parameters = {}) {
        return self
    }

    self.get = method(self, get)

    /******************************************************************************/
    #endregion –––––––––––––––––––– GENERAL ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_depth = function(arguments) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.depth
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_depth = function(arguments) {
        var _object = get({ object : object })
        var _depth  = arguments.depth
        _object.private.depth = _depth
    }

    CONSTRUCTOR_INITIALIZATION_CODE(function() {
        for (var _object_index = 0; _object_index < ; _object_index++) {
            if (object_exists(_object_index)) { break }
            private.objects[_object_index] = new Object({ object : _object_index })
        }
    })

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#macro define_event_stateful_object         define_event_stateful_object_generic
#macro define_default_event_stateful_object define_default_event_stateful_object_generic

#macro ObjectConstructor ObjectConstructorGeneric

#macro REINITIALIZATION_GUARD {                                   \
    static __REINITIALIZATION_GUARD__ = true                      \
    if (self[$ "__REINITIALIZATION_GUARD__"] != true) { return }  \
    struct_remove(static_get(self), "__REINITIALIZATION_GUARD__") \
}

#macro OBJECT_CONSTRUCTOR_GUARD {			 \
    REINITIALIZATION_GUARD					 \
    static private = variable_clone(private) \
}

function ObjectConstructorGeneric() constructor {

    static private = {
        object : noone,
    }

    /*******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

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
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static create = function(arguments) {
        var _object = new Object()
        _object.private = {
            object_id : _object_id,
            instance_abstraction : {
                constructor_function : ObjectInstanceAbstraction,
            },
        }

        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function initialize_instance(arguments)
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
    static initialize_instance = function(arguments) {

        var _instance = arguments.instance

        with (_instance) {
            _event = function() { private.finite_state_machine._event() }
        }

        _instance[$ "private"] ??= {
            object_constructor : _,
            object_instance    : _instance,
        }

        with (_instance.private) {
            create_event = method(self, BlockTreeObject.create_event)
            draw_event   = method(self, BlockTreeObject.draw_event)

            finite_state_machine = finite_state_machine_create()
        }

        var _finite_state_machine = _instance.private.finite_state_machine

        _default_events = get_default_events()
        _finite_state_machine.define_default_event({ events : _default_events })

        for (var i = 0; i < ; i++) {
            events = get_events({ state_name : _state_names[i] })
            _finite_state_machine.define_event({ state_name : _state_names[i], events : _default_events })
        }

    }

    /// ----------------------------------------------------------------------------
    /// @function set_constructor_instance_abstraction(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Real|String|Struct} arguments.object
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.constructor_function
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_constructor_function_instance_abstraction = function(arguments) {
        var _object = arguments.object
        _object.private.instance_abstraction.constructor_function = arguments.constructor_function
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– EVENT ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.event
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.state
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.arguments
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static execute_event = function(arguments) {
        var _object
        var _callable = get_callable_event()
        var _arguments =
        var _scope =

        // event code undefined
        if (_callable == undefined) { return }

        call_callable({
            callable  : _callable,
            arguments : _arguments,
            scope     : _scope,
        })
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.event
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_default_callable_event = function(arguments) {
        if (Object) { arguments.object = self }

        var _object = arguments["object"]
        var _event  = arguments["event"]
        _object = object_get({ object : _object })
        _event  = Object.get_event({ event : _event })

        if (_event.default_callable == undefined and _object.get_parent() != undefined) {
            return _object.get_parent().get_default_callable_event({ event : _event })
        } else {
            return _event.default_callable
        }
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
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
    /// @return {Struct} self
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static set_default_callable_event = function(arguments) {
        var _object   = arguments["object"]
        var _event    = arguments["events"]
        var _callable = arguments["callable"]
        _object = object_get({ object : _object })
        _object.private.default_events..callable = arguments.callable
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– EVENT ––––––––––––––––––––
    /******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function define_event(arguments)
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
    static define_event = function(arguments = {}) {

        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function define_default_event(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.event_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.event_method
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
    static define_default_event = function(arguments) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function get_event(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.state_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.event_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_event_method = function(arguments = {}) {
        // type_check : arguments.state_name
        var _state_name = arguments[$ "state_name"]
        if (!is_string(_state_name)) { return undefined }

        // type_check : arguments.event_name
        var _event_name = arguments[$ "event_name"]
        if (!is_string(_event_name)) { return undefined }

        if (private.events[$ _state_name] == undefined) { return undefined }

        return private.events[$ _state_name][$ _event_name]
    }

    /// ----------------------------------------------------------------------------
    /// @function get_default_event(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.event_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_default_event_method = function(arguments = {}) {
        // type_check : arguments.event_name
        var _event_name = arguments[$ "event_name"]
        if (!is_string(_event_name)) { return undefined }

        return private.default_events[$ _event_name]
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

}


/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

object_index
object_exists
object_get_name
object_get_mask
object_set_mask
object_get_parent
object_get_persistent
object_set_persistent
object_get_solid
object_set_solid
object_get_sprite
object_set_sprite
object_get_physics
object_is_ancestor

event_inherited
event_perform
event_perform_async
event_perform_object
event_user
event_number
event_object
event_type

/// ----------------------------------------------------------------------------
/// @function get_visible_object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// Object.get_visible
/// ----------------------------------------------------------------------------
function get_visible_object_generic(arguments) {
    // object_get_visible
    return ASSET_GENERIC.get_visible(arguments)
}

/// ----------------------------------------------------------------------------
/// @function set_visible_object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// Object.set_visible
/// ----------------------------------------------------------------------------
function set_visible_object_generic(arguments) {
    // object_set_visible
    return ASSET_GENERIC.set_visible(arguments)
}

/// ----------------------------------------------------------------------------
/// @function _object_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// Object.
/// ----------------------------------------------------------------------------
function _object_generic(arguments) {
    //
    return ASSET_GENERIC.(arguments)
}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#macro Object Object

Object()

function Object() : AssetGeneric() constructor {

    /// ----------------------------------------------------------------------------
    /// @function create_instance(arguments)
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
    static create_instance = function(arguments = {}) {
        return ObjectInstance.create({
            object : ,
            variables : ,

        })
    }

    // TODO
    static current_event = function() {

        var _object_instance, _event_name, _event_method

        _event_name   = get_event_name()
        _event_method = _object_instance[$ _event_name]


        // call event method if present
        if (_current_method != undefined) {
            _event_method()
            return
        }
        /* –––––––––––––––––––– EARLY_RETURN –––––––––––––––––––– */

        // check if event is missing
        var _constructor =
        if (!_constructor.has_event(_event_name)) {
            // EVENT MISSING
        }

        /* –––––––––––––––––––– EARLY_RETURN –––––––––––––––––––– */

        // initialize
        _constructor.initialize_instance()

    }

    static initialize_instance = function() {

    }

    static is_parent = is_parent_object_generic

    /*******************************************************************************/
    #region    –––––––––––––––––––– DEFAULT_EVENT ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function set_default_event(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This method modifies properties of default events.
    /// ----------------------------------------------------------------------------
    /// @parameter {mixed} event
    /// The value identifying the event to target.
    ///
    /// @parameter {callable} callable
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_default_event = function(parameters) {
        private.default_events[$ parameters.event] = method(undefined, parameters.callable)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function execute_default_event(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    ///
    /// ----------------------------------------------------------------------------
    /// @parameter {mixed} event
    /// The value identifying the event to target.
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static execute_default_event = function(parameters) {
        private.default_events[$ parameters.event] = method(undefined, parameters.callable)
        return self
    }


    /*******************************************************************************/
    #endregion –––––––––––––––––––– DEFAULT_EVENT ––––––––––––––––––––
    /*******************************************************************************/
}

Object.get_parent_object_index = function(arguments) {
    var _object_index        = arguments[$ "object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index

    return object_get_parent(_object_index)
}

#macro is_parent_object is_parent_object_generic
#macro is_instance_of_object is_instance_of_object_generic

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function get_parent_object_index_object_generic(arguments) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function is_parent_object_generic(arguments) {
    var _object_index        = arguments[$ "object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index

    return Object.get_parent_object_index(arguments) == _parent_object_index
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function is_instance_of_object_generic(arguments) {
    var _child_object_index  = arguments[$ "child_object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index
}

/// ----------------------------------------------------------------------------
/// @function is_child_of(arguments)
/// ----------------------------------------------------------------------------
/// @description This function returns whether the given object is a direct or
/// indirect child of the given parent_object.
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// @parameter {Asset.GMObject} [arguments.object=object_index] - Object
/// @parameter {Asset.GMObject}  arguments.parent_object        - Parent Object
/// ----------------------------------------------------------------------------
/// @return {Bool}
/// ----------------------------------------------------------------------------
Object.is_child_of = function(arguments) {
    var _object        = arguments[$ "object"] ?? object_index
    var _parent_object = arguments.parent_object

    var _object_index = _object

    // go up the inheritance tree
    while (_object_index >= 0) {
        var _object_index = object_get_parent(_object_index)
        if (_object_index == _parent_object) { return true }
    }

    return false
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
function inherits_from_object_generic(arguments) {
    var _child_object_index  = arguments[$ "child_object_index"] ?? self.object_index
    var _parent_object_index = arguments.parent_object_index
}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
