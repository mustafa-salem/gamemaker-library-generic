/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_sound_play(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
///
/// @parameter {Type} arguments.parameter_name
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_sound_play(arguments) {
    // FadeIn
    var _voice = VinylPlay(argument0)
    VinylPlay(sound, [loop], [gain=1], [pitch=1], [pan])
    VinylPlayFadeIn(sound, [loop], [targetGain=1], [rate=VINYL_DEFAULT_GAIN_RATE], [pitch=1])
    return SoundGeneric(_voice)
}

/// ----------------------------------------------------------------------------
/// @function generic_sound_fadeout(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function generic_sound_fadeout(parameters = {}) {
    VinylFadeOut(target, [rate=VINYL_DEFAULT_GAIN_RATE])
}

/// ----------------------------------------------------------------------------
/// @function generic_sound_is_shutdown(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// whether a voice is in “shutdown mode”
/// ----------------------------------------------------------------------------
function generic_sound_is_shutdown(parameters = {}) {
    return _return
}

function fade_in_sound_generic(arguments) {

}

function is_playing_sound_generic(arguments) {

}

function pause_sound_generic(arguments) {

}

function resume_sound_generic(arguments) {

}

function generic_sound_stop(arguments) {
    if (_instance == all) { audio_stop_all(); return; }
    audio_stop_sound(_instance)
}

function set_gain_sound_generic(arguments) {

}

/// @function get_pitch_sound_generic(arguments)
/// @description getter/setter for sound pitch
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Real} arguments.value
/// @parameter {Real} arguments.duration_seconds
/// @return {Real|Array<Real>}
function get_pitch_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _targets = arguments.target
        var _return_values = []
        for (var i = 0; i < array_length(_targets); i++) {
            arguments.target = _targets[i]
            var _value = get_pitch_sound_generic(arguments)
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // SET
        if (struct_exists(arguments, "value")) {
            if (struct_exists(arguments, "duration_seconds")) {
                var _current_value = gain_sound_generic({ target : arguments.target })
                var _rate = abs((_current_value - arguments.value) / arguments.duration_seconds)
                VinylPitchTargetSet(arguments.target, arguments.value, _rate)
            } else {
                VinylPitchSet(arguments.target, arguments.value)
            }
        }
        // GET
        return VinylPitchGet(arguments.target)
    }
}

function set_pitch_sound_generic(arguments) {

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// @function exists_sound_generic(arguments)
/// @description
/// @parameter {Struct} arguments
/// @return {Bool|Array<Bool>}
function exists_sound_generic(arguments) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _return_values = []
        for (var i = 0; i < array_length(arguments.target); i++) {
            var _value = unpause_sound_generic({ target : arguments.target[i] })
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // GET
        return VinylPausedGet(arguments.target)
    }
}

/// @function generic_sound_stop(arguments)
function generic_sound_stop(arguments) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        for (var i = 0; i < array_length(arguments.target); i++) {
            var _value = unpause_sound_generic({ target : arguments.target[i] })
        }
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // SET
        if (arguments.target == all) {
            VinylStopAll()
        } else {
            VinylStop(arguments.target)
        }
    }
}

/// @function stop_callback_sound_generic(arguments)
function stop_callback_sound_generic(arguments) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _return_values = []
        for (var i = 0; i < array_length(arguments.target); i++) {
            var _value = unpause_sound_generic({ target : arguments.target[i] })
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        VinylStopCallbackSet(arguments.target)
        // GET
        return VinylStopCallbackGet(arguments.target)
    }
}

/// @function paused_sound_generic(arguments)
/// @description getter/setter for sound.paused
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Bool} arguments.value
/// @return {Bool|Array<Bool>}
function paused_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _return_values = []
        for (var i = 0; i < array_length(arguments.target); i++) {
            var _value = unpause_sound_generic({ target : arguments.target[i] })
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // SET
        if (struct_exists(arguments, "value")) {
            if (arguments.value) { VinylPause(arguments.target) }
            else { VinylResume(arguments.target) }
        }
        // GET
        return VinylPausedGet(arguments.target)
    }
}

