extends Node2D

@export var points_per_sec : float = 50
@export var point_update_interval : float = 50
var points : float = 0

@onready var player = %Player

signal end_game_signal(points)
func end_game():
	print('end game signal emmited')
	emit_signal('end_game_signal', points)

func _process(delta):
	update_points(points_per_sec*delta)
	
var last_point_update : float = 0
func update_points(point_diff : float):
	points += point_diff
	#last_point_update += point_diff
	#if last_point_update > point_update_interval:
	#last_point_update = 0
	$HUD.update_point_total(points)

