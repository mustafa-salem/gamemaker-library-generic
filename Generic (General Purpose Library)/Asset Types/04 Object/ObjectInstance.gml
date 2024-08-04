/*

{
    x_position             : ,
    y_position             : ,
    z_position             : ,

    x_velocity             : ,
    y_velocity             : ,

    velocity_magnitude     : ,
    velocity_direction     : ,

    friction_magnitude     : ,

    x_acceleration         : ,
    y_acceleration         : ,
    acceleration_magnitude : ,
    acceleration_direction : ,
}

# GENERAL

## id

## object_index
* get_object
* get_object_name
* get_object_handle
* get_object_id

## visible
* get_visible
* set_visible

## solid

## persistent
* get_persistent
* set_persistent

## alarm



# POSITION

## x
* get_x_position
* set_x_position

## y
* get_y_position
* set_y_position

# depth
* get_z_position
* set_z_position

## layer
get_layer
set_layer

# xstart

# ystart

# xprevious

# yprevious

# bbox_bottom


# bbox_left

# bbox_right

# bbox_top

* get_bounding_box_x_position
* get_bounding_box_y_position

* get_bounding_box_x_dimension
* get_bounding_box_y_dimension

* get_bounding_box_x_alignment
* get_bounding_box_y_alignment

* get_bounding_box_x_offset
* get_bounding_box_y_offset

# DIMENSIONS

## sprite_width
get_x_dimension

## sprite_height

## sprite_xoffset

## sprite_yoffset

## image_xscale

## image_yscale



# ROTATION

## image_angle
get_x_rotation
set_x_rotation
get_y_rotation
set_y_rotation
get_z_rotation
set_z_rotation



# MOVEMENT

## speed
* get_velocity_magnitude
* set_velocity_magnitude

## direction
* get_velocity_direction
* set_velocity_direction

## hspeed
* get_x_velocity
* set_x_velocity

## vspeed
* get_y_velocity
* set_y_velocity

## friction
* get_friction_magnitude
* set_friction_magnitude

* get_friction_direction == - get_velocity_direction

## gravity
* get_acceleration_magnitude
* set_acceleration_magnitude

## gravity_direction
* get_acceleration_direction
* set_acceleration_direction

* get_x_acceleration
* set_x_acceleration
* get_y_acceleration
* set_y_acceleration



# TEXTURE

## sprite_index

## mask_index

## image_index

## image_number

## image_speed



# BLENDING

## image_blend
* get_blend_colour
* set_blend_colour

## image_alpha
* get_blend_alpha
* set_blend_alpha



# PATHS

## path_index

## path_position

## path_positionprevious

## path_speed

## path_scale

## path_orientation

## path_endaction



# TIMELINES

## timeline_index

## timeline_running

## timeline_speed

## timeline_position

## timeline_loop



# SEQUENCES

## in_sequence

## sequence_instance

*/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function object_instance_exists(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// ObjectInstance.exists
/// ----------------------------------------------------------------------------
function object_instance_exists(arguments) {
    return instance_exists(_object_instance_id or _object_id)
}

/// ----------------------------------------------------------------------------
/// @function object_instance_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// ObjectInstance.create
/// ----------------------------------------------------------------------------
/// @parameter {type} object
/// <parameter_description>
///
/// @parameter {type} x_position
/// <parameter_description>
///
/// @parameter {type} y_position
/// <parameter_description>
///
/// @parameter {type} z_position
/// <parameter_description>
///
/// @parameter {type} layer
/// <parameter_description>
///
/// @parameter {type} variables
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function object_instance_create(parameters = {}) {
    var _x_position    =
    var _y_position    =
    var _layer_handle  =
    var _depth         =
    var _object_handle =
    var _variables = {}

    if () {
        _variables.persistent
    }

    if (_layer_handle != undefined) {
        instance_create_layer(_x_position, _y_position, _layer_handle, _object_handle, _variables)
    } else {
        instance_create_depth(_x_position, _y_position, _depth, _object_handle, _variables)
    }
    return _return
}

/// ----------------------------------------------------------------------------
/// @function object_instance_destroy(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a wrapper for the built-in function:
/// instance_destroy
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {...} arguments.object_instance
/// * Struct.Object
/// * Name.Object
/// * Id.Object
/// * Struct.ObjectInstance
/// * Id.ObjectInstance
///
/// @parameter {Bool} arguments.execute_destroy_event
/// Whether to execute the destroy event of the object instance being destroyed.
/// ----------------------------------------------------------------------------
/// @return {Any} self
/// ----------------------------------------------------------------------------
function object_instance_destroy(arguments) {
    if (!is_struct(arguments)) { /* ERROR */ }

    var _object_instance       = arguments[$ "object_instance"]
    var _execute_destroy_event = arguments[$ "execute_destroy_event"]

    if (!is_array(_object_instance)) { _object_instance = [_object_instance] }

    for (var i = 0; i < array_length(_object_instance); i++) {

    }


    for (var i = 0; i < array_length(_object_instance); i++) {
        if (instance_exists(_object_instance[i])) {
            instance_destroy(_object_instance[i], _execute_destroy_event)
        }
    }
}

/// ----------------------------------------------------------------------------
/// @function object_instance_is_in_sequence(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} object_instance
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// <return_description>
/// ----------------------------------------------------------------------------
function object_instance_is_in_sequence(parameters = {}) {
    var _handle
    return _handle.in_sequence
}

/// ----------------------------------------------------------------------------
/// @function object_instance_get_sequence_instance(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} object_instance
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {struct|undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function object_instance_get_sequence_instance(parameters = {}) {
    var _handle
    return _handle.sequence_instance
}

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

function ObjectInstance() constructor {

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/


/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/





/// ----------------------------------------------------------------------------
/// @function gpl_object_instance_depthsort(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {mixed} object_instance
/// The object instance to target.
///
/// @parameter {number} y_position
/// The y position to use as a basis for the depth sorting algorithm.
/// ----------------------------------------------------------------------------
function gpl_object_instance_depthsort(parameters) {
    var _object_instance = parameters.object_instance
	_object_instance.depth = 8000 - room_height / 2 + _object_instance.y + _object_instance.sprite_height - _object_instance.sprite_yoffset
}



// if array is given this function is applied to each element
if (_object_instance != undefined and is_array(_object_instance)) {
    for (var i = 0; i < array_length(_object_instance); i++) {
        object_instance_destroy(_object_instance[i])
    }
// regular method of execution
} else {
    if (_object_instance != undefined and instance_exists(_object_instance)) {
        instance_destroy(_object_instance)
    }
}

#region    –––––––––––––––––––– POSITION_OBJECT_INSTANCE ––––––––––––––––––––

function position_object_instance_generic(arguments) {
	if (!is_struct(arguments)) {
		arguments = {
			x : argument0,
			y : argument1,
			target : argument2 ?? self,
		}
	}

    var target = arguments.target
    x = target.x
    y = target.y
    var alignment = arguments[$ "alignment"] ?? "top_left"
    if (alignment == "sprite_center") {
        x += target.sprite_width / 2 - target.sprite_xoffset
        y += target.sprite_height / 2 - target.sprite_yoffset
    }
}

#endregion –––––––––––––––––––– POSITION_OBJECT_INSTANCE ––––––––––––––––––––

function object_instance_destroy(_object_instance = self) {
    // if array is given this function is applied to each element
    if (_object_instance != undefined and is_array(_object_instance)) {
        for (var i = 0; i < array_length(_object_instance); i++) {
            object_instance_destroy(_object_instance[i])
        }
    // regular method of execution
    } else {
        if (_object_instance != undefined and instance_exists(_object_instance)) {
            instance_destroy(_object_instance)
        }
    }
}

function moved_horizontally_object_instance(_object_instance = self) {
	return _object_instance.x != _object_instance.xprevious
}

function moved_vertically_object_instance(_object_instance = self) {
	return _object_instance.y != _object_instance.yprevious
}

function moved_object_instance(_object_instance = self) {
	return moved_horizontally_object_instance(_object_instance) or moved_vertically_object_instance(_object_instance)
}

function horizontal_movement_object_instance(_object_instance = self) {
	return _object_instance.x - _object_instance.xprevious
}

function vertical_movement_object_instance(_object_instance = self) {
	return _object_instance.y - _object_instance.yprevious
}

// flash -> draw sprite again with overlay shader

/// ----------------------------------------------------------------------------
/// @function generic_object_instance_draw(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} object_instance
/// <parameter_description>
///
/// @parameter {type} flash_colour
/// <parameter_description>
///
/// @parameter {type} flash_alpha
/// <parameter_description>
///
/// @parameter {shader} [shader]
/// The shader to use while drawing.
///
/// @parameter {struct} [shader_variables]
/// The variables to pass to the shader.
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_object_instance_draw(parameters = {}) {
    var _object_instance_handle = generic_object_instance_get_handle(parameters)
    parameters[$ "sprite"]     ??= _object_instance_handle.sprite_index
    parameters[$ "frame"]      ??= _object_instance_handle.image_index
    parameters[$ "x_position"] ??= _object_instance_handle.x
    parameters[$ "y_position"] ??= _object_instance_handle.y
    parameters[$ "x_scale"]    ??= _object_instance_handle.image_xscale
    parameters[$ "y_scale"]    ??= _object_instance_handle.image_yscale
    parameters[$ "rotation"]   ??= _object_instance_handle.image_angle
    parameters[$ "alpha"]      ??= _object_instance_handle.image_alpha
    parameters[$ "colour"]     ??= _object_instance_handle.image_blend
    gpl_sprite_draw(parameters)
}

/******************************************************************************/
#region    –––––––––––––––––––– POSITION ––––––––––––––––––––
/******************************************************************************/

function object_instance_get_x_position(parameters = {}) {
    return self.x
}

function object_instance_get_y_position(parameters = {}) {
    return self.y
}

function object_instance_set_position(parameters = {}) {
    self.x = parameters.x
    self.y = parameters.y
}

/******************************************************************************/
#endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– DIMENSION ––––––––––––––––––––
/******************************************************************************/

function generic_object_instance_get_x_dimension(parameters = {}) {
    return self.sprite_width
}

function generic_object_instance_get_y_dimension(parameters = {}) {
    return self.sprite_height
}

/******************************************************************************/
#endregion –––––––––––––––––––– DIMENSION ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– BOUNDING_BOX ––––––––––––––––––––
/******************************************************************************/

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
function object_instance_bounding_box(parameters = {}) {
    bbox_bottom - bbox_top
    bbox_right - bbox_left
}

function object_instance_get_bounding_box_x_position(parameters = {}) {
    return self.bbox_left
}

function object_instance_get_bounding_box_y_position(parameters = {}) {
    return self.bbox_top
}

function object_instance_get_bounding_box_x_dimension(parameters = {}) {
    return self.bbox_right - self.bbox_left
}

function object_instance_get_bounding_box_y_dimension(parameters = {}) {
    return self.bbox_bottom - self.bbox_top
}

/******************************************************************************/
#endregion –––––––––––––––––––– BOUNDING_BOX ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– EVENT ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function object_instance_execute_parent_event(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is a generification of the built-in function 'event_inherited'.
///
/// ----------------------------------------------------------------------------
/// @parameter {type} object_instance
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function object_instance_execute_parent_event(parameters = {}) {
    return _return
}

/******************************************************************************/
#endregion –––––––––––––––––––– EVENT ––––––––––––––––––––
/******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#macro OBJECT_INSTANCE INITIALIZED_CONSTRUCTOR(ObjectInstance)

OBJECT_INSTANCE

function ObjectInstance() : AssetInstanceGeneric() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– STATIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function initialize(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    static initialize = function(arguments) {
        with (_object_instance_id) {

        }

        with (_object_instance_id.private) {

        }

            /// ----------------------------------------------------------------------------
            /// @type {Struct.ObjectInstance}
            /// ----------------------------------------------------------------------------
            /// @description
            /// <description>
            /// ----------------------------------------------------------------------------
            self[$ "object_instance"] ??= ObjectInstance.create({
                object_instance : id
            })

            /// ----------------------------------------------------------------------------
            /// @type {Struct.ObjectInstanceAbstraction}
            /// ----------------------------------------------------------------------------
            /// @description
            /// <description>
            /// ----------------------------------------------------------------------------
            self[$ "public"] ??= ObjectInstanceAbstraction.create({
                object_instance : id
            })

            /// ----------------------------------------------------------------------------
            /// @type {Struct}
            /// ----------------------------------------------------------------------------
            /// @description
            /// <description>
            /// ----------------------------------------------------------------------------
            private = {
                object,
                object_instance,
                public,
            }

            with (private) {
                /// ----------------------------------------------------------------------------
                /// @type {Struct.FiniteStateMachine}
                /// ----------------------------------------------------------------------------
                /// @description
                /// <description>
                /// ----------------------------------------------------------------------------
                finite_state_machine = FiniteStateMachine.create()
            }

    }

    static current_event = function() {

    }

    /// ----------------------------------------------------------------------------
    /// @function is_instance_of(arguments)
    /// ----------------------------------------------------------------------------
    /// @description This function returns whether the given object_instance is
    /// an instance of the given object or an instance of an object that is a
    /// direct or indirect child of the given object.
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    /// @parameter {Id.Instance}   [arguments.object_instance=id] - Object Instance
    /// @parameter {Asset.GMObject} arguments.object              - Object
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// ----------------------------------------------------------------------------
    static is_instance_of = function(arguments) {
        var _object_instance = arguments[$ "object_instance"] ?? id
        var _object          = arguments.object

        // Check if the given object_instance is an instance of the given object.
        if (_object_instance.object_index == _object) { return true }

        // Check if the given object_instance is an instance of a child of the given object.
        return Object.is_child_of({ object : _object_instance.object_index, parent_object : _object })
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– STATIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    private = {
        object_instance : noone,
        object : emote_bubble_object,
    }

    // NO_ARGUMENTS_PROVIDED -> BUILDER_MODE
    if (arguments == undefined) {

    // EXISTING_INSTANCE_ASSIGNED
    } else if (arguments[$ "object_instance"] != undefined) {
        private = object_instance.private
    // CREATE_NEW_INSTANCE
    } else {
        var _constructor = EmoteBubbleObject
        private.object_instance = _constructor.create_instance(arguments)
        private.object_instance.private = private
    }

    /// ----------------------------------------------------------------------------
    /// @function exists(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance
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
    static exists = object_instance_exists

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.layer
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.depth
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.x
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.y
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.variables
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static create = function(arguments) {
        arguments[$ "object"]
        arguments[$ "layer"]
        arguments[$ "depth"] ?? _object.get_depth()
        arguments[$ "x"]
        arguments[$ "y"]
        arguments[$ "variables"]

        // UNMANAGED_LAYER
        if (_layer_id != undefined) {
            var object_instance_id = instance_create_layer(
                _x_position,
                _y_position,
                _layer_id,
                _object_id,
                _variables
            )
        // MANAGED_LAYER
        } else {
            var object_instance_id = instance_create_depth(
                _x_position,
                _y_position,
                _depth,
                _object_id,
                _variables
            )
        }

        return _object_instance
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance_id
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    create_wrapper = function(arguments = {}) {
        var _object_instance = new ObjectInstance()
        with (_object_instance) {

        }
        return _object_instance
    }

    static destroy = object_instance_destroy

    /*******************************************************************************/
    #region    –––––––––––––––––––– VISIBLE ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_visible(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Bool}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_visible = function(arguments) {
        return object_instance.visible
    }

    /// ----------------------------------------------------------------------------
    /// @function set_visible(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Array<Real|String|Struct>} arguments.object_instance
    /// <parameter_description>
    ///
    /// @parameter {Bool} arguments.visible
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct} self
    /// ----------------------------------------------------------------------------
    static set_visible = function(arguments) {
        object_instance.visible = arguments.visible
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– VISIBLE ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– SOLID ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SOLID ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PERSISTENT ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PERSISTENT ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– DEPTH ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #endregion –––––––––––––––––––– DEPTH ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– LAYER ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #endregion –––––––––––––––––––– LAYER ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function add_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.x
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.y
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static add_position = function(arguments) {
        return self
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– INITIAL_POSITION ––––––––––––––––––––
    /*******************************************************************************/

    static get_initial_position = function(arguments) {
        var _object_instance
        return {
            x : _object_instance.xstart,
            y : _object_instance.ystart,
        }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– INITIAL_POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– PREVIOUS_POSITION ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function get_x_previous_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_x_previous_position = function(arguments) {
        var _object_instance
        return _object_instance.xprevious
    }

    /// ----------------------------------------------------------------------------
    /// @function get_y_previous_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Real}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_y_previous_position = function(arguments) {
        var _object_instance
        return _object_instance.yprevious
    }

    /// ----------------------------------------------------------------------------
    /// @function get_previous_position(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.object_instance
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static get_previous_position = function(arguments) {
        return {
            x : get_x_previous_position(arguments),
            y : get_y_previous_position(arguments),
        }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– PREVIOUS_POSITION ––––––––––––––––––––
    /*******************************************************************************/


    /******************************************************************************/
    #region    –––––––––––––––––––– EVENT ––––––––––––––––––––
    /******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function execute_parent_event(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// 'event_inherited'
    /// ----------------------------------------------------------------------------
    /// @parameter {type} parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct} self
    /// ----------------------------------------------------------------------------
    execute_parent_event = function(parameters) {
        object_instance_execute_parent_event(parameters)
        return self
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– EVENT ––––––––––––––––––––
    /******************************************************************************/

}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

function() {
    with (_object_instance) {
        /// ----------------------------------------------------------------------------
        /// @function exists(arguments)
        /// ----------------------------------------------------------------------------
        /// @description
        /// object_instance_exists
        /// ----------------------------------------------------------------------------
        exists = function(arguments) {
            arguments.object_instance = self
            return object_instance_exists(arguments)
        }

        /// ----------------------------------------------------------------------------
        /// @function destroy(arguments)
        /// ----------------------------------------------------------------------------
        /// @description
        /// object_instance_destroy
        /// ----------------------------------------------------------------------------
        destroy = function() {
            arguments.object_instance = self
            object_instance_destroy(arguments)
            return self
        }
    }
}


/// ----------------------------------------------------------------------------
/// @function (arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This static method function serves as a proxy for the script function:
/// _object_instance_generic
/// ----------------------------------------------------------------------------
/// @return {Struct}
/// The static struct of the constructor function ObjectInstance or the
///
/// ----------------------------------------------------------------------------
static destroy = function(arguments) {
    object_instance_destroy(arguments)
    return self
}

static destroy = function(arguments) {
    object_instance_destroy(arguments)
    return self
}

destroy = function(arguments) {
    arguments.object_instance = self
    object_instance_destroy(arguments)
    return self
}

STATIC_CALL
INSTANCE_SCOPE


function object_instance_destroy(_object_instance = self) {
    // if array is given this function is applied to each element
    if (_object_instance != undefined and is_array(_object_instance)) {
        for (var i = 0; i < array_length(_object_instance); i++) {
            object_instance_destroy(_object_instance[i])
        }
    // regular method of execution
    } else {
        if (_object_instance != undefined and instance_exists(_object_instance)) {
            instance_destroy(_object_instance)
        }
    }
}
