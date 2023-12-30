// Startup errors
if (!is_string(FSM_WILDCARD_TRANSITION_NAME_GENERIC) || (string_length(FSM_WILDCARD_TRANSITION_NAME_GENERIC) != 1)) {
	var _str = "[FiniteStateMachineGeneric]\n"
	_str += "FSM_WILDCARD_TRANSITION_NAME_GENERIC should be a string of length 1."
	_str += "\n\n\n"
	show_error(_str, true)
}

if (!is_string(FSM_REFLEXIVE_TRANSITION_NAME_GENERIC) || (string_length(FSM_REFLEXIVE_TRANSITION_NAME_GENERIC) != 1)) {
	var _str = "[FiniteStateMachineGeneric]\n"
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
