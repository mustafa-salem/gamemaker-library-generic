#region    –––––––––––––––––––– CREATE_OBJECT_INSTANCE ––––––––––––––––––––

function create_object_instance_generic(arguments = { }) {

    if (is_numeric(arguments)) { arguments = { object_index : arguments } }

    parameters = {
        // REQUIRED
        object_index : arguments.object_index,
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
