/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#macro OBJECT_INSTANCE_GENERIC INITIALIZED_CONSTRUCTOR(ObjectInstance)

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro ObjectInstance  ObjectInstanceGeneric
#macro OBJECT_INSTANCE OBJECT_INSTANCE_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– MACROS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function exists_object_instance_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// ObjectInstanceGeneric.exists
/// ----------------------------------------------------------------------------
function exists_object_instance_generic(arguments) {
    return instance_exists(_object_instance_id or _object_id)
}

/// ----------------------------------------------------------------------------
/// @function create_object_instance_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a proxy for the static method function:
/// ObjectInstanceGeneric.create
/// ----------------------------------------------------------------------------
function create_object_instance_generic(arguments) {
    // TODO: ADJUST PROJECT FOR RETURN TYPE CHANGE
    return OBJECT_INSTANCE_GENERIC.create(arguments)
}

/// ----------------------------------------------------------------------------
/// @function destroy_object_instance_generic(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// This script function serves as a wrapper for the built-in function:
/// instance_destroy
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {...} arguments.object_instance
/// * Struct.ObjectGeneric
/// * Name.Object
/// * Id.Object
/// * Struct.ObjectInstanceGeneric
/// * Id.ObjectInstance
///
/// @parameter {Bool} arguments.execute_destroy_event
/// Whether to execute the destroy event of the object instance being destroyed.
/// ----------------------------------------------------------------------------
/// @return {Any} self
/// ----------------------------------------------------------------------------
function destroy_object_instance_generic(arguments) {
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

// if array is given this function is applied to each element
if (_object_instance != undefined and is_array(_object_instance)) {
    for (var i = 0; i < array_length(_object_instance); i++) {
        destroy_object_instance_generic(_object_instance[i])
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

function destroy_object_instance_generic(_object_instance = self) {
    // if array is given this function is applied to each element
    if (_object_instance != undefined and is_array(_object_instance)) {
        for (var i = 0; i < array_length(_object_instance); i++) {
            destroy_object_instance_generic(_object_instance[i])
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

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

OBJECT_INSTANCE_GENERIC

function ObjectInstanceGeneric() : AssetInstanceGeneric() constructor {

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
            /// @type {Struct.ObjectInstanceGeneric}
            /// ----------------------------------------------------------------------------
            /// @description
            /// <description>
            /// ----------------------------------------------------------------------------
            self[$ "object_instance"] ??= ObjectInstanceGeneric.create({
                object_instance : id
            })

            /// ----------------------------------------------------------------------------
            /// @type {Struct.ObjectInstanceAbstractionGeneric}
            /// ----------------------------------------------------------------------------
            /// @description
            /// <description>
            /// ----------------------------------------------------------------------------
            self[$ "public"] ??= ObjectInstanceAbstractionGeneric.create({
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
                /// @type {Struct.FiniteStateMachineGeneric}
                /// ----------------------------------------------------------------------------
                /// @description
                /// <description>
                /// ----------------------------------------------------------------------------
                finite_state_machine = FiniteStateMachineGeneric.create()
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
        return ObjectGeneric.is_child_of({ object : _object_instance.object_index, parent_object : _object })
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
    static exists = exists_object_instance_generic

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
        var _object_instance = new ObjectInstanceGeneric()
        with (_object_instance) {

        }
        return _object_instance
    }

    static destroy = destroy_object_instance_generic

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
        /// exists_object_instance_generic
        /// ----------------------------------------------------------------------------
        exists = function(arguments) {
            arguments.object_instance = self
            return exists_object_instance_generic(arguments)
        }

        /// ----------------------------------------------------------------------------
        /// @function destroy(arguments)
        /// ----------------------------------------------------------------------------
        /// @description
        /// destroy_object_instance_generic
        /// ----------------------------------------------------------------------------
        destroy = function() {
            arguments.object_instance = self
            destroy_object_instance_generic(arguments)
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
/// The static struct of the constructor function ObjectInstanceGeneric or the
///
/// ----------------------------------------------------------------------------
static destroy = function(arguments) {
    destroy_object_instance_generic(arguments)
    return self
}

static destroy = function(arguments) {
    destroy_object_instance_generic(arguments)
    return self
}

destroy = function(arguments) {
    arguments.object_instance = self
    destroy_object_instance_generic(arguments)
    return self
}

STATIC_CALL
INSTANCE_SCOPE


function destroy_object_instance_generic(_object_instance = self) {
    // if array is given this function is applied to each element
    if (_object_instance != undefined and is_array(_object_instance)) {
        for (var i = 0; i < array_length(_object_instance); i++) {
            destroy_object_instance_generic(_object_instance[i])
        }
    // regular method of execution
    } else {
        if (_object_instance != undefined and instance_exists(_object_instance)) {
            instance_destroy(_object_instance)
        }
    }
}
