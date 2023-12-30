/*******************************************************************************
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
time_source_controller_generic.gml

@overview
This file defines the constructor for the TimeSourceControllerGeneric struct.
This struct caches time sources created by call_later_generic and automatically
garbage collects them once they have called their callback method. This struct
is initialized by SystemControllerGeneric.
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
*******************************************************************************/

/// @function TimeSourceControllerGeneric()
/// @description
/// Creates a controller struct for time sources used by the generic general
/// purpose library. Do not call this function.
function TimeSourceControllerGeneric() constructor {

    /// @type {Array<Struct.TimeSourceGeneric>}
    /// caches time sources created by call_later_generic
    call_later_time_sources = []

    default_parent_time_source_id = time_source_global

    /*******************************************************************************/
    #region    –––––––––––––––––––– OBJECT_EVENTS ––––––––––––––––––––
    /*******************************************************************************/

    #region    –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––

    step_event = function() {
        // remove time sources used with call_later_generic once they have run their callback method
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

    /// ----------------------------------------------------------------------------
    /// @function get_default_parent_time_source()
    /// ----------------------------------------------------------------------------
    /// @description
    /// Gets the default value used for the parent time source when creating a time source.
    /// ----------------------------------------------------------------------------
    /// @return {Struct.TimeSourceGeneric}
    /// ----------------------------------------------------------------------------
    get_default_parent_time_source = function() {
        return default_parent_time_source
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
    set_default_parent_time_source = function(arguments = {}) {
        if (is_struct(arguments.time_source)) {
            default_parent_time_source = arguments.time_source
        } else {
            default_parent_time_source = new TimeSourceGeneric({ time_source_id : arguments.time_source })
        }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– METHODS ––––––––––––––––––––
    /*******************************************************************************/

}
