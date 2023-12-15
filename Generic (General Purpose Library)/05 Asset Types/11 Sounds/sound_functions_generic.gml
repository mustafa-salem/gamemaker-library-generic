// FadeIn
function play_sound_generic(arguments = {}) {
    var _voice = VinylPlay(argument0)
    VinylPlay(sound, [loop], [gain=1], [pitch=1], [pan])
    VinylPlayFadeIn(sound, [loop], [targetGain=1], [rate=VINYL_DEFAULT_GAIN_RATE], [pitch=1])
    return SoundGeneric(_voice)
}

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

/// @function stop_sound_generic(arguments)
function stop_sound_generic(arguments) {
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

/// @function pitch_sound_generic(arguments)
/// @description getter/setter for sound pitch
/// @parameter {Struct} arguments
/// @parameter {SoundGeneric|Array<SoundGeneric>|String|Array<String>} arguments.target
/// @parameter {Real} arguments.value
/// @parameter {Real} arguments.duration_seconds
/// @return {Real|Array<Real>}
function pitch_sound_generic(arguments = {}) {
    // MULTI_TARGET
    if (is_array(arguments.target)) {
        var _targets = arguments.target
        var _return_values = []
        for (var i = 0; i < array_length(_targets); i++) {
            arguments.target = _targets[i]
            var _value = pitch_sound_generic(arguments)
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
            var _value = pitch_sound_generic(arguments)
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
            var _value = pitch_sound_generic(arguments)
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
