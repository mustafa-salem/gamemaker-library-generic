/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

// #macro INPUT_INITIALIZED_CONSTRUCTOR_GENERIC -42
/*
#macro GUARD_INITIALIZED_CONSTRUCTOR_GENERIC \
if (argument0 == INPUT_INITIALIZED_CONSTRUCTOR_GENERIC) { return }
#macro GUARD_INITIALIZED_CONSTRUCTOR GUARD_INITIALIZED_CONSTRUCTOR_GENERIC
*/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro INITIALIZED_CONSTRUCTOR_GENERIC __INITIALIZED_CONSTRUCTOR_GENERIC

INITIALIZED_STATIC_STRUCT

/// ----------------------------------------------------------------------------
/// @function __INITIALIZED_CONSTRUCTOR_GENERIC(_constructor)
/// ----------------------------------------------------------------------------
/// @description
/// Makes sure the provided constructor is initialized before returning
/// its static struct.
/// ----------------------------------------------------------------------------
/// @parameter {Function} constructor
///
/// ----------------------------------------------------------------------------
/// @return {Struct|Undefined}
/// <return_description>
/// ----------------------------------------------------------------------------
function __INITIALIZED_CONSTRUCTOR_GENERIC(_constructor) {
    static is_initialized = {}
    if (is_initialized[$ script_get_name(_constructor)] != true) {
        is_initialized[$ script_get_name(_constructor)]  = true
        new _constructor(ARGUMENT_0_INITIALIZED_CONSTRUCTOR_GENERIC)
        // new _constructor(INPUT_INITIALIZED_CONSTRUCTOR_GENERIC)
        /*
        if (static_get(_constructor)[$ "__initialize_static"] != undefined) {
            static_get(_constructor).__initialize_static()
        }
        */
    }
    return static_get(_constructor)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

/*
#macro DEFINE_INITIALIZE_STATIC_GENERIC \
    static __initialize_static = method(static_get(self), function() { \
	struct_remove(self, "__initialize_static")                \
	if (struct_exists(self, "__initialize_private_static")) { \
		__initialize_private_static()                         \
		struct_remove(self, "__initialize_private_static")    \
	}														  \
	if (struct_exists(self, "__initialize_public_static")) {  \
		__initialize_public_static()                          \
		struct_remove(self, "__initialize_public_static")     \
	}														  \
	return self												  \
})

#macro BEGIN_INITIALIZE_PRIVATE_STATIC_GENERIC static __initialize_private_static = function() {
#macro   END_INITIALIZE_PRIVATE_STATIC_GENERIC }
#macro BEGIN_INITIALIZE_PUBLIC_STATIC_GENERIC  static __initialize_public_static  = function() {
#macro   END_INITIALIZE_PUBLIC_STATIC_GENERIC  }
*/

#macro ARGUMENT_0_INITIALIZED_CONSTRUCTOR_GENERIC __ARGUMENT_0_INITIALIZED_CONSTRUCTOR_GENERIC()

function __ARGUMENT_0_INITIALIZED_CONSTRUCTOR_GENERIC() {
    static _argument0 = {}
    return _argument0
}

#macro INITIALIZATION_GUARD_CONSTRUCTOR_GENERIC                                 \
if (argument0 == ARGUMENT_0_INITIALIZED_CONSTRUCTOR_GENERIC) { return }



/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZATION_CODE_STATIC_STRUCT ––––––––––––––––––––
/*******************************************************************************/

#macro INITIALIZATION_CODE_STATIC_STRUCT INITIALIZATION_CODE_STATIC_STRUCT_GENERIC

#macro INITIALIZATION_CODE_STATIC_STRUCT_GENERIC                                     \
static ____INITIALIZATION_CODE_STATIC_STRUCT_GENERIC = __INITIALIZATION_CODE_STATIC_STRUCT_GENERIC

function __INITIALIZATION_CODE_STATIC_STRUCT_GENERIC(_initialization_code) {
    _initialization_code()
}

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZATION_CODE_STATIC_STRUCT ––––––––––––––––––––
/*******************************************************************************/

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro INITIALIZED_CONSTRUCTOR          INITIALIZED_CONSTRUCTOR_GENERIC
#macro INITIALIZATION_GUARD_CONSTRUCTOR INITIALIZATION_GUARD_CONSTRUCTOR_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/
