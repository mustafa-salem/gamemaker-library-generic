/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/*

// _source, _singleton_mode = false, _execution_context = self
function DialogueProvider() constructor {

	private : {
		chatterbox : ChatterboxCreate(_source, _singleton_mode, _execution_context),
	}

}

#macro yarn_dialogue_runner yarn_dialogue_runner_generic
#macro yarn_dialogue_runner_generic YarnDialogueRunner


// ChatterboxCreate([filename], [singletonText]), [localScope])
// IsChatterbox(value)

function YarnDialogueRunner() constructor { }

// ChatterboxVariablesClearVisited(node, filename)
// ChatterboxVariablesClearVisitedAll()
// ChatterboxVariablesFind(substring, mode, caseSensitive)

ChatterboxGetVisited(nodeTitle, filename)

ChatterboxLocalizationBuild(yarnPathArray, csvPathArray)
ChatterboxLocalizationLoad(path)
ChatterboxLocalizationClear()

*/


function dialogue_get_content_string(arguments) {
    ChatterboxGetAllContentString(chatterbox, [separator])
}

/// ----------------------------------------------------------------------------
/// @function define_function(arguments)
/// ----------------------------------------------------------------------------
/// @description
/// Defines association between function name used in yarn script and a GML
/// callable.
///
/// ChatterboxAddFunction(name, function)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments { name : String, callable : Function }
/// ----------------------------------------------------------------------------
static define_function = function(arguments) {

}

/// ----------------------------------------------------------------------------
/// @function dialogue_get(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} source
/// <parameter_description>
///
/// @parameter {type} singleton_mode
/// <parameter_description>
///
/// @parameter {type} execution_context
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function dialogue_get(parameters = {}) {
    var _source            = undefined
    var _singleton_mode    = undefined
    var _execution_context = ?? self

    var _dialogue = new DialogueProvider()
}


/******************************************************************************/
#region    –––––––––––––––––––– GENERAL ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
function dialogue_define_function(parameters) {
    ChatterboxAddFunction(parameters.name, parameters.callable)
}


/// ----------------------------------------------------------------------------
/// @function load_source({ source_name : String, filepath : String })
/// @function load_source({ source_name : String, string : String })
/// @function load_source({ source_name : String, buffer : Buffer })
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxLoadFromFile(filename, [aliasName])
/// ChatterboxLoadFromString(filename, string)
/// ChatterboxLoadFromBuffer(filename, buffer)
/// ----------------------------------------------------------------------------
static load_source = function(arguments) {
    ChatterboxLoadFromFile(filename, [aliasName])
    ChatterboxLoadFromString(filename, string)
    ChatterboxLoadFromBuffer(filename, buffer)
}

/// ----------------------------------------------------------------------------
/// @function unload_source({ source_name : String })
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxUnload(filename)
/// ----------------------------------------------------------------------------
static unload_source = function(arguments) {
    ChatterboxUnload(filename)
}

