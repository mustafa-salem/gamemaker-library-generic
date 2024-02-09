function ParticleSystemInstanceGeneric(arguments) constructor {

    destroy = function() {
        part_system_destroy(particle_system_id)
    }

    position = function(arguments) {
        part_system_position(particle_system_id, arguments.x, arguments.y)
    }

    asset = arguments.asset
    layer = layer_create(arguments[$ "depth"] ?? 0)
    persistent = arguments[$ "persistent"] ?? false

    particle_system_id = part_system_create_layer(layer, persistent, asset)
    if (arguments[$ "x"] && arguments[$ "y"]) {
        position({ x : arguments.x, y : arguments.y })
    }

}
