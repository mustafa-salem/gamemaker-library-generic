// global variable (struct) that is used as container for the library
// contains controllers and lookup tables
#macro GENERIC_LIBRARY_LOCATION global.generic_general_purpose_library

/*******************************************************************************/
#region    –––––––––––––––––––– CONTROLLERS ––––––––––––––––––––
/*******************************************************************************/

#macro system_controller      system_controller_generic

/*******************************************************************************/
#endregion –––––––––––––––––––– CONTROLLERS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– DATA_TYPES ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– VARIABLES ––––––––––––––––––––

#macro initialise_instance_variable initialise_instance_variable_generic

#endregion –––––––––––––––––––– VARIABLES ––––––––––––––––––––

#region    –––––––––––––––––––– ARRAY ––––––––––––––––––––

#macro is_index_out_of_range_array is_index_out_of_range_array_generic
#macro get_entry_array             get_entry_array_generic

#endregion –––––––––––––––––––– ARRAY ––––––––––––––––––––

/*******************************************************************************/
#endregion –––––––––––––––––––– DATA_TYPES ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– ASSET_TYPES ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– OBJECT ––––––––––––––––––––

#macro create_object_instance create_object_instance_generic
#macro destroy_object_instance destroy_object_instance_generic

#endregion –––––––––––––––––––– OBJECT ––––––––––––––––––––

#region    –––––––––––––––––––– SCRIPT ––––––––––––––––––––

#macro call_callable call_callable_generic

#endregion –––––––––––––––––––– SCRIPT ––––––––––––––––––––

/*******************************************************************************/
#endregion –––––––––––––––––––– ASSET_TYPES ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– OTHER_TYPES ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– TIME_SOURCE ––––––––––––––––––––

#macro time_source_controller time_source_controller_generic

#macro create_time_source                    create_time_source_generic
#macro destroy_time_source                   destroy_time_source_generic
#macro exists_time_source                    exists_time_source_generic
#macro start_time_source                     start_time_source_generic
#macro stop_time_source                      stop_time_source_generic
#macro pause_time_source                     pause_time_source_generic
#macro resume_time_source                    resume_time_source_generic
#macro reconfigure_time_sourc                reconfigure_time_source_generic
#macro reset_time_source                     reset_time_source_generic
#macro get_children_time_source              get_children_time_source_generic
#macro get_parent_time_source                get_parent_time_source_generic
#macro get_period_time_source                get_period_time_source_generic
#macro get_completed_repetitions_time_source get_completed_repetitions_time_source_generic
#macro get_remaining_repetitions_time_source get_remaining_repetitions_time_source_generic
#macro get_state_time_source                 get_state_time_source_generic
#macro get_remaining_time_time_source        get_remaining_time_time_source_generic
#macro get_units_time_source                 get_units_time_source_generic

#macro do_later call_later_generic

#macro get_id_time_source get_id_time_source_generic

#endregion –––––––––––––––––––– TIME_SOURCE ––––––––––––––––––––

/*******************************************************************************/
#endregion –––––––––––––––––––– OTHER_TYPES ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– CUSTOM_TYPES ––––––––––––––––––––
/*******************************************************************************/

#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––

#macro FiniteStateMachine FiniteStateMachineGeneric

#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––

/*******************************************************************************/
#endregion –––––––––––––––––––– CUSTOM_TYPES ––––––––––––––––––––
/*******************************************************************************/
