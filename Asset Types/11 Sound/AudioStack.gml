/// ----------------------------------------------------------------------------
/// @function audio_stack_create(parameters)
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
function audio_stack_create(parameters = {}) {
    return _return
}

function AudioStack() constructor {

}
 /// ----------------------------------------------------------------------------
 /// @function audio_stack_get_sound_instance(parameters)
 /// ----------------------------------------------------------------------------
 /// @description
 /// <function_description>
 /// ----------------------------------------------------------------------------
 /// @parameter {type} parameter_name
 /// <parameter_description>
 ///
 /// ----------------------------------------------------------------------------
 /// @return {struct|undefined}
 /// <return_description>
 /// ----------------------------------------------------------------------------
 function audio_stack_get_sound_instance(parameters = {}) {
     // audio stack
     var _audio_stack = parameters[$ "audio_stack"]
     if (!is_string(_audio_stack)) { return undefined }

     // priority
     var _priority = parameters[$ "priority"] ?? VinylStackMaxPriorityGet(_audio_stack)
     if (!is_numeric(_priority)) { return undefined }

     return VinylStackGet(_audio_stack, _priority)
 }
