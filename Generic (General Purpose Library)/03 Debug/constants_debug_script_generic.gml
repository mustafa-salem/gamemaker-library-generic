#macro BEGIN_SCRIPT_HINT_DEBUG_GENERIC show_debug_message("BEGIN_SCRIPT:\n" + string(debug_get_callstack()))
#macro   END_SCRIPT_HINT_DEBUG_GENERIC show_debug_message("END_SCRIPT:\n"   + string(debug_get_callstack()))