/// ----------------------------------------------------------------------------
/// @function is_source_loaded({ source_name : String })
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxIsLoaded(filename)
/// ----------------------------------------------------------------------------
/// @return {Bool} <return_description>
/// ----------------------------------------------------------------------------
static is_source_loaded = function(arguments) {
    return ChatterboxIsLoaded(filename)
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxAddFindReplace(oldString, newString)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
function_name = function(arguments = {}) {
    ChatterboxAddFindReplace(oldString, newString)
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxSourceNodeExists(sourceName, nodeTitle)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
node_exists = function(arguments = {}) {
    return ChatterboxSourceNodeExists(sourceName, nodeTitle)
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxSourceNodeCount(sourceName)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
get_node_count = function(arguments = {}) {
    return ChatterboxSourceNodeCount(sourceName)
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxSourceGetTags(sourceName)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
get_node_tags = function(arguments = {}) {
    return ChatterboxSourceGetTags(sourceName)
}

/// ----------------------------------------------------------------------------
/// @function function_name(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
///
/// ChatterboxSourceGetNodeMetadata(sourceName, nodeTitle)
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type} <return_description>
/// ----------------------------------------------------------------------------
get_node_metadata = function(arguments = {}) {
    return ChatterboxSourceGetNodeMetadata(sourceName, nodeTitle)
}

/******************************************************************************/
#endregion –––––––––––––––––––– GENERAL ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONTENT ––––––––––––––––––––
/******************************************************************************/

get_content_string = function() {
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

/******************************************************************************/
#endregion –––––––––––––––––––– CONTENT ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– OPTIONS ––––––––––––––––––––
/******************************************************************************/

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

/******************************************************************************/
#endregion –––––––––––––––––––– OPTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
/******************************************************************************/

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
/// @function generic_dialogue_select_option(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} dialogue
/// <parameter_description>
///
/// @parameter {type} option
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_dialogue_select_option(parameters = {}) {
    return ChatterboxSelect(chatterbox, optionIndex)
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

/******************************************************************************/
#endregion –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– VARIABLES ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function generic_dialogue_define_constant(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function defines a global YarnScript constant. This is equivalent to
/// using the '<<constant>>' statement in YarnScript.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name of the constant to be defined.
///
/// @parameter {boolean|number|string} value
/// The value to assign to the constant.
/// ----------------------------------------------------------------------------
function generic_dialogue_define_constant(parameters) {
    ChatterboxVariableSetConstant(parameters.name, parameters.value)
}

/// ----------------------------------------------------------------------------
/// @function generic_dialogue_define_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function defines a global YarnScript variable. This is equivalent to
/// using the '<<declare>>' statement in YarnScript.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name of the variable to be defined.
///
/// @parameter {boolean|number|string} value
/// The value to assign to the variable.
/// ----------------------------------------------------------------------------
function generic_dialogue_define_variable(parameters) {
    ChatterboxVariableSet(parameters.name, parameters.value)
}

/// ----------------------------------------------------------------------------
/// @function generic_dialogue_exists_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {string} variable
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_dialogue_exists_variable(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function generic_dialogue_get_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {string} variable
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {undefined|boolean|number|string}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_dialogue_get_variable(parameters) {
    return ChatterboxVariableGet(parameters.name, undefined)
}

/// ----------------------------------------------------------------------------
/// @function generic_dialogue_set_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function assigns a value to a yarn variable. This is equivalent to
/// using a '<<set>>' statement in a yarn file. If the variable has not been
/// previously declared with the '<<declare>>' statement or the
/// 'generic_dialogue_set_variable' function then it will be created.
///
/// This function may throw an error depending on the library configuration if:
/// * The provided variable name is not a valid yarn variable name.
/// * The provided value is of incorrect type.
/// * The variable has been declared as a constant.
/// * The variable doesn't exist.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name of the variable
///
/// @parameter {boolean|number|string} value
/// The value to set the variable to.
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_dialogue_set_variable(parameters) {
    ChatterboxVariableSet(parameters.name, parameters.value)
}

/// ----------------------------------------------------------------------------
/// @function generic_dialogue_reset_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_dialogue_reset_variable(parameters = {}) {
    return _return
}

/******************************************************************************/
#endregion –––––––––––––––––––– VARIABLES ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– LOCALISATION ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_build_localisation(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function creates a csv file for the targeted source files that can be
/// used for localisation purposes.
/// ----------------------------------------------------------------------------
/// @parameter {string|array<string>} source_filepath
/// <parameter_description>
///
/// @parameter {string|array<string>} localisation_filepath
/// <parameter_description>
/// ----------------------------------------------------------------------------
function dialogue_build_localisation(parameters) {
    ChatterboxLocalizationBuild(parameters.source_filepath, parameters.localisation_filepath)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_load_localisation(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function loads a localisation file.
/// ----------------------------------------------------------------------------
/// @parameter {string} filepath
/// The filepath of the localisation file to load.
/// ----------------------------------------------------------------------------
function dialogue_load_localisation(parameters) {
    ChatterboxLocalizationLoad(parameters.filepath)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_unload_localisation()
/// ----------------------------------------------------------------------------
/// @description
/// This function unloads the current localisation file causing further dialogue
/// to be displayed in the native language.
/// ----------------------------------------------------------------------------
function dialogue_unload_localisation() {
    ChatterboxLocalizationClear()
}

/******************************************************************************/
#endregion –––––––––––––––––––– LOCALISATION ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function Dialogue() constructor {

    /******************************************************************************/
    #region    –––––––––––––––––––– GENERAL ––––––––––––––––––––
    /******************************************************************************/

    static get_node_title = function() {
        ChatterboxGetCurrent(chatterbox)
    }

    /******************************************************************************/
    #endregion –––––––––––––––––––– GENERAL ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– CONTENT ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #endregion –––––––––––––––––––– CONTENT ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– OPTIONS ––––––––––––––––––––
    /******************************************************************************/

    static _ = function() { }

    /******************************************************************************/
    #endregion –––––––––––––––––––– OPTIONS ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
    /******************************************************************************/

    static select_option = function(parameters) {
        parameters.dialogue = self
        generic_dialogue_select_option(parameters)
    }

    self.select_option = method(self, select_option)

    /******************************************************************************/
    #endregion –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– VARIABLES ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #endregion –––––––––––––––––––– VARIABLES ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– LOCALISATION ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #endregion –––––––––––––––––––– LOCALISATION ––––––––––––––––––––
    /******************************************************************************/

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
