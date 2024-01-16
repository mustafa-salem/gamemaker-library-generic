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
