local Translations = {
    error = {
        no_rent = 'Este vehiculo no es alquilado',
        no_enough_money = 'No tienes dinero suficiente'
    },
    success = {
        get_money = 'Te hemos devuelto tu dinero',
        spawned = 'Has alquilado un T20'
    },
    text = {
        get_veh = 'Presiona E para coger un vehiculo',
        press_save = 'Presiona E para guardar el vehiculo'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})