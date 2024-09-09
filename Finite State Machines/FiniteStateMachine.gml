/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

// The string used as the name of the default state
#macro FINITE_STATE_MACHINE_DEFAULT_STATE "default_state"

// Whether to throw an error when circular inheritance is found (true) or not (false)
#macro CIRCULAR_INHERITANCE_THROW_ERROR_FINITE_STATE_MACHINE_GENERIC \
true

// Whether to show warning messages in Output (true) or not (false)
#macro SHOW_WARNINGS_FINITE_STATE_MACHINE_GENERIC \
true

// Whether history should be tracked by default (true) or not (false)
#macro FINITE_STATE_MACHINE_DEFAULT_HISTORY_ENABLED \
false

// Default maxmimum history count
#macro FINITE_STATE_MACHINE_DEFAULT_HISTORY_CAPACITY \
5

// Startup errors
// show_error(_str, true)

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
/// @function finite_state_machine_create()
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to create an instance of FiniteStateMachine.
/// ----------------------------------------------------------------------------
/// @return {struct.FiniteStateMachine}
/// ----------------------------------------------------------------------------
function finite_state_machine_create() {
    return new FiniteStateMachine()
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
/// @function FiniteStateMachine(parameters)
/// ----------------------------------------------------------------------------
/// @description
///
/// # States
/// * has_state
/// * get_states
/// * add_state
/// * get_current_state
/// * get_previous_state
/// * change_state
/// *
/// *
/// * get_state_runtime_seconds
/// * add_state_runtime
///
/// # Events
/// * has_event
/// * add_event
/// * execute_parent_event
///
/// # Event Listeners
/// * add_event_listener
/// * remove_event_listener
///
/// # Transitions
/// * has_transition
/// * add_transition
/// * trigger_transition
///
/// # History
/// * is_history_enabled
/// * get_history_capacity
/// * get_history_contents
/// * set_history
/// ----------------------------------------------------------------------------
function FiniteStateMachine() constructor {

	/******************************************************************************/
	#region    –––––––––––––––––––– DEBUG ––––––––––––––––––––
	/******************************************************************************/

	/// ----------------------------------------------------------------------------
	/// @function __debug_message(_method_name, _message_string)
	/// ----------------------------------------------------------------------------
	__debug_message = function(_method_name, _message_string) {
	    show_debug_message($"FiniteStateMachine.{_method_name}: {_message_string}")
	}

	/******************************************************************************/
	#endregion –––––––––––––––––––– DEBUG ––––––––––––––––––––
	/******************************************************************************/

	/******************************************************************************/
	#region    –––––––––––––––––––– GENERAL ––––––––––––––––––––
	/******************************************************************************/

	/// @type {struct<mixed>}
	/// The struct containing the private variables of the finite state machine instance.
	self.private = {}

	/// @type {mixed}
	/// The object instance or struct which is the self context used when events
	/// are executed. Defaults to the scope in which the finite state machine
	/// is being created.
	private.execution_context = other

	/// ----------------------------------------------------------------------------
	/// @function get_execution_context()
	/// ----------------------------------------------------------------------------
	/// @return {mixed}
	/// The object instance handle or struct used as self context for event execution.
	/// ----------------------------------------------------------------------------
	get_execution_context = function() {
	    return private.execution_context
	}

	/// ----------------------------------------------------------------------------
	/// @function set_execution_context(parameters)
	/// ----------------------------------------------------------------------------
	/// @parameter {type} execution_context
	/// The object instance handle or struct used as self context for event execution.
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	set_execution_context = function(parameters = {}) {
		private.execution_context = parameters.execution_context
		return self
	}

	/******************************************************************************/
	#endregion –––––––––––––––––––– GENERAL ––––––––––––––––––––
	/******************************************************************************/

	/******************************************************************************/
	#region    –––––––––––––––––––– STATES ––––––––––––––––––––
	/******************************************************************************/

	/// @type {struct}
	///
	private.states = {}
	/// @type {Real}
	/// Start time of the current state (in microseconds)
	private.state_start_time = get_timer()

	private.states[$ FINITE_STATE_MACHINE_DEFAULT_STATE] = {
		name        : FINITE_STATE_MACHINE_DEFAULT_STATE,
		parent_name : undefined,
	}

	/// ----------------------------------------------------------------------------
    /// @function __is_valid_state_name(_string)
    /// ----------------------------------------------------------------------------
    /// @return {boolean}
    /// Whether the string is valid as a state name.
    /// ----------------------------------------------------------------------------
    __is_valid_state_name = function(_string) {
        if (!is_string(_string) or _string == "") {
            __debug_message("The state name should be a non-empty string.")
            return false
        }
        return true
    }

	/// ----------------------------------------------------------------------------
	/// @function exists_state(parameters)
	/// ----------------------------------------------------------------------------
	/// @parameter {string} state
	/// The name of the state to check.
	/// ----------------------------------------------------------------------------
	/// @return {boolean}
	/// Whether the finite state machine has a state with the given name.
	/// ----------------------------------------------------------------------------
	exists_state = function(parameters = {}) {
		var _state_name = parameters[$ "state"]
		if (!__is_valid_state_name()) { return false }
		return private.states[$ _state_name] != undefined
	}

	/// ----------------------------------------------------------------------------
	/// @function is_state(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to check if a given state equals another state or is
	/// inherits from it.
	/// ----------------------------------------------------------------------------
	/// @parameter {string} state
	/// The name of the state to check.
	///
	/// @parameter {string} [parent]
	/// The name of the parent state to check. Defaults to the current state.
	/// ----------------------------------------------------------------------------
	/// @return {boolean}
	/// ----------------------------------------------------------------------------
	is_state = function(parameters = {}) {
		// the name of the state to check
		var _state_name  = parameters[$ "state"]
		if (!__is_valid_state_name(_state_name)) { return false }
		// the name of the state to check as parent
		var _parent_name = parameters[$ "parent"] ?? get_current_state_name()
		if (!__is_valid_state_name(_parent_name)) { return false }

		while (_state_name != undefined) {
			if (_state_name == _parent_name) { return true }
			_state_name = private.state[$ _state_name].parent_name
		}

		return false
	}

	/// ----------------------------------------------------------------------------
	/// @function add_state(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to set the properties of a state.
	/// ----------------------------------------------------------------------------
	/// @parameter {string} name
	/// The name of the state to define.
	///
	/// @parameter {string} parent
	/// The name of the parent state of the state to define.
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	add_state = function(parameters = {}) {

		/* –––––––––––––––––––– ARGUMENT_VALIDATION –––––––––––––––––––– */

		// the name string of the state
		var _state_name  = parameters[$ "state"]
		if (!is_struct(parameters)) {
			__debug_message("argument0 should be a struct.")
			return self
		}
		if (!__is_valid_state_name(_state_name)) {
			__debug_message("argument0.name should be a valid state name.")
			return self
		}
		if (_state_name == FINITE_STATE_MACHINE_DEFAULT_STATE) {
			__debug_message("argument0.name cannot be the name of the default state.")
			return self
		}

		// the name string of the parent state of the state
		var _parent_name = parameters[$ "parent"] ?? FINITE_STATE_MACHINE_DEFAULT_STATE
		if (!__is_valid_state_name(_parent_name)) {
			__debug_message("argument0.parent should be a valid state name.")
			return self
		}
		if (!exists_state({ state : _parent_name })) {
			__debug_message($"The parent state '{_parent_name}' is not defined.")
			return self
		}
		if (_parent_name == _state_name) {
			__debug_message("Cannot set a state as a parent to itself.")
			return self
		}

		/* –––––––––––––––––––– LOGIC –––––––––––––––––––– */

		// create new
		private.states[$ _state_name] ??= {
			name        : _state_name,
			parent_name : _parent_name,
		}

		// overwrite
		private.states[$ _state_name][$ "parent_name"] ??= _parent_name

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function remove_state(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to remove a state.
	/// ----------------------------------------------------------------------------
	/// @parameter {type} state
	/// <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	remove_state = function(parameters = {}) {
		var _state_names = parameters[$ "state"]
		if (!is_array(_state_names)) { _state_names = [_state_names] }
		for (var i = 0; i < array_length(_state_names); i++) {
			var _state_name = _state_names[i]
			if (!__is_valid_state_name(_state_name)) {
				continue
			}
			if (_state_name == FINITE_STATE_MACHINE_DEFAULT_STATE) {
				__debug_message("Cannot remove the default state.")
				continue
			}
			struct_remove(private.states, _state_name)
		}
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function change_state(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This method is used to change the finite state machine to another state.
	/// ----------------------------------------------------------------------------
	/// @parameter {String} state
	/// <parameter_description>
	///
	/// @parameter {Function} leave_state_event
	/// <parameter_description>
	///
	/// @parameter {Function} enter_state_event
	/// <parameter_description>
	///
	/// @parameter {Array<Any>} arguments
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	change_state = function(arguments) {
		// the name of the state to change to
		var _state_name  = arguments[$ "state_name"]

		// the arguments to provide
		var _arguments   = arguments[$ "arguments"]

		// leave_event validity check
		var _leave_event = arguments[$ "leave_event"]
		if (_leave_event != undefined and !is_callable(_leave_event)) {
			__debug_message("Invalid value for 'leave_event' in change_state(). Should be a function.")
			return undefined
		}

		// enter_event validity check
		var _enter_event = arguments[$ "enter_event"]
		if ((_enter_event != undefined) and !is_callable(_enter_event)) {
			__debug_message("Invalid value for 'enter_event' in change_state(). Should be a function.")
			return undefined
		}

		var _source_state_name = get_current_state_name()
		// __change_state({ state_name : _state_name, leave_event : _leave_event, enter_event : _enter_event, arguments : _arguments })
		_state_name = arguments[$ "state_name"]
		var _leave = arguments[$ "leave_event"]
		var _enter = arguments[$ "enter_event"]
		var _data  = arguments[$ "arguments"]
		var _defLeave = leave
		var _defEnter = enter
		leave = _leave
		enter = _enter

		// Leave current state
		if (leave == undefined) { leave = _defLeave }
		else { private.temp_event = _defLeave }
		leave_state_event(_data)

		// Init state
		private.state_start_time = get_timer()
		__add_to_history({ state_name : _state_name })

		// Enter next state
		if (enter == undefined) { enter = _defEnter }
		else { private.temp_event = _defEnter }
		enter_state_event(_data)

		// Reset temp variable
		private.temp_event = undefined

		leave = _defLeave
		enter = _defEnter
		__trigger_event_listener("change_state_event", [_state_name, _source_state_name])

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function get_state_names()
	/// ----------------------------------------------------------------------------
	/// @return {array<string>}
	/// An array containing the names of the states of the finite state machine.
	/// ----------------------------------------------------------------------------
	get_state_names = function() {
		return struct_get_names(private.states)
	}

	#region    –––––––––––––––––––– CURRENT/PREVIOUS STATE ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_current_state_name()
	/// ----------------------------------------------------------------------------
	/// @return {string}
	/// The name of the current state.
	/// ----------------------------------------------------------------------------
	get_current_state_name = function() {
		var _state_name = array_length(private.history_contents) > 0 ? private.history_contents[0] : undefined
		return _state_name
	}

	/// ----------------------------------------------------------------------------
	/// @function get_previous_state_name()
	/// ----------------------------------------------------------------------------
	/// @return {String}
	/// The name of the previous state.
	/// ----------------------------------------------------------------------------
	get_previous_state_name = function() {
		return array_length(private.history_contents) > 1 ? private.history_contents[1].state_name : undefined
	}

	#endregion –––––––––––––––––––– CURRENT/PREVIOUS STATE ––––––––––––––––––––

	#region    –––––––––––––––––––– STATE_RUNTIME ––––––––––––––––––––

	/// ----------------------------------------------------------------------------
	/// @function get_state_runtime_seconds(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to get the time the current state has been running.
	/// ----------------------------------------------------------------------------
	/// @return {number}
	/// ----------------------------------------------------------------------------
	get_state_runtime_seconds = function(parameters = {}) {
		return (get_timer() - private.state_start_time) / 1000000
	}

	/// ----------------------------------------------------------------------------
	/// @function add_state_runtime(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {type} runtime_frames
	/// <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	add_state_runtime = function(parameters = {}) {
		var _time
		if (!is_real(_time)) {
			__debug_message("Time should be a number")
			return self
		}
		private.state_start_time = get_timer() - _time * 1000000
		return self
	}

	#endregion –––––––––––––––––––– STATE_RUNTIME ––––––––––––––––––––

	/******************************************************************************/
	#endregion –––––––––––––––––––– STATES ––––––––––––––––––––
	/******************************************************************************/

	/******************************************************************************/
	#region    –––––––––––––––––––– EVENTS ––––––––––––––––––––
	/******************************************************************************/

	// enter_state_event: { exists: "undefined_event", callable: function() {} },

	/// @type {String|Undefined}
	// Current event
	private.current_event_name = undefined
	/// @type {Struct}
	/// Default functions for events
	/// { <event_name> : { <state_name> : { callable, execution_context } } }
	private.events = {}
	/// @type {Function|Undefined}
	// Temporary event - Used when changing states
	private.temp_event = undefined

	/// ----------------------------------------------------------------------------
	/// @function __is_valid_event_name(_string)
	/// ----------------------------------------------------------------------------
	/// @return {boolean}
	/// Whether the string is valid as an event name.
	/// ----------------------------------------------------------------------------
	__is_valid_event_name = function(_string) {
		if (struct_exists(self, _string)) {
			__debug_message($"Can not use '{_string}' as an event.")
			return false
		}
		return true
	}

	/// ----------------------------------------------------------------------------
	/// @function has_event(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {boolean}
	/// ----------------------------------------------------------------------------
	has_event = function(parameters = {}) {
		var _event_name = parameters[$ "event_name"]
		if (!is_string(_event_name) or _event_name == "") {
			__debug_message("Event should be a non-empty string.")
			return false
		}
		var _current_event = private.states[$ get_current_state_name()][_event_name]
		return _current_event != undefined
	}

	/// ----------------------------------------------------------------------------
	/// @function __execute_event(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {string} event_name
	/// The name of the event to execute.
	///
	/// @parameter {string} state_name
	/// The name of the state to execute the event for.
	///
	/// @parameter {array<any>} arguments
	/// The array of variables to pass into the event callable.
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	__execute_event = function(parameters = {}) {
		var _event_name = parameters[$ "event_name"]
		var _state_name = parameters[$ "state_name"] ?? private.history_contents[0]
		var _arguments  = parameters[$ "arguments"]

		if (!exists_state({ state : _state_name })) {
			__debug_message("State '{_state_name}' is not defined.")
			return undefined
		}

		private.current_event_name = _event_name
		method(private.execution_context, private.states[$ _state_name][$ _event_name].callable)(_arguments)

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function execute_parent_event(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to execute the current event of the parent state.
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} parameter_name
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	execute_parent_event = function(parameters = {}) {
		var _state_name = private.history_contents[0]

		if (private.state_parent_name[$ _state_name] == undefined) {
			__debug_message("State '{_state_name}' has no parent state.")
			return self
		}

		if (CIRCULAR_INHERITANCE_THROW_ERROR_FINITE_STATE_MACHINE_GENERIC) {
			private.child_queue	= []
			var _length = array_length(private.child_queue)
			var _str = ""

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
				__debug_message($"Circular inheritance found. Inheritance chain: (-> reads as \"inherits from\")\n{_str}")
				return undefined
			}
		}

		__execute_event({ event_name : private.current_event_name })

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function add_event(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {string} name
	/// <parameter_description>
	///
	/// @parameter {string|undefined} [state]
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	add_event = function(parameters = {}) {

		/* –––––––––––––––––––– ARGUMENT_VALIDATION –––––––––––––––––––– */

		var _event_name = parameters[$ "name"]
		var _state_name = parameters[$ "state"] ?? FINITE_STATE_MACHINE_DEFAULT_STATE

		var _method = arguments[$ "callable"]
		if (!__is_valid_event_name(_event_name)) {
			__debug_message("The event name should be a non-empty string.")
			return self
		}

		var _callable = parameters[$ "callable"]
		if (!is_callable(_callable)) {
			__debug_message("The event callable should be a callable.")
			return self
		}

		/* –––––––––––––––––––– LOGIC –––––––––––––––––––– */

		private.events[$ _event_name] = {
			exists: _defined,
			callable: _method
		}

		if (self[$ _event_name] == undefined) {
			var _self = self
			var _temp = {
				finite_state_machine : _self,
				event_name           : _event_name
			}

			self[$ _event_name] = method(_temp, function() {
				var _args = undefined
				if (argument_count > 0) {
					_args = array_create(argument_count)
					for (var i = 0; i < argument_count; i++) { _args[i] = argument[i] }
				}
				finite_state_machine.__execute_event(event_name, undefined, _args)
				finite_state_machine.__trigger_event_listener(event_name)
			})
		}

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function remove_event(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	remove_event = function(parameters = {}) {
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

	/******************************************************************************/
	#endregion –––––––––––––––––––– EVENTS ––––––––––––––––––––
	/******************************************************************************/

	/******************************************************************************/
	#region    –––––––––––––––––––– EVENT_LISTENERS ––––––––––––––––––––
	/******************************************************************************/

	/// @type {struct}
	/// { <state_name> : [ { name, callable, execution_context } ] }
	private.event_handlers = {}

	/// ----------------------------------------------------------------------------
	/// @function add_event_listener(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to attach a callable to an event. An event handler
	/// is a callable that is called once the event has finished executing.
	/// Event listeners are triggered regardless of the current state.
	/// ----------------------------------------------------------------------------
	/// @parameter {string|array<string>|all} event
	/// <parameter_description>
	///
	/// @parameter {callable|all} callable
	/// <parameter_description>
	///
	/// @parameter {string|all} name
	/// <parameter_description>
	///
	/// @parameter {mixed} [execution_context]
	/// The context in which code is to be executed.
	/// Defaults to the finite state machine's execution context.
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	add_event_listener = function(parameters = {}) {
		// var _name ??= method_get_index(_callable)

		var _event    = parameters[$ "event"]
		var _callable = parameters[$ "callable"]
		var _execution_context  = parameters[$ "execution_context"] ?? noone

		if (!is_string(_event)) {
			__debug_message("Event name should be a string.")
			return self
		}
		if (!is_callable(_callable)) {
			__debug_message("Callback should be a callable.")
			return self
		}

		if (struct_exists(private.event_handlers, _event)) {
			if (_execution_context != noone) _callable = method(_execution_context, _callable)
			private.event_handlers[$ _event] = {
				name     : "",
				callable : "",
			}
		} else {
			__debug_message($"Event '{_event}' does not exist.")
		}

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function remove_event_listener(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This method is used to remove event handlers from events.
	/// ----------------------------------------------------------------------------
	/// @parameter {string|array<string>|all} event
	/// <parameter_description>
	///
	/// @parameter {callable|all} callable
	/// <parameter_description>
	///
	/// @parameter {string|all} name
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	remove_event_listener = function(parameters = {}) {
		// loop over events
		for (var i = 0; i < 0; i++) {
			// loop over event handlers
			for (var i = 0; i < 0; i++) {

			}
		}
		// private.event_handlers[$ _event_name]
	    return self
	}

	/// ----------------------------------------------------------------------------
	/// @function __trigger_event_listener(_event_name, _arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	__trigger_event_listener = function(_event_name, _arguments = []) {
		var _event_handlers = private.event_handlers[$ _event_name]
		if (!is_array(_event_handlers)) { return }
		for (var i = 0; i < array_length(_event_handlers); i++) {
			method(private.execution_context, _event_handlers[i].callable)(_arguments)
		}
	}

	/******************************************************************************/
	#endregion –––––––––––––––––––– EVENT_LISTENERS ––––––––––––––––––––
	/******************************************************************************/

	/******************************************************************************/
	#region    –––––––––––––––––––– TRANSITIONS ––––––––––––––––––––
	/******************************************************************************/

	/// ----------------------------------------------------------------------------
	/// @type {Struct}
	private.transitions	= {}
	/// ----------------------------------------------------------------------------
	/// @type {Struct}
	private.wildcard_transitions = {}
	/// ----------------------------------------------------------------------------

	/// ----------------------------------------------------------------------------
	/// @function __is_valid_transition_name(_string)
	/// ----------------------------------------------------------------------------
	/// @return {boolean}
	/// Whether the string is a valid transition name.
	/// ----------------------------------------------------------------------------
	__is_valid_transition_name = function(_string) {
		if (is_string(_string) and _string != "") {
			return true
		} else {
			__debug_message("Transition name should be a non-empty string.")
			return false
		}
	}

	/// ----------------------------------------------------------------------------
	/// @function has_transition(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Type} arguments.transition_name
	/// <parameter_description>
	///
	/// @parameter {String} [arguments.source_state]
	/// <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// FSM_TRIGGER_GENERIC
	/// ----------------------------------------------------------------------------
	has_transition = function(arguments = {}) {
		var _transition_name   = arguments[$ "transition_name"]
		var _source_state_name = arguments[$ "source_state_name"]
		if (!is_string(_transition_name)) return false
		if (!is_string(_source_state_name)) return false
		if (_source_state_name == FSM_WILDCARD_TRANSITION_NAME_GENERIC) return true

		if (!__is_valid_transition_name({ transition_name : _transition_name, show_error : false })) { return false }

		var _transition_name   = arguments[$ "transition_name"]
		var _source_state_name = arguments[$ "source_state_name"]
		if (_source_state_name == WILDCARD_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC) {
			// Wildcard transition
			if (struct_exists(private.wildcard_transitions, _transition_name)) {
				return "defined_trigger"
			}
		} else {
			// Default
			if (struct_exists(private.transitions, _source_state_name) and struct_exists(private.transitions[$ _source_state_name], _transition_name)) {
				return "defined_trigger"
			}
			while (struct_exists(private.state_parent_name, _source_state_name)) {
				_source_state_name = private.state_parent_name[$ _source_state_name]
				if (struct_exists(private.transitions, _source_state_name) and struct_exists(private.transitions[$ _source_state_name], _transition_name)) {
					return "inherited_trigger"
				}
			}
		}

		return "undefined_trigger"
	}

	/// ----------------------------------------------------------------------------
	/// @function add_transition(arguments)
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
	add_transition = function(arguments = {}) {

		/* –––––––––––––––––––– ARGUMENT_VALIDATION –––––––––––––––––––– */

		// the name string of the transition
		var _transition_name = arguments[$ "transition_name"]
		if (!__is_valid_transition_name(_transition_name)) { return undefined }

		// the name string of the source state
		// if it is undefined the transition is a wildcard transition
		var _source_state_name = arguments[$ "source_state_name"]
		_source_state_name ??= undefined

		// the name string of the destination state
		// if it is undefined the transition is a reflexive transition
		var _destination_state_name = arguments[$ "destination_state_name"]
		if (!is_string(_destination_state_name) or (_destination_state_name == "")) {
			__debug_message("State name should be a non-empty string.")
			return undefined
		}

		// the condition for the transition execute
		var _predicate_method = arguments[$ "predicate_method"]
		if (!is_callable(_predicate_method)) {
			__debug_message("Invalid value for 'condition' in add_transition(). Should be a function.")
			return self
		}

		// the custom leave state event
		var _leave_event = arguments[$ "leave_event"]
		if (!is_callable(_leave_event)) {
			__debug_message("Invalid value for 'leave_func' in add_transition(). Should be a function.")
			return self
		}

		// the custom enter state event
		var _enter_event = arguments[$ "enter_event"]
		if (!is_callable(_enter_event)) {
			__debug_message("Invalid value for 'enter_func' in add_transition(). Should be a function.")
			return self
		}

		/* –––––––––––––––––––– LOGIC –––––––––––––––––––– */

		if (!is_array(_source)) { _source = [_source] }

		for (var i = 0; i < array_length(_source); i++) {
			_source_state_name = _source[i]
			if (!is_string(_source_state_name) or (_source_state_name == "")) {
				__debug_message("State name should be a non-empty string. Transition not added.")
			} else {
				// Define the transition
				var _transition = {
					source_state_name		: _source_state_name,
					destination_state_name  : _destination_state_name,
					predicate_method	    : _predicate_method,
					exists		            : "defined_trigger",
					leave_event             : _leave_event,
					enter_event             : _enter_event,
				}

				private.transitions[$ _transition_name] = _transition
			}
		}

		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function remove_transition(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {type} parameter_name
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	remove_transition = function(parameters = {}) {
	    return self
	}

	/// ----------------------------------------------------------------------------
	/// @function trigger_transition(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {mixed} transition
	/// <parameter_description>
	///
	/// @parameter {array<any>} arguments
	/// <parameter_description>
	///
	/// ----------------------------------------------------------------------------
	/// @return {type}
	/// Whether the transition has been successfully triggered.
	/// ----------------------------------------------------------------------------
	trigger_transition = function(parameters = {}) {
		var _transitions = arguments[$ "transition"]
		var _arguments   = arguments[$ "arguments"]
		//
		for (var i = 0; array_length(_transitions); i++) {
			if (!__is_valid_transition_name({ transition_name : _transition_name })) { continue }
			var _currState, _source
			_currState = get_current_state_name()
			_source    = _currState
			// My triggers
			if (has_transition({ transition_name : _transition_name, source_state_name : _source }) == "defined_trigger") {
				if (__try_triggering_transition({
					transitions : private.transitions[$ _source][$ _transition_name],
					source_state_name : _currState,
					trigger_name : _transition_name,
					arguments : _arguments
				})) { return true }
			}
			// Wild triggers
			if (has_transition({ transition_name : _transition_name, source_state_name : WILDCARD_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC }) == "defined_trigger") {
				if (__try_triggering_transition({
					transitions : private.wildcard_transitions[$ _transition_name],
					source_state_name : _currState,
					trigger_name : _transition_name,
					arguments : _arguments
				})) { return true }
			}
			// Parent triggers
			while (struct_exists(private.state_parent_name, _source)) {
				_source = private.state_parent_name[$ _source]
				if (has_transition({ transition_name : _transition_name, source_state_name : _source }) == "defined_trigger") {
					if (__try_triggering_transition({
						transitions : private.transitions[$ _source][$ _transition_name],
						source_state_name : _currState,
						trigger_name : _transition_name,
						arguments : _arguments
					})) { return true }
				}
			}
		}
		// return
		return false
	}

	/// ----------------------------------------------------------------------------
	/// @function __try_triggering_transition(parameters)
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments { transitions : Array<Struct>, source_state_name : String, trigger_name : String, arguments : [Array<Any>] }
	/// @return {Bool} Whether the trigger_transition is successful (true), or not (false)
	__try_triggering_transition = function(arguments = {}) {
		var _transitions       = arguments[$ "transitions"]
		var _source_state_name = arguments[$ "source_state_name"]
		var _trigger_name      = arguments[$ "trigger_name"]
		var _arguments         = arguments[$ "arguments"]

		var _dest

		for (var i = 0; i < array_length(_transitions); i++) {
			var _transition = _transitions[i]
			// For reflexive wildcard transitions, change to source
			_dest = _transition.to
			if (_dest == REFLEXIVE_TRANSITION_NAME_FINITE_STATE_MACHINE_GENERIC) _dest = _source

			// Check condition
			if (_transition.condition(_arguments)) {
				change_state({ state_name : _dest, leave_event : _transition.leave_state_event, enter_event : _transition.enter_state_event, arguments : _arguments })
				return true
			}
		}

		return false
	}

	/******************************************************************************/
	#endregion –––––––––––––––––––– TRANSITIONS ––––––––––––––––––––
	/******************************************************************************/

	/******************************************************************************/
	#region    –––––––––––––––––––– HISTORY ––––––––––––––––––––
	/******************************************************************************/

	/// @type {boolean}
	/// whether history keeping is enabled
	private.history_enabled	= FINITE_STATE_MACHINE_DEFAULT_HISTORY_ENABLED
	/// @type {integer}
	/// the maxmimum amount of history entries
	private.history_capacity = max(2, FINITE_STATE_MACHINE_DEFAULT_HISTORY_CAPACITY)
	/// @type {array<string>}
	/// the array holding the history entries
	private.history_contents = []

	/// ----------------------------------------------------------------------------
	/// @function __add_to_history()
	/// ----------------------------------------------------------------------------
	__add_to_history = function(parameters = {}) {
		var _state_name = parameters[$ "state_name"]
		array_insert(private.history_contents, 0, { state_name : _state_name })
		// resize history
		if (private.history_enabled and array_length(private.history_contents) > private.history_capacity) {
			array_resize(private.history_contents, private.history_capacity)
		} else if (!private.history_enabled and array_length(private.history_contents) > 2) {
			array_resize(private.history_contents, 2)
		}
	}

	/// ----------------------------------------------------------------------------
	/// @function is_history_enabled()
	/// ----------------------------------------------------------------------------
	/// @return {boolean}
	/// Whether history keeping is enabled.
	/// ----------------------------------------------------------------------------
	is_history_enabled = function() {
	    return private.history_enabled
	}

	/// ----------------------------------------------------------------------------
	/// @function get_history_capacity()
	/// ----------------------------------------------------------------------------
	/// @return {integer}
	/// The maxmimum amount of history entries to keep.
	/// ----------------------------------------------------------------------------
	get_history_capacity = function() {
		return private.history_capacity
	}

	/// ----------------------------------------------------------------------------
	/// @function get_history_contents()
	/// ----------------------------------------------------------------------------
	/// @return {array}
	/// A clone of the array holding the history entries.
	/// ----------------------------------------------------------------------------
	get_history_contents = function() {
		return variable_clone(private.history_contents)
	}

	/// ----------------------------------------------------------------------------
	/// @function set_history(parameters)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This function is used to set properties regarding history keeping.
	/// ----------------------------------------------------------------------------
	/// @parameter {boolean} enabled
	/// Whether history keeping is enabled. If disabled only the two most recent
	/// entries are kept.
	///
	/// @parameter {integer} capacity
	/// The maxmimum amount of history entries to keep. At least 2.
	/// ----------------------------------------------------------------------------
	/// @return {struct.FiniteStateMachine} self
	/// ----------------------------------------------------------------------------
	set_history = function(parameters = {}) {
		var _history_enabled  = parameters[$ "enabled"]
		var _history_capacity = parameters[$ "capacity"]
		// set history_enabled
		if (is_bool(_history_enabled)) {
			private.history_enabled = _history_enabled
		}
		// set history_capacity
		if (is_numeric(_history_capacity)) {
			private.history_capacity = max(2, _history_capacity)
		}
		// resize history
		if (private.history_enabled and array_length(private.history_contents) > private.history_capacity) {
			array_resize(private.history_contents, private.history_capacity)
		} else if (!private.history_enabled and array_length(private.history_contents) > 2) {
			array_resize(private.history_contents, 2)
		}
		// return
	    return self
	}

	/******************************************************************************/
	#endregion –––––––––––––––––––– HISTORY ––––––––––––––––––––
	/******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– INITIALIZATION ––––––––––––––––––––
    /*******************************************************************************/

	// built-in state
	add_state({ name : FINITE_STATE_MACHINE_DEFAULT_STATE })

	// built-in events
	add_event({ event : "enter_state_event"  })
	add_event({ event : "leave_state_event"  })
	add_event({ event : "change_state_event" })

    /*******************************************************************************/
    #endregion –––––––––––––––––––– INITIALIZATION ––––––––––––––––––––
    /*******************************************************************************/
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
