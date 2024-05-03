/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
time_source_controller_generic.gml

@overview
This file defines the constructor for the TimeSourceControllerGeneric struct.
This struct caches time sources created by generic_call_later and automatically
garbage collects them once they have called their callback method. This struct
is initialized by SystemControllerGeneric.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

/// @function TimeSourceControllerGeneric()
/// @description
/// Creates a controller struct for time sources used by the generic general
/// purpose library. Do not call this function.
function TimeSourceControllerGeneric() constructor {

    SYSTEM_CONTROLLER.set_default_controller({
        controller_name   : "time_source_controller",
        controller_struct : static_get(TimeSourceControllerGeneric),
    })

    static default_parent       = DEFAULT_PARENT_TIME_SOURCE_GENERIC
    static default_period       = DEFAULT_PERIOD_TIME_SOURCE_GENERIC
    static default_units        = DEFAULT_UNITS_TIME_SOURCE_GENERIC
    static default_repetitions  = DEFAULT_REPETITIONS_TIME_SOURCE_GENERIC
    static default_expiry_type  = DEFAULT_EXPIRY_TYPE_TIME_SOURCE_GENERIC

    static time_sources = []

    /// @type {Array<Struct.TimeSourceGeneric>}
    /// caches time sources created by generic_call_later
    static call_later_time_sources = []

    /*******************************************************************************/
    #region    –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––

    static step_event = function() {
        // remove time sources used with generic_call_later once they have run their callback method
        for (var i = 0; i < array_length(call_later_time_sources); i++) {
            var _time_source = call_later_time_sources[i]
            // destroy stopped time sources
            if (!_time_source.get_state() == time_source_state_stopped) {
                _time_source.destroy()
            }
            // delete destroyed time sources from array
            if (!_time_source.exists()) {
                array_delete(call_later_time_sources, i, 1)
            }
        }
    }

    #endregion –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– METHODS ––––––––––––––––––––
    /*******************************************************************************/

    static get_default_parent = function() {
        return default_parent
    }

    /// ----------------------------------------------------------------------------
    /// @function set_default_parent_time_source(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// Sets the default value used for the parent time source when creating a time source.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    /// {Id.TimeSource or Struct.TimeSourceGeneric} time_source
    /// ----------------------------------------------------------------------------
    static set_default_parent = function(arguments = {}) {
        if (is_struct(arguments.time_source)) {
            default_parent = arguments.time_source
        } else {
            default_parent = new TimeSourceGeneric({ time_source_id : arguments.time_source })
        }
    }

    static get_default_period = function() {
        return default_period
    }

    static get_default_units = function() {
        return default_units
    }

    static get_default_repetitions = function() {
        return default_repetitions
    }

    static get_default_expiry_type = function() {
        return default_expiry_type
    }

    static add_garbage_collection = function(arguments = {}) {
        array_push(call_later_time_sources, arguments.time_source)
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– METHODS ––––––––––––––––––––
    /*******************************************************************************/

}
