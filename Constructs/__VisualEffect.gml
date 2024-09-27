/// ----------------------------------------------------------------------------
/// visual_effect
/// ----------------------------------------------------------------------------

// visual_effect_object

construct_create({ name : "visual_effect" })

/// ----------------------------------------------------------------------------
/// afterimage_visual_effect
/// ----------------------------------------------------------------------------

construct_create({ name : "afterimage_visual_effect", parent : "visual_effect" })

.set_event({ event : "create_event", callable : function() {
    // lifetime_frames
    self[$ "fadeSpeed"] ??= 0.04
    if ("animated") {
        animRate    = 1
        fade        = 0.1
        reverse     = 0
        maxalpha    = 1
        image_count = 0
        ease        = 0
        image_count = (sprite_get_number(sprite_index) - 1)
    } else if ("growing") {
        xrate = 0.2
        yrate = 0.2
        fade  = 0.1
    } else if ("partial") {
        faderate     = 0.1
        siner        = 0
        sprite_index = spr_whitepx
        image_speed  = 0
        flash        = false
        // user_event_0
        width        = sprite_get_width(sprite_index)
        height       = sprite_get_width(sprite_index)
        xo           = sprite_get_xoffset(sprite_index)
        yo           = sprite_get_yoffset(sprite_index)
    }

    fade = fadeSpeed
    fade = faderate

    get_subtype = function() {
        return private.subtype
    }
}})

.set_event({ event : "step_event", callable : function() {
    if ("") {
	} else if ("growing") {
		image_xscale += xrate
		image_yscale += yrate
	} else if ("animated") {
        if (reverse == 1) {
            reverse = 0
            image_index = image_count
            maxalpha = image_alpha
            image_alpha = 0
            fade *= -1
        }
        image_index = ((1 - (image_alpha / 1)) * image_count)
        if (image_alpha < 0 || image_alpha > 1) instance_destroy()
    }

    image_alpha -= fade
    if (image_alpha < 0) instance_destroy()
}})

