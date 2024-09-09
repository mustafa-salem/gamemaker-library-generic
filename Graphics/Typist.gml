function typist_create() {
    return new Typist()
}

function Typist() {

    private = {
        typist_instance : scribble_typist([perLine]),
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    fade_in = function(parameters = {}) {
        private.typist_instance.in(speed, smoothness)
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    fade_out = function(parameters = {}) {
        private.typist_instance.out(speed, smoothness, [backwards])
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @descriptio
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {struct} parameters
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {number}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    get_position = function(parameters = {}) {
        return private.typist_instance.get_position()
    }

    /// ----------------------------------------------------------------------------
    /// @function reset_animation()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    reset_animation = function() {
        private.typist_instance.reset()
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {struct} parameters
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    ease = function(parameters = {}) {
        private.typist_instance.ease(easeMethod, dx, dy, xscale, yscale, rotation, alphaDuration)
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {struct} parameters
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    get_state = function(parameters = {}) {
        return private.typist_instance.get_state()
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {struct} parameters
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_paused = function(parameters = {}) {
        private.typist_instance.pause()
        private.typist_instance.unpause()
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function is_paused()
    /// ----------------------------------------------------------------------------
    /// @return {boolean}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    get_paused = function() {
        return private.typist_instance.get_paused()
    }

    #region    –––––––––––––––––––– PAUSE ––––––––––––––––––––

    #endregion –––––––––––––––––––– PAUSE ––––––––––––––––––––

    #region    –––––––––––––––––––– SKIPPING ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function set_skip_animation(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} skipping_animation
    /// <parameter_description>
    ///
    /// @parameter {type} ignore_pause
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_skip_animation = function(parameters = {}) {
        if (parameters.ignore_pause) {
            private.typist_instance.skip(parameters.skipping_animation)
        } else {
            private.typist_instance.skip_to_pause(parameters.skipping_animation)
        }
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function get_skip_animation()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {boolean} Whether the typist is skipping typewriter animation.
    /// ----------------------------------------------------------------------------
    get_skip_animation = function() {
        return private.typist_instance.get_skip()
    }

    #endregion –––––––––––––––––––– SKIPPING ––––––––––––––––––––

    #region    –––––––––––––––––––– SOUND ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    sync_to_sound = function(parameters = {}) {
        private.typist_instance.sync_to_sound(soundInstance)
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {struct} parameters
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    sound = function(parameters = {}) {
        private.typist_instance.sound(soundArray, overlap, pitchMin, pitchMax. [gain=1])
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {struct} parameters
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// @parameter {type} parameters.parameter_name
    /// <parameter_description>
    ///
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    sound_per_char = function(parameters = {}) {
        private.typist_instance.sound_per_char(soundArray, pitchMin, pitchMax, [exceptionString], [gain=1])
        return _return
    }

    #endregion –––––––––––––––––––– SOUND ––––––––––––––––––––

    #region    –––––––––––––––––––– DELAY ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_ignore_delay()
    /// ----------------------------------------------------------------------------
    /// @return {boolean}
    /// Whether the typewriter is set to ignore character and tag delays.
    /// ----------------------------------------------------------------------------
    get_ignore_delay = function() {
        return private.typist_instance.get_ignore_delay()
    }

    /// ----------------------------------------------------------------------------
    /// @function set_ignore_delay(parameters)
    /// ----------------------------------------------------------------------------
    /// @parameter {boolean} ignore_delay
    /// Whether the typewriter should ignore character and tag delays.
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_ignore_delay = function(parameters = {}) {
        private.typist_instance.ignore_delay(parameters.ignore_delay)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {string} character
    /// <parameter_description>
    ///
    /// @parameter {number} delay_frames
    /// <parameter_description>
    ///
    /// @parameter {number} delay_milliseconds
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_character_delay = function(parameters = {}) {
        for (var i = 0; i < ; i++) {
            if (<condition>) {
                private.typist_instance.character_delay_add(character, delay)
            } else if (<condition>) {
                private.typist_instance.character_delay_remove(character)
            } else {
                private.typist_instance.character_delay_clear()
            }
        }
        return
    }

    #endregion –––––––––––––––––––– DELAY ––––––––––––––––––––

    #region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {callable|undefined} callable
    /// The function that will be executed once per character as that character is revealed
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_per_character_callable = function(parameters = {}) {
        private.typist_instance.function_per_char(parameters.callable)
        return self
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {callable|undefined} callable
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_on_complete_callable = function(parameters = {}) {
        private.typist_instance.function_on_complete(parameters.callable)
        return self
    }

    #endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– EXECUTION_SCOPE ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_execution_scope()
    /// ----------------------------------------------------------------------------
    /// @return {mixed}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    get_execution_scope = function() {
        return private.typist_instance.get_execution_scope()
    }

    /// ----------------------------------------------------------------------------
    /// @function set_execution_scope(parameters)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {mixed} execution_scope
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {struct.Typist} self
    /// ----------------------------------------------------------------------------
    set_execution_scope = function(parameters = {}) {
        private.typist_instance.execution_scope(parameters.execution_scope)
        return self
    }

    #endregion –––––––––––––––––––– EXECUTION_SCOPE ––––––––––––––––––––

    #region    –––––––––––––––––––– TEXT_ELEMENT ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function get_text_element()
    /// ----------------------------------------------------------------------------
    /// @return {struct.TextElement}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    get_text_element = function() {
        return private.typist_instance.get_text_element()
    }

    #endregion –––––––––––––––––––– TEXT_ELEMENT ––––––––––––––––––––

}
