/******************************************************************************/
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

SOUND_INSTANCE

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/

SOUND_INSTANCE

function SoundInstance() constructor {

    voice = function(arguments = {}) {
        if (arguments.value) { private.voice = arguments.value }
        return private.voice
    }

    /// @function stop(arguments)
    /// @description self-targeting sound_exists
    /// @parameter {Struct} arguments
    /// @return {Bool}
    exists = function(arguments = {}) {
        arguments.target = self
        return sound_exists(arguments)
    }

    /// @function stop(arguments)
    /// @description self-targeting sound_stop
    /// @parameter {Struct} arguments
    stop = function(arguments = {}) {
        arguments.target = self
        sound_stop(arguments)
    }

    /// @function stop_callback(arguments)
    /// @description self-targeting sound_set_stop_callback
    /// @parameter {Struct} arguments
    /// @return {Struct}
    stop_callback = function(arguments = {}) {
        arguments.target = self
        return sound_set_stop_callback(arguments)
    }

    /// @function paused(arguments)
    /// @description self-targeting sound_is_paused
    /// @parameter {Struct} arguments
    /// @return {Bool}
    paused = function(arguments = {}) {
        arguments.target = self
        return sound_is_paused(arguments)
    }

    /// @function stop(arguments)
    /// @description self-targeting sound_is_looping
    /// @parameter {Struct} arguments
    /// @return {Bool}
    looping = function(arguments = {}) {
        arguments.target = self
        return sound_is_looping(arguments)
    }

    /// @function stop(arguments)
    /// @description self-targeting sound_is_persistent
    /// @parameter {Struct} arguments
    /// @return {Bool}
    persistent = function(arguments = {}) {
        arguments.target = self
        return sound_is_persistent(arguments)
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
    /// @description self-targeting sound_get_pitch
    /// @parameter {Struct} arguments
    /// @return {Real}
    pitch = function(arguments = {}) {
        arguments.target = self
        return sound_get_pitch(arguments)
    }

    /// @function length(arguments)
    /// @description self-targeting sound_get_length
    /// @parameter {Struct} arguments
    /// @return {Real}
    length = function(arguments = {}) {
        arguments.target = self
        return sound_get_length(arguments)
    }

    /// @function playback_position(arguments)
    /// @description self-targeting sound_get_track_position
    /// @parameter {Struct} arguments
    /// @return {Real}
    playback_position = function(arguments = {}) {
        arguments.target = self
        return sound_get_track_position(arguments)
    }

}

/******************************************************************************/
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/******************************************************************************/
