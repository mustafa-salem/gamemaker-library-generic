/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/// ----------------------------------------------------------------------------
/// @description
/// <description>
/// ----------------------------------------------------------------------------
enum BLEND_FACTOR_IDS {
    ZERO                      = bm_zero,
    ONE                       = bm_one,
    SOURCE_COLOUR             = bm_src_colour,
    INVERSE_SOURCE_COLOUR     = bm_inv_src_colour
    SOURCE_ALPHA              = bm_src_alpha
    INVERSE_DESTINATION_ALPHA =
}

/// ----------------------------------------------------------------------------
/// @description
/// red   : 0
/// green : 0
/// blue  : 0
/// alpha : 0
/// ----------------------------------------------------------------------------
#macro ZERO_BLEND_FACTOR
BLEND_FACTOR_IDS.ZERO

/// ----------------------------------------------------------------------------
/// @description
/// red   : 1
/// green : 1
/// blue  : 1
/// alpha : 1
/// ----------------------------------------------------------------------------
#macro ONE_BLEND_FACTOR
BLEND_FACTOR_IDS.ONE

/// ----------------------------------------------------------------------------
/// @description
/// red   : source.red
/// green : source.green
/// blue  : source.blue
/// alpha : source.alpha
/// ----------------------------------------------------------------------------
#macro SOURCE_COLOUR_BLEND_FACTOR
BLEND_FACTOR_IDS.SOURCE_COLOUR

/// ----------------------------------------------------------------------------
/// @description
/// red   : 1 - source.red
/// green : 1 - source.green
/// blue  : 1 - source.blue
/// alpha : 1 - source.alpha
/// ----------------------------------------------------------------------------
#macro INVERSE_SOURCE_COLOUR_BLEND_FACTOR
BLEND_FACTOR_IDS.INVERSE_SOURCE_COLOUR

/// ----------------------------------------------------------------------------
/// @description
/// red   : source.alpha
/// green : source.alpha
/// blue  : source.alpha
/// alpha : source.alpha
/// ----------------------------------------------------------------------------
#macro SOURCE_ALPHA_BLEND_FACTOR
BLEND_FACTOR_IDS.SOURCE_ALPHA

/// ----------------------------------------------------------------------------
/// @description
/// red   : 1 - source.alpha
/// green : 1 - source.alpha
/// blue  : 1 - source.alpha
/// alpha : 1 - source.alpha
/// ----------------------------------------------------------------------------
#macro INVERSE_SOURCE_ALPHA_BLEND_FACTOR
bm_inv_src_alpha

/// ----------------------------------------------------------------------------
/// @description
/// red   : destination.red
/// green : destination.green
/// blue  : destination.blue
/// alpha : destination.alpha
/// ----------------------------------------------------------------------------
#macro DESTINATION_COLOUR_BLEND_FACTOR
bm_dest_colour

/// ----------------------------------------------------------------------------
/// @description
/// red   : 1 - destination.red
/// green : 1 - destination.green
/// blue  : 1 - destination.blue
/// alpha : 1 - destination.alpha
/// ----------------------------------------------------------------------------
#macro INVERSE_DESTINATION_COLOUR_BLEND_FACTOR
bm_inv_dest_colour

/// ----------------------------------------------------------------------------
/// @description
/// red   : destination.alpha
/// green : destination.alpha
/// blue  : destination.alpha
/// alpha : destination.alpha
/// ----------------------------------------------------------------------------
#macro DESTINATION_ALPHA_BLEND_FACTOR
bm_dest_alpha

/// ----------------------------------------------------------------------------
/// @description
/// red   : 1 - destination.alpha
/// green : 1 - destination.alpha
/// blue  : 1 - destination.alpha
/// alpha : 1 - destination.alpha
/// ----------------------------------------------------------------------------
#macro INVERSE_DESTINATION_ALPHA_BLEND_FACTOR
bm_inv_dest_alpha

/// ----------------------------------------------------------------------------
/// @description
/// red   : min(soure.alpha, 1 - destination.alpha)
/// green : min(soure.alpha, 1 - destination.alpha)
/// blue  : min(soure.alpha, 1 - destination.alpha)
/// alpha : 1
/// ----------------------------------------------------------------------------
#macro SOURCE_ALPHA_SATURATION_BLEND_FACTOR
bm_src_alpha_sat

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTANTS ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#region    –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/

BLEND_FACTOR

function BlendFactor() constructor {

}

/******************************************************************************/
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
#endregion –––––––––––––––––––– CONSTRUCTOR ––––––––––––––––––––
/* –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– */
/******************************************************************************/
