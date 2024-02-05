new DisplayControllerGeneric()

function DisplayControllerGeneric() constructor {

    static private = {
        cameras    : array_create(8),
        views      : array_create(8),
        view_ports : array_create(8),
    }

    for (var i = 0; i < 8; i++) {
        private.cameras[i]    = new CameraGeneric({ view_port_index : i })
        private.views[i]      = new ViewGeneric({ view_port_index : i })
        private.view_ports[i] = new ViewPortGeneric({ view_port_index : i })
    }

}

#macro CAMERAS    DisplayControllerGeneric.private.cameras
#macro VIEWS      DisplayControllerGeneric.private.views
#macro VIEW_PORTS DisplayControllerGeneric.private.view_ports
