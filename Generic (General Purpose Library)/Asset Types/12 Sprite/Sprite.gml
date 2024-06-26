/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function get_width_sprite_generic() {
    return sprite_get_width(_sprite_index)
}

function draw_sprite_center_pivot(argument0, argument1, argument2, argument3) {
    var __theta = point_direction((sprite_width / 2), (sprite_height / 2), 0, 0)
    var __radius = point_distance((sprite_width / 2), (sprite_height / 2), 0, 0)
    __theta += image_angle
    var __xx = ((argument2 + (sprite_width / 2)) + lengthdir_x(__radius, __theta))
    var __yy = ((argument3 + (sprite_height / 2)) + lengthdir_y(__radius, __theta))
    draw_sprite_ext(argument0, argument1, __xx, __yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}

function draw_sprite_ext_centerscale(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
    var _xoff = (sprite_get_xoffset(argument0) * image_xscale)
    var _yoff = (sprite_get_yoffset(argument0) * image_yscale)
    var _sprite_width = (sprite_get_width(argument0) * image_xscale)
    var _sprite_height = (sprite_get_width(argument0) * image_yscale)
    draw_sprite_ext(argument0, argument1, (argument2 - (((_sprite_width - _xoff) * (argument4 - image_xscale)) / 2)), (argument3 - (((_sprite_height - _yoff) * (argument5 - image_yscale)) / 2)), argument4, argument5, argument6, argument7, argument8)
}

function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
    gpu_set_fog(true, argument7, 0, 1)
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    gpu_set_fog(false, c_black, 0, 0)
}

function draw_sprite_ext_glow() {
    var color = (argument_count > 9 ? argument[9] : c_white)
    var blend = (color != c_white ? merge_color(argument[7], color, glow) : argument[7])
    if (glow < 1) { draw_sprite_ext(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], blend, argument[8]) }
    if (glow > 0) {
        if (color == c_white) { generic_graphics_set_blend_mode(ADDITIVE_BLEND_MODE) }
        gpu_set_fog(true, color, 0, 1)
        draw_sprite_ext(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], glow)
        gpu_set_fog(false, c_black, 0, 0)
        if (color == c_white) { generic_graphics_set_blend_mode(DEFAULT_BLEND_MODE) }
    }
}

function draw_sprite_ext_mode(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
    var sprite = argument0
    var index = argument1
    var xx = argument2
    var yy = argument3
    var xscale = argument4
    var yscale = argument5
    var cosAngle = cos(degtorad(argument6))
    var sinAngle = sin(degtorad(argument6))
    var tint = argument7
    var alpha = argument8
    var hskew = argument9
    var vskew = argument10
    var sprTex = sprite_get_texture(sprite, index)
    var sprWidth = sprite_get_width(sprite)
    var sprHeight = sprite_get_height(sprite)
    var sprXOrig = sprite_get_xoffset(sprite)
    var sprYOrig = sprite_get_yoffset(sprite)
    var _nn = 0
    draw_primitive_begin_texture(5, sprTex)
    var tempX = ((((-sprXOrig) + ((sprYOrig / sprHeight) * _nn)) * xscale) + hskew)
    var tempY = ((((-sprYOrig) + ((sprXOrig / sprWidth) * (-_nn))) * yscale) + vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 0, 0, tint, alpha)
    tempX = ((((sprWidth + ((sprYOrig / sprHeight) * _nn)) - sprXOrig) * xscale) - hskew)
    tempY = ((((-sprYOrig) + ((1 - (sprXOrig / sprWidth)) * _nn)) * yscale) - vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 1, 0, tint, alpha)
    tempX = ((((-sprXOrig) + ((1 - (sprYOrig / sprHeight)) * (-_nn))) * xscale) - hskew)
    tempY = ((((sprHeight - sprYOrig) + ((sprXOrig / sprWidth) * (-_nn))) * yscale) + vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 0, 1, tint, alpha)
    tempX = ((((sprWidth - sprXOrig) + ((1 - (sprYOrig / sprHeight)) * (-_nn))) * xscale) + hskew)
    tempY = ((((sprHeight - sprYOrig) + ((1 - (sprXOrig / sprWidth)) * _nn)) * yscale) - vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 1, 1, tint, alpha)
    draw_primitive_end()
}

