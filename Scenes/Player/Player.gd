extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var JUMP_VELOCITY : int = 550
@export var SPEED : int = 250
@onready var _sprite = $AnimatedSprite2D

const FREEZE_FACTOR = 32
const WIND_STRENGTH = 125

var floor_frozen = false
var is_windy = false

func handle_movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_dir:
		velocity.x = input_dir.x * SPEED + (WIND_STRENGTH if is_windy else 0)
	else:
		velocity.x = move_toward(velocity.x, (WIND_STRENGTH if is_windy else 0), 
			SPEED/FREEZE_FACTOR if floor_frozen and is_on_floor() else SPEED)

	move_and_slide()
	
	
func _physics_process(delta):
	handle_movement(delta)

func _process(_delta):
	if not is_on_floor():
		_sprite.play("jumping")
	elif velocity.x != 0:
		_sprite.play('walking')
	else:
		_sprite.play('idle')