/// @function looping_sound_generic(arguments)
/// @description getter/setter for sound.looping
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Bool} arguments.value
/// @return {Bool|Array<Bool>}
function looping_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _return_values = []
        for (var i = 0; i < array_length(arguments.target); i++) {
            var _value = unpause_sound_generic({ target : arguments.target[i] })
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        if (struct_exists(arguments, "value")) { VinylLoopSet(arguments.target, arguments.value) }
        return VinylLoopGet(arguments.target)
    }
}

/// @function persistent_sound_generic(arguments)
/// @description getter/setter for sound.persistent
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Bool} arguments.value
/// @return {Bool|Array<Bool>}
function persistent_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _return_values = []
        for (var i = 0; i < array_length(arguments.target); i++) {
            var _value = unpause_sound_generic({ target : arguments.target[i] })
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        if (struct_exists(arguments, "value")) { VinylPersistentSet(arguments.target, arguments.value) }
        return VinylPersistentGet(arguments.target)
    }
}

/// @function gain_sound_generic(arguments)
/// @description getter/setter for sound gain
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Real} arguments.value
/// @parameter {Real} arguments.duration_seconds
/// @return {Real|Array<Real>}
function gain_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _targets = arguments.target
        var _return_values = []
        for (var i = 0; i < array_length(_targets); i++) {
            arguments.target = _targets[i]
            var _value = gain_sound_generic(arguments)
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // SET
        if (struct_exists(arguments, "value")) {
            if (struct_exists(arguments, "duration_seconds")) {
                var _current_value = gain_sound_generic({ target : arguments.target })
                var _rate = abs((_current_value - arguments.value) / arguments.duration_seconds)
                VinylGainTargetSet(arguments.target, arguments.value, _rate)
            } else {
                VinylGainSet(arguments.target, arguments.value)
            }
        }
        // GET
        return VinylGainGet(arguments.target)
    }
}

/// @function playback_position_sound_generic(arguments)
/// @description getter/setter for sound pitch
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Real} arguments.value
/// @parameter {Real} arguments.duration_seconds
/// @return {Real|Array<Real>}
function playback_position_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _targets = arguments.target
        var _return_values = []
        for (var i = 0; i < array_length(_targets); i++) {
            arguments.target = _targets[i]
            var _value = playback_position_sound_generic(arguments)
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // SET
        if (struct_exists(arguments, "value")) {
            VinylPositionSet(arguments.target, arguments.value)
        }
        // GET
        return VinylPositionGet(arguments.target)
    }
}

/// @function length_sound_generic(arguments)
/// @description getter/setter for sound pitch
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Real} arguments.value
/// @parameter {Real} arguments.duration_seconds
/// @return {Real|Array<Real>}
function length_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _targets = arguments.target
        var _return_values = []
        for (var i = 0; i < array_length(_targets); i++) {
            arguments.target = _targets[i]
            var _value = length_sound_generic(arguments)
            array_push(_return_values, _value)
        }
        return _return_values
    // SINGLE_TARGET
    } else {
        // SoundGeneric -> Voice
        if (is_struct(arguments.target)) { arguments.target = arguments.target.voice }
        // GET
        return VinylLengthGet(arguments.target)
    }
}


/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function scr_music_mute()
{
    if (scr_debug() && keyboard_check_pressed(ord("M")) && ENCOUNTER_THEME_SOUND_INSTANCE.is_playing())
    {
        if (ENCOUNTER_THEME_SOUND_INSTANCE.is_playing())
            ENCOUNTER_THEME_SOUND_INSTANCE.pause()
        else
            ENCOUNTER_THEME_SOUND_INSTANCE.resume()
    }
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– REGION_NAME ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function Sound() {

}

function SoundGeneric() {

    static stop = function() {

    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Type} arguments.sound
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.gain
    /// <parameter_description>
    ///
    /// @parameter {Type} arguments.pitch
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct.SoundInstanceGeneric}
    /// The struct representing the created sound instance.
    /// ----------------------------------------------------------------------------
    static play = function(arguments) {
        return new SoundInstanceGeneric()
    }
}
