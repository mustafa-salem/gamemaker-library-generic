new InputController()

function InputController() : InputControllerGeneric() constructor {

    static game_start_event = function() {
        import_system_config()
    }

}

function input_check_all_pressed(_verb, _player_index, _buffer_duration) {
	for (var i = 0; i < (array_length(_verb)); i++) {
		if (!input_check_pressed(_verb[i], _player_index, _buffer_duration)) { return false }
	}
	return true
}

/*

load_controls_config()

function scr_gamepad_axis_check(argument0, argument1)
{
    axis_value = 0.4
    __returnvalue = 0
    if (argument1 == 0)
    {
        if (gamepad_axis_value(argument0, gp_axislv) >= axis_value)
            __returnvalue = 1
    }
    if (argument1 == 1)
    {
        if (gamepad_axis_value(argument0, gp_axislh) >= axis_value)
            __returnvalue = 1
    }
    if (argument1 == 2)
    {
        if (gamepad_axis_value(argument0, gp_axislv) <= (-axis_value))
            __returnvalue = 1
    }
    if (argument1 == 3)
    {
        if (gamepad_axis_value(argument0, gp_axislh) <= (-axis_value))
            __returnvalue = 1
    }
    return __returnvalue;
}

function scr_gamepad_check_any()
{
    if (!instance_exists(obj_gamecontroller))
        return 0;
    else
    {
        var any_input = 0
        var i = 0
        while (i < 4)
        {
            if scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, i)
            {
                any_input = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
        i = 0
        while (i < 10)
        {
            if gamepad_button_check(obj_gamecontroller.gamepad_id, global.legacy_input_gamepad[i])
            {
                any_input = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
    }
    return any_input;
}

function scr_gamepad_check_pressed_any()
{
    if (!instance_exists(obj_gamecontroller))
        return 0;
    else
    {
        var button_pressed = 0
        var i = 0
        while (i < 10)
        {
            if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.legacy_input_gamepad[i])
            {
                button_pressed = 1
                break
            }
            else
            {
                i += 1
                continue
            }
        }
    }
    return button_pressed;
}
