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
        arguments.object = private.object
        return create_object_instance_generic(arguments)
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

            finite_state_machine = new FiniteStateMachine()
        }

        var _finite_state_machine = _instance.private.finite_state_machine

        _default_events = get_default_events()
        _finite_state_machine.define_default_event({ events : _default_events })

        for (var i = 0; i < ; i++) {
            events = get_events({ state_name : _state_names[i] })
            _finite_state_machine.define_event({ state_name : _state_names[i], events : _default_events })
        }

    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
    /*******************************************************************************/

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
