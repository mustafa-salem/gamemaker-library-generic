#macro ObjectInstance ObjectInstanceGeneric

ObjectInstanceGeneric()

function ObjectInstanceGeneric() constructor {

    static initialize = function() {
        controller = arguments[$ "controller"]
    }

    static current_event = function() {

    }

}