function draw_sprite_ext_pivotscale(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
    draw_sprite_ext(argument0, argument1, (argument2 - (argument9 * (argument4 - image_xscale))), (argument3 - (argument10 * (argument5 - image_yscale))), argument4, argument5, argument6, argument7, argument8)
}

function draw_sprite_part_ext_glow() {
    var color = (argument_count > 12 ? argument[12] : c_white)
    var blend = (color != c_white ? merge_color(argument[10], color, glow) : argument[10])
    if (glow < 1) { draw_sprite_part_ext(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], blend, argument[11]) }
    if (glow > 0) {
        if (color == c_white) { generic_graphics_set_blend_mode(ADDITIVE_BLEND_MODE) }
        gpu_set_fog(true, color, 0, 1)
        draw_sprite_part_ext(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], glow)
        gpu_set_fog(false, c_black, 0, 0)
        if (color == c_white) { generic_graphics_set_blend_mode(DEFAULT_BLEND_MODE) }
    }
}

function draw_sprite_part_parallax(argument0, argument1, argument2, argument3, argument4) {
    var _mysprite = argument0
    var _mywidth = sprite_get_width(argument0)
    var _myheight = sprite_get_height(argument0)
    var _xoffset = (argument2 % _mywidth)
    var _yoffset = (argument3 % _myheight)
    if (_xoffset < 0) { _xoffset += _mywidth }
    if (_yoffset < 0) { _yoffset += _myheight }
    if (_xoffset == 0 && _yoffset == 0) { draw_sprite_ext(argument0, argument1, x, y, 2, 2, 0, image_blend, argument4) } else {
        draw_sprite_part_ext(argument0, argument1, 0, 0, (_mywidth - _xoffset), (_myheight - _yoffset), (x + (_xoffset * 2)), (y + (_yoffset * 2)), 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), (_myheight - _yoffset), _xoffset, _yoffset, x, y, 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, 0, (_myheight - _yoffset), (_mywidth - _xoffset), _yoffset, (x + (_xoffset * 2)), y, 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), 0, _xoffset, (_myheight - _yoffset), x, (y + (_yoffset * 2)), 2, 2, image_blend, argument4)
    }
}

function draw_sprite_part_parallax_scale(argument0, argument1, argument2, argument3, argument4, argument5) {
    var _scale = argument5
    var _mysprite = argument0
    var _mywidth = sprite_get_width(argument0)
    var _myheight = sprite_get_height(argument0)
    var _xoffset = (argument2 % _mywidth)
    var _yoffset = (argument3 % _myheight)
    if (_xoffset < 0) { _xoffset += _mywidth }
    if (_yoffset < 0) { _yoffset += _myheight }
    var _xmax = (_mywidth * (2 / _scale))
    var _ymax = (_myheight * (2 / _scale))
    if (_xoffset == 0 && _yoffset == 0) { draw_sprite_ext(argument0, argument1, x, y, 2, 2, 0, image_blend, argument4) } else {
        draw_sprite_part_ext(argument0, argument1, 0, 0, (_xmax - _xoffset), (_ymax - _yoffset), (x + (_xoffset * _scale)), (y + (_yoffset * _scale)), _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), (_myheight - _yoffset), min(_xmax, _xoffset), min(_ymax, _yoffset), x, y, _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, 0, (_ymax - _yoffset), min(_xmax, (_xmax - _xoffset)), min(_ymax, _yoffset), (x + (_xoffset * _scale)), y, _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_xmax - _xoffset), 0, min(_xmax, _xoffset), min(_ymax, (_ymax - _yoffset)), x, (y + (_yoffset * _scale)), _scale, _scale, image_blend, argument4)
    }
}

function draw_sprite_skew(argument0, argument1, argument2, argument3, argument4, argument5) {
    draw_sprite_skew_ext(argument0, argument1, argument2, argument3, image_xscale, image_yscale, image_angle, image_blend, image_alpha, argument4, argument5)
}

