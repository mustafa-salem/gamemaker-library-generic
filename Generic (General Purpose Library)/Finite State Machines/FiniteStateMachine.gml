/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
finite_state_machine_constructor_generic.gml

This file defines FiniteStateMachine. This struct represents a finite
state machine. It is recommended to name instances of FiniteStateMachine
finite_state_machine. States and events can be added to a finite_state_machine.
Events in this case are stateful functions.

This implementation is based on SnowState by Sohom Sahaun.
https://github.com/sohomsahaun/SnowState
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

// TODO: remove direct references to FiniteStateMachine

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

// Startup errors
if (!is_string(FSM_WILDCARD_TRANSITION_NAME_GENERIC) || (string_length(FSM_WILDCARD_TRANSITION_NAME_GENERIC) != 1)) {
	var _str = "[FiniteStateMachine]\n"
	_str += "FSM_WILDCARD_TRANSITION_NAME_GENERIC should be a string of length 1."
	_str += "\n\n\n"
	show_error(_str, true)
}

if (!is_string(FSM_REFLEXIVE_TRANSITION_NAME_GENERIC) || (string_length(FSM_REFLEXIVE_TRANSITION_NAME_GENERIC) != 1)) {
	var _str = "[FiniteStateMachine]\n"
	_str += "FSM_REFLEXIVE_TRANSITION_NAME_GENERIC should be a string of length 1."
	_str += "\n\n\n"
	show_error(_str, true)
}

#macro SHOW_WARNINGS_FINITE_STATE_MACHINE_GENERIC				     true		// Whether to show warning messages in Output (true) or not (false)
#macro HISTORY_ENABLED_DEFAULT_FINITE_STATE_MACHINE_GENERIC		     false		// Whether history should be tracked by default (true) or not (false)
#macro MAXIMUM_HISTORY_SIZE_DEFAULT_FINITE_STATE_MACHINE_GENERIC     5			// Default maxmimum history count
#macro CIRCULAR_INHERITANCE_THROW_ERROR_FINITE_STATE_MACHINE_GENERIC true		// Whether to throw an error when circular inheritance is found (true) or not (false)
#macro WILDCARD_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC		 "*"			// Default wildcard transition name
#macro REFLEXIVE_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC	     "="

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

