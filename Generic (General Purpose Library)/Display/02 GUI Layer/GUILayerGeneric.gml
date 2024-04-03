new GUILayerGeneric()

function GUILayerGeneric() constructor {

    static get_x_dimensions = gui_get_x_dimension
    static get_y_dimensions = gui_get_y_dimension
    static set_dimensions   = gui_set_dimensions
    static set_maximise     = gui_set_maximise

}

function gui_get_x_dimension() {
    return display_get_gui_width()
}

function gui_get_y_dimension() {
    return display_get_gui_height()
}

function gui_set_dimensions() {
    display_set_gui_size(width, height)
}

function gui_set_maximise() {
    display_set_gui_maximise(xscale, yscale, xoffset, yoffset)
}
