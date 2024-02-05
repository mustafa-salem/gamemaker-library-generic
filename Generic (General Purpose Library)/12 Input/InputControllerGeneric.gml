#macro DEFAULT_FILEPATH_SYSTEM_CONFIG_INPUT_GENERIC "controls.json"

new InputControllerGeneric()

function InputControllerGeneric() constructor {

    static private = {
        system_config : {
            default_filepath : DEFAULT_FILEPATH_SYSTEM_CONFIG_INPUT_GENERIC,
        },
    }

    /*******************************************************************************/
    #region    –––––––––––––––––––– SYSTEM_CONFIG ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function reset_system()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    static reset_system_config = function() {
        input_system_reset()
    }

    #region    –––––––––––––––––––– EXPORT_SYSTEM_CONFIG ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function export_system(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct|String}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static export_system_config = function(arguments = {}) {
        arguments[$ "stringify"] ??= false
        arguments[$ "prettify"]  ??= false
        input_system_export(arguments.stringify, arguments.prettify)
    }

    /// ----------------------------------------------------------------------------
    /// @function export_to_struct_system_config()
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static export_to_struct_system_config = function() {
        return export_system_config()
    }

    /// ----------------------------------------------------------------------------
    /// @function export_to_string_system_config(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Bool} arguments.prettify
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct|String}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static export_to_string_system_config = function(arguments = {}) {
        arguments[$ "stringify"] ??= false
        arguments[$ "prettify"]  ??= false
        input_system_export(arguments.stringify, arguments.prettify)
    }

    /// ----------------------------------------------------------------------------
    /// @function export_system(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.filepath
    /// <parameter_description>
    ///
    /// @parameter {Bool} arguments.prettify
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct|String}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static export_to_file_system_config = function(arguments) {
        if (!is_struct(arguments)) { return }

        var _filepath = arguments[$ "filepath"] ?? private.system_config.default_filepath
        if (!is_string(_filepath)) { return }

        //Export a nice readable string
        var _string = export_to_string_system_config({ prettify : arguments[$ "prettify"] })
        //Save the string into a buffer
        var _buffer = buffer_create(1024, buffer_grow, 1)
        buffer_write(_buffer, buffer_text, _string)
        //Save the buffer to disk
        buffer_save_ext(_buffer, _filepath, 0, buffer_tell(_buffer)) // "controls.json"
        //Clean up the buffer!
        buffer_delete(_buffer)
    }

    #endregion –––––––––––––––––––– EXPORT_SYSTEM_CONFIG ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function verify_system(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|String} arguments.data
    /// <parameter_description>
    ///
    /// @parameter {Bool} arguments.return_error
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Struct|Undefined}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static verify_system_config = function(arguments = {}) {
        arguments[$ "return_error"] ??= true
        return input_system_verify(arguments.data, arguments.return_error)
    }

    #region    –––––––––––––––––––– IMPORT_SYSTEM_CONFIG ––––––––––––––––––––

    /// ----------------------------------------------------------------------------
    /// @function import_system(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {Struct|String} arguments.data
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static import_system_config = function(arguments) {

        verify_system_config()

        input_system_import(arguments.data)
    }

    /// ----------------------------------------------------------------------------
    /// @function import_from_file_system_config(arguments)
    /// ----------------------------------------------------------------------------
    /// @description
    /// <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments
    ///
    /// @parameter {String} arguments.filepath
    /// <parameter_description>
    ///
    /// @parameter {Struct|String} arguments.data
    /// <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type}
    /// <return_description>
    /// ----------------------------------------------------------------------------
    static import_from_file_system_config = function(arguments = {}) {

        var _filepath = arguments[$ "filepath"] ?? private.system_config.default_filepath

        //Load up the Input data if it exists
        if (file_exists(_filepath)) { //
            //Load up a buffer and try to read Input data from it as a string
            var _buffer = buffer_load(_filepath)
            var _incoming_data = buffer_read(_buffer, buffer_text)
            //Always clean up your memory!
            buffer_delete(_buffer)
            //We failed to validate the controls so force a reset of the control scheme
            if (not input_system_verify(_incoming_data)) {
                show_notification("Couldn't load control settings!")
            //Otherwise load as planned
            } else {
                input_system_import(_incoming_data)
            }
        }
    }

    #endregion –––––––––––––––––––– IMPORT_SYSTEM_CONFIG ––––––––––––––––––––

    /*******************************************************************************/
    #endregion –––––––––––––––––––– SYSTEM_CONFIG ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// check_pressed(arguments)
    ///
    /// verb : String or Array<String> or all
    /// player_index : Integer = 0
    /// ----------------------------------------------------------------------------
    static static consume_verb = function(arguments) {
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
    static static check_pressed = function(arguments) {
        input_check_pressed(
            arguments.verb,
            arguments[$ "player_index"]    ?? 0,
            arguments[$ "buffer_duration"] ?? 0
        )
    }

}
