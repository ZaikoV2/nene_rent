local Translations = {
    error = {
        no_rent = 'This vehicle is not rented',
        no_enough_money = 'You dont have enough money'
    },
    success = {
        get_money = 'We have returned your money',
        spawned = 'You have rented a T20'
    },
    text = {
        get_veh = 'Press E to take a vehicle',
        press_save = 'Press E to save the vehicle'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})