function draw_sprite_skew_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
    var sprite = argument0
    var index = argument1
    var xx = argument2
    var yy = argument3
    var xscale = argument4
    var yscale = argument5
    var cosAngle = cos(degtorad(argument6))
    var sinAngle = sin(degtorad(argument6))
    var tint = argument7
    var alpha = argument8
    var hskew = argument9
    var vskew = argument10
    var sprTex = sprite_get_texture(sprite, index)
    var sprWidth = sprite_get_width(sprite)
    var sprHeight = sprite_get_height(sprite)
    var sprXOrig = sprite_get_xoffset(sprite)
    var sprYOrig = sprite_get_yoffset(sprite)
    draw_primitive_begin_texture(5, sprTex)
    var tempX = (((-sprXOrig) + ((sprYOrig / sprHeight) * hskew)) * xscale)
    var tempY = (((-sprYOrig) + ((sprXOrig / sprWidth) * (-vskew))) * yscale)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 0, 0, tint, alpha)
    tempX = (((sprWidth + ((sprYOrig / sprHeight) * hskew)) - sprXOrig) * xscale)
    tempY = (((-sprYOrig) + ((1 - (sprXOrig / sprWidth)) * vskew)) * yscale)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 1, 0, tint, alpha)
    tempX = (((-sprXOrig) + ((1 - (sprYOrig / sprHeight)) * (-hskew))) * xscale)
    tempY = (((sprHeight - sprYOrig) + ((sprXOrig / sprWidth) * (-vskew))) * yscale)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 0, 1, tint, alpha)
    tempX = (((sprWidth - sprXOrig) + ((1 - (sprYOrig / sprHeight)) * (-hskew))) * xscale)
    tempY = (((sprHeight - sprYOrig) + ((1 - (sprXOrig / sprWidth)) * vskew)) * yscale)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 1, 1, tint, alpha)
    draw_primitive_end()
}

function draw_sprite_skew_ext_cute(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
    var sprite = argument0
    var index = argument1
    var xx = argument2
    var yy = argument3
    var xscale = argument4
    var yscale = argument5
    var cosAngle = cos(degtorad(argument6))
    var sinAngle = sin(degtorad(argument6))
    var tint = argument7
    var alpha = argument8
    var hskew = argument9
    var vskew = argument10
    var sprTex = sprite_get_texture(sprite, index)
    var sprWidth = sprite_get_width(sprite)
    var sprHeight = sprite_get_height(sprite)
    var sprXOrig = sprite_get_xoffset(sprite)
    var sprYOrig = sprite_get_yoffset(sprite)
    var _nn = 0
    draw_primitive_begin_texture(5, sprTex)
    var tempX = ((((-sprXOrig) + ((sprYOrig / sprHeight) * _nn)) * xscale) + hskew)
    var tempY = ((((-sprYOrig) + ((sprXOrig / sprWidth) * (-_nn))) * yscale) + vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 0, 0, tint, alpha)
    tempX = ((((sprWidth + ((sprYOrig / sprHeight) * _nn)) - sprXOrig) * xscale) - hskew)
    tempY = ((((-sprYOrig) + ((1 - (sprXOrig / sprWidth)) * _nn)) * yscale) - vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 1, 0, tint, alpha)
    tempX = ((((-sprXOrig) + ((1 - (sprYOrig / sprHeight)) * (-_nn))) * xscale) - hskew)
    tempY = ((((sprHeight - sprYOrig) + ((sprXOrig / sprWidth) * (-_nn))) * yscale) + vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 0, 1, tint, alpha)
    tempX = ((((sprWidth - sprXOrig) + ((1 - (sprYOrig / sprHeight)) * (-_nn))) * xscale) + hskew)
    tempY = ((((sprHeight - sprYOrig) + ((1 - (sprXOrig / sprWidth)) * _nn)) * yscale) - vskew)
    draw_vertex_texture_color(((xx + (tempX * cosAngle)) - (tempY * sinAngle)), ((yy + (tempX * sinAngle)) + (tempY * cosAngle)), 1, 1, tint, alpha)
    draw_primitive_end()
}

function scr_draw_sprite_crop(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
    var _sprite_xoffset = sprite_get_xoffset(argument0)
    var _sprite_yoffset = sprite_get_yoffset(argument0)
    var _sprite_width = sprite_get_width(argument0)
    var _sprite_height = sprite_get_height(argument0)
    var _true_xanchor = (x - abs(sprite_xoffset))
    var _true_yanchor = (y - abs(sprite_yoffset))
    if (_true_xanchor > argument2 && (_true_xanchor + _sprite_width) < argument4 && _true_yanchor > argument3 && (_true_yanchor + _sprite_height) < argument5) {
        draw_self()
        return;
    }
    var _leftcrop = clamp((argument2 - _true_xanchor), 0, abs(_sprite_width))
    var _topcrop = clamp((argument3 - _true_yanchor), 0, abs(_sprite_height))
    var _rightcrop = clamp((argument4 - _true_xanchor), 0, abs(_sprite_width))
    var _bottomcrop = clamp((argument5 - _true_yanchor), 0, abs(_sprite_height))
    draw_sprite_part(argument0, argument1, _leftcrop, _topcrop, _rightcrop, _bottomcrop, ((argument6 - _sprite_xoffset) + _leftcrop), ((argument7 - _sprite_yoffset) + _topcrop))
}

