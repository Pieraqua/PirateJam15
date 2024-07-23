extends Potion
class_name WindPotion

var wind_potion_timer : Timer
var duration = 5

func throw(world):
	print('wind potion thrown')
	_world = world
	if wind_potion_timer == null:
		wind_potion_timer = Timer.new()
		_world.add_child(wind_potion_timer)
		wind_potion_timer.timeout.connect(end_effect)
		wind_potion_timer.paused = false
		wind_potion_timer.start()
	wind_potion_timer.start(duration)
	_world.player.is_windy = true

func end_effect():
	_world.player.is_windy = false
