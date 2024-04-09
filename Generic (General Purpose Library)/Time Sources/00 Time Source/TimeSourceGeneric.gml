/// ----------------------------------------------------------------------------
/// @function TimeSourceGeneric(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
/// <parameter_description>
///
/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.parent
/// The parent time source of the new time source.
///
/// @parameter {Real} arguments.period
/// The period that the time source runs for.
///
/// @parameter {Constant.TimeSourceUnit} arguments.units
/// The units that the given period is in.
///
/// @parameter {Real|Infinity} arguments.repetitions
/// The number of times the Time Source should repeat,
/// or infinity for indefinite repetition.
///
/// @parameter {Constant.TimeSourceExpiry} arguments.expiry_type
/// Whether the Time Source expires on the frame nearest to its expiry,
/// or on the next frame.
///
/// @parameter {Function} arguments.callback
/// The method or script function to call when the Time Source expires.
///
/// @parameter {Array<Any>} arguments.arguments
/// An array containing the arguments to pass into the method
///
/// @parameter {} arguments.scope
///
/// ----------------------------------------------------------------------------
function TimeSourceGeneric(arguments = {}) constructor {

	CONSTRUCTOR_INITIALIZATION_GUARD

	/*******************************************************************************/
	#region    –––––––––––––––––––– PUBLIC_STATIC ––––––––––––––––––––
	/*******************************************************************************/

	/// ----------------------------------------------------------------------------
	/// @function get_id(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {type}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_id = function(arguments = {}) {
		return time_source_id

		return is_struct(arguments.time_source) ? arguments.time_source.get_id() : arguments.time_source
	}

	/// ----------------------------------------------------------------------------
	/// @function create(arguments)
	/// ----------------------------------------------------------------------------
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_create
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// <parameter_description>
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.parent
	/// The parent time source of the new time source.
	///
	/// @parameter {Real} arguments.period
	/// The period that the time source runs for.
	///
	/// @parameter {Constant.TimeSourceUnit} arguments.units
	/// The units that the given period is in.
	///
	/// @parameter {Real|Infinity} arguments.repetitions
	/// The number of times the Time Source should repeat,
	/// or infinity for indefinite repetition.
	///
	/// @parameter {Constant.TimeSourceExpiry} arguments.expiry_type
	/// Whether the Time Source expires on the frame nearest to its expiry,
	/// or on the next frame.
	///
	/// @parameter {Function} arguments.callback
	/// The method or script function to call when the Time Source expires.
	///
	/// @parameter {Array<Any>} arguments.arguments
	/// An array containing the arguments to pass into the method
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric}
	/// The created time source.
	/// ----------------------------------------------------------------------------
	function create(arguments = {}) {
		arguments.creation_scope = other
		return new TimeSourceGeneric(arguments)
	}

	/// ----------------------------------------------------------------------------
	/// @function exists(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_exists
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Bool}
	/// Whether the time source exists.
	/// ----------------------------------------------------------------------------
	static exists = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		return time_source_exists(_time_source_id)
	}

	/// ----------------------------------------------------------------------------
	/// @function destroy(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_destroy
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static destroy = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		var _destroy_children  = arguments[$ "destroy_children"] ?? false
		time_source_destroy(_time_source_id, _destroy_children)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function start(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_start
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static start = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		time_source_start(_time_source_id)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function pause(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_pause
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static pause = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		time_source_pause(_time_source_id)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function stop(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_stop
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static stop = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		time_source_stop(_time_source_id)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function resume(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_resume
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static resume = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		time_source_resume(_time_source_id)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function reconfigure(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_reconfigure
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// <parameter_description>
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.parent
	/// The parent time source of the new time source.
	///
	/// @parameter {Real} arguments.period
	/// The period that the time source runs for.
	///
	/// @parameter {Constant.TimeSourceUnit} arguments.units
	/// The units that the given period is in.
	///
	/// @parameter {Real|Infinity} arguments.repetitions
	/// The number of times the Time Source should repeat,
	/// or infinity for indefinite repetition.
	///
	/// @parameter {Constant.TimeSourceExpiry} arguments.expiry_type
	/// Whether the Time Source expires on the frame nearest to its expiry,
	/// or on the next frame.
	///
	/// @parameter {Function} arguments.callback
	/// The method or script function to call when the Time Source expires.
	///
	/// @parameter {Array<Any>} arguments.arguments
	/// An array containing the arguments to pass into the method
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static reconfigure = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		var _arguments = private_static.reconfigure_arguments(arguments)
		time_source_reconfigure(
			_arguments.time_source_id,
			_arguments.period,
			_arguments.units,
			_arguments.callback,
			_arguments.arguments,
			_arguments.repetitions,
			_arguments.expiry_type,
		)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function reset(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// get_id_time_source_generic
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric|Struct} self
	/// ----------------------------------------------------------------------------
	static reset = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		time_source_reset(_time_source_id)
		return self
	}

	/// ----------------------------------------------------------------------------
	/// @function get_children(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_children
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Array<Struct.TimeSourceGeneric>}
	/// An array containing the Time Sources children.
	/// ----------------------------------------------------------------------------
	static get_children = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		var _children_ids = time_source_get_children(_time_source_id)
		var _children = []
		for (var i = 0; i < array_length; i++) {
			array_push(_children, new TimeSourceGeneric({ time_source_id : _children_ids[i] }))
		}
		return _children
	}

	/// ----------------------------------------------------------------------------
	/// @function get_parent(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_parent
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Struct.TimeSourceGeneric}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_parent = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		var _parent_id = time_source_get_parent(_time_source_id)
		return new TimeSourceGeneric({ time_source_id : _parent_id })
	}

	/// ----------------------------------------------------------------------------
	/// @function get_period(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_period
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// The period value set for the given Time Source
	/// ----------------------------------------------------------------------------
	static get_period = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		return time_source_get_period(_time_source_id)
	}

	/// ----------------------------------------------------------------------------
	/// @function get_state(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_state
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Constant.TimeSourceState}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_state = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		return time_source_get_state(_time_source_id)
	}

	/// ----------------------------------------------------------------------------
	/// @function get_remaining_time(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_time_remaining
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_remaining_time = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		return time_source_get_time_remaining(_time_source_id)
	}

	/// ----------------------------------------------------------------------------
	/// @function get_units(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_units
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Constant.TimeSourceUnit}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_units = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		return time_source_get_units(_time_source_id)
	}

	/// ----------------------------------------------------------------------------
	/// @function get_completed_repetitions(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_reps_completed
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_completed_repetitions = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		return time_source_get_reps_completed(_time_source_id)
	}

	/// ----------------------------------------------------------------------------
	/// @function get_remaining_repetitions(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// This script function serves as a wrapper for the built-in function:
	/// time_source_get_reps_remaining
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_remaining_repetitions = function(arguments = {}) {
		if (is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source_id = get_id(arguments)
		var _remaining_repetitions = time_source_get_reps_remaining(_time_source_id)
		return _remaining_repetitions == undefined ? infinity : _remaining_repetitions
	}

	/// ----------------------------------------------------------------------------
	/// @function get_repetitions(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric|Id.TimeSource} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Real|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_repetitions = function(arguments = {}) {
		if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source = arguments[$ "time_source"]
		var _remaining_repetitions = time_source_get_reps_remaining(_time_source_id)
		if (_remaining_repetitions == undefined) { return infinity }
		var _completed_repetitions = time_source_get_reps_completed(_time_source_id)
		return _completed_repetitions + _remaining_repetitions
	}

	/// ----------------------------------------------------------------------------
	/// @function get_expiry_type(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Constant.TimeSourceExpiry|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_expiry_type = function(arguments = {}) {
		if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source = arguments[$ "time_source"]
		return is_struct(_time_source) ? _time_source.private.expiry_type : undefined
	}

	/// ----------------------------------------------------------------------------
	/// @function get_callback(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Function|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_callback = function(arguments = {}) {
		if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source = arguments[$ "time_source"]
		return is_struct(_time_source) ? _time_source.private.callback : undefined
	}

	/// ----------------------------------------------------------------------------
	/// @function get_arguments(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	///
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments
	///
	/// @parameter {Struct.TimeSourceGeneric} arguments.time_source
	/// The time source to target.
	/// ----------------------------------------------------------------------------
	/// @return {Array<Any>|Undefined}
	/// <return_description>
	/// ----------------------------------------------------------------------------
	static get_arguments = function(arguments = {}) {
		if (!is_instanceof(self, TimeSourceGeneric)) { arguments.time_source = self }
		var _time_source = arguments[$ "time_source"]
		return is_struct(_time_source) ? _time_source.private.arguments : undefined
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– PUBLIC_STATIC ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– PRIVATE_STATIC ––––––––––––––––––––
	/*******************************************************************************/

	CONSTRUCTOR_INITIALIZATION_CODE(function() {
		private = {}

		/// ----------------------------------------------------------------------------
		/// @function creation_arguments(arguments)
		/// ----------------------------------------------------------------------------
		private.creation_arguments = function(arguments) {
			var _parent      = arguments[$ "parent"]      ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_parent()
			var _period      = arguments[$ "period"]      ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_period()
			var _units       = arguments[$ "units"]       ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_units()
			var _callback    = arguments[$ "callback"]
			var _arguments   = arguments[$ "arguments"]   ?? []
			var _repetitions = arguments[$ "repetitions"] ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_repetitions()
			var _expiry_type = arguments[$ "expiry_type"] ?? TIME_SOURCE_CONTROLLER_GENERIC.get_default_expiry_type()

			// shortform
			var _period_seconds = arguments[$ "period_seconds"]
			// shortform
			var _period_frames  = arguments[$ "period_frames"]
			// ensures correct scoping of callback function
			var _creation_scope = arguments[$ "creation_scope"] ?? other

			// PARENT
			if (is_struct(_parent)) { _parent = _parent.get_id() }
			// PERIOD and UNITS
			if (_period_seconds != undefined) {
				var _period = _period_seconds
				var _units  = time_source_units_seconds
			} else if (_period_frames != undefined) {
				var _period = _period_frames
				var _units  = time_source_units_frames
			}
			// REPETITIONS
			if (_repetitions == infinity) { _repetitions = -1 }
			// CALLBACK
			if (!is_method(_callback) or method_get_self(_callback) == arguments) {
				_callback = method(_creation_scope, _callback)
			}

			return {
				parent      : _parent,
				period      : _period,
				units       : _units,
				callback    : _callback,
				arguments   : _arguments,
				repetitions : _repetitions,
				expiry_type : _expiry_type,
			}
		}

		/// ----------------------------------------------------------------------------
		/// @function creation_arguments(arguments)
		/// ----------------------------------------------------------------------------
		private.reconfigure_arguments = function(arguments) {
			arguments[$ "time_source_id"] ??= get_id(arguments)
			arguments[$ "parent"]         ??= get_parent(arguments)
			arguments[$ "period"]         ??= get_period(arguments)
			arguments[$ "units"]          ??= get_units(arguments)
			arguments[$ "callback"]	      ??= get_callback(arguments)
			arguments[$ "arguments"]      ??= get_arguments(arguments)
			arguments[$ "repetitions"]    ??= get_repetitions(arguments)
			arguments[$ "expiry_type"]    ??= get_expiry_type(arguments)

			return creation_arguments(arguments)
		}

	})

	/*******************************************************************************/
	#endregion –––––––––––––––––––– PRIVATE_STATIC ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– PRIVATE_INSTANCE ––––––––––––––––––––
	/*******************************************************************************/

	private = {
		time_source_id : arguments[$ "time_source_id"],
		parent         : undefined,
		period         : undefined,
		units          : undefined,
		callback       : undefined,
		arguments      : undefined,
		repetitions    : undefined,
		expiry_type    : undefined,
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– PRIVATE_INSTANCE ––––––––––––––––––––
	/*******************************************************************************/

	/*******************************************************************************/
	#region    –––––––––––––––––––– NEW_INSTANCE ––––––––––––––––––––
	/*******************************************************************************/

	if (private.time_source_id == undefined) {
		var _arguments = TimeSourceGeneric.private.creation_arguments(arguments)
		private.time_source_id = time_source_create(
			_arguments.parent,
			_arguments.period,
			_arguments.units,
			_arguments.callback,
			_arguments.arguments,
			_arguments.repetitions,
			_arguments.expiry_type,
		)
	}

	/*******************************************************************************/
	#endregion –––––––––––––––––––– NEW_INSTANCE ––––––––––––––––––––
	/*******************************************************************************/

}
