/// load_source
/// define_function
/// unload_source
/// is_source_loaded
/// get_line
// get_content_string
// get_lines
// get_line_struct_array

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

// Feather disable all

// Whether chatterboxes should default to singleton mode. This is useful to most RPGs where lines
// of dialogue arrive one at a time. More modern narrative games tend to deliver larger chunks of
// text and, as such, singleton mode is less useful for those sorts of games.
#macro CHATTERBOX_DEFAULT_SINGLETON  true

// Root folder in Included Files to look in for Chatterbox files.
#macro CHATTERBOX_INCLUDED_FILES_SUBDIRECTORY  ""

// Whether to allow scripts to be added as Chatterbox functions. This is potentially insecure but
// also very convenient.
#macro CHATTERBOX_ALLOW_SCRIPTS  true

// Whether Chatterbox functions should be executed using an array of parameters.
#macro CHATTERBOX_FUNCTION_ARRAY_ARGUMENTS  true

// Whether to enter into a "wait" state before options are presented when using singleton
// chatterboxes. This is helpful for games where you want to visually replace dialogue with a
// series of options for the player to choose from.
#macro CHATTERBOX_SINGLETON_WAIT_BEFORE_OPTION  false

// Whether a chatterbox should enter a "wait" state before marking the chatterbox as stopped. This
// makes implementing dialogue boxes that automatically destroy themselves a lot easier.
#macro CHATTERBOX_WAIT_BEFORE_STOP  true

// Whether to add rejected (failed) options to the list of chooseable options. The default setting
// is <true> which will show failed options in the list and therefore requires that you filter
// those options yourself. This is useful for games like Fallout 3 which show you options that you
// could have taken if you had e.g. higher charisma. Set this option to <false> if you deliberately
// want to hide every failed option (which is a lot simpler to implement!).
#macro CHATTERBOX_SHOW_REJECTED_OPTIONS  true

// Whether to show extra debug information. This is useful to narrow down problems that you might
// run into.
#macro CHATTERBOX_VERBOSE  false

// Replaces backslashes \ in Chatterbox aliases with front slashes /. This improves consistency
// when accessing Included Files in folder across different platforms.
#macro CHATTERBOX_REPLACE_ALIAS_BACKSLASHES  true

// Whether to allow use of keyword operators. Setting this macro to <true> will enable use of the
// following operators as keywords:
//    and = &&
//    le  = <
//    lt  = <
//    ge  = >
//    gt  = >
//    or  = ||
//    lte = <=
//    gte = >=
//    leq = <=
//    geq = >=
//    eq  = ==
//    is  = ==
//    neq = !=
//    to  = =
//    not = !
#macro CHATTERBOX_KEYWORD_OPERATORS  true

// Whether nodes without an explicit <<stop>> or <<hopback>> instruct at the end should default
// to <<hopback>>. Legacy behaviour (pre-2.7) is to set this to <false>
#macro CHATTERBOX_END_OF_NODE_HOPBACK  true

// Action mode controls how <<actions>> are processed by Chatterbox
// There are three possible values:
//
// CHATTERBOX_ACTION_MODE = 0
// This is the officially recommended behaviour. The full contents of the action (everything
// between << and >>) are passed as a string to a function for parsing and execution by the
// developer (you). I think this behaviour is stupid but I've included it here because technically
// that is what the YarnScript specification says. You can set the function that receives the
// action string by setting CHATTERBOX_ACTION_FUNCTION. Exactly what syntax you use for
// actions is therefore completely up to you.
//
// CHATTERBOX_ACTION_MODE = 1
// Chatterbox will treat actions as expressions to be executed in a similar manner to in-line
// expressions. This is covenient if you want to treat actions as little snippets of code
// that Chatterbox can run. Syntax for actions becomes the same as in-line expressions, which
// is broadly similar to "standard" GML syntax. Functions that you wish to execute must be added
// by calling ChatterboxAddFunction().
//
// An example would be: <<giveItem("amulet", 1)>>
//
//
// CHATTERBOX_ACTION_MODE = 2
// Chatterbox will treat actions as expressions with a greatly simplified syntax. This is
// useful for writers and narrative designers who are less familiar with the particulars of
// coding and instead want to use a simple syntax to communicate with the underlying GameMaker
// application. The action is sliced into arguments using spaces as delimiters. The first
// token in the action is the name of the function call, as added by ChatterboxAddFunction().
// Subsequent tokens are passed to the function call with each token being a function parameter.
// All parameters are passed as strings. If a parameter needs to contain a space then you may
// enclose the string in " double quote marks.
//
// An example, analogous to the example above, would be: <<giveItem amulet 1>>

#macro CHATTERBOX_ACTION_MODE      1           //See above
#macro CHATTERBOX_ACTION_FUNCTION  (undefined) //The function to receive <<action>> contents. This will only be called if CHATTERBOX_ACTION_MODE is 0

// Chatterbox offers three helper functions to assist with parsing content strings as dialogue:
//   ChatterboxGetContentSpeech()
//   ChatterboxGetContentSpeaker()
//   ChatterboxGetContentSpeakerData()
//
// A content string must be formatted in a specific way for Chatterbox's helper functions to
// work correctly:
//
//   Speaker Name: The words that the speaker is saying, called "speech" in Chatterbox.
//
// Calling ChatterboxGetContentSpeaker() with the above string as the input will output "Speaker Name".
// Calling ChatterboxGetContentSpeech() will output everything after the colon, though without the
// leading whitespace between the colon and "The".
//
// Chatterbox also offers "speaker data". This is an additional string that can be attached to
// a speaker for a content string. The formatting looks like this:
//
//   Speaker Name[additional speaker data]: The words that the speaker is saying, called "speech" in Chatterbox.
//
// Calling ChatterboxGetContentSpeakerData() will return "additional speaker data" in this case. For
// more complex situations you may want to perform additional parsing on the speaker data yourself.
//
// The following macros control what substrings are used to split speaker and speech, and what
// substrings separate the speaker data from the speaker.