/// ----------------------------------------------------------------------------
/// @function finite_state_machine_create(parameters)
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
function finite_state_machine_create(parameters) {
    return new FiniteStateMachine(parameters)
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function FiniteStateMachine(arguments)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { initial_state_name : String, execute_initial_enter_event : [Bool=true], event_execution_context : [(Id.Instance|Struct)=other] }
/// ----------------------------------------------------------------------------
function FiniteStateMachine(arguments) constructor {

    var _initial_state_name          = arguments[$ "initial_state_name"]
    var _execute_initial_enter_event = arguments[$ "execute_initial_enter_event"] ?? true
    var _event_execution_context     = arguments[$ "event_execution_context"]     ?? other

    private = {}

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

	/// ----------------------------------------------------------------------------
    /// @type {Id.Instance|Struct}
    private.event_execution_context = _event_execution_context
	/// ----------------------------------------------------------------------------
    /// @type {Struct}
    private.states = {}
	/// ----------------------------------------------------------------------------
    /// @type {Struct}
    private.transitions	= {}
	/// ----------------------------------------------------------------------------
    /// @type {Struct}
    private.wildcard_transitions = {}
	/// ----------------------------------------------------------------------------
    /// @type {Struct}
    private.event_handlers = {}
	/// ----------------------------------------------------------------------------
    /// @type {String}
    private.initial_state_name = _initial_state_name
	/// ----------------------------------------------------------------------------
    /// @type {Bool}
    private.execute_initial_enter_event = _execute_initial_enter_event
	/// ----------------------------------------------------------------------------
    /// @type {String|Undefined}
    // Current event
    private.current_event_name = undefined
	/// ----------------------------------------------------------------------------
    /// @type {Function|Undefined}
    // Temporary event - Used when changing states
    private.temp_event = undefined
	/// ----------------------------------------------------------------------------
    /// @type {Struct}
    // Inheritance tree
    private.state_parent_name = {}
	/// ----------------------------------------------------------------------------
    /// @type {Array<String>}
    // Path from current state to it's ancestor(s)
    private.child_queue	= []
	/// ----------------------------------------------------------------------------
    /// @type {Real}
    // Start time of the current state (in microseconds)
    private.state_start_time = get_timer()
	/// ----------------------------------------------------------------------------
    /// @type {Array<String|Undefined>}
    // Array holding the history
    private.history = array_create(2, undefined)
	/// ----------------------------------------------------------------------------
    /// @type {Real}
    // Maximum size of history
    private.history_max_size = max(0, MAXIMUM_HISTORY_SIZE_DEFAULT_FINITE_STATE_MACHINE_GENERIC)
	/// ----------------------------------------------------------------------------
    /// @type <Bool>
    // If history is enabled or not
    private.history_enabled	= HISTORY_ENABLED_DEFAULT_FINITE_STATE_MACHINE_GENERIC
	/// ----------------------------------------------------------------------------
    /// @type {Struct}
    // Default functions for events
    private.default_events = {
        enter: {
            exists: "undefined_event",
            callable: function() {}
        },
        leave: {
            exists: "undefined_event",
            callable: function() {}
        },
    }
	/// ----------------------------------------------------------------------------
    /// @type {Array<String>}
    // It is what it is
    private.invalid_state_names = [
        FSM_WILDCARD_TRANSITION_NAME_GENERIC,
        REFLEXIVE_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC,
    ]
	/// ----------------------------------------------------------------------------
    /// @type {}
    // Add .set_event_handler() events
    private.event_handlers[$ "change_state_event"] = undefined

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_PROPERTIES ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PRIVATE_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function define_state(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// <parameter_description>
    ///
    /// @parameter {Struct} [arguments.events]
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.define_state = function(arguments) {
        var _state_name = arguments[$ "name"]
        var _events     = arguments[$ "events"] ?? {}
        // var _state_has_parent = arguments[$ ""]

        var _state_event_names, _state, _event_name

        _state = private.create_state({ events : _events })
        private.states[$ _state_name] = _state

        // Update from parent
        if (_state_has_parent) {
            // Get events from parent
            private.update_events_from_parent({ state_name : _state_name })

            // Replace parent's events with defined ones
            _state_event_names = struct_get_names(_events)
            for (var i = 0; i < array_length(_state_event_names); i++) {
                _event_name = _state_event_names[i]
                _state[$ _event_name] = {
                    exists: "defined_event",
                    callable: method(private.event_execution_context, _events[$ _event_name])
                }
            }
        }

        // Update all the states
        private.update_states()

        // execute initial enter event
        if (_state_name == private.initial_state_name and private.execute_initial_enter_event) {
            private.state_start_time = get_timer()
            enter()
        }

        return self
    }


    /// ----------------------------------------------------------------------------
    /// @function define_transition(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.transition_name
    /// <parameter_description>
    ///
    /// @parameter {String} [arguments.source_state_name]
    /// <parameter_description>
    ///
    /// @parameter {String} [arguments.destination_state_name]
    /// <parameter_description>
    ///
    /// @parameter {Function} [arguments.predicate_method]
    /// <parameter_description>
    ///
    /// @parameter {Function} [arguments.leave_event]
    /// <parameter_description>
    ///
    /// @parameter {Function} [arguments.enter_event]
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.define_transition = function(arguments = {}) {
        var _transition_name        = arguments[$ "transition_name"]
        var _source_state_name      = arguments[$ "source_state_name"]
        var _destination_state_name = arguments[$ "destination_state_name"]
        var _predicate_method       = arguments[$ "predicate_method"] ?? function() { return true }
        var _leave_event            = arguments[$ "leave_event"]
        var _enter_event            = arguments[$ "enter_event"]

        // Define the transition
        var _transition = {
            source_state_name		: _source_state_name,
            destination_state_name : _destination_state_name,
            predicate_method	    : _predicate_method,
            exists		            : "defined_trigger",
            leave_event             : _leave_event,
            enter_event             : _enter_event,
        }

        // wildcard_transition
        if (_source_state_name == FSM_WILDCARD_TRANSITION_NAME_GENERIC) {
            // Wildcard transition
            private.wildcard_transitions[$ _transition_name] ??= []
            array_push(private.wildcard_transitions[$ _transition_name], _transition)
        // transition
        } else {
            private.transitions[$ _source_state_name] ??= {}
            private.transitions[$ _source_state_name][$ _transition_name] ??= []
            array_push(private.transitions[$ _source_state_name][$ _transition_name], _transition)
        }

        return self
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
    /// @parameter {Struct} arguments { event_name : String }
    /// @return {struct.FiniteStateMachine} self
    private.define_event_method = function(arguments = {}) {
        _event_name = arguments[$ "event_name"]
        var _temp = {
            exec : private.execute_event,
            event: _event_name
        }
        self[$ _event_name] = method(_temp, function() {
            var _args = undefined
            if (argument_count > 0) {
                _args = array_create(argument_count)
                for (var i = 0; i < argument_count; i++) { _args[i] = argument[i] }
            }
            exec(event, undefined, _args)
        })

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.event_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.is_event_available = function(arguments) {
        var _event_name = arguments[$ "event_name"]
        if (private.default_events[$ _event_name] != undefined) {
            private.define_default_event({ event_name : _event_name, callable : function() {}, defined : "undefined_event" })
        }
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function is_valid_event_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This function checks if the specified string is valid as an event name.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.event_name
    /// The string to check the validity of.
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// Whether the name is valid.
    /// ----------------------------------------------------------------------------
    private.is_valid_event_name = function(arguments) {
        _event_name = arguments[$ "event_name"]
        if (struct_exists(private.default_events, _event_name)) { return true }
        if (struct_exists(self, _event_name)) {
            show_trace_debug_generic({ show_popup : true, debug_message : $"Can not use '{_event_name}' as an event." })
            return false
        }
        return true
    }

    /// ----------------------------------------------------------------------------
    /// @function is_valid_state_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This function checks if the specified string is valid as a state name.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// The string to check the validity of.
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// Whether the name is valid.
    /// ----------------------------------------------------------------------------
    private.is_valid_state_name = function(arguments) {
        _state_name = arguments[$ "state_name"]

        if (!is_string(_state_name) || (_state_name == "")) {
            show_trace_debug_generic({ debug_message : "State name should be a non-empty string." })
            return false
        }

        var _name
        for (var i = 0; i < array_length(private.invalid_state_names); i++) {
            _name = private.invalid_state_names[i]
            if (_state_name == _name) {
                show_trace_debug_generic({ debug_message : "State name can not be '{_name}'." })
                return false
            }
        }

        return true
    }

    /// ----------------------------------------------------------------------------
    /// @function is_valid_transition_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This function checks if the specified string is valid as a transition name.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.transition_name
    /// The string to check the validity of.
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// Whether the name is valid.
    /// ----------------------------------------------------------------------------
    private.is_valid_transition_name = function(arguments) {
        _transition_name = arguments[$ "transition_name"]

        if (!is_string(_transition_name) || (_transition_name == "")) {
            show_trace_debug_generic({ debug_message : "Transition name should be a non-empty string." })
            return false
        }

        return true
    }

    /// ----------------------------------------------------------------------------
    /// @function private.trigger_event_handlers(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.event_name
    /// <parameter_description>
    ///
    /// @parameter {Array<Any>} arguments.arguments
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.trigger_event_handlers = function(arguments = {}) {
        _event_name = arguments[$ "event_name"]
        _arguments = arguments[$ "arguments"] ?? []
        var _event = private.event_handlers[$ _event_name]
        if (_event != undefined) { call_callable_generic({ callable : _event, arguments : _arguments }) }

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function change_state(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.leave_event
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.enter_event
    /// <parameter_description>
    ///
    /// @parameter {Array<Any>} arguments.arguments
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.change_state = function(arguments = {}) {
        _state_name = arguments[$ "state_name"]
        _leave = arguments[$ "leave_event"]
        _enter = arguments[$ "enter_event"]
        _data  = arguments[$ "arguments"]
        var _defLeave, _defEnter
        _defLeave = leave
        _defEnter = enter
        leave = _leave
        enter = _enter

        // Leave current state
        if (leave == undefined) { leave = _defLeave }
        else { private.temp_event = _defLeave }
        leave(_data)

        // Add to history
        if (array_length(private.child_queue) > 0) {
            private.history[@ 0] = private.child_queue[0]
            private.child_queue = []
        }

        // Init state
        private.state_start_time = get_timer()
        private.add_to_history({ state_name : _state_name })

        // Enter next state
        if (enter == undefined) { enter = _defEnter }
        else { private.temp_event = _defEnter }
        enter(_data)

        // Reset temp variable
        private.temp_event = undefined

        leave = _defLeave
        enter = _defEnter

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function private.create_state(arguments)
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
    /// @parameter {Struct} arguments { events : Struct }
    /// @return {Struct} State struct filled with all possible events
    private.create_state = function(arguments = {}) {
        _events = arguments[$ "events"] ?? {}
        var _event_count, _event_names, _event_name, _default_event

        _event_names = struct_get_names(_events)
        var _event_count = array_length(_event_names)

        // state event
        for (var i = 0; i < _event_count; i++) {
            _event_name = _event_names[i]
            private.is_valid_event_name({ event_name : _event_name })
            private.is_event_available({ event_name : _event_name })
            _events[$ _event_name] = {
                exists: "defined_event",
                callable: method(private.event_execution_context, _events[$ _event_name])
            }
        }

        // default events
        _event_names = struct_get_names(private.default_events)
        _default_event_count = array_length(private.default_events)
        for (var i = 0; i < _default_event_count; i++) {
            _event_name = _event_names[i]
            _default_event = private.default_events[$ _event_name ]
            _events[$ _event_name] ??= {
                exists: _default_event.exists,
                callable: method(private.event_execution_context, _default_event.callable)
            }
        }

        return _events
    }

    /// ----------------------------------------------------------------------------
    /// @function private.execute_event(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.event_name
    /// <parameter_description>
    ///
    /// @parameter {String} arguments.state_name
    /// <parameter_description>
    ///
    /// @parameter {Array<Any>} arguments.arguments
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.execute_event = function(arguments = {}) {
        _event_name = arguments[$ "event_name"]
        _state_name = arguments[$ "state_name"] ?? private.history[0]
        _arguments  = arguments[$ "arguments"]

        if (!private.is_state_defined({ state_name : _state_name })) {
            show_trace_debug_generic({ show_popup : true, debug_message : "State '{_state_name}' is not defined." })
            return undefined
        }

        private.current_event_name = _event_name
        var _callable = private.states[$ _state_name][$ _event_name].callable
        call_callable_generic({ callable : _callable, arguments : _arguments, scope : private.event_execution_context })

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_current_state_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {String}
    /// The current state
    /// ----------------------------------------------------------------------------
    private.get_current_state_name = function() {
        var _state_name = ((array_length(private.history) > 0) ? private.history[0] : undefined)
        if (array_length(private.child_queue) > 0) _state_name = private.child_queue[0]
        return _state_name
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.add_to_history = function(arguments = {}) {
        var _state_name = arguments[$ "state_name"]
        if (private.history_enabled) {
            if (private.history[1] == undefined) {
                private.history[@ 1] = private.history[0]
                private.history[@ 0] = _state_name
            } else {
                array_insert(private.history, 0, _state_name)
                private.fit_history_contents()
            }
        } else {
            private.history[@ 1] = private.history[0]
            private.history[@ 0] = _state_name
        }

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function fit_history_contents()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.fit_history_contents = function() {
        array_resize(private.history, max(2, min(private.history_max_size, array_length(private.history))))
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// Whether the state is defined.
    /// ----------------------------------------------------------------------------
    private.is_state_defined = function(arguments = {}) {
        var _state_name = arguments[$ "state_name"]
        if (!is_string(_state_name)) { return false }
        return (private.states[$ _state_name] != undefined)
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.event_name
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.callable
    /// <parameter_description>
    ///
    /// @parameter {Real} arguments.defined
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    private.define_default_event = function(arguments = {}) {
        _event_name = arguments[$ "event_name"]
        _method = arguments[$ "callable"]
        _defined = arguments[$ ""]
        private.default_events[$ _event_name] = {
            exists: _defined,
            callable: _method
        }
        private.define_event_method({ event_name : _event_name })

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function transition_exists(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.transition_name
    /// <parameter_description>
    ///
    /// @parameter {String} arguments.source_state_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Real} FSM_TRIGGER_GENERIC
    /// ----------------------------------------------------------------------------
    private.transition_exists = function(arguments = {}) {
        var _transition_name   = arguments[$ "transition_name"]
        var _source_state_name = arguments[$ "source_state_name"]
        if (_source_state_name == WILDCARD_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC) {
            // Wildcard transition
            if (struct_exists(private.wildcard_transitions, _transition_name)) {
                return "defined_trigger"
            }
        } else {
            // Default
            if (struct_exists(private.transitions, _source_state_name) && struct_exists(private.transitions[$ _source_state_name], _transition_name)) {
                return "defined_trigger"
            }
            while (struct_exists(private.state_parent_name, _source_state_name)) {
                _source_state_name = private.state_parent_name[$ _source_state_name]
                if (struct_exists(private.transitions, _source_state_name) && struct_exists(private.transitions[$ _source_state_name], _transition_name)) {
                    return "inherited_trigger"
                }
            }
        }

        return "undefined_trigger"
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
    /// @parameter {Struct} arguments { transition_name : String, arguments : [Array<Any>] }
    /// @return {Bool} Whether the transition has been triggered (true), or not (false)
    private.trigger_transition = function(arguments = {}) {
        _transition_name = arguments[$ "transition_name"]
        _arguments       = arguments[$ "arguments"]
        if (!private.is_valid_transition_name({ transition_name : _transition_name })) { return false }

        var _currState, _source
        _currState = private.get_current_state_name()
        _source    = _currState

        // My triggers
        if (private.transition_exists({ transition_name : _transition_name, source_state_name : _source }) == "defined_trigger") {
            if (private.try_triggering_transition({
                transitions : private.transitions[$ _source][$ _transition_name],
                source_state_name : _currState,
                trigger_name : _transition_name,
                arguments : _arguments
            })) { return true }
        }

        // Wild triggers
        if (private.transition_exists({ transition_name : _transition_name, source_state_name : WILDCARD_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC }) == "defined_trigger") {
            if (private.try_triggering_transition({
                transitions : private.wildcard_transitions[$ _transition_name],
                source_state_name : _currState,
                trigger_name : _transition_name,
                arguments : _arguments
            })) { return true }
        }

        // Parent triggers
        while (struct_exists(private.state_parent_name, _source)) {
            _source = private.state_parent_name[$ _source]
            if (private.transition_exists({ transition_name : _transition_name, source_state_name : _source }) == "defined_trigger") {
                if (private.try_triggering_transition({
                    transitions : private.transitions[$ _source][$ _transition_name],
                    source_state_name : _currState,
                    trigger_name : _transition_name,
                    arguments : _arguments
                })) { return true }
            }
        }

        return false
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
    /// @parameter {Struct} arguments { transitions : Array<Struct>, source_state_name : String, trigger_name : String, arguments : [Array<Any>] }
    /// @return {Bool} Whether the trigger_transition is successful (true), or not (false)
    private.try_triggering_transition = function(arguments = {}) {
        _transitions       = arguments[$ "transitions"]
        _source_state_name = arguments[$ "source_state_name"]
        _trigger_name      = arguments[$ "trigger_name"]
        _arguments         = arguments[$ "arguments"]

        var _dest

        for (var i = 0; i < array_length(_transitions); i++) {
            _transition = _transitions[i]
            // For reflexive wildcard transitions, change to source
            _dest = _transition.to
            if (_dest == REFLEXIVE_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC) _dest = _source

            // Check condition
            if (_transition.condition(_arguments)) {
                private.change_state({ state_name : _dest, leave_event : _transition.leave, enter_event : _transition.enter, arguments : _arguments })
                private.trigger_event_handlers({ event_name : "change_state_event", arguments : [_dest, _source, _trigger_name] })
                return true
            }
        }

        return false
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
    /// @parameter {Struct} arguments { state_name : String }
    /// @return {struct.FiniteStateMachine} self
    private.update_events_from_parent = function(arguments = {}) {
        _state_name = arguments[$ "state_name"]
        var _parent, _state, _events, _event, _exists, _parEvent

        _parent = private.states[$ private.state_parent_name[$ _state_name]]
        _state  = private.states[$ _state_name]

        _events = struct_get_names(_parent)

        for (var i = 0; i < array_length(_events); i++) {
            _event = _events[i]
            _parEvent = _parent[$ _event]

            _exists = "undefined_event"
            switch (_parEvent.exists) {
                case "defined_event":
                    _exists = "inherited_event"
                break
                case "inherited_event":
                    _exists = "inherited_event"
                break
                case "default_event":
                    _exists = "default_event"
                break
            }

            _state[$ _event] = {
                exists: _exists,
                callable: _parEvent.callable
            }
        }

        return self
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
    /// @parameter {Struct} arguments { has_parent : Bool }
    /// @return {struct.FiniteStateMachine} self
    private.update_states = function(arguments = {}) {
        _hasParent = arguments[$ ""]
        var _states, _events, _state, _event, _default_event, i, j
        _states = struct_get_names(private.states)
        _events = struct_get_names(private.default_events)

        // for each state
        for (var i = 0; i < array_length(_states); i++) {
            _state = private.states[$ _states[i]]
            // for each event
            for (var j = 0; j < array_length(_events); j++) {
                _event = _events[j]
                _default_event = private.default_events[$ _event]
                _state[$ _event] ??= {
                    exists: _default_event.exists,
                    callable: method(private.event_execution_context, _default_event.callable)
                }
            }
        }

        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PRIVATE_METHODS ––––––––––––––––––––
    /*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– PUBLIC_METHODS ––––––––––––––––––––
	/*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function define_state(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// The name of the state to define.
    ///
    /// @parameter {String} [arguments.parent_name]
    /// The name of the parent state of the state to define.
    ///
    /// @parameter {Struct} [arguments.events]
    /// A struct containing event methods to be associated with the state.
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    define_state = function(arguments) {
        //
        if (!is_struct(arguments)) { return self }
        //
        var _state_name  = arguments[$ "state_name"]
        if (!is_string(_state_name)) { return self }

        var _parent_name = arguments[$ "parent_name"]
        var _events      = arguments[$ "events"]

        if (!private.is_valid_state_name(_state_name)) { return undefined }

        if (!is_struct(_struct)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "State struct should be a struct." })
            return undefined
        }
        //
        if (private.is_state_defined({ state_name : _state_name })) {
            show_trace_debug_generic({ debug_message : [$"State '{_state_name}' has been defined already.", "The previous definition has been replaced."] })
            return self
        }

        if (is_string(parent_state_name)) {

            if (!private.is_valid_state_name({ state_name : _parent })) {
                return undefined
            }

            if (!private.is_state_defined({ state_name : _parent_name })) {
                show_trace_debug_generic({ show_popup : true, $"State {_parent_name} is not defined." })
                return undefined
            }

            if (_parent_name == _state_name) {
                show_trace_debug_generic({ show_popup : true, debug_message : "Cannot set a state as a parent to itself." })
                return undefined
            }

            if (struct_exists(private.state_parent_name, _state_name)) {
                if (private.state_parent_name[$ _state_name] == _parent_name) {
                    show_trace_debug_generic({ debug_message : $"State '{_state_name}' is already a child of {_parent_name}." })
                }
            }

            private.state_parent_name[$ _state_name] = _parent_name
        }


        private.define_state({ state_name : _state_name, events : _struct, has_parent : (private.state_parent_name[$ _state_name] != undefined) })

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function change_state(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.state_name
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.leave_event
    /// <parameter_description>
    ///
    /// @parameter {Function} arguments.enter_event
    /// <parameter_description>
    ///
    /// @parameter {Array<Any>} arguments.arguments
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    change_state = function(arguments) {
        _state_name  = arguments[$ "state_name"]
        _leave_event = arguments[$ "leave_event"]
        _enter_event = arguments[$ "enter_event"]
        _arguments   = arguments[$ "arguments"]

        // leave_event validity check
        if (_leave_event != undefined && !is_callable(_leave_event)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Invalid value for 'leave_event' in change_state(). Should be a function." })
            return undefined
        }

        // enter_event validity check
        if ((_enter_event != undefined) && !is_callable(_enter_event)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Invalid value for 'enter_event' in change_state(). Should be a function." })
            return undefined
        }

        var _source_state_name = get_current_state_name()
        private.change_state({ state_name : _state_name, leave_event : _leave_event, enter_event : _enter_event, arguments : _arguments })
        private.trigger_event_handlers({ event_name : "change_state_event", _arguments : [_state_name, _source_state_name] })

        return self
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
    /// @parameter {Struct} arguments { state_name : String, state_to_check : [String] }
    /// @return {Bool} Whether state_name is state_to_check or a parent of state_to_check (true), or not (false)
    is_state = function(arguments = {}) {
        _target = arguments[$ ""]
        _source = get_current_state_name()
        var _state = _source

        if (!private.is_valid_state_name({ state_name : _target })) { return false }
        if (!private.is_valid_state_name({ state_name : _source })) { return false }

        while (_state != undefined) {
            if (_state == _target) return true
            _state = struct_exists(private.state_parent_name, _state) ? private.state_parent_name[$ _state] : undefined
        }

        return false
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
    /// @parameter {Struct} arguments { state_name : String }
    /// ----------------------------------------------------------------------------
    /// @return {Bool} Whether state_name exists (true), or not (false)
    /// ----------------------------------------------------------------------------
    state_exists = function(arguments = {}) {
        return (private.states[$ arguments.state_name] != undefined)
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
    /// @return {Array} Array containing the states defined
    get_state_names = function() {
        return struct_get_names(private.states)
    }

    /// ----------------------------------------------------------------------------
    /// @function get_current_state_name()
    /// ----------------------------------------------------------------------------
    /// @return {String}
    /// The name of the current state.
    /// ----------------------------------------------------------------------------
    get_current_state_name = function() {
        return private.get_current_state_name()
    }

    /// ----------------------------------------------------------------------------
    /// @function get_previous_state_name()
    /// ----------------------------------------------------------------------------
    /// @return {String}
    /// The name of the previous state.
    /// ----------------------------------------------------------------------------
    get_previous_state_name = function() {
        return (array_length(private.history) > 1) ? private.history[1] : undefined
    }

    /// ----------------------------------------------------------------------------
    /// @function get_time(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Bool} [arguments.in_microseconds]
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// Number of microseconds (or steps) the current state has been running for
    /// ----------------------------------------------------------------------------
    get_time = function(arguments = {}) {
        _us = arguments[$ ""] = true
        var _time = (get_timer()-private.state_start_time)
        return (_us ? _time : (_time * game_get_speed(gamespeed_fps) * 1/1000000))
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
    /// @parameter {Struct} arguments { time : number, in_microseconds : Bool }
    /// @return {struct.FiniteStateMachine} self
    set_time = function(arguments = {}) {
        _time = arguments[$ ""]
        _us = arguments[$ ""] = true
        if (!is_real(_time)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Time should be a number" })
            return undefined
        }

        private.state_start_time = get_timer() - (_us ? _time : (_time * 1/game_get_speed(gamespeed_fps) * 1000000))

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function set_event_handler(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// This method sets event handlers for targeted events.
    /// ----------------------------------------------------------------------------
    /// @parameter {type} event_handler
    /// The value that will be used to identify the event handler.
    ///
    /// @parameter {mixed} event
    /// The value or array of values identifying the event(s) to target.
    ///
    /// @parameter {callable} callable
    /// <parameter_description>
    ///
    /// @parameter {type} execution_context
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    set_event_handler = function(parameters) {
        _event    = parameters[$ "event"]
        _callable = parameters[$ "callable"]
        _event_execution_context  = parameters[$ "execution_context"] ?? noone

        if (!is_string(_event)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Event name should be a string." })
            return self
        }
        if (!is_callable(_callable)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Callback should be a callable." })
            return self
        }

        if (struct_exists(private.event_handlers, _event)) {
            if (_event_execution_context != noone) _callable = method(_event_execution_context, _callable)
            private.event_handlers[$ _event] = _callable
        } else {
            show_trace_debug_generic({ debug_message : $"Event '{_event}' does not exist." })
        }

        return self
    }

    #region    –––––––––––––––––––– INHERITANCE ––––––––––––––––––––

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
    /// @return {struct.FiniteStateMachine} self
    inherit_event = function() {
        var _state_name = private.history[0]

        if (private.state_parent_name[$ _state_name] == undefined) {
            show_trace_debug_generic({ debug_message : "State '{_state_name}' has no parent state." })
            return self
        }

        if (CIRCULAR_INHERITANCE_THROW_ERROR_FINITE_STATE_MACHINE_GENERIC) {
            var _str, _length
            _length = array_length(private.child_queue)
            _str = ""

            var _index = 0
            for (var i = 0; i < _length; i++) {
                if (private.child_queue[i] == _state_name) {
                    _index = i
                    break
                }
            }

            if (_index < _length) {
                _str += string(_state_name)
                for (var i = 1; i < _length - _index; i++) {
                    _str += " -> " + string(private.child_queue[_index])
                }
                _str += " -> " + string(_state_name)
                show_trace_debug_generic({ $"Circular inheritance found. Inheritance chain: (-> reads as \"inherits from\")\n{_str}", show_popup : true })
                return undefined
            }
        }

        array_push(private.child_queue, _state_name)
        _state_name = private.state_parent_name[$ _state_name]
        private.history[@ 0] = _state_name
        private.execute_event({ event_name : private.current_event_name })
        if (array_length(private.child_queue) > 0) private.history[@ 0] = array_pop(private.child_queue)

        return self
    }

    #endregion –––––––––––––––––––– INHERITANCE ––––––––––––––––––––

    #region    –––––––––––––––––––– EVENTS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function define_default_event(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String|Array<String>} arguments.event_name
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.event_method
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.events
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    define_default_event = function(arguments = {}) {

        var _event_names = struct_get_names(arguments[$ "event"])

        for (var i = 0; i < array_length(_event_names); i++) {
            _event_name = arguments[$ "event_name"]
            _function = arguments[$ "function"]
            if (struct_names_count(private.states) > 0) {
                show_trace_debug_generic({ debug_message : "event_set_default_function() should be called before defining any state." })
            }

            if (!is_string(_event_name) || (_event_name == "")) {
                show_trace_debug_generic({ show_popup : true, debug_message : "Event should be a non-empty string." })
                return undefined
            }

            if (!is_callable(_function)) {
                show_trace_debug_generic({ show_popup : true, debug_message : "Default function should be a function." })
                return undefined
            }

            private.is_valid_event_name({ event_name : _event_name })
            private.define_default_event({ event_name : _event_name, callable : method(private.event_execution_context, _function), defined : "default_event" })
            private.update_states()
        }

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_current_event_function(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// NOTE: This function is only meant to be used in change()
    /// ----------------------------------------------------------------------------
    /// @return {Function}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    get_current_event_function = function() {
        return private.temp_event
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.event_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// EVENT_TYPE_FINAL_STATE_MACHINE_GENERIC
    /// ----------------------------------------------------------------------------
    event_exists = function(arguments = {}) {
        var _event_name = arguments[$ "event_name"]
        if (!is_string(_event_name) || (_event_name == "")) {
            show_trace_debug_generic({ debug_message : "Event should be a non-empty string." })
            return "undefined_event"
        }
		var _current_event = private.states[$ private.get_current_state_name()][_event_name]
        return (_current_event != undefined) ? _current_event.exists : "undefined_event"
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
    /// @parameter {Struct} arguments { arguments : [Array<Any>] }
    /// @return {struct.FiniteStateMachine} self
    enter = function(arguments = {}) {
        _arguments = arguments[$ "arguments"]
        private.execute_event({ event_name : "enter", arguments : _arguments })
        return self
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
    /// @parameter {Struct} arguments { arguments : [Array<Any>] }
    /// @return {struct.FiniteStateMachine} self
    leave = function(arguments = {}) {
        _arguments = arguments[$ "arguments"]
        private.execute_event({ event_name : "leave", arguments : _arguments })
        return self
    }

    #endregion –––––––––––––––––––– EVENTS ––––––––––––––––––––

    #region    –––––––––––––––––––– TRANSITIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function define_transition(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// Leaving source_state undefined is equivalent to providing all state names.
    /// Leaving destination_state undefined will cause the transition to reenter
    /// the current state.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { transition_name : String, source_state_name : [String], destination_state_name : [String], predicate_method : [Function], leave_event : [Function], enter_event : [Function] }
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    define_transition = function(arguments = {}) {
        var _transition_name        = arguments[$ "transition_name"]
        var _source_state_name      = arguments[$ "source_state_name"]
        var _destination_state_name = arguments[$ "destination_state_name"]
        var _predicate_method       = arguments[$ "predicate_method"]
        var _leave_event            = arguments[$ "leave_event"]
        var _enter_event            = arguments[$ "enter_event"]

        // undefined source_state -> WILDCARD_TRANSITION
		_source_state_name ??= FSM_WILDCARD_TRANSITION_NAME_GENERIC

        // undefined destination_state -> REFLEXIVE_TRANSITION
        _destination_state_name ??= REFLEXIVE_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC

        if (!private.is_valid_transition_name({ transition_name : _transition_name })) { return undefined }

        if (!is_string(_destination_state_name) || (_destination_state_name == "")) {
            show_trace_debug_generic({ show_popup : true, debug_message : "State name should be a non-empty string." })
            return undefined
        }
        if (_destination_state_name == FSM_WILDCARD_TRANSITION_NAME_GENERIC) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Destination state name can not be the same as FSM_WILDCARD_TRANSITION_NAME_GENERIC." })
            return undefined
        }

        if (!is_callable(_predicate_method)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Invalid value for 'condition' in define_transition(). Should be a function." })
            return undefined
        }
        if (!is_callable(_leave_event)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Invalid value for 'leave_func' in define_transition(). Should be a function." })
            return undefined
        }
        if (!is_callable(_enter_event)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Invalid value for 'enter_func' in define_transition(). Should be a function." })
            return undefined
        }

        if (!is_array(_source)) { _source = [_source] }

        for (var i = 0; i < array_length(_source); i++) {
            _source_state_name = _source[i]
            if (!is_string(_source_state_name) || (_source_state_name == "")) {
                show_trace_debug_generic({ debug_message : "State name should be a non-empty string. Transition not added." })
            } else if (_source_state_name == REFLEXIVE_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC) {
                show_trace_debug_generic("Source state name can not be the same as REFLEXIVE_TRANSITION_NAME. Transition not added.")
            } else {
                private.define_transition({
                    name                   : _transition_name,
                    source_state_name      : _source_state_name,
                    destination_state_name : _destination_state_name,
                    predicate_method       : _predicate_method,
                    leave_event            : _leave_event,
                    enter_event            : _enter_event,
                })
            }
        }

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function transition_exists(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.transition_name
    /// <parameter_description>
    ///
    /// @parameter {String} [arguments.source_state]
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// FSM_TRIGGER_GENERIC
    /// ----------------------------------------------------------------------------
    transition_exists = function(arguments = {}) {
        _transition_name   = arguments[$ "transition_name"]
        _source_state_name = arguments[$ "source_state_name"]
        if (!is_string(_transition_name)) return false
        if (!is_string(_source_state_name)) return false
        if (_source_state_name == FSM_WILDCARD_TRANSITION_NAME_GENERIC) return true

        if (!private.is_valid_transition_name({ transition_name : _transition_name, show_error : false })) { return false }

        return private.transition_exists({ transition_name : _transition_name, source_state_name : _source_state_name })
    }

    /// ----------------------------------------------------------------------------
    /// @function trigger_transition(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String|Array<String>} arguments.transition_name
    /// <parameter_description>
    ///
    /// @parameter {Array<Any>} [arguments.arguments]
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// Whether a transition has been triggered (true), or not (false)
    /// ----------------------------------------------------------------------------
    trigger_transition = function(arguments = {}) {
        _transition_name = arguments[$ "transition_name"]
        _arguments  = arguments[$ "arguments"]

        for (var i = 0; array_length(_transition_name); i++) {
            if (private.trigger_transition({ transition_name : _transition_name[i], arguments : _arguments })) { return true }
        }

        return false
    }

    #endregion –––––––––––––––––––– TRANSITIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– HISTORY ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function enable_state_history()
    /// ----------------------------------------------------------------------------
    /// @description
    /// Enables keeping of state history.
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    enable_state_history = function() {
        if (!private.history_enabled) {
            private.history_enabled = true
            private.fit_history_contents()
        }
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function disable_state_history()
    /// ----------------------------------------------------------------------------
    /// @description
    /// Disables keeping of state history.
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    disable_state_history = function() {
        if (private.history_enabled) {
            private.history_enabled = false
            array_resize(private.history, 2)
        }
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function is_enabled_state_history()
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// Whether state history is enabled (true), or not (false)
    /// ----------------------------------------------------------------------------
    is_enabled_state_history = function() {
        return private.history_enabled
    }

    /// ----------------------------------------------------------------------------
    /// @function set_maximum_size_state_history(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Real} arguments.maximum_history_size
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.FiniteStateMachine} self
    /// ----------------------------------------------------------------------------
    set_maximum_size_state_history = function(arguments = {}) {
        _maximum_history_size = arguments[$ "maximum_history_size"]
        if (!is_real(_maximum_history_size)) {
            show_trace_debug_generic({ show_popup : true, debug_message : "Size should be a number." })
            return undefined
        }
        if (_maximum_history_size < 0) {
            show_trace_debug_generic({ debug_message : "History size should non-negative. Setting the size to 0 instead of '{_maximum_history_size}'." })
            _maximum_history_size = 0
        }
        private.history_max_size = _maximum_history_size
        private.fit_history_contents()

        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_maximum_size_state_history()
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// The maximum storage capacity of state history
    /// ----------------------------------------------------------------------------
    get_maximum_size_state_history = function() {
        return private.history_max_size
    }

    /// ----------------------------------------------------------------------------
    /// @function get_state_history()
    /// ----------------------------------------------------------------------------
    /// @return {Array<String>}
    /// Array containing the state history
    /// ----------------------------------------------------------------------------
    get_state_history = function() {
        // history not enabled
        if (!private.history_enabled) {
            show_trace_debug_generic({ debug_message : "History is disabled, can not get_state_history()." })
            return []
        }
        //
        if (get_previous_state_name() == undefined) return [private.get_current_state_name()]
        var _length = min(array_length(private.history), private.history_max_size)
        var _array = array_create(_length)
        array_copy(_array, 0, private.history, 0, _length)
        _array[@ 0] = private.get_current_state_name()
        return _array
    }

    #endregion –––––––––––––––––––– HISTORY ––––––––––––––––––––

	/*******************************************************************************/
	#endregion –––––––––––––––––––– PUBLIC_METHODS ––––––––––––––––––––
	/*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– INITIALIZATION ––––––––––––––––––––
    /*******************************************************************************/

    private.is_valid_state_name({ state_name : _initial_state_name })
	private.add_to_history({ state_name : _initial_state_name })

    /*******************************************************************************/
    #endregion –––––––––––––––––––– INITIALIZATION ––––––––––––––––––––
    /*******************************************************************************/
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
