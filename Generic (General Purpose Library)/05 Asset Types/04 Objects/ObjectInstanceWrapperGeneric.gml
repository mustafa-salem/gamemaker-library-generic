#macro ObjectInstanceWrapper ObjectInstanceWrapperGeneric

function ObjectInstanceWrapperGeneric(arguments) constructor {

    private = {
        object
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    static create = function() {
        if (private.constructor) {
            private.object_instance = private.constructor.create_instance()
        } else {
            private.object_instance = create_object_instance_generic({
                variables : {
                    private,
                },
            })
        }
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    static destroy = function(arguments = {}) {
        arguments.object_instance = get_id()
        destroy_object_instance_generic(arguments)
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------


}
