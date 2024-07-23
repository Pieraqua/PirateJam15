extends Area2D
@export var fall_speed : int = 300
var velocity = Vector2(0,fall_speed)

func _physics_process(delta):
	position.x += velocity.x*delta
	position.y += velocity.y*delta

signal end_game
func _on_body_entered(body):
	if 'player' in body.get_groups():
		emit_signal('end_game')
	
