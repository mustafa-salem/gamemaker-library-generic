/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– YARN_LINE_PROVIDER ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#macro yarn_line_provider yarn_line_provider_generic
#macro yarn_line_provider_generic YarnLineProviderGeneric

function YarnLineProviderGeneric(_filename, _singleton_mode = false, _scope = self) constructor {

	private : {
		chatterbox : ChatterboxCreate(_filename, _singleton_mode, _scope),
	}

    /*******************************************************************************/
    #region    –––––––––––––––––––– CONTENT_GETTERS ––––––––––––––––––––
    /*******************************************************************************/

    get_scribble_lines = function() {
        var _string = ""
        for (var i = 0; i < get_line_count(); i++) {

			// SPEECH
			var _speech = get_line_speech(i)

			// SPEAKER
			var _speaker = ""
            var _speaker_name = get_line_speaker(i)
            var _speaker_data = get_line_speaker_data(i)
			if (_speaker_name != "") {
				if (_speaker_data != "") {
					_speaker = $"[speaker,{_speaker_name},{_speaker_data}]"
				} else {
					_speaker = $"[speaker,{_speaker_name}]"
				}
			}

			// BEFORE_AFTER_TAGS
			var _before = ""
			var _after = ""
			var _tags = get_line_metadata(i)
			for (var j = 0; j < array_length(_tags); j++) {
				if (string_count("before:", _tags[j]) > 0) {
					_before = string_replace(_tags[j], "before:", "")
				} else if (string_count("after:", _tags[j]) > 0) {
					_after = string_replace(_tags[j], "after:", "")
				}
			}

            _string += $"{_speaker}{_before}{_speech}{_after}\n"
        }

        return _string
    }

    /// ----------------------------------------------------------------------------
    /// @function get_line({ index : Integer })
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    get_line = function(_index) {
        return ChatterboxGetContent(private.chatterbox, _index)
    }

    get_lines = function(_separator = "\n") {
        return ChatterboxGetAllContentString(private.chatterbox, _separator)
    }

    get_line_metadata = function(_content_index) {
        return ChatterboxGetContentMetadata(chatterbox, _content_index)
    }

    get_line_count = function() {
        return ChatterboxGetContentCount(private.chatterbox)
    }

    get_line_speech = function(_content_index, _default = "") {
        return ChatterboxGetContentSpeech(private.chatterbox, _content_index, _default)
    }

    get_line_speaker = function(_content_index, _default = "") {
        return ChatterboxGetContentSpeaker(private.chatterbox, _content_index, _default)
    }

    get_line_speaker_data = function(_content_index, _default = "") {
        return ChatterboxGetContentSpeakerData(private.chatterbox, _content_index, _default)
    }

    get_line_struct_array = function() {
        return ChatterboxGetContentArray(private.chatterbox)
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CONTENT_GETTERS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– OPTION_GETTERS ––––––––––––––––––––
    /*******************************************************************************/

	/// ----------------------------------------------------------------------------
	/// @function get_option_content(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments { option_index : Integer }
	/// ----------------------------------------------------------------------------
	/// @return {String} Content string of the option with the given index.
	/// ----------------------------------------------------------------------------
    get_option_content = function(arguments) {
        return ChatterboxGetOption(private.chatterbox, arguments.option_index)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments { option_index : Integer }
	/// ----------------------------------------------------------------------------
	/// @return {String} Metadata string of the option with the given index.
	/// ----------------------------------------------------------------------------
    get_option_metadata = function(arguments) {
        return ChatterboxGetOptionMetadata(private.chatterbox, arguments.option_index)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description
	/// Checks whether the option’s if-statement passed. If the option had no
	/// if-statement associated with it then this function will return true.
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments { option_index : Integer }
	/// ----------------------------------------------------------------------------
	/// @return {Boolean} Whether the option’s if-statement passed.
	/// ----------------------------------------------------------------------------
    is_option_condition_satisfied = function(arguments) {
        return ChatterboxGetOptionConditionBool(private.chatterbox, arguments.option_index)
    }

	/// ----------------------------------------------------------------------------
	/// @function get_option_chosen_count(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments { option_index : Integer }
	/// ----------------------------------------------------------------------------
	/// @return {Integer} How many times the option has been chosen.
	/// ----------------------------------------------------------------------------
    get_option_chosen_count = function(arguments) {
        return ChatterboxGetOptionChosen(private.chatterbox, arguments.option_index)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {type} <return_description>
	/// ----------------------------------------------------------------------------
    get_option_count = function() {
        return ChatterboxGetOptionCount(private.chatterbox)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {type} <return_description>
	/// ----------------------------------------------------------------------------
    get_option_array = function() {
        return ChatterboxGetOptionArray(private.chatterbox)
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– OPTION_GETTERS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– FLOW_CONTROL ––––––––––––––––––––
    /*******************************************************************************/

	/// ----------------------------------------------------------------------------
	/// @function jump_to_node({ source_name : [String], node_title : String })
	/// ----------------------------------------------------------------------------
	/// @description
	/// Jumps to the node <node_title> in the source <source_name>.
	/// If source_name isn't specified the current source is used.
	///
	/// Native Chatterbox Functions
	/// * ChatterboxJump(chatterbox, nodeTitle, [filename])
	/// ----------------------------------------------------------------------------
    jump_to_node = function(arguments) {
		var _source_name = arguments[$ "source_name"] ?? get_current_source_name()
		var _node_title  = arguments[$ "node_title"]
        ChatterboxJump(private.chatterbox, _node_title, _source_name)
    }

	/// ----------------------------------------------------------------------------
	/// @function hop_to_node({ source_name : [String], node_title : String })
	/// ----------------------------------------------------------------------------
	/// @description
	/// Pushes the node and node position to an internal stack. Then jumps to
	/// the node <node_title> in the source <source_name>. You can return to the
	/// current node and node position by calling hop_back.
	/// If source_name isn't specified the current source is used.
	///
	/// Native Chatterbox Functions
	/// * ChatterboxHop(chatterbox, nodeTitle, [filename])
	/// ----------------------------------------------------------------------------
    hop_to_node = function(arguments) {
		var _source_name = arguments[$ "source_name"] ?? get_current_source_name()
		var _node_title  = arguments[$ "node_title"]
        ChatterboxHop(private.chatterbox, _node_title, _source_name)
    }

	/// ----------------------------------------------------------------------------
	/// @function hop_back()
	/// ----------------------------------------------------------------------------
	/// @description
	/// Jumps back to the position before hop_to_node was called.
	///
	/// Native Chatterbox Functions
	/// * ChatterboxHopBack(chatterbox)
	/// ----------------------------------------------------------------------------
    hop_back = function() {
        ChatterboxHopBack(private.chatterbox)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name({ option_index : UnsignedInteger })
	/// ----------------------------------------------------------------------------
	/// @description
	///
	///
	/// Native Chatterbox Functions
	/// * ChatterboxSelect(chatterbox, optionIndex)
	/// ----------------------------------------------------------------------------
    select_option = function(arguments) {
		var _option_index = arguments.option_index
        ChatterboxSelect(private.chatterbox, _option_index)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {type} <return_description>
	/// ----------------------------------------------------------------------------
    wait = function() {
        ChatterboxWait(private.chatterbox)
    }

	/// ----------------------------------------------------------------------------
	/// @function is_waiting()
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	///
	///
	/// Native Chatterbox Functions
	/// * ChatterboxIsWaiting(chatterbox)
	/// ----------------------------------------------------------------------------
	/// @return {Boolean}
	/// ----------------------------------------------------------------------------
    is_waiting = function() {
        ChatterboxIsWaiting(private.chatterbox)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {type} <return_description>
	/// ----------------------------------------------------------------------------
    is_stopped = function() {
        ChatterboxIsStopped(private.chatterbox)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {type} <return_description>
	/// ----------------------------------------------------------------------------
    resume = function() {
        ChatterboxContinue(private.chatterbox)
    }

	/// ----------------------------------------------------------------------------
	/// @function function_name(arguments)
	/// ----------------------------------------------------------------------------
	/// @description <function_description>
	/// ----------------------------------------------------------------------------
	/// @parameter {Struct} arguments <parameter_description>
	/// ----------------------------------------------------------------------------
	/// @return {type} <return_description>
	/// ----------------------------------------------------------------------------
    fast_foreward = function() {
        ChatterboxFastForward(private.chatterbox)
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– FLOW_CONTROL ––––––––––––––––––––
    /*******************************************************************************/

}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– YARN_LINE_PROVIDER ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
