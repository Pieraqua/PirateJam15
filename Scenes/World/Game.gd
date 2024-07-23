extends Node2D

func end_game(points : int):
	print('ending game')
	var end_game_screen = preload("res://Scenes/World/GameOver.tscn").instantiate()
	var child = get_child(0)
	child.queue_free()
	add_child(end_game_screen)
	end_game_screen.set_final_points(points)
	

func start_game():
	pass

func pause_game():
	pass
