extends Potion
class_name FirePotion

var screen_x_min = 0
var screen_x_max = 574+578
var fireball
var fire_potion_timer
var fireballs_spawned = 0
var fire_potions_active = 0
signal end_game

func throw(world):
	_world = world
	if fire_potion_timer == null:
		fire_potion_timer = Timer.new()
		_world.add_child(fire_potion_timer)
		fire_potion_timer.timeout.connect(spawn_fire)
		update_fire_potion(1)
		fire_potion_timer.paused = false
		fire_potion_timer.start()
		fireball = preload("res://Scenes/Obstacles/fireball.tscn")
	update_fire_potion(1)
	print('Fire potions active: %d' % fire_potions_active)
	
func spawn_fire():
	if fireballs_spawned > 30:
		update_fire_potion(-1)
		fireballs_spawned = 0
	var x_spawn = randi_range(screen_x_min, screen_x_max)
	var new_fireball = fireball.instantiate()
	new_fireball.position.x = x_spawn
	new_fireball.position.y = 0
	new_fireball.connect('end_game', _world.end_game)
	_world.add_child(new_fireball)
	fire_potion_timer.start()
	fireballs_spawned += 1

func update_fire_potion(num : int):
	fire_potions_active += num if num > 0 or fire_potions_active > 0 else 0
	fire_potion_timer.wait_time = clampf(1 - fire_potions_active*0.2, 0.2, 1)

