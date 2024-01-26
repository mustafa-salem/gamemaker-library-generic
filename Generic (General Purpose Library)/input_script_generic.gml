#macro input_controller InputControllerGeneric

new InputControllerGeneric()

function InputControllerGeneric() constructor {

    /// ----------------------------------------------------------------------------
    /// check_pressed(arguments)
    ///
    /// verb : String or Array<String> or all
    /// player_index : Integer = 0
    /// ----------------------------------------------------------------------------
    static consume_verb = function(arguments) {
        input_verb_consume(
            arguments.verb,
            arguments[$ "player_index"] ?? 0
        )
    }

    /// ----------------------------------------------------------------------------
    /// check_pressed(arguments)
    ///
    /// verb : String or Array<String> or all
    /// player_index : Integer
    /// buffer_duration : Integer = 0
    /// buffer_duration_frames
    /// buffer_duration_seconds
    /// buffer_duration_milliseconds
    /// ----------------------------------------------------------------------------
    static check_pressed = function(arguments) {
        input_check_pressed(
            arguments.verb,
            arguments[$ "player_index"]    ?? 0,
            arguments[$ "buffer_duration"] ?? 0
        )
    }

}
