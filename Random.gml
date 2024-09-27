/// repeatable, sample, population, weight

function random_choice(argument0 = []) {
    if (array_length(argument0) < 1) {
        /// ERROR
    }
    return argument0[irandom(array_length(argument0) - 1)]
}

random_choice({ choices : [0, 1, 2, 3, 4] }) -> [0, 4]

/// choose one or more

function random_weighted_choice() {

}

random_normal_distribution({ })
