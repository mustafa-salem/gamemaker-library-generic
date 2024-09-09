/******************************************************************************/
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

mp_linear_step(xgoal, ygoal, stepsize, checkall)
mp_linear_step_object(xgoal, ygoal, stepsize, obj)
mp_linear_path(path, xgoal, ygoal, stepsize, checkall)
mp_linear_path_object(path, xgoal, ygoal, stepsize, obj)

mp_potential_settings(maxrot, rotstep, ahead, onspot)
mp_potential_step(xgoal, ygoal, stepsize, checkall)
mp_potential_step_object(xgoal, ygoal, stepsize, obj)
mp_potential_path(path, xgoal, ygoal, stepsize, factor, checkall)
mp_potential_path_object(path, xgoal, ygoal, stepsize, factor, obj)

mp_grid_create(left, top, hcells, vcells, cellwidth, cellheight)

mp_grid_destroy(id)

mp_grid_path(id, path, xstart, ystart, xgoal, ygoal, allowdiag)

mp_grid_add_cell(id, h, v)
mp_grid_add_instances(id, obj, prec)
mp_grid_add_rectangle(id, x1, y1, x2, y2)

mp_grid_get_cell(id, x , y)

mp_grid_clear_all(id)
mp_grid_clear_cell(id, h, v)
mp_grid_clear_rectangle(id, x1, y1, x2, y2)

mp_grid_draw(id)

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
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
function motion_planning_grid_create(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
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
function motion_planning_grid_destroy(parameters = {}) {
    return _return
}


/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

function MotionPlanningGrid() {

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
