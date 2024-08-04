function scr_debug() { return global.debug }

function scr_debug_keycheck(argument0)
{
    var key = argument0
    var is_pressed = 0
    if (obj_gamecontroller.gamepad_active)
    {
        var alt_key = -4
        switch key
        {
            case 113:
                alt_key = gp_padu
                break
            case 114:
                alt_key = gp_padr
                break
            case 116:
                alt_key = gp_padd
                break
            case 117:
                alt_key = gp_padl
                break
            case 119:
                alt_key = gp_shoulderl
                break
            case 120:
                alt_key = gp_shoulderlb
                break
            case 121:
                alt_key = gp_shoulderr
                break
            case 86:
                alt_key = gp_select
                break
        }

        if gamepad_button_check(obj_gamecontroller.gamepad_id, gp_shoulderrb)
        {
            if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, alt_key)
                is_pressed = 1
        }
    }
    if ((!is_pressed))
    {
        if keyboard_check_pressed(argument0)
            is_pressed = 1
    }
    return is_pressed;
}

function scr_debug_premade_save()
{
    var chapter = argument[0]
    var filechoice = argument[1]
    file = ((("filech" + string(chapter)) + "_") + string(filechoice))
    myfileid = file_text_open_write(file)
    file_text_write_string(myfileid, global.truename)
    file_text_writeln(myfileid)
    for (i = 0; i < 6; i += 1)
    {
        file_text_write_string(myfileid, global.othername[i])
        file_text_writeln(myfileid)
    }
    file_text_write_real(myfileid, global.char[0])
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.char[1])
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.char[2])
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 0)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 0)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 1)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 0)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 1)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 0)
    file_text_writeln(myfileid)
    for (i = 0; i < 4; i += 1)
    {
        file_text_write_real(myfileid, DW_HP[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, DW_MAX_HP[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, DW_ATK[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, DW_DEF[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, DW_MAG[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, DW_COURAGE[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.charweapon[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.chararmor1[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.chararmor2[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.weaponstyle[i])
        file_text_writeln(myfileid)
        for (q = 0; q < 4; q += 1)
        {
            file_text_write_real(myfileid, global.itemat[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itemdf[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itemmag[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itembolts[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itemgrazeamt[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itemgrazesize[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itemboltspeed[i][q])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.itemspecial[i][q])
            file_text_writeln(myfileid)
        }
        for (j = 0; j < 12; j += 1)
        {
            file_text_write_real(myfileid, global.spell[i][j])
            file_text_writeln(myfileid)
        }
    }
    file_text_write_real(myfileid, global.boltspeed)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.grazeamt)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.grazesize)
    file_text_writeln(myfileid)
    for (j = 0; j < 13; j += 1)
    {
        file_text_write_real(myfileid, global.item[j])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.keyitem[j])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.weapon[j])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.armor[j])
        file_text_writeln(myfileid)
    }
    file_text_write_real(myfileid, party_get_tension_points())
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, Party.get_maximum_tension_points())
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 2)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 3)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 0)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 1)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 2)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 20)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 20)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 10)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 20)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 1)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 0)
    file_text_writeln(myfileid)
    for (i = 0; i < 8; i += 1)
    {
        file_text_write_real(myfileid, LW_ITEM_INVENTORY[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, LW_PHONE_NUMBERS[i])
        file_text_writeln(myfileid)
    }
    for (i = 0; i < 9999; i += 1)
    {
        file_text_write_real(myfileid, 0)
        file_text_writeln(myfileid)
    }
    file_text_write_real(myfileid, 251)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 28)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, 14400)
    file_text_close(myfileid)
    ini_open("dr.ini")
    ini_write_string(("G" + string(filechoice)), "Name", "Kris")
    ini_write_real(("G" + string(filechoice)), "Level", 1)
    ini_write_real(("G" + string(filechoice)), "Love", 1)
    ini_write_real(("G" + string(filechoice)), "Time", 14400)
    ini_write_real(("G" + string(filechoice)), "Room", 28)
    ini_write_real(("G" + string(filechoice)), "InitLang", global.flag[912])
    ini_close()
}

function scr_debug_print(argument0)
{
    if (!scr_debug())
        return;
    if (!instance_exists(obj_debug_gui))
    {
        object_instance_create((camerax() + 10), (cameray() + 10), obj_debug_gui)
        obj_debug_gui.depth = -9999
    }
    obj_debug_gui.newtext = argument0
    with (obj_debug_gui)
    {
        message[messagecount] = newtext
        newtext = ""
        timer[messagecount] = (90 - totaltimer)
        totaltimer += timer[messagecount]
        messagecount++
        debugmessage = message[0]
        for (i = 1; i < messagecount; i++)
            debugmessage += ("#" + message[i])
    }
}

function scr_debug_print_persistent(argument0)
{
    draw_set_halign(fa_right)
    var dcolor = draw_get_color()
    draw_set_color(c_black)
    draw_text_transformed(621, 11, string_hash_to_newline(argument0), 0.5, 0.5, 0)
    draw_set_color(dcolor)
    draw_text_transformed(620, 10, string_hash_to_newline(argument0), 0.5, 0.5, 0)
    draw_set_halign(fa_left)
}

function scr_debug_soundboard()
{
    if scr_debug()
    {
        for (var __sndcount = 0; __sndcount < (argument_count + 1); __sndcount++)
        {
            if keyboard_check_pressed(ord(string(__sndcount)))
                sound_play({ sound : argument[__sndcount] })
        }
    }
}

