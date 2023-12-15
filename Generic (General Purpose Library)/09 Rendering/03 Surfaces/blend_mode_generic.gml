enum BLEND_MODE {
    DEFAULT,
    ADDITIVE,
}

function blend_mode_set(_blend_mode) {
    blend_mode_generic({ set : _blend_mode })
}

function blend_mode_generic(arguments = {}) {

    /*******************************************************************************
    –––––––––––––––––––– PARAMETERS ––––––––––––––––––––
    *******************************************************************************/

    var a = arguments

    parameters = {
        source_colour_blend_mode : bm_src_alpha,
        source_alpha_blend_mode : bm_src_alpha,
        destination_colour_blend_mode : bm_inv_src_alpha,
        destination_alpha_blend_mode : bm_inv_src_alpha,
    }

    var p = parameters

    /*******************************************************************************
    –––––––––––––––––––– SET BLEND MODE ––––––––––––––––––––
    *******************************************************************************/

    if (struct_exists(a, "set")) {
        if (a.set == BLEND_MODE.DEFAULT) { p.source_alpha_blend_mode = bm_one }
        else if (a.set == BLEND_MODE.ADDITIVE) {
            gpu_set_blendmode(bm_add)
            return
        }

        gpu_set_blendmode_ext_sepalpha(
            p.source_colour_blend_mode,
            p.destination_colour_blend_mode,
            p.source_alpha_blend_mode,
            p.destination_alpha_blend_mode,
        )
    }

}
