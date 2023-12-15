function remove_struct_variable(_struct, _name) {
    if (_struct == undefined or !is_struct(_struct)) { return }
    if (_name == undefined or !is_string(_name)) { return }
    if (struct_exists(_struct, _name)) { struct_remove(_struct, _name) }
}
