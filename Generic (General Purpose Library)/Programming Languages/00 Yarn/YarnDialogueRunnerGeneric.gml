/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– YARN_DIALOGUE_RUNNER ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/

#macro yarn_dialogue_runner yarn_dialogue_runner_generic
#macro yarn_dialogue_runner_generic YarnDialogueRunnerGeneric


// ChatterboxCreate([filename], [singletonText]), [localScope])
// IsChatterbox(value)

function YarnDialogueRunnerGeneric() constructor {

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
        var _name     = arguments[$ "name"]
        var _callable = arguments[$ "callable"]
        ChatterboxAddFunction(_name, _callable)
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

    /*******************************************************************************/
    #region    –––––––––––––––––––– VARIABLES_AND_CONSTANTS ––––––––––––––––––––
    /*******************************************************************************/

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------

    // ChatterboxVariableDefault(name)

    /// ----------------------------------------------------------------------------
    /// @function get_variable(arguments)
    /// ----------------------------------------------------------------------------
    /// @description Gets the value of a yarn variable.
    ///
    /// ChatterboxVariableGet(name)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {Boolean or Number or String}
    /// ----------------------------------------------------------------------------
    static get_variable = function(arguments) {
        return ChatterboxVariableGet(arguments.name)
    }

    /// ----------------------------------------------------------------------------
    /// @function set_variable(arguments)
    /// ----------------------------------------------------------------------------
    /// @description Sets the value of a yarn variable.
    ///
    /// ChatterboxVariableSet(name, value)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { name : String, value : Boolean or Number or String }
    /// ----------------------------------------------------------------------------
    static set_variable = function(arguments) {
        ChatterboxVariableSet(arguments.name, arguments.value)
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    ///
    /// ChatterboxVariableSetConstant(name, value)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    static initialize_constant = function(arguments) {
        ChatterboxVariableSet(arguments.name, arguments.value)
    }

    /// ----------------------------------------------------------------------------
    /// @function export_variables(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ChatterboxVariablesExport()
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { format : String }
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    static export_variables = function(arguments) {
        // INITIALIZE_FORMAT_SPECIFIC_SUBMETHODS
        static export_variables_to = {
            struct : function() {
                return json_parse(ChatterboxVariablesExport())
            },
            json : function() {
                return ChatterboxVariablesExport()
            }
        }
        // DETERMINE_FORMAT_TO_USE
        var _format = arguments[$ "format"] ?? "struct"
        // RETURN_VARIABLES
        return export_variables_to[$ _format]()
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ChatterboxVariablesImport(string)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments { json : [String], struct : [Struct] }
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    import_variables = function(arguments) {
        if (arguments[$ "string"] != undefined) {
            ChatterboxVariablesImport(arguments.string)
        }
        if (arguments[$ "struct"] != undefined) {
            ChatterboxVariablesImport(json_stringify(arguments.struct))
        }

    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ChatterboxVariableReset(name)
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    reset_variable = function(arguments = {}) {
        return _return
    }

    /// ----------------------------------------------------------------------------
    /// @function function_name(arguments)
    /// ----------------------------------------------------------------------------
    /// @description <function_description>
    /// ChatterboxVariablesResetAll()
    /// ----------------------------------------------------------------------------
    /// @parameter {Struct} arguments <parameter_description>
    /// ----------------------------------------------------------------------------
    /// @return {type} <return_description>
    /// ----------------------------------------------------------------------------
    reset_all_variables = function(arguments = {}) {
        return _return
    }

    // ChatterboxVariablesClearVisited(node, filename)
    // ChatterboxVariablesClearVisitedAll()
    // ChatterboxVariablesFind(substring, mode, caseSensitive)

    gml-method

    /*******************************************************************************/
    #endregion –––––––––––––––––––– VARIABLES ––––––––––––––––––––
    /*******************************************************************************/

    /*

    ChatterboxGetVisited(nodeTitle, filename)

    ChatterboxLocalizationBuild(yarnPathArray, csvPathArray)
    ChatterboxLocalizationLoad(path)
    ChatterboxLocalizationClear()

    */

}

/*******************************************************************************/
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– YARN_DIALOGUE_RUNNER ––––––––––––––––––––
/* ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/*******************************************************************************/