.set_event({ event : "draw_event", callable : function() {
    if ("") {
        draw_self()
    } else if ("animated") {
        gpu_set_fog(true, image_blend, 0, 1)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, (image_alpha * maxalpha))
        gpu_set_fog(false, c_black, 0, 0)
    } else if ("growing") {
        draw_self()
    } else if ("partial") {
        if flash {
            gpu_set_fog(true, c_white, 0, 1)
            draw_self()
            gpu_set_fog(false, c_black, 0, 0)
            flash = false
        }
        siner++
        var hw = (width / 2)
        var hh = (height / 2)
        var m = lerp_ease_out(0, (sprite_height / 2), ((siner + 2) / 10), 1)
        draw_sprite_part_ext(sprite_index, image_index, 0, 0, hw, hh, ((x - m) - ((xo * image_xscale) / 2)), ((y - m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
        draw_sprite_part_ext(sprite_index, image_index, hw, 0, hw, hh, ((x + m) - ((xo * image_xscale) / 2)), ((y - m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
        draw_sprite_part_ext(sprite_index, image_index, 0, hh, hw, hh, ((x - m) - ((xo * image_xscale) / 2)), ((y + m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
        draw_sprite_part_ext(sprite_index, image_index, hw, hh, hw, hh, ((x + m) - ((xo * image_xscale) / 2)), ((y + m) - ((yo * image_yscale) / 2)), image_xscale, image_yscale, image_blend, image_alpha)
    }
}})

// afterimage_object
// animated_afterimage_object
// growing_afterimage_object
// partial_afterimage_object

enum AFTERIMAGE_TYPE {
    DEFAULT,
	ANIMATED,
	GROWING,
	PARTIAL,
}

function afterimage_create(_instance = self) {
    // _instance.sprite_index = _target.sprite_index
    // _instance.image_index  = _target.image_index
    // _instance.image_blend  = _target.image_blend
    // _instance.image_speed  = 0
    // _instance.depth        = _target.depth
    // _instance.image_xscale = _target.image_xscale
    // _instance.image_yscale = _target.image_yscale
    // _instance.image_angle  = _target.image_angle
	_instance = object_instance_create(_target.x, _target.y, afterimage_object)
	return _instance
}

/// ----------------------------------------------------------------------------
/// SFX
/// ----------------------------------------------------------------------------

#macro SFX global.special_effects_helper
SFX = new SpecialEffectsHelper()

function SpecialEffectsHelper() constructor {


    private = {
        noises : {
            move : false,
            select : false,
            cantselect : false,
            cancel : false,
        },
    }

    noises = {}
    noises.move = function() { with (private.noises) { move = true } }
    noises.select = function() { with (private.noises) { select = true } }
    noises.cantselect = function() { with (private.noises) { cantselect = true } }
    noises.cancel = function() { with (private.noises) { cancel = true } }

    play_noises = function() {
        with (private.noises) {
            if (move) {
                sound_play({ sound : snd_menumove })
                move = false
            }
            if (select) {
                sound_play({ sound : snd_select })
                select = false
            }
            if (cantselect) {
                sound_play({ sound : unselectable_sound })
                cantselect = false
            }
            if (cancel) {
                sound_play({ sound : snd_smallswing })
                cancel = false
            }

        }
    }

}

/// ----------------------------------------------------------------------------
/// EmoteBubble
/// ----------------------------------------------------------------------------
function EmoteBubble(arguments) constructor {

private = EmoteBubbleObject.create_instance(arguments).private

static destroy = function(arguments = {}) {
    arguments.object_instance = private.object_instance
    object_instance_destroy(arguments)
}

}

/*

EMOTE_BUBBLE
* private -> not static

EMOTE_BUBBLE_OBJECT
* private -> static

EMOTE_BUBBLE_OBJECT_INSTANCE
* private -> not static

// INITIALIZE_STATIC_VARIABLES
EmoteBubbleObject()
*/

// CONSTRUCTOR
function EmoteBubbleObject() : Object() constructor {

// RETURN IF INITIALIZED AND NOT INTERHITED
static initialized = false
if (initialized) { return }
initialized = true

// copy private struct of parent and overwrite
static private = merge_struct({ structs : [ clone_variable({ variable : private }), {
    object_id : emote_bubble_object,
}]})

/// ----------------------------------------------------------------------------
/// @function create_instance(arguments)
/// ----------------------------------------------------------------------------
/// @description <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} arguments
/// @parameter {String} emote_type
/// @parameter {Real} lifetime_frames
/// @parameter {Id.ObjectInstance} target_object_instance
/// @parameter {Real} xoffset
/// ----------------------------------------------------------------------------
/// @return {Id.Instance} emote_bubble_object_instance
/// ----------------------------------------------------------------------------
static create_instance = function(arguments) {

    var _x         = arguments[$ "x"]
    var _y         = arguments[$ "y"]
    var _layer     =
    var _variables = {}

    var _lifetime_frames = arguments[$ "lifetime_frames"]
    var _emote_type = arguments[$ "emote_type"]
    var _xoffset = arguments[$ "xoffset"] ?? (IN_DARK_WORLD ? 20 : 10)

    var _target_object_instance = arguments[$ "target_object_instance"]
    if (_target_object_instance != undefined) {
        _x = (image_xscale > 0) ? x - image_xscale * sprite_get_xoffset(sprite_index) + (sign(image_xscale) * 0.5 * sprite_width) - (0.5 * _emote_bubble_object_instance.sprite_width) + _xoffset : x + image_xscale * sprite_get_xoffset(sprite_index) - (sign(image_xscale) * 0.5 * sprite_width) - (0.5 * _emote_bubble_object_instance.sprite_width) + _xoffset,
        _y = y - IN_DARK_WORLD ? 20 : 10
    }

    return object_instance_create({
        object    : get_object_id(),
        x         : _x,
        y         : _y,
        layer     : _layer,
        variables : _variables,
    })
}

get_emote_type = function() {
    return private.emote_type
}

set_emote_type = function(_value) {
    emote_type = _value
    return self
}

static initialize = function() {
    with (other) {
        private = {}
        private.object_instance = self
        private.create_event = method(self, EmoteBubbleObject.create_event)
        private.step_event = method(self, EmoteBubbleObject.step_event)
    }
}

static create_event = function() { with (other) {

    self[$ "private"] ??= {}

    private[$ "emote_type"]      ??= "!"
    private[$ "lifetime_frames"] ??= 20

    image_xscale = IN_DARK_WORLD ? 2 : 1
    image_yscale = IN_DARK_WORLD ? 2 : 1



    if (get_emote_type() == "!") {
        sprite_index = exclamation_mark_emote_bubble_sprite
    } else if (get_emote_type() == "?") {
        sprite_index = question_mark_emote_bubble_sprite
    } else if (get_emote_type() == "...") {
        // image_speed = 0.1 -> 3 FPS
        sprite_index = ellipsis_emote_bubble_sprite
    }

    // destroy_self
    gpl_call_later({ delay_frames : lifetime_frames, callback : object_instance_destroy })
}}

static step_event = function() {
    // WHY?
    if (input_check("menu")) {
        onesec = scr_marker(x, y, sprite_index)
        onesec.image_xscale = image_xscale
        onesec.image_yscale = image_yscale
        onesec.depth = depth
        onesec.image_index = image_index
        onesec.image_speed = image_speed
        gpl_call_later(2, object_instance_destroy, [onesec])
        object_instance_destroy()
    }
}

}

/// ----------------------------------------------------------------------------
/// battle_message
/// ----------------------------------------------------------------------------

/// ----------------------------------------------------------------------------
/// @function battle_message_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} x_position
/// <parameter_description>
///
/// @parameter {type} y_position
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function battle_message_create(parameters) {
	// damage_battle_message_object
    return new BattleMessage()
}

function BattleMessage() {

}

function HealingBattleMessage(arguments) constructor {
    // health_points
    // delay_frames
    // full_health
    //
    // target -> scr_dmgwriter_selfchar (charinstance)
    // target -> enemy -> global.monsterx[myself] and global.monstery[myself]
    // target -> check full health

    /*

    self[$ "delay_frames"] ?? 8

    */

}

*/

x : global.monsterx[myself],
y : global.monstery[myself],

DW_HP[global.char[myself]] >= DW_MAX_HP[global.char[myself]]

function DefeatBattleMessageObject() : Object() constructor{

    static object_id = defeat_battle_message_object

    static create_event = function() {
        sequence_element_id = sequence_instance.elementID
        sequence_instance_struct = layer_sequence_get_instance(sequence_element_id)

        with (sequence_instance_struct.creation_variables) {
            other.type = type
        }

        switch (type) {
            case "recruit":
                sprite_index = recruit_message_sprite
            break;
            case "lost":
                sprite_index = lost_message_sprite
            break;
            case "frozen":
                sprite_index = frozen_message_sprite
            break;
            case "dead":
                sprite_index = dead_message_sprite
            break;
        }
    }

    static draw_event = function() {
        if (!in_sequence) { instance_destroy() }
        draw_self()
    }

    static cleanup_event = function() {
        try { layer_sequence_destroy(sequence_element_id) }
        catch(_exception) { show_debug_message(_exception) }
    }

}

DefeatBattleMessageSequence()

function DefeatBattleMessageSequence() : Sequence() constructor {

    static sequence_id = defeat_battle_message_sequence

    static create_instance = function(arguments) {
        var _layer = layer_create(-5)
    	var _sequence_element_id = layer_sequence_create(_layer, arguments.x, arguments.y, defeat_battle_message_sequence)
    	var _sequence_instance_struct = layer_sequence_get_instance(_sequence_element_id)
        _sequence_instance_struct.creation_variables = {
            defeat_type : arguments.defeat_type,
        }
    }

}

function DamageBattleMessage(arguments) constructor {

    object_instance = DamageBattleMessageObject.create_instance(arguments)

    destroy = function() {
        object_instance_destroy(object_instance)
    }

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
function scr_dmgwriter_selfchar()
{
    return object_instance_create(x, (((y + myheight) - 24) - (tu * 20)), damage_battle_message_object);
}

enum DAMAGE_MESSAGE_TYPE {
    NUMBER          = 0,
    MISS            = 1,
    DOWN            = 2,
    MAX             = 3,
    UP              = 4,
    _100_PERCENT    = 5,
    DANCING         = 6,
    DANCING_X2      = 7,
    PLUS_BUMP       = 8,
    STOPPED_DANCING = 9,
}

/*

type
* 0 -> kris
* 1 -> susie
* 2 -> ralsei
* 3 -> heal?
* 4 -> down
* 5 -> spare?
* 6 -> noelle

*/

/*
    damage -> damage_points
*/

// initialize static variables
DamageBattleMessageObject()

function DamageBattleMessageObject() : Object() constructor {

    static object_index = damage_battle_message_object

    static colours = {
        light_fuchsia : merge_color(c_purple, c_white, 0.6),
        light_blue    : merge_color(c_aqua, c_white, 0.5),
        light_green   : merge_color(c_lime, c_white, 0.5),
        light_yellow  : merge_color(c_yellow, c_white, 0.3),
    }

    static create_instance = function() {

        damage_points
        style_type

        var _object_instance = object_instance_create({
            x : ,
            y : ,
            layer : ,
            object : ,
            variables : {

            }
        })

        // apply object events
        // _object_instance.create_event = DamageBattleMessageObject.create_event
        // _object_instance.current_event =

        return _object_instance
    }

    static create_event = function() {

        // STATIC_PROPERTIES
        colours = DamageBattleMessageObject.colours

        spec = 0
        delaytimer = 0
        delay = 2
        active = false
        damage = round(random(600))
        bounces = 0
        type = -1
        stretch = 0.2
        stretchgo = 1

        kill = 0
        killtimer = 0
        killactive = false

        with (damage_battle_message_object) { if (type != 3) { killtimer = 0 } }

        stayincamera = true
        xx = camerax()

        // message_sprite = spr_battlemsg

        specialmessage = 0
        message = specialmessage

        if (damage == 0) { message = "Miss" }
        damagemessage = string(damage)
        colour = c_white
        font = global.damagefont
        if (type == "kris") colour = colours.light_blue
        if (type == "susie") colour = colours.light_fuchsia
        if (type == "ralsei") colour = colours.light_green
        if (type == "noelle") {
           colour = colours.light_yellow
        }
        if (type == "heal") {
            colour = c_lime
        } if (type == "down") {
            message = "Down"
        } if (type == "spare" && damage < 0) {
            if (damage == 100) { message = "+100%" }
            font = global.damagefontgold
            colour = c_silver
            damagemessage = (damage < 0) ? $"{damage}%" : $"+{damage}%"
        }

        if (message == "Down") colour = c_red
        if (message == "Max")  colour = c_lime
        if (message == "Up")  colour = c_lime
        if (message == "+100%") colour = c_lime
        if (message == "Dancing")
        if (message == "Dancingx2")
        if (message == "+BUMP")
        if (message == "StoppedDancing")

        /*
        green_battle_message_font
        yellow_battle_message_font
        blue_battle_message_font
        red_battle_message_font
        */

        message_renderer = text_element_create({ string : damagemessage })
        .set_colour(colour)
        .set_alignment({ horizontal : fa_right })
        .set_rotation({ degrees : spec ? 90 : 0 })
    }

    static step_event = function() {

        // stay in camera
        if (global.fighting and stayincamera) { if (x >= (xx + 600)) { x = (xx + 600) } }

        // prevent_death
        if (delaytimer < delay) { with (damage_battle_message_object) { killtimer = 0 } }

        // advance_timer
        delaytimer++

        // ???
        if (delaytimer == delay) {
            vspeed = (-5 - random(2))
            hspeed = 10
            vstart = vspeed
            flip = 90
        }

        // EARLY_RETURN
        if (delaytimer < delay) { return }

        if (hspeed > 0) hspeed -= 1
        if (hspeed < 0) hspeed += 1
        if (abs(hspeed) < 1) hspeed = 0

        if (bounces < 2) vspeed += 1
        if (y > ystart && bounces < 2 && killactive == false) {
            y = ystart
            vspeed = (vstart / 2)
            bounces += 1
        }
        if (bounces >= 2 && killactive == false) {
            vspeed = 0
            y = ystart
        }
        if (stretchgo == 1) stretch += 0.4
        if (stretch >= 1.2) {
            stretch = 1
            stretchgo = 0
        }
        killtimer += 1
        if (killtimer > 35) killactive = true
        if (killactive) {
            kill += 0.08
            y -= 4
        }

        if (kill > 1) { instance_destroy() }

    }

    static draw_event = function() {

        // EARLY_RETURN
        if (delaytimer < delay) { return }

        // MESSAGE_RENDERER.DRAW
        message_renderer
        .set_alpha(1 - kill)
        .set_scale({ x : 2 - stretch, y : stretch + kill })
        .draw({ x : x + 30, y })
    }

}

/*

// INITIALIZE_STATICS
DamageBattleMessageObject()

function DamageBattleMessageObject() : Object() constructor {

    static create_event = function() {
        spec = 0
        delaytimer = 0
        delay = 2
        active = false
        damage = round(random(600))
        bounces = 0
        type = -1
        stretch = 0.2
        stretchgo = 1
        lightf = merge_color(c_purple, c_white, 0.6)
        lightb = merge_color(c_aqua, c_white, 0.5)
        lightg = merge_color(c_lime, c_white, 0.5)
        lighty = merge_color(c_yellow, c_white, 0.3)
        init = false
        kill = 0
        killtimer = 0
        killactive = false
        with (damage_battle_message_object)
        {
            if (type != 3)
                killtimer = 0
        }
        specialmessage = 0
        stayincamera = 1
        xx = camerax()
        message_sprite = spr_battlemsg
    }

    static draw_event = function() {
        if (delaytimer < delay)
        {
            with (damage_battle_message_object)
                killtimer = 0
        }
        delaytimer += 1
        if (delaytimer == delay)
        {
            vspeed = (-5 - random(2))
            hspeed = 10
            vstart = vspeed
            flip = 90
        }
        if (delaytimer >= delay)
        {
            draw_set_color(c_white)
            if (type == 0)
                draw_set_color(lightb)
            if (type == 1)
                draw_set_color(lightf)
            if (type == 2)
                draw_set_color(lightg)
            if (type == 3)
                draw_set_color(c_lime)
            if (type == 4)
                draw_set_color(c_red)
            if (type == 5 && damage < 0)
                draw_set_color(c_silver)
            if (type == 6)
                draw_set_color(lighty)
            message = specialmessage
            if (damage == 0)
                message = 1
            if (type == 4)
                message = 2
            if (type == 5 && damage == 100)
                message = 5
            if (type != 5)
                draw_set_font(global.damagefont)
            if (type == 5)
                draw_set_font(global.damagefontgold)
            if (hspeed > 0)
                hspeed -= 1
            if (hspeed < 0)
                hspeed += 1
            if (abs(hspeed) < 1)
                hspeed = 0
            if (init == false)
            {
                damagemessage = string(damage)
                if (type == 5)
                    damagemessage = (("+" + string(damage)) + "%")
                if (type == 5 && damage < 0)
                    damagemessage = (string(damage) + "%")
                init = true
            }
            if (message == 0)
            {
                draw_set_alpha((1 - kill))
                draw_set_halign(fa_right)
                if (spec == 0)
                    draw_text_transformed((x + 30), y, string_hash_to_newline(damagemessage), (2 - stretch), (stretch + kill), 0)
                if (spec == 1)
                    draw_text_transformed((x + 30), y, string_hash_to_newline(damagemessage), (2 - stretch), (stretch + kill), 90)
                draw_set_halign(fa_left)
                draw_set_alpha(1)
            }
            else
            {
                if (message == 1)
                    draw_sprite_ext(message_sprite, 0, (x + 30), y, (2 - stretch), (stretch + kill), 0, draw_get_color(), (1 - kill))
                if (message == 2)
                    draw_sprite_ext(message_sprite, 1, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_red, (1 - kill))
                if (message == 3)
                    draw_sprite_ext(message_sprite, 2, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_lime, (1 - kill))
                if (message == 4)
                    draw_sprite_ext(message_sprite, 3, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_lime, (1 - kill))
                if (message == 5)
                    draw_sprite_ext(message_sprite, 5, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_lime, (1 - kill))
                if (message == 6)
                    draw_sprite_ext(message_sprite, 8, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_white, (1 - kill))
                if (message == 7)
                    draw_sprite_ext(message_sprite, 9, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_white, (1 - kill))
                if (message == 8)
                    draw_sprite_ext(message_sprite, 10, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_white, (1 - kill))
                if (message == 9)
                    draw_sprite_ext(message_sprite, 11, (x + 30), y, (2 - stretch), (stretch + kill), 0, c_white, (1 - kill))
            }
            if (bounces < 2)
                vspeed += 1
            if (y > ystart && bounces < 2 && killactive == false)
            {
                y = ystart
                vspeed = (vstart / 2)
                bounces += 1
            }
            if (bounces >= 2 && killactive == false)
            {
                vspeed = 0
                y = ystart
            }
            if (stretchgo == 1)
                stretch += 0.4
            if (stretch >= 1.2)
            {
                stretch = 1
                stretchgo = 0
            }
            killtimer += 1
            if (killtimer > 35)
                killactive = true
            if (killactive == true) {
                kill += 0.08
                y -= 4
            }
            if (kill > 1)
                instance_destroy()
        }
        if (global.fighting == true) {
            if (stayincamera == 1) {
                if (x >= (xx + 600)) { x = (xx + 600) }
            }
        }
    }

}

*/

/// ----------------------------------------------------------------------------
/// "spare_animation"
/// ----------------------------------------------------------------------------

/// ----------------------------------------------------------------------------
/// @function spare_animation_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} sprite
/// <parameter_description>
///
/// @parameter {type} frame
/// <parameter_description>
///
/// @parameter {type} x_position
/// <parameter_description>
///
/// @parameter {type} y_position
/// <parameter_description>
///
/// @parameter {type} x_dimension
/// <parameter_description>
///
/// @parameter {type} y_dimension
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function spare_animation_create(parameters) {
	var _sprite      = parameters[$ "sprite"]      ??
	var _frame       = parameters[$ "frame"]       ??
	var _x_position  = parameters[$ "x_position"]  ??
	var _y_position  = parameters[$ "y_position"]  ??
	var _x_dimension = parameters[$ "x_dimension"] ??
	var _y_dimension = parameters[$ "y_dimension"] ??

	return object_instance_create({
		object_index : spare_animation_object,
		x, y,
		variables : {
			sprite_index : self[$ "spared_sprite"] ?? sprite_index,
			image_index : 0, // image_index
			image_xscale,
			image_yscale,
		},
	})
}

SpareAnimationObject()

create_event : function() {
    /// @type {type}
    ///
    time = 0
    /// @type {type}
    ///
    image_speed = 0
    /// @type {type}
    ///
    starcount = 0
    /// @type {type}
    ///
    afterimage = 0
    /// @type {type}
    ///
    tone = 0
    /// @type {type}
    ///
    neotone = 0

    sound_stop({ sound : snd_spare })
    sound_play({ sound : snd_spare })
}

draw_event : function() {
    if (time >= 6 and time <= 26) {
        afterimage += 1
        gpu_set_fog(true, c_white, 0, 1)
        draw_sprite_ext(sprite_index, image_index, x + afterimage * 4, y, image_xscale, image_yscale, 0, image_blend, 0.7 - afterimage / 25)
        draw_sprite_ext(sprite_index, image_index, x + afterimage * 8, y, image_xscale, image_yscale, 0, image_blend, 0.4 - afterimage / 30)
        gpu_set_fog(false, c_black, 0, 0)
    }
    if (time < 5) { draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, (1 - (neotone / 4))) }
    if (time < 6) {
        gpu_set_fog(true, c_white, 0, 1)
        maxwhite = (time / 5)
        if (maxwhite > 1) { maxwhite = 1 }
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, (maxwhite - (tone / 5)))
        gpu_set_fog(false, c_black, 0, 0)
    }
    if (time >= 1 and time <= 5) {
        for (i = 0; i < 2; i += 1) {
            star[starcount] = object_instance_create((x + random(sprite_width)), (y + random(sprite_height)), obj_marker)
            with (star[starcount]) {
                image_xscale = 2
                image_yscale = 2
                sprite_index = spr_sparestar_anim
                image_alpha = 2
                image_speed = 0.25
                hspeed = -3
                gravity = 0.5
                gravity_direction = 0
            }
            starcount += 1
        }
    }
    if (time >= 5 && time <= 30) {
        for (i = 0; i < starcount; i += 1) {
            with (star[i]) {
                image_angle += 10
                image_alpha -= 0.1
                if (image_alpha <= 0) { instance_destroy() }
            }
        }
    }
    if (time >= 5 && time < 10) {
        tone += 1
    }
    if (time >= 9) {
        neotone += 1
        if (neotone >= 30) {
            instance_destroy(star)
            instance_destroy()
        }
    }
    time += 1
}

/// ----------------------------------------------------------------------------
/// "flee_animation"
/// ----------------------------------------------------------------------------

function flee_animation_create() {

}

function DefeatAnimation() constructor {
    // defeat_animation_object
    var defeat_animation_variables = {
        sprite_index : self[$ "hurt_sprite"] ?? sprite_index,
        image_index : 0, image_xscale, image_yscale,
    }
}

function DeathAnimation(arguments) constructor {

    DeathAnimationObject.create_instance(arguments)

}

SpareAnimation()

new DefeatAnimationObject()

function DefeatAnimationObject() constructor {

    static initialize = function() {
        other.create_event = method(other, create_event)
        other.step_event   = method(other, step_event)
        other.draw_event   = method(other, draw_event)
    }

    static create_event = function() {
        timer = 0
        g_timer = 0
        image_speed = 0
        sound_play({ sound : snd_defeatrun })
    }

    static step_event = function() {
        g_timer++
        if (g_timer >= 15) { timer++ }

        if (timer > 15) { object_instance_destroy() }
    }

    static draw_event = function() {
        // DRAW_SELF
        if (timer == 0) {
            draw_self()
        } else {
            for (i = 0; i <= 80; i++) {
                draw_sprite_ext(sprite_index, image_index, (x + (4 * i)), y, image_xscale, image_yscale, 0, image_blend, ((0.4 - (timer / 8)) + (i / 200)))
            }
        }
        // DRAW_SWEAT
        if ((g_timer <= 5) or (g_timer >= 9 and g_timer <= 13)) { draw_sprite(spr_defeatsweat, 0, (x - 6), (y - 6)) }
    }

}

/// ----------------------------------------------------------------------------
/// "death_animation"
/// ----------------------------------------------------------------------------

function death_animation_create() {

}

DeathAnimationObject()

function DeathAnimationObject() constructor {

    static create_instance = function() {
        // death_animation_object
        var defeat_animation_variables = {
            sprite_index : self[$ "hurt_sprite"] ?? sprite_index,
            image_index : 0, image_xscale, image_yscale,
        }

        var _death_animation = object_instance_create(x, y, death_animation_object)
        if (variable_instance_exists(id, "touchsprite")) {
            _death_animation.sprite_index = touchsprite
        } else {
            _death_animation.sprite_index = sprite_index
        }
        _death_animation.image_index = 0
        _death_animation.image_xscale = image_xscale
        _death_animation.image_yscale = image_yscale

        return object_instance_create({
            object : death_animation_object,
        })
    }

    static initialize = function() {
        other.create_event = method(other, create_event)
        other.step_event   = method(other, step_event)
        other.draw_event   = method(other, draw_event)
    }

    static create_event = function() {
        t = 0
        image_speed = 0
        starcount = 0
        redup = 0
        bsize = 6
        sound_play({ sound : death_sound })
    }

    static step_event = function() {
        if (t == 0)
        {
            truew = sprite_get_width(sprite_index)
            trueh = sprite_get_width(sprite_index)
            imgx = image_xscale
            imgy = image_yscale
            if (truew >= 50 || trueh >= 50)
                bsize = 8
            if (truew >= 100 || truew >= 100)
                bsize = 16
            xs = ceil((truew / bsize))
            ys = ceil((trueh / bsize))
            for (i = 0; i <= xs; i += 1)
            {
                for (j = 0; j <= ys; j += 1)
                {
                    bl[i][j] = (i * bsize)
                    bh[i][j] = (j * bsize)
                    bx[i][j] = (x + ((i * bsize) * imgx))
                    bspeed[i][j] = 0
                    bsin[i][j] = ((4 + (j * 3)) - i)
                }
            }
        }
        if (t >= 1)
        {
            if (redup < 10)
                redup += 1
            image_blend = merge_color(c_white, c_red, (redup / 10))
            for (i = 0; i <= xs; i += 1)
            {
                for (j = 0; j <= ys; j += 1)
                {
                    if (bsin[i][j] <= 0)
                        bspeed[i][j] += 1
                    bx[i][j] += bspeed[i][j]
                    bsin[i][j] -= 1
                }
            }
        }
        t += 1
    }

    static draw_event = function() {
        if (t == 0) { draw_self() }
        if (t >= 1) {
            for (i = 0; i <= xs; i += 1) {
                for (j = 0; j <= ys; j += 1) { draw_sprite_part_ext(sprite_index, image_index, bl[i][j], bh[i][j], bsize, bsize, bx[i][j] - sprite_xoffset, (y + ((j * bsize) * imgy)) - sprite_yoffset, imgx, imgy, image_blend, (1 - (bspeed[i][j] / 12))) }
            }
            if (bspeed[0][ys] >= 12) { instance_destroy() }
        }
    }

}

/// ----------------------------------------------------------------------------
/// "target_marker"
/// ----------------------------------------------------------------------------

/// creates a target marker for the target if it doesn't have one
/// and otherwise extends the life of the existing target marker
function apply_target_marker(arguments) {
    var a = arguments
    var _target_marker = variable_instance_get(a.target, "target_marker") ?? noone
    if (instance_exists(_target_marker)) {
        _target_marker.self_destruct = false
    } else {
        var _variables = { target : a.target }
        if (struct_exists(a, "colour")) { _variables.colour = a.colour }

        object_instance_create({
            object_index : target_marker_object,
            variables : _variables,
        })
    }
}

/*******************************************************************************/
#region    –––––––––––––––––––– HEALING_ANIMATION_OBJECT ––––––––––––––––––––
/*******************************************************************************/

HealingAnimationObject()

function HealingAnimationObject() constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– CREATE_INSTANCE ––––––––––––––––––––
    /*******************************************************************************/

    static create_instance = function(arguments) {

        var _variables = {}

        if (arguments[$ "target_object_instance"] != undefined) {
            _variables.target_object_instance = arguments.target_object_instance
        }

        if (arguments[$ "particle_sprite"] != undefined) {
            _variables.target_object_instance = arguments.particle_sprite
        }

        if (arguments[$ "particle_colour"] != undefined) {
            _variables.particle_colour = arguments.particle_colour
        }

        if (arguments[$ "flash"] != undefined) {
            _variables.flash = arguments.flash
        }

        return object_instance_create({
            object : healing_animation_object,
            x : target_object_instance.x,
            y : target_object_instance.y,
            variables : _variables,
        })
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CREATE_INSTANCE ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– CREATE_EVENT ––––––––––––––––––––
    /*******************************************************************************/

    static create_event = function() {
        /// @type {Id.Instance}
        self[$ "target_object_instance"] ??= noone
        if (!exists_object_instance(target_object_instance)) { object_instance_destroy(); exit; }
        /// @type {Asset.GMSprite}
        self[$ "particle_sprite"] = spr_sparestar_anim
        /// @type {Constant.Colour}
        self [$ "particle_colour"] = c_lime
        /// @type {Bool}
        self[$ "flash"] ??= true

        particle_count = 0
        timer = 0
        x = target_object_instance.x
        y = target_object_instance.y
        image_xscale = target_object_instance.image_xscale
        image_yscale = target_object_instance.image_yscale
        sprite_index = target_object_instance.sprite_index
        target_sprite_width = sprite_width
        target_sprite_height = sprite_height

        // FLASH
        if (flash) { with (target_object_instance) { flash_create() } }

        // ENCOUNTER_CHARACTER
        if (ObjectInstance.is_instance_of({ object_instance : target_object_instance, object : encounter_character_object })) {
            target_sprite_width  = target_object_instance.mywidth
            target_sprite_height = target_object_instance.myheight
        // K_K_ENCOUNTER_ENEMY
        } else if (is_instance_of_object({ object_instance : target_object_instance, object : k_k_encounter_enemy_object })) {
            with (obj_oflash) {
                x += 18
                y += 18
            }
        // BOXING_CONTROLLER
        } else if (ObjectInstance.is_instance_of({ object_instance : target_object_instance, object : o_boxingcontroller })) {
            obj_oflash.image_xscale = -2
            _oflash = object_instance_create(x, y, obj_oflash)
            _oflash.image_speed = 0
            _oflash.image_index = o_boxingcontroller.image_index
            _oflash.image_xscale = -2
            _oflash.image_yscale = 2
            _oflash.sprite_index = o_boxingcontroller.headsprite
            _oflash.depth = (depth - 1)
        }
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CREATE_EVENT ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––
    /*******************************************************************************/

    static step_event = function() {

        // DESTROY_SELF
        if (!exists_object_instance(target_object_instance) or timer >= 30) { object_instance_destroy() }

        // CREATE_PARTICLES
        if (timer <= 4) {
            for (i = 0; i < 2; i++) {
                if (target_object_instance.object_index == o_boxingcontroller) {
                    particle_object_instances[particle_count] = object_instance_create(((x - (target_sprite_width / 2)) + random(target_sprite_width)), (y - random(target_sprite_height)), obj_marker)
                } else {
                    particle_object_instances[particle_count] = object_instance_create((x + random(target_sprite_width)), (y + random(target_sprite_height)), obj_marker)
                }
                with (particle_object_instances[particle_count]) {
                    image_angle = random(360)
                    depth = -10
                    image_xscale = 2
                    image_yscale = 2
                    image_alpha = 2
                    image_speed = 0.25
                    hspeed = (2 - random(2))
                    vspeed = (-3 - random(2))
                    friction = 0.2
                }
                particle_object_instances[particle_count].sprite_index = particle_sprite
                particle_object_instances[particle_count].image_blend = particle_colour
                particle_count++
            }
        }

        // DESTROY_PARTICLES
        if (timer >= 4 && timer < 30) {
            for (i = 0; i < particle_count; i++) {
                with (particle_object_instances[i]) {
                    image_angle -= 10
                    image_alpha -= 0.1
                    if (image_alpha <= 0) { object_instance_destroy() }
                }
            }
        }

        // ADVANCE_TIMER
        timer++
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– STEP_EVENT ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #region    –––––––––––––––––––– CLEAN_UP_EVENT ––––––––––––––––––––
    /*******************************************************************************/

    static cleanup_event = function() {
        object_instance_destroy(particle_object_instances[i])
    }

    /*******************************************************************************/
    #endregion –––––––––––––––––––– CLEAN_UP_EVENT ––––––––––––––––––––
    /*******************************************************************************/

}

/*******************************************************************************/
#endregion –––––––––––––––––––– HEALING_ANIMATION_OBJECT ––––––––––––––––––––
/*******************************************************************************/

/******************************************************************************/
#region    –––––––––––––––––––– FADEOVER ––––––––––––––––––––
/******************************************************************************/

fade_in_object
fade_parent_object
persistent_fade_in_object
fade_out_object

visual_effect_create({ name : "fadeover" })

.set_event({ event : "", callable : function() {
    image_blend ??= c_black
    length ??= EXTENDED_GUI_AREA.width() / 4
    height ??= EXTENDED_GUI_AREA.height() / 4
    fadespeed ??= -0.08
    image_alpha ??= 1
    fadein ??= true
    x ??= 0
    y ??= 0

    if (/* fadeout */) {
        fadespeed ??= 0.08
        image_alpha ??= 0
        fadein ??= false
    }
}})

.set_event({ event : "", callable : function() {
    image_alpha += fadespeed
    draw_sprite_ext(sprite_index, image_index, x, y, length, height, 0, image_blend, image_alpha)
    if (fadein and image_alpha <= 0) { instance_destroy() }
}})

.set_event({ event : "", callable : function() {
    length = (10 + (room_width / 4))
    height = (10 + (room_height / 4))
}})

function create_fade_in(_duration_frames) {
    return object_instance_create({
		object_index : fade_in_object
		variables : {
			fadespeed : (-1 / _duration_frames),
			depth : 3,
		},
	})
}

function create_fade_out(_duration_frames) {
	return object_instance_create({
		object_index : fade_out_object
		variables : {
			fadespeed : (1 / _duration_frames),
			depth : 3,
		},
	})
}

/******************************************************************************/
#endregion –––––––––––––––––––– FADEOVER ––––––––––––––––––––
/******************************************************************************/

visual_effect_create({ name : "instance_shake_object" })

.set_event({ event : "create_event", callable : function() {
    active = false
    target = 0
    shakeamt = 10
    shakereduct = 2
    if (IN_DARK_WORLD == false) {
        shakeamt = 5
        shakereduct = true
    }
    shakespeed = 1
    nowx = 0
    nowy = 0
    on = 1
    timer = 0
}})

.set_event({ event : "", callable : function() {
    if (active == false)
        instance_destroy()
    if (active == true)
    {
        if instance_exists(target)
        {
            shakeamt -= shakereduct
            on *= -1
            target.x = (nowx + (shakeamt * on))
            if (shakeamt <= 0)
                instance_destroy()
        }
        else
            instance_destroy()
    }
}})

.set_event({ event : "user_event_0", callable : function() {
    if instance_exists(target)
    {
        active = true
        nowx = target.x
        nowy = target.y
    }
    else
        instance_destroy()
}})

visual_effect_create({ name : "screen_shake_effect_object" })

.set_event({ event : "create_event", callable : function() {
    create_event = function() {
    	if (instance_number(object_index) >= 2) {
    		execute_clean_up_event = false
    	    instance_destroy()
    		return
    	}

    	/// @type {}
    	///
    	camera     = view_camera[0]
    	/// @type {}
    	///
    	shakespeed = 1
    	/// @type {}
    	///
    	shakesign  = 1
    	/// @type {}
    	///
    	shakex     = 4
    	/// @type {}
    	///
    	shakey     = 4
    	/// @type {boolean}
    	///
    	continuous = false
    	/// @type {}
    	///
    	execute_clean_up_event = true
    	/// @type {}
    	///
    	mycamerax = camera_get_view_x(camera)
    	/// @type {}
    	///
    	mycameray = camera_get_view_y(camera)

    	update()
    }

    cleanup_event = function() {
    	if (!execute_clean_up_event) { return }
    	camera_set_view_x(camera, mycamerax)
    	camera_set_view_y(camera, mycameray)
    }

    update = function() {
    	if (!instance_exists(self)) { return }

    	camera_set_view_x(camera, mycamerax + shakex * shakesign)
    	camera_set_view_y(camera, mycameray + shakey * shakesign)

    	if (!continuous) {
    	    if (shakex > 0) { shakex -= 1 }
    	    if (shakey > 0) { shakey -= 1 }
    	}

    	shakesign = -shakesign

    	// destroy
    	if (shakex == 0 and shakey == 0) { instance_destroy() }

    	gpl_call_later({ delay_frames : shakespeed, callback : update })
    }

    create_event()
}})

.set_event({ event : "cleanup_event", callable : function() {

}})

.set_event({ event : "step_event", callable : function() {

}})

function create_shake_effect()  {
    shakeobj = object_instance_create(x, y, instance_shake_object)
    shakeobj.target = id
    with (shakeobj) { event_user(0) }
}

function create_small_shake_effect()
{
    shakeobj = object_instance_create(x, y, instance_shake_object)
    shakeobj.target = id
    shakeobj.shakeamt = 4
    shakeobj.shakereduct = true
    with (shakeobj)
        event_user(0)
}

/// ----------------------------------------------------------------------------
/// @function screen_shake_effect_exists(parameters)
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
function screen_shake_effect_exists() {
	instance_exists(screen_shake_effect_object)
}

/// ----------------------------------------------------------------------------
/// @function screen_shake_effect_create(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {type} parameter_name
/// <parameter_description>
///
/// @parameter {number} x_magnitude
/// <parameter_description>
///
/// @parameter {number} y_magnitude
/// <parameter_description>
///
/// @parameter {boolean} continuous
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {type}
/// <return_description>
/// ----------------------------------------------------------------------------
function screen_shake_effect_create() {
	return instance_exists(screen_shake_effect_object) ? screen_shake_effect_object : instance_create_depth(0, 0, 0, screen_shake_effect_object)
}

/// ----------------------------------------------------------------------------
/// @function screen_shake_effect_destroy(parameters)
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
function screen_shake_effect_destroy() {
	instance_destroy(screen_shake_effect_object)
}

/// ----------------------------------------------------------------------------
/// obj_oflash
/// ----------------------------------------------------------------------------
construct_create({ name : "obj_oflash", parent : "visual_effect" })

.set_event({ event : "create_event", callable : function() {
    flashspeed = 1
	siner = 0
	target = noone
	image_speed = 0
	flashcolor = c_white
}})

.set_event({ event : "draw_event", callable : function() {
    if instance_exists(target) {
	    image_index = target.image_index
	    sprite_index = target.sprite_index
	    if (target.object_index == mauswheel_encounter_enemy_object)      sprite_index = target.idle_sprite
	    if (target.object_index == berdly_coaster_encounter_enemy_object) sprite_index = target.hurt_sprite
	    if (target.object_index == spamton_neo_encounter_enemy_object) {
	        siner += flashspeed
	        if (siner > 4 && sin((siner / 3)) < 0) {
	            instance_destroy()
	            spamton_neo_encounter_enemy_object.state = 0
	        }
	        if (siner == flashspeed) {
	            with (spamton_neo_encounter_enemy_object) {
	                partmode = 40
	                shockthreshold = 15
	                shocktimer = 9999
	                hurttimer2 = 10
	            }
	        }
	        for (i = 0; i < 8; i += 1) {
	            spamton_neo_encounter_enemy_object.flash = true
	            spamton_neo_encounter_enemy_object.fsiner = (spamton_neo_encounter_enemy_object.partsiner[i] / 8)
	        }
	    }
	}
	siner += flashspeed
	gpu_set_fog(true, flashcolor, 0, 1)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, sin((siner / 3)))
	gpu_set_fog(false, c_black, 0, 0)
	if (siner > 4 && sin((siner / 3)) < 0) { instance_destroy() }
}})

function flash_create() {
    _oflash = object_instance_create(x, y, obj_oflash)
    _oflash.image_xscale = image_xscale
    _oflash.image_speed = 0
    _oflash.image_index = image_index
    _oflash.image_yscale = image_yscale
    if (object_index == mauswheel_encounter_enemy_object) _oflash.sprite_index = spr_mauswheel_idle
    else _oflash.sprite_index = sprite_index
    _oflash.depth = depth - 1
    _oflash.target = id
    return _oflash;
}
