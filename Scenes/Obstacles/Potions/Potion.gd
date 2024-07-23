extends Node
class_name Potion

var _world

func _init(world):
	_world = world

func throw(world):
	print('Normal potion thrown.')
	self._world = world