function scr_draw_sprite_crop_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
    var _sprite_xoffset = sprite_get_xoffset(argument0)
    var _sprite_yoffset = sprite_get_yoffset(argument0)
    var _sprite_width = (sprite_get_width(argument0) * argument8)
    var _sprite_height = (sprite_get_height(argument0) * argument9)
    var _true_xanchor = (x - (abs(_sprite_xoffset) * argument8))
    var _true_yanchor = (y - (abs(_sprite_yoffset) * argument9))
    if (_true_xanchor > argument2 && (_true_xanchor + _sprite_width) < argument4 && _true_yanchor > argument3 && (_true_yanchor + _sprite_height) < argument5) {
        draw_sprite_ext(argument0, argument1, argument6, argument7, argument8, argument9, 0, argument10, argument11)
        return;
    }
    var _leftcrop = clamp((argument2 - _true_xanchor), 0, abs(_sprite_width))
    var _topcrop = clamp((argument3 - _true_yanchor), 0, abs(_sprite_height))
    var _rightcrop = clamp((argument4 - _true_xanchor), 0, abs(_sprite_width))
    var _bottomcrop = clamp((argument5 - _true_yanchor), 0, abs(_sprite_height))
    draw_sprite_part_ext(argument0, argument1, _leftcrop, _topcrop, _rightcrop, _bottomcrop, ((argument6 - _sprite_xoffset) + _leftcrop), ((argument7 - _sprite_yoffset) + _topcrop), argument8, argument9, argument10, argument11)
}

function scr_draw_sprite_tiled_area() {
    var sprite = argument[0]
    var subimg = argument[1]
    var xx = argument[2]
    var yy = argument[3]
    var x1 = argument[4]
    var y1 = argument[5]
    var x2 = argument[6]
    var y2 = argument[7]
    var xscale = argument[8]
    var yscale = argument[9]
    var col = (argument_count > 10 ? argument[10] : c_white)
    var alpha = (argument_count > 11 ? argument[11] : 1)
    var sw = (sprite_get_width(sprite) * xscale)
    var sh = (sprite_get_height(sprite) * yscale)
    var i = ((x1 - ((x1 % sw) - (xx % sw))) - (sw * (x1 % sw) < (xx % sw)))
    var j = ((y1 - ((y1 % sh) - (yy % sh))) - (sh * (y1 % sh) < (yy % sh)))
    var jj = j
    while (i <= x2) {
        while (j <= y2) {
            if (i <= x1) { var left = (x1 - i) } else { left = 0 }
            var X = (i + left)
            if (j <= y1) { var top = (y1 - j) } else { top = IMAGE_LOGO }
            var Y = (j + top)
            if (x2 <= (i + sw)) { var width = (((sw - ((i + sw) - x2)) + 1) - left) } else { width = (sw - left) }
            if (y2 <= (j + sh)) { var height = (((sh - ((j + sh) - y2)) + 1) - top) } else { height = (sh - top) }
            draw_sprite_part_ext(sprite, subimg, left, top, width, height, X, Y, xscale, yscale, col, alpha)
            j += sh
        }
        j = jj
        i += sw
    }
    return 0;
}

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

// WRAPPER FOR NATIVE GAMEMAKER SPRITE ASSET
function SpriteAssetGeneric() constructor {
    get_width = function() {

    }
}

// REFERS TO SPRITE ASSET
function SpritePatternGeneric() constructor {

}

