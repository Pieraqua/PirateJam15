extends Node2D

@onready var world = get_parent()
@onready var potion_throw_timer = %PotionThrowTimer

func _ready():
	potion_throw_timer.timeout.connect(throw_potion)
	potion_throw_timer.start()
	
func _process(delta):
	handle_obstacles(delta)
	
func handle_obstacles(_delta):
	pass
	
var firePotion : Potion = FirePotion.new(world)
var icePotion : Potion = IcePotion.new(world)
var windPotion : Potion = WindPotion.new(world)
var waterPotion : Potion = Potion.new(world)

var potions = [firePotion, icePotion, windPotion, waterPotion]

func throw_potion():
	potions.pick_random().throw(world)


