#macro ObjectInstance ObjectInstanceGeneric

ObjectInstanceGeneric()

function ObjectInstanceGeneric() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– STATIC_METHODS ––––––––––––––––––––
    /*******************************************************************************/

    static initialize = function() {
        controller = arguments[$ "controller"]
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

    create = function(arguments) {

        // NON_STATIC_CALL
        if (is_instanceof(self, ObjectInstanceGeneric)) {
            create_object_instance(private)
        // STATIC_CALL
        } else {
            return create_object_instance(arguments)
        }

    }

    static destroy = function(arguments) { with (other) { destroy_object_instance(arguments) } }

}

#region    –––––––––––––––––––– CREATE_OBJECT_INSTANCE ––––––––––––––––––––

function create_object_instance_generic(arguments = { }) {

    if (is_numeric(arguments)) { arguments = { object_index : arguments } }

    parameters = {
        // REQUIRED
        object_index : arguments.object_index, // object_index or object
        // OPTIONAL
        x : arguments[$ "x"] ?? 0,
        y : arguments[$ "y"] ?? 0,
        depth : arguments[$ "depth"] ?? undefined,
        layer : arguments[$ "layer"] ?? undefined,
        variables : arguments[$ "variables"] ?? { },
    }

    if (parameters.layer == undefined && parameters.depth == undefined) {
        parameters.depth = /*object_get_depth(parameters.object_index) ??*/ 0
    }

    if (parameters.layer != undefined) {
        return instance_create_layer(
            parameters.x,
            parameters.y,
            parameters.layer_id,
            parameters.object_index,
            parameters.variables
        )
    } else {
        return instance_create_depth(
            parameters.x,
            parameters.y,
            parameters.depth,
            parameters.object_index,
            parameters.variables
        )
    }
}

#endregion –––––––––––––––––––– CREATE_OBJECT_INSTANCE ––––––––––––––––––––

#region    –––––––––––––––––––– DESTROY_OBJECT_INSTANCE ––––––––––––––––––––

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

#endregion –––––––––––––––––––– DESTROY_OBJECT_INSTANCE ––––––––––––––––––––

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
