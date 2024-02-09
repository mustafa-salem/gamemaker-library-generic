/*******************************************************************************/
#region    –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

#macro INPUT_INITIALIZED_CONSTRUCTOR_GENERIC -42
#macro GUARD_INITIALIZED_CONSTRUCTOR_GENERIC \
if (argument0 == INPUT_INITIALIZED_CONSTRUCTOR_GENERIC) { return }
#macro GUARD_INITIALIZED_CONSTRUCTOR GUARD_INITIALIZED_CONSTRUCTOR_GENERIC

#macro INITIALIZED_CONSTRUCTOR_GENERIC __INITIALIZED_CONSTRUCTOR_GENERIC

/// ----------------------------------------------------------------------------
/// @function __INITIALIZED_CONSTRUCTOR_GENERIC(_constructor)
/// ----------------------------------------------------------------------------
/// @description
/// Makes sure the provided constructor is initialized before returning
/// its static struct.
/// ----------------------------------------------------------------------------
function __INITIALIZED_CONSTRUCTOR_GENERIC(_constructor) {
    static is_initialized = {}
    if (is_initialized[$ script_get_name(_constructor)] != true) {
        is_initialized[$ script_get_name(_constructor)]  = true
        new _constructor(INPUT_INITIALIZED_CONSTRUCTOR_GENERIC)
        if (static_get(_constructor)[$ "__initialize_static"] != undefined) {
            static_get(_constructor).__initialize_static()
        }
    }
    return static_get(_constructor)
}

/*******************************************************************************/
#endregion –––––––––––––––––––– INITIALIZED_CONSTRUCTOR ––––––––––––––––––––
/*******************************************************************************/

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

/*******************************************************************************/
#region    –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/

#macro INITIALIZED_CONSTRUCTOR INITIALIZED_CONSTRUCTOR_GENERIC

/*******************************************************************************/
#endregion –––––––––––––––––––– ABBREVIATIONS ––––––––––––––––––––
/*******************************************************************************/
