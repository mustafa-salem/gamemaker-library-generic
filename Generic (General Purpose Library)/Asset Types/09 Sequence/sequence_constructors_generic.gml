function SequenceInstanceGeneric(arguments) constructor {

    /*******************************************************************************/
    #region    –––––––––––––––––––– METHODS ––––––––––––––––––––
    /*******************************************************************************/

    /*******************************************************************************/
    #endregion –––––––––––––––––––– METHODS ––––––––––––––––––––
    /*******************************************************************************/

    destroy = function() {
        layer_sequence_destroy(elementID)
    }

    playhead_position = function(arguments) {
        if (arguments[$ "frame"]) {
            var _frame = arguments.frame
            layer_sequence_headpos(elementID, _frame)
        }
        if (arguments[$ "moment"]) {
            var _frame = moments[$ arguments.moment]
            layer_sequence_headpos(elementID, _frame)
        }
    }

    position = function(arguments) {
        if (arguments[$ "x"]) {
            layer_sequence_x(elementID, arguments.x)
        }
        if (arguments[$ "y"]) {
            layer_sequence_y(elementID, arguments.y)
        }
    }

    pause = function() {
        layer_sequence_pause(elementID)
    }

    play = function() {
        layer_sequence_play(elementID)
    }

    /*******************************************************************************/
    #region    –––––––––––––––––––– CREATION ––––––––––––––––––––
    /*******************************************************************************/

    asset = arguments.asset
    layer = layer_create(arguments[$ "depth"] ?? 0)
    var _x = arguments[$ "x"] ?? 0
    var _y = arguments[$ "y"] ?? 0
    var _pause = arguments[$ "pause"] ?? false
    elementID = layer_sequence_create(layer, _x, _y, asset)
    if (_pause) { pause() }

    var moments = { }


    /*******************************************************************************/
    #endregion –––––––––––––––––––– CREATION ––––––––––––––––––––
    /*******************************************************************************/

}
