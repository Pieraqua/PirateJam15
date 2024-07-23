extends Potion
class_name IcePotion

var ice_potion_timer : Timer
var ice_time = 5

func throw(world):
	print('ice potion thrown')
	_world = world
	if ice_potion_timer == null:
		ice_potion_timer = Timer.new()
		_world.add_child(ice_potion_timer)
		ice_potion_timer.timeout.connect(stop_ice)
		ice_potion_timer.paused = false
		ice_potion_timer.start()
	ice_potion_timer.start(ice_time)
	_world.player.floor_frozen = true

func stop_ice():
	_world.player.floor_frozen = false
