/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function in_game_event_type_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function in_game_event_type_create(parameters = {}) {

    var _name

    var _in_game_event_type = new InGameEventType()

    InGameEventType.private.in_game_event_types[$ _name] = _in_game_event_type

    return _in_game_event_type
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

function InGameEventType() {

    static private = {
        in_game_event_types : {},
    }

    self.private = {}

    /// ----------------------------------------------------------------------------
    /// @function set_event(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// * create_event
    /// * cleanup_event
    /// * step_event
    /// ----------------------------------------------------------------------------
    /// @parameter {type} event
    /// <parameter_description>
    ///
    /// @parameter {type} callable
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    set_event = function(parameters = {}) {
        return _return
    }

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
