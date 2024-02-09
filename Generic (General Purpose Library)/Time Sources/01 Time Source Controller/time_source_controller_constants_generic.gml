/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

#macro TIME_SOURCE_CONTROLLER_GENERIC INITIALIZED_CONSTRUCTOR_GENERIC(TimeSourceControllerGeneric)

TIME_SOURCE_CONTROLLER_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DEFAULTS ––––––––––––––––––––
/*******************************************************************************/

#macro DEFAULT_PARENT_TIME_SOURCE_GENERIC      time_source_global
#macro DEFAULT_PERIOD_TIME_SOURCE_GENERIC      1
#macro DEFAULT_UNITS_TIME_SOURCE_GENERIC       time_source_units_frames
#macro DEFAULT_REPETITIONS_TIME_SOURCE_GENERIC 1
#macro DEFAULT_EXPIRY_TYPE_TIME_SOURCE_GENERIC time_source_expire_after

/*******************************************************************************/
#endregion –––––––––––––––––––– DEFAULTS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro TimeSourceController   TimeSourceControllerGeneric
#macro TIME_SOURCE_CONTROLLER TIME_SOURCE_CONTROLLER_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

/*

#macro time_source_controller time_source_controller_generic

*/