#macro CHATTERBOX_SPEAKER_DELIMITER   ":"  //Character that separates speaker (and speaker data) from speech. This can be any arbitrary string, potentially composed of multiple characters
#macro CHATTERBOX_SPEAKER_DATA_START  "["  //Character that indicates where the speaker data string starts. This can be any arbitrary string, potentially composed of multiple characters
#macro CHATTERBOX_SPEAKER_DATA_END    "]"  //Character that indicates where the speaker data string ends. This can be any arbitrary string, potentially composed of multiple characters

#macro CHATTERBOX_ESCAPE_FILE_TAGS           true
#macro CHATTERBOX_ESCAPE_NODE_TAGS           true
#macro CHATTERBOX_ESCAPE_CONTENT             true
#macro CHATTERBOX_ESCAPE_EXPRESSION_STRINGS  false

#macro CHATTERBOX_LOCALIZATION_ACKNOWLEDGE_WARNING  false



#region Advanced

// Whether to declare variables when Chatterbox script is compiled. Set to <false> for the highly
// inconvenient legacy (2.1 and earlier) behaviour.
#macro CHATTERBOX_DECLARE_ON_COMPILE  true

#macro CHATTERBOX_LEGACY_WEIRD_OPERATOR_PRECEDENCE  false  //Set to <true> if you're coming from pre-2.7.1

#macro CHATTERBOX_INDENT_TAB_SIZE     4    //Space size of a tab character
#macro CHATTERBOX_FILENAME_SEPARATOR  ":"  //The character used to separate filenames from node titles in redirects and options

#macro CHATTERBOX_LINE_HASH_SIZE           6
#macro CHATTERBOX_HIDE_LINE_HASH_METADATA  true

#macro CHATTERBOX_ERROR_NONSTANDARD_SYNTAX   true  //Throws an error when using a reasonable, though technically illegal, syntax e.g. <<end if>> or <<elseif>>
#macro CHATTERBOX_ERROR_UNDECLARED_VARIABLE  true  //Throws an error when trying to set an undeclared variable
#macro CHATTERBOX_ERROR_UNSET_VARIABLE       true  //Throws an error when trying to *get* a variable that doesn't exist
#macro CHATTERBOX_ERROR_REDECLARED_VARIABLE  true  //Throws an error when trying to redeclare a variable
#macro CHATTERBOX_ERROR_NO_LOCAL_SCOPE       true  //Throws an error when trying to execute a function without a local scope being available

// Value to return from a variable that doesn't exist
// This is only relevant if CHATTERBOX_ERROR_UNSET_VARIABLE is <false> and the "default" argument for ChatterboxVariableGet() has not been specified
#macro CHATTERBOX_VARIABLE_MISSING_VALUE  0

