/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro FIXED_DELTA_TIME Time.fixed_delta_time

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro FIXED_UNSCALED_DELTA_TIME Time.fixed_unscaled_delta_time

new Time()

function Time() constructor {
    static private = { fixed_delta_time : game_get_speed(gamespeed_microseconds) * 0.000001 }
}
