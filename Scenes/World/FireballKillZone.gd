extends Area2D

signal game_over
func _on_area_entered(area):
	if 'fireball' in area.get_groups():
		area.queue_free()

func _on_body_entered(body):
	if 'player' in body.get_groups():
		emit_signal('game_over')