function debug_event_type_name() {
    switch (event_type) {
        // CREATE EVENT
        case ev_create:
            _event_name = "create"
        break;
        // DESTROY EVENT
        case ev_destroy:
            _event_name = "destroy"
        break;
        // CLEANUP EVENT
        case ev_cleanup:
            _event_name = "cleanup"
        break;
        // STEP EVENTS
        case ev_step:
            _event_name = "step"
            switch (event_number) {
                case ev_step_normal:
                    _sub_event_name = "step_normal"
                break;
                case ev_step_begin:
                    _sub_event_name = "begin_step"
                break;
                case ev_step_end:
                    _sub_event_name = "end_step"
                break;
            }
        break;
        // ALARM EVENT
        case ev_alarm:
            _event_name = "alarm"
            _sub_event_name = string(event_number) // ALARM NUMBER 0...11
        break;
        // KEY DOWN EVENT
        case ev_keyboard:
            _event_name = "key_down"
            _sub_event_name = string(event_number) // KEYCODE
        break;
        // KEY PRESS EVENT
        case ev_keypress:
            _event_name = "key_press"
            _sub_event_name = string(event_number) // KEYCODE
        break;
        // KEY RELEASE EVENT
        case ev_keyrelease:
            _event_name = "key_release"
            _sub_event_name = string(event_number) // KEYCODE
        break;
        case ev_mouse:
            _event_name = "mouse"
            // TODO: EXPAND
            _sub_event_name = string(event_number)
        break;
        // COLLISION EVENTS
        case ev_collision:
            _event_name = "collision"
            _sub_event_name = object_get_name(event_number) // INDEX COLLISION OBJECT -> NAME COLLISION OBJECT
        break;
        // OTHER EVENTS
        case ev_other:
            _event_name = "other"
            // TODO: EXPAND
            _sub_event_name = string(event_number)
        break;
        // GESTURE EVENTS
        case ev_gesture:
            _event_name = "gesture"
            // TODO: EXPAND
            _sub_event_name = string(event_number)
        break;
        // DRAW EVENTS
        case ev_draw:
            _event_name = "draw"
            switch (event_number) {
                case ev_draw_begin:
                    _sub_event_name = "draw_begin"
                break;
                case ev_draw_end:
                    _sub_event_name = "draw_end"
                break;
                case ev_draw_pre:
                    _sub_event_name = "pre_draw"
                break;
                case ev_draw_post:
                    _sub_event_name = "post_draw"
                break;
                case ev_gui:
                    _sub_event_name = "gui"
                break;
                case ev_gui_begin:
                    _sub_event_name = "gui_begin"
                break;
                case ev_gui_end:
                    _sub_event_name = "gui_end"
                break;
                default:
                    _sub_event_name = "draw_normal"
            }
        break;
        default:
            _event_name = "unknown"
            _sub_event_name = "unknown"
    }
}

function debug_log_event(_debug_note = "") {
	if (global.debug_setting_log_events == true) {

        _event_name = ""
        _sub_event_name = ""

        // EVENT ID -> STRING
        debug_event_type_name()

        _debug_message = "event log: " + object_get_name(object_index) + "." + _event_name
        if (_sub_event_name != "") { _debug_message = _debug_message + "." + _sub_event_name }
        if (_debug_note != "") { _debug_message = _debug_message + " -> " + _debug_note}

        show_debug_message(_debug_message)
	}
}

function debug_message(argument0)  {
    if (global.debug == true)
        show_debug_message(argument0)
}

function debug_printline(argument0, argument1)
{
    if scr_debug()
    {
        draw_set_font(deltarune_small_font)
        draw_set_color(c_black)
        yy = (480 - (8 * argument1))
        xx = 2
        draw_set_color(c_white)
    }
}

function debug_printxy(argument0, argument1, argument2)
{
    if scr_debug()
    {
        camx = camerax()
        camy = cameray()
        camx = (argument0 + camerax())
        camy = (argument1 + cameray())
        draw_set_font(deltarune_small_font)
        draw_set_color(c_black)
        draw_text(camx, camy, argument2)
        draw_text((camx + 1), camy, argument2)
        draw_text((camx + 1), (camy + 1), argument2)
        draw_text((camx + 1), (camy - 1), argument2)
        draw_text((camx - 1), camy, argument2)
        draw_text((camx - 1), (camy + 1), argument2)
        draw_text((camx - 1), (camy - 1), argument2)
        draw_text(camx, (camy - 1), argument2)
        draw_text((camx + 1), (camy - 1), argument2)
        draw_text((camx - 1), (camy - 1), argument2)
        draw_text(camx, (camy + 1), argument2)
        draw_text((camx + 1), (camy + 1), argument2)
        draw_text((camx - 1), (camy + 1), argument2)
        draw_set_color(c_gray)
        draw_text(camx, camy, argument2)
    }
}

my_debug_skip_contact = false
my_debug_skip_intro = false
my_debug_draw_room_name = true
my_debug_draw_skip_audiogroup_load = true
my_debug_room_goto_next_key = true
my_debug_goto_dojo = true
my_debug_print_code_location = true

debug_setting_log_events = false

// MESSES UP SAVE POINTS
debug_setting_toggle_solid_blocks = false
debug_setting_draw_solid_blocks = false

debug_skip_legend = true
debug_skip_intro = true

debug_setting_draw_fps = true
debug_setting_draw_path = false
debug_setting_draw_grid = false

// version = "1.10"
