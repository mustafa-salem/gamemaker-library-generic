function SoundInstanceGeneric() constructor {

    static stop = function() {

    }

    // gain
    static set_volume = function(arguments) {

    }

    // pitch
    static set_speed = function(arguments) {

    }

}


/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function SoundAssetGeneric() constructor {

}

function SoundGeneric(_voice) constructor {

    private = {
        voice : _voice,
    }

    voice = function(arguments = {}) {
        if (arguments.value) { private.voice = arguments.value }
        return private.voice
    }

    /// @function stop(arguments)
    /// @description self-targeting exists_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Bool}
    exists = function(arguments = {}) {
        arguments.target = self
        return exists_sound_generic(arguments)
    }

    /// @function stop(arguments)
    /// @description self-targeting stop_sound_generic
    /// @parameter {Struct} arguments
    stop = function(arguments = {}) {
        arguments.target = self
        stop_sound_generic(arguments)
    }

    /// @function stop_callback(arguments)
    /// @description self-targeting stop_callback_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Struct}
    stop_callback = function(arguments = {}) {
        arguments.target = self
        return stop_callback_sound_generic(arguments)
    }

    /// @function paused(arguments)
    /// @description self-targeting paused_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Bool}
    paused = function(arguments = {}) {
        arguments.target = self
        return paused_sound_generic(arguments)
    }

    /// @function stop(arguments)
    /// @description self-targeting looping_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Bool}
    looping = function(arguments = {}) {
        arguments.target = self
        return looping_sound_generic(arguments)
    }

    /// @function stop(arguments)
    /// @description self-targeting persistent_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Bool}
    persistent = function(arguments = {}) {
        arguments.target = self
        return persistent_sound_generic(arguments)
    }

    /// @function gain(arguments)
    /// @description self-targeting gain_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Real}
    gain = function(arguments = {}) {
        arguments.target = self
        return gain_sound_generic(arguments)
    }

    /// @function pitch(arguments)
    /// @description self-targeting get_pitch_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Real}
    pitch = function(arguments = {}) {
        arguments.target = self
        return get_pitch_sound_generic(arguments)
    }

    /// @function length(arguments)
    /// @description self-targeting length_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Real}
    length = function(arguments = {}) {
        arguments.target = self
        return length_sound_generic(arguments)
    }

    /// @function playback_position(arguments)
    /// @description self-targeting playback_position_sound_generic
    /// @parameter {Struct} arguments
    /// @return {Real}
    playback_position = function(arguments = {}) {
        arguments.target = self
        return playback_position_sound_generic(arguments)
    }

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