#endregion

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// # Localisation
/// * ChatterboxLocalizationBuild        -> dialogue_build_localisation
/// * ChatterboxLocalizationLoad         -> dialogue_load_localisation
/// * ChatterboxLocalizationClear        -> dialogue_reset_localisation
/// ----------------------------------------------------------------------------
/// # Setup
/// * ChatterboxAddFunction              -> dialogue_define_function
/// * ChatterboxAddFindReplace           -> dialogue_find_and_replace
/// ----------------------------------------------------------------------------
/// # Dialogue
/// * IsChatterbox                       -> is_dialogue
/// * ChatterboxCreate                   -> dialogue_create
/// ----------------------------------------------------------------------------
/// # Sources
/// * ChatterboxIsLoaded                 -> dialogue_is_loaded_source
/// * ChatterboxLoadFromFile             -> dialogue_load_source
/// * ChatterboxLoadFromString           -> dialogue_load_source
/// * ChatterboxLoadFromBuffer           -> dialogue_load_source
/// * ChatterboxUnload                   -> dialogue_unload_source
/// * ChatterboxGetCurrentSource         -> dialogue_get_source_name
/// * ChatterboxSourceGetTags            -> dialogue_get_source_tags
/// ----------------------------------------------------------------------------
/// # Nodes
/// * ChatterboxSourceNodeCount          -> dialogue_get_node_count
/// * ChatterboxSourceNodeExists         -> dialogue_node_exists
/// * ChatterboxGetCurrent               -> dialogue_get_node_title
/// * ChatterboxGetVisited               -> dialogue_get_node_visited_count
/// * ChatterboxVariablesClearVisited    -> dialogue_reset_node_visited
/// * ChatterboxVariablesClearVisitedAll -> dialogue_reset_node_visited
/// * ChatterboxGetCurrentMetadata       -> dialogue_get_node_metadata
/// * ChatterboxSourceGetNodeMetadata    -> dialogue_get_node_metadata
/// ----------------------------------------------------------------------------
/// # Lines
/// * ChatterboxGetContentCount          -> dialogue_get_line_count
/// * ChatterboxGetContentArray          -> dialogue_get_lines
/// * ChatterboxGetContent               -> dialogue_get_line_content
/// * ChatterboxGetAllContentString      -> dialogue_get_line_content
/// * ChatterboxGetContentSpeaker        -> dialogue_get_line_speaker
/// * ChatterboxGetContentSpeakerData    -> dialogue_get_line_speaker_data
/// * ChatterboxGetContentSpeech         -> dialogue_get_line_speech
/// * ChatterboxGetContentMetadata       -> dialogue_get_line_metadata
/// ----------------------------------------------------------------------------
/// # Options
/// * ChatterboxGetOptionCount           -> dialogue_get_option_count
/// * ChatterboxGetOption                -> dialogue_get_option_content
/// * ChatterboxGetOptionArray           -> dialogue_get_options
/// * ChatterboxGetOptionMetadata        -> dialogue_get_option_metadata
/// * ChatterboxGetOptionConditionBool   -> dialogue_is_option_condition_satisfied
/// * ChatterboxGetOptionChosen          -> dialogue_get_option_chosen_count
/// * ChatterboxSelect                   -> dialogue_select_option
/// ----------------------------------------------------------------------------
/// # Flow Control
/// * ChatterboxJump                     -> dialogue_jump_to_node
/// * ChatterboxHop                      -> dialogue_hop_to_node
/// * ChatterboxHopBack                  -> dialogue_hop_back
/// * ChatterboxIsWaiting                -> dialogue_is_waiting
/// * ChatterboxWait                     -> dialogue_wait
/// * ChatterboxContinue                 -> dialogue_continue
/// * ChatterboxIsStopped                -> dialogue_is_stopped
/// * ChatterboxStop                     -> dialogue_stop
/// * ChatterboxFastForward              -> dialogue_fast_foreward
/// ----------------------------------------------------------------------------
/// # Variables and Constants
/// * dialogue_exists_variable
/// * ChatterboxVariablesFind            -> dialogue_find_variables
/// * ChatterboxVariableSetConstant      -> dialogue_declare_constant
/// * ChatterboxVariableDefault          -> dialogue_declare_variable
/// * ChatterboxVariableGet              -> dialogue_get_variable
/// * ChatterboxVariableSet              -> dialogue_set_variable
/// * ChatterboxVariableReset            -> dialogue_reset_variable
/// * ChatterboxVariablesResetAll        -> dialogue_reset_variable
/// * ChatterboxVariablesExport          -> dialogue_export_variables
/// * ChatterboxVariablesImport          -> dialogue_import_variables
/// ----------------------------------------------------------------------------

/******************************************************************************/
#region    –––––––––––––––––––– LOCALISATION ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_build_localisation(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// Parses an array of YarnScript files stored in your project's Included Filess directory and
/// creates a CSV that contains all strings in those source files. The YarnScript files are modified
/// by this function such that they link up to the CSV. You should then create a copy of the CSV
/// file for each language you're localising into and load then using ChatterboxLocalizationLoad()
/// when you wish to localise Chatterbox text into a different language.
///
/// WARNING: THIS FUNCTION WILL MODIFY SOURCE FILES ON DISK INSIDE YOUR PROJECT
/// ENSURE YOU HAVE BACKED UP YOUR WORK IN SOURCE CONTROL.
///
/// ----------------------------------------------------------------------------
/// @parameter {string|array<string>} source_filepath
/// The filepath or array of filepaths of the source files for which to create
/// a localisation.
///
/// NOTE: This filepath must be relative to CHATTERBOX_INCLUDED_FILES_SUBDIRECTORY.
///
/// @parameter {string|array<string>} localisation_filepath
/// The filepath or array of filepaths where to create localisation files.
///
/// NOTE: This filepath must be relative to CHATTERBOX_INCLUDED_FILES_SUBDIRECTORY.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_build_localisation(parameters) {
    if (!is_struct(parameters)) { parameters = {} }
    var _source_filepath       = parameters[$ "source_filepath"]
    var _localisation_filepath = parameters[$ "localisation_filepath"]
    ChatterboxLocalizationBuild(_source_filepath, _localisation_filepath)
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_load_localisation(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to load a CSV file generated by "dialogue_build_localisation"
///
/// NOTE: Only one localisation can be active at any time.
///
/// NOTE: The localisation is applied the next time a dialogue instance executes
/// a flow control function.
///
/// NOTE: Any lines and options that don't have a #line tag and a corresponding
/// value in the active localisation file will be displayed in their native language.
/// ----------------------------------------------------------------------------
/// @parameter {string} filepath
/// The filepath of the localisation file to load.
///
/// NOTE: The filepath is relative to CHATTERBOX_INCLUDED_FILES_SUBDIRECTORY.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_load_localisation(parameters) {
    if (!is_struct(parameters)) { parameters = {} }
    var _filepath = parameters[$ "filepath"]
    ChatterboxLocalizationLoad(_filepath)
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_reset_localisation()
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to reset the localisation of all dialogue instances
/// to the native text of the YarnScript sources.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_reset_localisation() {
    ChatterboxLocalizationClear()
    return undefined
}

