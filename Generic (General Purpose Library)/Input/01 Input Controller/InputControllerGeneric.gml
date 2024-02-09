#macro DEFAULT_FILEPATH_SYSTEM_CONFIG_INPUT_GENERIC "controls.json"

new InputControllerGeneric()

function InputControllerGeneric() constructor {

    static private = {
        system_config : {
            default_filepath : DEFAULT_FILEPATH_SYSTEM_CONFIG_INPUT_GENERIC,
        },
    }

}
