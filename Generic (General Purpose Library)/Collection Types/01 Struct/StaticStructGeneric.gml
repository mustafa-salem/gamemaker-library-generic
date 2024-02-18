#macro StaticStruct      StaticStructGeneric
#macro get_static_struct get_static_struct_generic
#macro set_static_struct set_static_struct_generic

function get_static_struct_generic() {
    static_get(struct_or_func_name)
}

function set_static_struct_generic() {
    static_set(struct, static_struct)
}

StaticStructGeneric()

function StaticStructGeneric() {

    static get = function(arguments) {
        return static_get(arguments.owner)
    }

    static set = function(arguments) {
        static_set(arguments.owner, arguments.static_struct)
        return self
    }

}