/******************************************************************************/
#endregion –––––––––––––––––––– LOCALISATION ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– SETUP ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_define_function(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to link YarnScript functions/commands to a GML function.
///
/// NOTE: The GML function should expect argument0 to be an array of the arguments
/// of the YarnScript function/command.
///
/// NOTE: The GML function should only return a boolean, number, string or undefined.
///
/// NOTE: This action SHOULD NOT be performed after YarnScript sources were loaded.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name used to refer to the function/command in YarnScript.
///
/// @parameter {callable} callable
/// The callable to link the name to.
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// Whether the function was added successfully.
/// ----------------------------------------------------------------------------
function dialogue_define_function(parameters) {
    return ChatterboxAddFunction(parameters.name, parameters.callable)
}

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to run a find and replace operation on source files
/// whenever they are loaded.
///
/// NOTE: This action SHOULD NOT be performed after YarnScript sources were loaded.
/// ----------------------------------------------------------------------------
/// @parameter {string} search
/// The string to seach for.
///
/// @parameter {string} replace
/// The string to replace it with.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_find_and_replace(parameters = {}) {
    ChatterboxAddFindReplace(parameters.search, parameters.replace)
    return undefined
}

/******************************************************************************/
#endregion –––––––––––––––––––– SETUP ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– DIALOGUE ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function is_dialogue(_value)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to check whether a value is a dialogue instance.
/// ----------------------------------------------------------------------------
/// @parameter {any} value - The value to check.
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// ----------------------------------------------------------------------------
function is_dialogue(_value) {
    return is_instanceof(_value, Dialogue)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to create an instance of 'struct.Dialogue'.
/// ----------------------------------------------------------------------------
/// @parameter {string} source
/// The name of the YarnScript source to use.
/// The default argument is the name of the default source.
///
/// @parameter {boolean} [singleton]
/// Whether the dialogue should be processed in singleton mode.
/// Defaults to CHATTERBOX_DEFAULT_SINGLETON.
///
/// @parameter {mixed} [execution_context]
/// The object instance or struct that should be used as the self context when
/// executing YarnScript functions and commands.
///
/// This value defaults to the self context where this function is being called.
/// ----------------------------------------------------------------------------
/// @return {struct}
/// ----------------------------------------------------------------------------
function dialogue_create(parameters = {}) {
    var _source            = parameters[$ "source"]            ?? undefined
    var _singleton_mode    = parameters[$ "singleton_mode"]    ?? undefined
    var _execution_context = parameters[$ "execution_context"] ?? self

	ChatterboxCreate(_source, _singleton_mode, _execution_context)

    var _dialogue = new Dialogue()
	return _dialogue
}

/******************************************************************************/
#endregion –––––––––––––––––––– DIALOGUE ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– SOURCES ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_is_loaded_source(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to check if a source is loaded to memory.
/// ----------------------------------------------------------------------------
/// @parameter {string} source
/// The name of the source to check.
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// ----------------------------------------------------------------------------
function dialogue_is_loaded_source(parameters = {}) {
    var _name = parameters[$ "source"]
    return ChatterboxIsLoaded(_name)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_load_source(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to load a YarnScript source from a file, string or
/// buffer.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name that should be used to reference the source.
///
/// NOTE: When loading from a file this value will default to the filepath.
///
/// NOTE: When loading from a string or buffer this parameter is required.
///
/// NOTE: If you are using the name of an already existing source then this
/// action will enter any existing dialogue instances using that source into a
/// "stopped" state.
///
/// @parameter {string} filepath
/// The filepath to load the YarnScript source from.
///
/// NOTE: The filepath must be relative to CHATTERBOX_INCLUDED_FILES_SUBDIRECTORY.
///
/// @parameter {string} string
/// The string to load the YarnScript source from.
///
/// NOTE: The string must be correctly formatted as a .yarn file.
///
/// @parameter {type} buffer
/// The handle or index of the buffer to load the YarnScript source from.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_load_source(parameters = {}) {
    var _name     = parameters[$ "name"]
    var _filepath = parameters[$ "filepath"]
    var _string   = parameters[$ "string"]
    var _buffer   = parameters[$ "buffer"]

    // loads YarnScript from a file
    if (is_string(_filepath)) {
        ChatterboxLoadFromFile(_filepath, _name)
        return undefined
    }
    // loads YarnScript from a string
    if (is_string(_string)) {
        ChatterboxLoadFromString(_name, _string)
        return undefined
    }
    // loads YarnScript from a buffer
    if (is_numeric(_buffer) and buffer_exists(_buffer)) {
        ChatterboxLoadFromBuffer(_name, _buffer)
        return undefined
    }
}

/// ----------------------------------------------------------------------------
/// @function dialogue_unload_source(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to unload YarnScript sources from memory.
///
/// NOTE: This action will enter any existing dialogue instances using those
/// source into a "stopped" state.
/// ----------------------------------------------------------------------------
/// @parameter {string|array<string>} source
/// The name or the array of names of the sources to unload.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_unload_source(parameters = {}) {
    var _names = parameters[$ "source"]
    if (!is_array(_names)) { _names = [_names] }
    for (var i = 0; i < array_length(_names); i++) {
        if (!is_string(_names[i])) { continue }
        ChatterboxUnload(_names[i])
    }
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_source_name(parameters)
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
function dialogue_get_source_name(parameters = {}) {
    return ChatterboxGetCurrentSource(chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_node_tags(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the tags associated with a source.
/// ----------------------------------------------------------------------------
/// @parameter {string} source
/// The name of the source to target.
/// ----------------------------------------------------------------------------
/// @return {array<string>}
/// ----------------------------------------------------------------------------
function dialogue_get_source_tags(parameters = {}) {
    return ChatterboxSourceGetTags(sourceName)
}

/******************************************************************************/
#endregion –––––––––––––––––––– SOURCES ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– NODES ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_get_node_count(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to check how many nodes a source has.
/// ----------------------------------------------------------------------------
/// @parameter {string} source
/// The name of the source to check.
/// ----------------------------------------------------------------------------
/// @return {number}
/// ----------------------------------------------------------------------------
function dialogue_get_node_count(parameters = {}) {
    return ChatterboxSourceNodeCount(parameters.source)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_node_exists(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to check whether a node exists.
/// ----------------------------------------------------------------------------
/// @parameter {string} source
/// The name of the source to check.
///
/// @parameter {string} node
/// The title of the node to check.
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// ----------------------------------------------------------------------------
function dialogue_node_exists(parameters = {}) {
    return ChatterboxSourceNodeExists(parameters.source, parameters.node)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_node_title(parameters)
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
function dialogue_get_node_title(parameters = {}) {
    ChatterboxGetCurrent(chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_node_visited_count(parameters)
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
function dialogue_get_node_visited_count(parameters = {}) {
    return ChatterboxGetVisited(nodeTitle, filename)
}

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
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_reset_node_visited(parameters = {}) {
    ChatterboxVariablesClearVisited(node, filename)
    ChatterboxVariablesClearVisitedAll()
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_node_metadata(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the metadata of a node.
/// ----------------------------------------------------------------------------
/// @parameter {string} source
/// The name of the source.
///
/// @parameter {string} node
/// The title of the node.
/// ----------------------------------------------------------------------------
/// @return {struct}
/// ----------------------------------------------------------------------------
function dialogue_get_node_metadata(parameters = {}) {
    return ChatterboxGetCurrentMetadata(chatterbox)
    return ChatterboxSourceGetNodeMetadata(sourceName, nodeTitle)
}

/******************************************************************************/
#endregion –––––––––––––––––––– NODES ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– CONTENT ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_get_line_count(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the number of lines of content currently
/// available to a dialogue instance.
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// The dialogue instance to target.
/// ----------------------------------------------------------------------------
/// @return {integer}
/// ----------------------------------------------------------------------------
function dialogue_get_line_count(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return 0 }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetContentCount(_chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_lines(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {array}
/// ----------------------------------------------------------------------------
function dialogue_get_lines(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return [] }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetContentArray(private.chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_line_content(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// <parameter_description>
///
/// @parameter {numer} index
/// <parameter_description>
///
/// @parameter {string} separator
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_line_content(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return "" }
    var _chatterbox = _dialogue.private.chatterbox
    var _index      = parameters[$ ""]
    var _separator  = parameters[$ ""]
    if (is_numeric(_index)) {
        return ChatterboxGetContent(_chatterbox, _index)
    } else {
        return ChatterboxGetAllContentString(_chatterbox, _separator)
    }
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_line_speaker(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_line_speaker(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return "" }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetContentSpeaker(private.chatterbox, _content_index, _default)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_line_speaker_data(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_line_speaker_data(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return "" }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetContentSpeakerData(private.chatterbox, _content_index, _default)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_line_speech(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_line_speech(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return "" }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetContentSpeech(private.chatterbox, _content_index, _default)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_line_metadata(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} dialogue
/// <parameter_description>
///
/// @parameter {type} line_index
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {array<string>}
/// An array containing the strings of the metadata tags.
/// ----------------------------------------------------------------------------
function dialogue_get_line_metadata(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue   = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return [] }
    var _chatterbox = _dialogue.private.chatterbox
    var _content_index = parameters[$ "line_index"]
    return ChatterboxGetContentMetadata(_chatterbox, _content_index)
}

/******************************************************************************/
#endregion –––––––––––––––––––– CONTENT ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– OPTIONS ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_count(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the number of options available to a dialogue
/// instance.
/// ----------------------------------------------------------------------------
/// @parameter {type} dialogue
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {integer}
/// ----------------------------------------------------------------------------
function dialogue_get_option_count(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return 0 }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetOptionCount(_chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_options(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {array<struct>}
/// ----------------------------------------------------------------------------
function dialogue_get_options(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return [] }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetOptionArray(_chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_content(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_option_content(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return "" }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetOption(_chatterbox, arguments.option_index)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_speaker(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the speaker string of an option available to a
/// dialogue instance.
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// <parameter_description>
///
/// @parameter {integer} option
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_option_speaker(parameters = {}) {
    ChatterboxGetOption(_chatterbox, arguments.option_index)
    return _return
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_speaker_data(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the speaker data string of an option available
/// to a dialogue instance.
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// <parameter_description>
///
/// @parameter {integer} option
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_option_speaker_data(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_speech(parameters)
/// ----------------------------------------------------------------------------
/// This function is used to get the speech string of an option available to a
/// dialogue instance.
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// <parameter_description>
///
/// @parameter {integer} option
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_get_option_speech(parameters = {}) {
    return _return
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_metadata(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {array<string>}
/// ----------------------------------------------------------------------------
function dialogue_get_option_metadata(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return "" }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetOptionMetadata(_chatterbox, arguments.option_index)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_is_option_condition_satisfied(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// ----------------------------------------------------------------------------
function dialogue_is_option_condition_satisfied(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return false }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetOptionConditionBool(_chatterbox, arguments.option_index)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_option_chosen_count(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get the number of times an option has been selected.
/// NOTE: WHEN DOES THIS RESET???
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// <parameter_description>
///
/// @parameter {integer} option
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {integer}
/// ----------------------------------------------------------------------------
function dialogue_get_option_chosen_count(parameters = {}) {
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : undefined
    if (!is_dialogue(_dialogue)) { return 0 }
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxGetOptionChosen(_chatterbox, arguments.option_index)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_select_option(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to select an option available to a dialogue instance.
/// ----------------------------------------------------------------------------
/// @parameter {type} dialogue
/// The dialogue instance to target.
///
/// @parameter {integer} option
/// The index of the option to select.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_select_option(parameters = {}) {
    ChatterboxSelect(chatterbox, optionIndex)
    return undefined
}

/******************************************************************************/
#endregion –––––––––––––––––––– OPTIONS ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
/******************************************************************************/

#region    –––––––––––––––––––– JUMPING ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function dialogue_jump_to_node(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to make dialogue jump to a node in a source.
///
/// NOTE: This function differs from a YarnScript <<jump>> command in that it
/// restarts dialogue processing from the top of the new node. Any progress in
/// previous nodes will be reset for this dialogue instance and it won't be
/// possible to get dialogue content from the previous node in non 'singleton'
/// mode.
/// ----------------------------------------------------------------------------
/// @parameter {type} dialogue
/// The dialogue to target.
///
/// @parameter {type} [source]
/// The name of the source. Defaults to the current source.
///
/// @parameter {string} node
/// The title of the node to jump to.
/// ----------------------------------------------------------------------------
/// @return {struct.Dialogue}
/// ----------------------------------------------------------------------------
function dialogue_jump_to_node(parameters = {}) {
    var _dialogue    = parameters[$ "dialogue"]
    var _chatterbox  = _dialogue.private.chatterbox
    var _source_name = parameters[$ "source"]
    var _node_title  = parameters[$ "node"]
    ChatterboxJump(_chatterbox, _node_title, _source_name)
    return _dialogue
}

/// ----------------------------------------------------------------------------
/// @function dialogue_hop_to_node(parameters)
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
function dialogue_hop_to_node(parameters = {}) {
    var _source_name = arguments[$ "source_name"] ?? get_current_source_name()
    var _node_title  = arguments[$ "node_title"]
    ChatterboxHop(private.chatterbox, _node_title, _source_name)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_hop_back(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {struct}
/// The dialogue
/// ----------------------------------------------------------------------------
function dialogue_hop_back(parameters = {}) {
    var _dialogue = parameters[$ "dialogue"] ?? (is_instanceof(self, Dialogue) ? self : undefined)
    ChatterboxHopBack(private.chatterbox)
    return _dialogue
}

#endregion –––––––––––––––––––– JUMPING ––––––––––––––––––––

#region    –––––––––––––––––––– WAITING ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function dialogue_is_waiting(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to check if a dialogue is in a 'waiting' state.
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// The dialogue instance to check.
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// ----------------------------------------------------------------------------
function dialogue_is_waiting(parameters = {}) {
    var _dialogue = parameters[$ "dialogue"]
    if (is_instanceof(self, Dialogue)) { _dialogue ??= self }
    return ChatterboxIsWaiting(_dialogue.private.chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_wait(parameters)
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
function dialogue_wait(parameters = {}) {
    ChatterboxWait(private.chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_continue(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to advance processing of dialogue instances that are
/// in a "waiting" state.
/// ----------------------------------------------------------------------------
/// @parameter {struct|array<struct>} dialogue
/// The dialogue instance or array of dialogue instances to target.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_continue(parameters = {}) {
    /* –––––––––––––––––––– ARGUMENTS –––––––––––––––––––– */
    if (!is_struct(parameters)) { parameters = {} }
    var _dialogue = parameters[$ "dialogue"] ?? is_dialogue(self) ? self : []
    if (!is_array(_dialogue)) { _dialogue = [_dialogue] }
    /* –––––––––––––––––––– LOGIC –––––––––––––––––––– */
    for (var i = 0; i < array_length(_dialogue); i++) {
        if (!is_dialogue(_dialogue[i])) { continue }
        var _chatterbox = _dialogue[i].private.chatterbox
        ChatterboxContinue(_chatterbox)
    }
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_fast_foreward(parameters)
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
function dialogue_fast_foreward(parameters = {}) {
    return ChatterboxFastForward(private.chatterbox)
}

#endregion –––––––––––––––––––– WAITING ––––––––––––––––––––

#region    –––––––––––––––––––– STOPPED ––––––––––––––––––––

/// ----------------------------------------------------------------------------
/// @function dialogue_is_stopped(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to check if a dialogue is in a 'stopped' state.
/// ----------------------------------------------------------------------------
/// @parameter {struct} dialogue
/// The dialogue instance to check.
/// ----------------------------------------------------------------------------
/// @return {boolean}
/// ----------------------------------------------------------------------------
function dialogue_is_stopped(parameters = {}) {
    var _dialogue = parameters[$ "dialogue"]
    if (is_instanceof(self, Dialogue)) { _dialogue ??= self }
    ChatterboxIsStopped(_dialogue.private.chatterbox)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_stop(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} dialogue
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_stop(parameters = {}) {
    var _dialogue   = parameters[$ "dialogue"] ?? is_instanceof(self, Dialogue) ? self : undefined
    var _chatterbox = _dialogue.private.chatterbox
    return ChatterboxStop(_chatterbox)
}

#endregion –––––––––––––––––––– STOPPED ––––––––––––––––––––

/******************************************************************************/
#endregion –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
/******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– VARIABLES ––––––––––––––––––––
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function dialogue_exists_variable(parameters)
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
function dialogue_exists_variable(parameters = {}) {
    return _return
}

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
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function dialogue_find_variables(parameters = {}) {
    ChatterboxVariablesFind(substring, mode, caseSensitive)
    return _return
}

/// ----------------------------------------------------------------------------
/// @function dialogue_declare_constant(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to declare a YarnScript constant and assign it a value.
///
/// NOTE: This is the GML equivalent to the YarnScript <<constant>> command.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name of the constant to define.
///
/// @parameter {boolean|number|string} value
/// The value to assign to the constant.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_declare_constant(parameters) {
    if (!is_struct(parameters)) { parameters = {} }
    ChatterboxVariableSetConstant(parameters.name, parameters.value)
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_declare_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to declare a YarnScript variable and assign it a
/// default value.
///
/// NOTE: This is the GML equivalent to the YarnScript <<declare>> command.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name of the variable to define.
///
/// @parameter {boolean|number|string} value
/// The value to assign to the variable.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_declare_variable(parameters) {
    if (!is_struct(parameters)) { parameters = {} }
    ChatterboxVariableSet(parameters.name, parameters.value)
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_get_variable(parameters)
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
function dialogue_get_variable(parameters) {
    return ChatterboxVariableGet(parameters.name, undefined)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_set_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function assigns a value to a yarn variable. This is equivalent to
/// using a '<<set>>' statement in a yarn file. If the variable has not been
/// previously declared with the '<<declare>>' statement or the
/// 'dialogue_set_variable' function then it will be created.
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
function dialogue_set_variable(parameters) {
    ChatterboxVariableSet(parameters.name, parameters.value)
}

/// ----------------------------------------------------------------------------
/// @function dialogue_reset_variable(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to reset the values of YarnScript variables to the
/// value assigned to them through a <<declare>> command.
/// ----------------------------------------------------------------------------
/// @parameter {string} name
/// The name of the variable.
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_reset_variable(parameters = {}) {
    ChatterboxVariableReset(name)
    ChatterboxVariablesResetAll()
    return undefined
}

/// ----------------------------------------------------------------------------
/// @function dialogue_export_variables(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to get a JSON string containing a key-value pair for
/// each YarnScript variable and the number of times nodes were visited.
///
/// NOTE: YarnScript constants can't be exported.
/// ----------------------------------------------------------------------------
/// @return {string}
/// ----------------------------------------------------------------------------
function dialogue_export_variables(parameters = {}) {
    return ChatterboxVariablesExport()
}

/// ----------------------------------------------------------------------------
/// @function dialogue_import_variables(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// This function is used to set YarnScript variables based on the data of a
/// JSON string created by "dialogue_export_variables".
///
/// NOTE: YarnScript constants can't be imported.
///
/// NOTE: YarnScript variables not presented in the JSON string will be reset to
/// their default value or deleted if they don't have a default value.
/// ----------------------------------------------------------------------------
/// @parameter {string} string
/// ----------------------------------------------------------------------------
/// @return {undefined}
/// ----------------------------------------------------------------------------
function dialogue_import_variables(parameters = {}) {
    var _string = parameters[$ "string"]
    ChatterboxVariablesImport(_string)
    return undefined
}

/******************************************************************************/
#endregion –––––––––––––––––––– VARIABLES ––––––––––––––––––––
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

/// ----------------------------------------------------------------------------
/// This is a wrapper around a chatterbox, basically a container for dialogue
/// processing.
/// ----------------------------------------------------------------------------
/// # execution_context
/// The object instance or struct that should be used as the self context when
/// executing YarnScript functions and commands.
///
/// NOTE: This property can't be changed once the Dialogue has been created.
/// ----------------------------------------------------------------------------
/// # singleton
/// Whether the dialogue content is being processed in singleton mode.
/// This is equivalent to putting a 'wait' command after every line.
///
/// CHATTERBOX_SINGLETON_WAIT_BEFORE_OPTION
///
/// wait stop state
///
/// NOTE: This property can't be changed once the Dialogue has been created.
/// ----------------------------------------------------------------------------
/// # waiting
/// Whether the dialogue is in a 'waiting' state. This state is triggered due to
/// a 'wait' command, singleton mode.
///
/// NOTE: If 'CHATTERBOX_WAIT_BEFORE_STOP' is true the dialogue will go into a
/// 'waiting' state before being changed into a 'stopped' state by a <<stop>>
/// command if it wasn't already in a 'waiting' state.
///
/// NOTE: Dialogue is not waiting when option needs to be chosen. CHATTERBOX_SINGLETON_WAIT_BEFORE_OPTION
///
/// NOTE: When stopped by GML 'stop' the 'waiting' state isn't changed.
/// ----------------------------------------------------------------------------
/// # stopped
/// Whether the dialogue is in a 'stopped' state. Instances of dialogue begin
/// in a 'stopped' state and go into a 'stopped' state whenever they are reset.
/// This state can be triggered by <<stop>> commands and 'dialogue_stop'.
/// This state is left by changing to a valid source/node.
///
/// NOTE: Nodes not explicitly terminated by a <<stop>> or <<hopback>> command
/// will be implicitly terminated by a <<stop>> or <<hopback>> command depending
/// on the value of CHATTERBOX_END_OF_NODE_HOPBACK.
/// ----------------------------------------------------------------------------
function Dialogue() constructor {

    /******************************************************************************/
    #region    –––––––––––––––––––– GENERAL ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #endregion –––––––––––––––––––– GENERAL ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– NODES ––––––––––––––––––––
    /******************************************************************************/

    /// @function node_exists(parameters)
    static node_exists = dialogue_node_exists
    self.node_exists   = method(self, dialogue_node_exists)

    /// @function get_node_count(parameters)
    static get_node_count = dialogue_get_node_count
    self.get_node_count   = method(self, dialogue_get_node_count)

    /// @function get_node_tags(parameters)
    static get_node_tags = dialogue_get_node_tags
    self.get_node_tags   = method(self, dialogue_get_node_tags)

    /// @function get_node_metadata(parameters)
    static get_node_metadata = dialogue_get_node_metadata
    self.get_node_metadata   = method(self, dialogue_get_node_metadata)

    /******************************************************************************/
    #endregion –––––––––––––––––––– NODES ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– CONTENT ––––––––––––––––––––
    /******************************************************************************/

    /// @function get_line_count(parameters)
    static get_line_count = dialogue_get_line_count
    self.get_line_count   = method(self, dialogue_get_line_count)

    /// @function get_line_speaker(parameters)
    static get_line_speaker = dialogue_get_line_speaker
    self.get_line_speaker   = method(self, dialogue_get_line_speaker)

    /// @function get_line_speaker_data(parameters)
    static get_line_speaker_data = dialogue_get_line_speaker_data
    self.get_line_speaker_data   = method(self, dialogue_get_line_speaker_data)

    /// @function get_line_speech(parameters)
    static get_line_speech = dialogue_get_line_speech
    self.get_line_speech   = method(self, dialogue_get_line_speech)

    /// @function get_line_metadata(parameters)
    static get_line_metadata = dialogue_get_line_metadata
    self.get_line_metadata   = method(self, dialogue_get_line_metadata)

    /******************************************************************************/
    #endregion –––––––––––––––––––– CONTENT ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– OPTIONS ––––––––––––––––––––
    /******************************************************************************/

    /// @function get_option_content(parameters)
    static get_option_content = dialogue_get_option_content
    self.get_option_content   = method(self, dialogue_get_option_content)

    /// @function get_option_metadata(parameters)
    static get_option_metadata = dialogue_get_option_metadata
    self.get_option_metadata   = method(self, dialogue_get_option_metadata)

    /// @function is_option_condition_satisfied(parameters)
    static is_option_condition_satisfied = dialogue_is_option_condition_satisfied
    self.is_option_condition_satisfied   = method(self, dialogue_is_option_condition_satisfied)

    /// @function get_option_chosen_count(parameters)
    static get_option_chosen_count = dialogue_get_option_chosen_count
    self.get_option_chosen_count   = method(self, dialogue_get_option_chosen_count)

    /// @function get_option_count(parameters)
    static get_option_count = dialogue_get_option_count
    self.get_option_count   = method(self, dialogue_get_option_count)

    /// @function get_option_array(parameters)
    static get_option_array = dialogue_get_options
    self.get_option_array   = method(self, dialogue_get_options)

    /******************************************************************************/
    #endregion –––––––––––––––––––– OPTIONS ––––––––––––––––––––
    /******************************************************************************/

    /******************************************************************************/
    #region    –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
    /******************************************************************************/

    /// @function get_node_title(parameters)
    static get_node_title = dialogue_get_node_title
    self.get_node_title   = method(self, dialogue_get_node_title)

    #region    –––––––––––––––––––– JUMPING ––––––––––––––––––––

    /// @function jump_to_node(parameters)
    static jump_to_node = dialogue_jump_to_node
    self.jump_to_node   = method(self, dialogue_jump_to_node)

    /// @function hop_to_node(parameters)
    static hop_to_node = dialogue_hop_to_node
    self.hop_to_node   = method(self, dialogue_hop_to_node)

    /// @function hop_back(parameters)
    static hop_back = dialogue_hop_back
    self.hop_back   = method(self, dialogue_hop_back)

    #endregion –––––––––––––––––––– JUMPING ––––––––––––––––––––

    #region    –––––––––––––––––––– OPTIONS ––––––––––––––––––––

    /// @function select_option(parameters)
    static select_option = dialogue_select_option
    self.select_option   = method(self, dialogue_select_option)

    #endregion –––––––––––––––––––– OPTIONS ––––––––––––––––––––

    #region    –––––––––––––––––––– WAITING ––––––––––––––––––––

    /// @function is_waiting(parameters)
    static is_waiting = dialogue_is_waiting
    self.is_waiting   = method(self, dialogue_is_waiting)

    /// @function wait(parameters)
    static wait = dialogue_wait
    self.wait   = method(self, dialogue_wait)

    /// @function resume(parameters)
    static resume = dialogue_continue
    self.resume   = method(self, dialogue_continue)

    /// @function fast_foreward(parameters)
    static fast_foreward = dialogue_fast_foreward
    self.fast_foreward   = method(self, dialogue_fast_foreward)

    #endregion –––––––––––––––––––– WAITING ––––––––––––––––––––

    #region    –––––––––––––––––––– STOPPED ––––––––––––––––––––

    /// @function is_stopped(parameters)
    static is_stopped = dialogue_is_stopped
    self.is_stopped   = method(self, dialogue_is_stopped)

    /// @function stop(parameters)
    static stop = dialogue_stop
    self.stop   = method(self, dialogue_stop)

    #endregion –––––––––––––––––––– STOPPED ––––––––––––––––––––

    /******************************************************************************/
    #endregion –––––––––––––––––––– FLOW CONTROL ––––––––––––––––––––
    /******************************************************************************/

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
