function create_afterimage(_instance = self) {
	with (_instance) {
		afterimage = create_object_instance_generic({
			object_index : afterimage_object,
			x, y,
			variables : {
				sprite_index,
				image_index,
				image_blend,
				image_speed : 0,
				depth,
				image_xscale,
				image_yscale,
				image_angle,
			},
		})
		return afterimage
	}
}

function scr_afterimage_cut()
{
    afterimage = instance_create(x, y, partial_afterimage_object)
    afterimage.sprite_index = sprite_index
    afterimage.image_index = image_index
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = depth
    afterimage.image_xscale = image_xscale
    afterimage.image_yscale = image_yscale
    afterimage.image_angle = image_angle
    with (afterimage)
        event_user(0)
    return afterimage;
}

function scr_afterimage_grow()
{
    afterimage = instance_create(x, y, growing_afterimage_object)
    afterimage.sprite_index = sprite_index
    afterimage.image_index = image_index
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = depth
    afterimage.image_xscale = image_xscale
    afterimage.image_yscale = image_yscale
    afterimage.image_angle = image_angle
    return afterimage;
}

function scr_afterimagefast()
{
    afterimage = instance_create(x, y, afterimage_object)
    afterimage.sprite_index = sprite_index
    afterimage.image_index = image_index
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = depth
    afterimage.image_xscale = image_xscale
    afterimage.image_yscale = image_yscale
    afterimage.image_angle = image_angle
    afterimage.fadeSpeed = 0.08
    return afterimage;
}

function scr_custom_afterimage(argument0)
{
    afterimage = instance_create(x, y, argument0)
    afterimage.sprite_index = sprite_index
    afterimage.image_index = image_index
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = (depth + 1)
    afterimage.image_xscale = image_xscale
    afterimage.image_yscale = image_yscale
    afterimage.image_angle = image_angle
    return afterimage;
}

function scr_custom_afterimage_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
{
    afterimage = instance_create(argument3, argument4, argument0)
    afterimage.sprite_index = argument1
    afterimage.image_index = argument2
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = (depth + 1)
    afterimage.image_angle = image_angle
    afterimage.image_xscale = argument5
    afterimage.image_yscale = argument6
    return afterimage;
}

function scr_following_afterimage()
{
    var __source = (argument_count == 2 ? argument[1] : self)
    afterimage = instance_create(__source.x, __source.y, argument[0])
    afterimage.parent = __source
    afterimage.sprite_index = __source.sprite_index
    afterimage.image_index = __source.image_index
    afterimage.image_blend = __source.image_blend
    afterimage.image_speed = 0
    afterimage.depth = __source.depth
    afterimage.image_xscale = __source.image_xscale
    afterimage.image_yscale = __source.image_yscale
    afterimage.image_angle = __source.image_angle
    return afterimage;
}