// WRAPPER FOR SPRITE WITH SPECIFIC SETTINGS
function SpriteInstanceGeneric() constructor {

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTORS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

function relative_image_speed(_sprite, _fps) {
    var _base_sprite_speed = sprite_get_speed(_sprite)
    var _sprite_speed_type = sprite_get_speed_type(_sprite)

    if (_sprite_speed_type == spritespeed_framespersecond) {
        var _image_speed = _fps / _base_sprite_speed
    } else if (_sprite_speed_type == spritespeed_framespergameframe) {
        var _image_speed = _fps / (_base_sprite_speed * game_get_speed(gamespeed_fps))
    }

    return _image_speed
}

function sprite_get_fps(_sprite) {
    var _speed = sprite_get_speed(_sprite)
    var _type = sprite_get_speed_type(_sprite)

    if (_type == spritespeed_framespersecond) {
        return _speed
    } else if (_type == spritespeed_framespergameframe) {
        return (_speed * game_get_speed(gamespeed_fps))
    }
}

function generic_sprite_draw(arguments) {

    /*******************************************************************************
    –––––––––––––––––––– INTERNAL: DRAW METHODS ––––––––––––––––––––
    *******************************************************************************/

    /* –––––––––––––––––––– DEFAULT DRAW METHOD –––––––––––––––––––– */
    static draw_method_default = function(arguments) {
        draw_sprite_general(
            arguments.sprite,
            arguments.frame,
            arguments.fragment.x,
            arguments.fragment.y,
            arguments.fragment.width,
            arguments.fragment.height,
            arguments.x,
            arguments.y,
            arguments.xscale,
            arguments.yscale,
            arguments.rotation,
            arguments.gradient.top_left,
            arguments.gradient.top_right,
            arguments.gradient.bottom_right,
            arguments.gradient.bottom_left,
            arguments.alpha
        )
    }

    /* –––––––––––––––––––– NINE-SLICE DRAW METHOD –––––––––––––––––––– */
    static draw_method_nine_slice = function(arguments) {
        draw_sprite_ext(
            arguments.sprite,
            arguments.frame,
            arguments.x,
            arguments.y,
            arguments.xscale,
            arguments.yscale,
            arguments.rotation,
            arguments.colour,
            arguments.alpha
        )
    }

    /* –––––––––––––––––––– TILED DRAW METHOD –––––––––––––––––––– */
    static draw_method_tiled = function(arguments) {
        draw_sprite_tiled_ext(
            arguments.sprite,
            arguments.frame,
            arguments.x,
            arguments.y,
            arguments.xscale,
            arguments.yscale,
            arguments.colour,
            arguments.alpha
        )
    }

    /* –––––––––––––––––––– SHADER DRAW METHOD –––––––––––––––––––– */
    static draw_method_shader = function(arguments) {

        /* –––––––––––––––––––– SCREEN / SURFACE CORRDINATES –––––––––––––––––––– */
        arguments.screen_x = arguments.x
        arguments.screen_y = arguments.y
        arguments.x = 0
        arguments.y = 0

        /* –––––––––––––––––––– PRESERVE PREVIOUS SHADER –––––––––––––––––––– */
        var _preserved_shader = shader_current()

        /* –––––––––––––––––––– SHADER PREPERATION –––––––––––––––––––– */
        var _surface_width = arguments.sprite_draw_width
        var _surface_height = arguments.sprite_draw_height

        /* –––––––––––––––––––– CREATE SURFACE –––––––––––––––––––– */
        if (arguments.shader == outline_shader) {
            arguments.outline.width = arguments.outline[$ "width"] ?? 1

            _surface_width += 2 * arguments.outline.width
            _surface_height += 2 * arguments.outline.width

            arguments.x += arguments.outline.width
            arguments.y += arguments.outline.width

            arguments.screen_x -= arguments.outline.width
            arguments.screen_y -= arguments.outline.width
        }

        var surface = generic_surface_create({ x_dimension : _surface_width, y_dimension : _surface_height })
        render_target_set_surface({ surface })
        draw_clear_alpha(c_white, 0)

        /* –––––––––––––––––––– DRAW TO SURFACE –––––––––––––––––––– */
        if (arguments.nine_slice) { generic_sprite_draw.draw_method_nine_slice(arguments) }
        else if (arguments.tiled) { generic_sprite_draw.draw_method_tiled(arguments) }
        else { generic_sprite_draw.draw_method_default(arguments) }
        render_target_reset_surface()

        /* –––––––––––––––––––– APPLY SHADER –––––––––––––––––––– */
        shader_set(arguments.shader)

        if (arguments.shader == outline_shader) {
            // var _texture = sprite_get_texture(arguments.sprite, arguments.frame)
            var _pixel_width = 1 / _surface_width // texture_get_texel_width(_texture)
            var _pixel_height = 1 / _surface_height // texture_get_texel_height(_texture)

            var _pixel_size = shader_get_uniform(outline_shader, "pixel_size")
            shader_set_uniform_f(_pixel_size, _pixel_width, _pixel_height)

            var _outline_width = shader_get_uniform(outline_shader, "outline_width")
            shader_set_uniform_i(_outline_width, arguments.outline.width)

            var _red = colour_get_red(arguments.outline.colour) / 255
            var _green = colour_get_green(arguments.outline.colour) / 255
            var _blue = colour_get_blue(arguments.outline.colour) / 255
            var _alpha = arguments.outline[$ "alpha"] ?? 1

            var _outline_colour = shader_get_uniform(outline_shader, "outline_colour")
            shader_set_uniform_f(_outline_colour, _red, _green, _blue, _alpha)

            if (!is_undefined(arguments[$ "filling"])) {
                var _filling_mode = shader_get_uniform(outline_shader, "filling_mode")
                shader_set_uniform_i(_filling_mode, 2)

                var _red = colour_get_red(arguments.filling.colour) / 255
                var _green = colour_get_green(arguments.filling.colour) / 255
                var _blue = colour_get_blue(arguments.filling.colour) / 255
                var _alpha = arguments.filling[$ "alpha"] ?? 1

                var _filling_colour = shader_get_uniform(outline_shader, "filling_colour")
                shader_set_uniform_f(_filling_colour, _red, _green, _blue, _alpha)
            }

        }

        /* –––––––––––––––––––– DRAW SURFACE TO SCREEN –––––––––––––––––––– */
        draw_surface(surface, arguments.screen_x, arguments.screen_y)

        /* –––––––––––––––––––– SURFACE & SHADER CLEANUP –––––––––––––––––––– */
        generic_surface_destroy({ surface : surface })
        shader_reset()

        /* –––––––––––––––––––– PRESERVE PREVIOUS SHADER –––––––––––––––––––– */
        if (_preserved_shader != -1) { shader_set(_preserved_shader) }
    }

    /*******************************************************************************
    –––––––––––––––––––– FUNCTION PARAMETERS ––––––––––––––––––––
    *******************************************************************************/

    var a = arguments

    var parameters = {
        sprite : arguments.sprite,
        frame : arguments[$ "frame"] ?? 0,
        x : arguments[$ "x"] ?? 0,
        y : arguments[$ "y"] ?? 0,
        xscale : arguments[$ "xscale"] ?? 1,
        yscale : arguments[$ "yscale"] ?? 1,
        rotation : arguments[$ "rotation"] ?? 0,
        alpha : arguments[$ "alpha"] ?? 1,

        fragment : arguments[$ "fragment"] ?? {
            x : 0,
            y : 0,
            width : sprite_get_width(arguments.sprite),
            height : sprite_get_height(arguments.sprite),
        },

        colour : arguments[$ "colour"] ?? c_white,
        gradient : arguments[$ "gradient"] ?? {
            top_left : c_white,
            top_right : c_white,
            bottom_right : c_white,
            bottom_left : c_white,
        },

        tiled : arguments[$ "tiled"] == undefined ? false : true,

        nine_slice : sprite_get_nineslice(arguments.sprite).enabled,
        shader : arguments[$ "shader"] ?? -1,
        outline : arguments[$ "outline"] ?? undefined,
        filling : arguments[$ "filling"] ?? undefined,

        seconds : get_timer() / 1000000,
    }

    var p = parameters

    /*******************************************************************************
    –––––––––––––––––––– SCALING ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "scale")) {
        parameters.xscale = arguments.scale
        parameters.yscale = arguments.scale
    }

    /*******************************************************************************
    –––––––––––––––––––– ANIMATION ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "image_speed")) {
        if (arguments.image_speed == MODE_DEFAULT || arguments.image_speed == "default") {
            parameters.frame = (parameters.seconds * sprite_get_fps(arguments.sprite)) % sprite_get_number(arguments.sprite)
        } else {
            parameters.frame = (parameters.seconds * arguments.image_speed) % sprite_get_number(arguments.sprite)
        }
    }

    /*******************************************************************************
    –––––––––––––––––––– HOVER EFFECT ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "yhover")) {
        parameters.y += sin((parameters.seconds * (2 * pi) * arguments.yhover.frequency)) * arguments.yhover.amplitude
    }

    /*******************************************************************************
    –––––––––––––––––––– WIDTH & HEIGHT ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "width")) {
        parameters.xscale = arguments.width / (parameters.fragment.width)
    }

    if (struct_exists(arguments, "height")) {
        parameters.yscale = arguments.height / (parameters.fragment.height)
    }

    /*******************************************************************************
    –––––––––––––––––––– PULSATE EFFECT ––––––––––––––––––––
    *******************************************************************************/
    if (struct_exists(arguments, "pulsate")) {
        parameters.xscale += sin((p.seconds * (2 * pi) * a.pulsate.x.frequency)) * a.pulsate.x.amplitude
        parameters.yscale += sin((p.seconds * (2 * pi) * a.pulsate.y.frequency)) * a.pulsate.y.amplitude
    }

    /*******************************************************************************
    –––––––––––––––––––– SOLID COLOUR ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "colour")) {
        with (parameters.gradient) {
            top_left = arguments.colour
            top_right = arguments.colour
            bottom_right = arguments.colour
            bottom_left = arguments.colour
        }
    }

    /*******************************************************************************
    –––––––––––––––––––– ALIGNMENT ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(arguments, "align") && arguments.align == "center") {
        parameters.x -= sprite_get_width(parameters.sprite) * parameters.xscale / 2
        parameters.y -= sprite_get_height(parameters.sprite) * parameters.yscale / 2
    } else if (!struct_exists(arguments, "ignore_offset") || arguments.ignore_offset == false) {
        parameters.x -= sprite_get_xoffset(parameters.sprite) * parameters.xscale
        parameters.y -= sprite_get_yoffset(parameters.sprite) * parameters.yscale
    }

    /*******************************************************************************
    –––––––––––––––––––– CALCULATIONS ––––––––––––––––––––
    *******************************************************************************/

    parameters.sprite_draw_width = p.fragment.width * p.xscale
    parameters.sprite_draw_height = p.fragment.height * p.yscale

    /*******************************************************************************
    –––––––––––––––––––– TILED ––––––––––––––––––––
    *******************************************************************************/

    if (parameters.tiled) {
        if (is_struct(arguments.tiled)) {
            parameters.x = -2 * p.sprite_draw_width
            parameters.y = -2 * p.sprite_draw_height
            parameters.x += (a.tiled.x.offset + p.seconds * a.tiled.x.speed) % p.sprite_draw_width
            parameters.y += (a.tiled.y.offset + p.seconds * a.tiled.y.speed) % p.sprite_draw_height
        }
    }

    /*******************************************************************************
    –––––––––––––––––––– DRAWING ––––––––––––––––––––
    *******************************************************************************/

    if (parameters.shader != -1) { draw_method_shader(parameters) }
    else if (parameters.nine_slice) { draw_method_nine_slice(parameters) }
    else if (parameters.tiled) { draw_method_tiled(parameters) }
    else { draw_method_default(parameters) }
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
#macro SPRITE INITIALIZED_CONSTRUCTOR(Sprite)

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {Struct} parameters
///
/// @parameter {Type} parameters.parameter_name
/// <parameter_description>
///
/// @parameter {Type} parameters.parameter_name
/// <parameter_description>
///
/// @parameter {Type} parameters.parameter_name
/// <parameter_description>
///
/// @parameter {Type} parameters.parameter_name
/// <parameter_description>
///
/// ----------------------------------------------------------------------------
/// @return {struct.Texture}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_sprite_get_texture(parameters) {

}

/// ----------------------------------------------------------------------------
/// @function function_name(parameters)
/// ----------------------------------------------------------------------------
/// @description
/// <function_description>
/// ----------------------------------------------------------------------------
/// @parameter {struct.Sprite|handle.Sprite|id.Sprite} sprite
/// <parameter_description>
/// ----------------------------------------------------------------------------
/// @return {pointer.Texture}
/// <return_description>
/// ----------------------------------------------------------------------------
function generic_sprite_get_texture_pointer(parameters) {

    var _sprite_handle =
    var _frame_index   =

    var _texture_pointer = sprite_get_texture(_sprite_handle, _frame_index)
    return _texture_pointer
}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– SCRIPT_FUNCTIONS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

SPRITE

function Sprite() constructor {

    /// @function get_texture(parameters)
    static get_texture = generic_sprite_get_texture

    /// @function get_texture_pointer(parameters)
    static get_texture_pointer = generic_sprite_get_texture_pointer

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
