extends Node2D

const ROTATE_MAX = 60

var rotating_right = false
func _physics_process(delta):
	if rotating_right and rotation_degrees < ROTATE_MAX:
		rotation_degrees = move_toward(rotation_degrees, ROTATE_MAX, ROTATE_MAX*2/4 * delta)
	elif not rotating_right and rotation_degrees > -ROTATE_MAX:
		rotation_degrees = move_toward(rotation_degrees, -ROTATE_MAX, ROTATE_MAX*2/4 * delta)
	else:
		rotating_right = not rotating_right
