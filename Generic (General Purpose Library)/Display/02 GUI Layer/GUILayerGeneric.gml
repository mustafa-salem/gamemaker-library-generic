#macro GUILayer GUILayerGeneric

#macro get_x_dimensions_gui_layer get_x_dimensions_gui_layer_generic
#macro get_y_dimensions_gui_layer get_y_dimensions_gui_layer_generic
#macro set_dimensions_gui_layer   set_dimensions_gui_layer_generic
#macro set_maximise_gui_layer     set_maximise_gui_layer_generic

new GUILayerGeneric()

function GUILayerGeneric() constructor {

    static get_x_dimensions = get_x_dimensions_gui_layer_generic
    static get_y_dimensions = get_y_dimensions_gui_layer_generic
    static set_dimensions   = set_dimensions_gui_layer_generic
    static set_maximise     = set_maximise_gui_layer_generic

}

function get_x_dimensions_gui_layer_generic() {
    return display_get_gui_width()
}

function get_y_dimensions_gui_layer_generic() {
    return display_get_gui_height()
}

function set_dimensions_gui_layer_generic() {
    display_set_gui_size(width, height)
}

function set_maximise_gui_layer_generic() {
    display_set_gui_maximise(xscale, yscale, xoffset, yoffset)
}
