extends KinematicBody2D

# Player Number
export var id = 5

export var MAX_SPEED = 400
export var ACCELERATION = 1000
var motion = Vector2.ZERO

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	$Sprite.play("idle")
	axis.x = int(Input.is_action_pressed('right_%s' % id)) - int(Input.is_action_pressed('left_%s' % id))
	axis.y = int(Input.is_action_pressed('down_%s' % id)) - int(Input.is_action_pressed('up_%s' % id))
	return axis.normalized()
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
