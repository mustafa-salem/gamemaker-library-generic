#macro ObjectInstanceWrapper ObjectInstanceWrapperGeneric

function ObjectInstanceWrapperGeneric(arguments) constructor {

    static static_initialization = true

    static private = {
        object_constructor : arguments.object_constructor,
        object_instance    : arguments[$ "object_instance"],
    }

    // object_instance not provided exist
    if (private.object_instance == undefined) {
        create(arguments[$ "arguments"] ?? {})
    // object_instance provided and exists
    } else if (exists_object_instance({ object_instance : private.object_instance })) {
        _object_instance[$ "private"] ??= {}
        _object_instance.private[$ "object_constructor"] ??= private.object_constructor
        _object_instance.private[$ "object_instance"]    ??= private.object_instance
        private = _object_instance.private
    // object_instance provided but does not exist -> nothing
    }

    /// ----------------------------------------------------------------------------
    /// @function create(arguments)
    /// ----------------------------------------------------------------------------
    static create = function(arguments = {}) {
        arguments[$ "variables"] ??= {}
        arguments.variables.private = private
        private.object_instance = private.object_constructor.create_instance(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function destroy(arguments)
    /// ----------------------------------------------------------------------------
    static destroy = function(arguments = {}) {
        arguments.object_instance = private.object_instance
        destroy_object_instance_generic(arguments)
    }

    if (!struct_exists(self, "static_initialization")) { return }
    struct_remove(static_get(self), "static_initialization")

}
