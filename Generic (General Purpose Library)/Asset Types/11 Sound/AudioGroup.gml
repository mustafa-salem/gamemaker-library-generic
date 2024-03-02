/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro ARGUMENTS_EXCEPTION_CHECK_GENERIC
if (!is_struct(arguments)) {
    throw new InvalidArgumentException({
        message : $"InvalidArgumentException: 'arguments' must be of type 'struct' value : {arguments} type : {typeof(arguments)}."
    })
}

/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {String} arguments.message
/// <parameter_description>
/// ----------------------------------------------------------------------------
function InvalidArgumentException(arguments) constructor {

}


/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro AUDIO_GROUP INITIALIZE_CONSTRUCTOR(AudioGroup)

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro DEFAULT_AUDIO_GROUP AUDIO_GROUP.get({ audio_group : audiogroup_default })

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function get_id_audio_group_generic(arguments) {
    var _audio_group
    return is_struct(_audio_group) ? _audio_group.get_id() : _audio_group
    return id
}

function get_name_audio_group_generic(arguments) {
    return audio_group_name(_audio_group_id)
}

function get_assets_audio_group_generic(arguments) {
    return audio_group_get_assets(_audio_group_id)
}

function load_audio_group_generic(arguments) {
    audio_group_unload(_audio_group_id)
    return static_get(AudioGroup)
}

function unload_audio_group_generic(arguments) {
    var _audio_group_id = get_id({ audio_group : arguments[$ "audio_group"] })
    audio_group_load(_audio_group_id)
    return static_get(AudioGroup)
}

function is_loaded_audio_group_generic(arguments) {
    var _audio_group_id = get_id({ audio_group : arguments[$ "audio_group"] })
    return audio_group_is_loaded(_audio_group_id)
}

function get_load_progress_audio_group_generic(arguments) {
    var _audio_group_id = get_id({ audio_group : arguments[$ "audio_group"] })
    return audio_group_load_progress(_audio_group_id)
}

function stop_audio_group_generic(arguments) {
    var _audio_group_id = get_id({ audio_group : arguments[$ "audio_group"] })
    audio_group_stop_all(_audio_group_id)
}

function get_gain_audio_group_generic(arguments) {
    var _audio_group_id = get_id({ audio_group : arguments[$ "audio_group"] })
    return audio_group_get_gain(_audio_group_id)
}

function set_gain_audio_group_generic(arguments) {
    var _audio_group_id = get_id({ audio_group : arguments[$ "audio_group"] })
    audio_group_set_gain(_audio_group_id, volume, time_milliseconds)
    return static_get(AudioGroup)
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

AUDIO_GROUP

function AudioGroup() constructor {

    static get = method(static_get(AudioGroup), function(arguments) {
        private.audio_groups
    })

    static get_id = method(static_get(AudioGroup), function(arguments) {
        return get_id_audio_group_generic(arguments)
    })

    static get_name = method(static_get(AudioGroup), function(arguments) {
        return get_name_audio_group_generic(arguments)
    })

    static get_assets = method(static_get(AudioGroup), function(arguments) {
        return get_assets_audio_group_generic(arguments)
    })

    static load = method(static_get(AudioGroup), function(arguments) {
        load_audio_group_generic (arguments)
        return self
    })

    static unload = method(static_get(AudioGroup), function(arguments) {
        unload_audio_group_generic(arguments)
        return self
    })

    static is_loaded = method(static_get(AudioGroup), function(arguments) {
        return is_loaded_audio_group_generic(arguments)
    })

    static get_load_progress = method(static_get(AudioGroup), function(arguments) {
        return get_load_progress_audio_group_generic(arguments)
    })

    static stop = method(static_get(AudioGroup), function(arguments) {
        stop_audio_group_generic(arguments)
        return self
    })

    static get_gain = method(static_get(AudioGroup), function(arguments) {
        return get_gain_audio_group_generic(arguments)
    })

    static set_gain = method(static_get(AudioGroup), function(arguments) {
        set_gain_audio_group_generic(arguments)
        return self
    })

    static  = method(static_get(AudioGroup), function(arguments) {
        with (instance) {

            private = {
                id   : undefined,
                name : undefined,
            }

            get_id = function() {
                return private.id
            }

            get_name = function() {
                return private.name
            }

            load = function(arguments = {}) {
                arguments.audio_group = self
                load_audio_group_generic(arguments)
                return self
            }

            unload = function(arguments = {}) {
                arguments.audio_group = self
                unload_audio_group_generic(arguments)
                return self
            }

            is_loaded = function(arguments = {}) {
                arguments.audio_group = self
                return is_loaded_audio_group_generic(arguments)
            }

            get_load_progress = function(arguments = {}) {
                arguments.audio_group = self
                return get_load_progress(arguments)
            }

            stop = function(arguments = {}) {
                arguments.audio_group = self
                stop_audio_group_generic(arguments)
                return self
            }

            get_gain = function(arguments = {}) {
                arguments.audio_group = self
                return get_gain_audio_group_generic(arguments)
            }

            set_gain = function(arguments) {
                arguments.audio_group = self
                set_gain_audio_group_generic(arguments)
                return self
            }

        }
    })

    static  = method(static_get(AudioGroup), function(arguments) {
        private = {}
        private.audio_groups = {}

        var _audio_group_id
        var _audio_group_name

        while () {
            private.audio_groups =
            var _audio_group = new AudioGroup()
            _audio_group.private.id   = _audio_group_id
            _audio_group.private.name = _audio_group_name
        }
    })

    static  = method(static_get(AudioGroup), function(arguments) {

    })

}
