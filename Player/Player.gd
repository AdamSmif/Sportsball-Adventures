extends KinematicBody2D

# Player Number
export var id = 1

# Movement
const MAX_SPEED = 250
const ACCELERATION = 150
const JUMP_HEIGHT = -600 
const GRAVITY = 20
var motion = Vector2()
var coyote_time

# Attack Variables
const throw = preload("res://Player/Disc.tscn")
var is_dead = false
var is_attacking = false

# Score 
var score = 0

# allows rigid bodies to stay rigid
export (int, 0, 200) var push = 5    

func _ready():
	coyote_time = Timer.new()
	coyote_time.one_shot = true
	coyote_time.wait_time = .02
	add_child(coyote_time)

func _physics_process(_delta):
	motion.y += GRAVITY
	var friction = false

# Throw
	if Input.is_action_just_pressed("fire_%s" % id):
		$Sprite.play("fire")
		#spawn disc
		var throwInstance = throw.instance()
		throwInstance.position = $Position2D.global_position
		get_tree().get_root().add_child(throwInstance)

# Movment
	if Input.is_action_pressed('right_%s' % id):
		motion.x = lerp(motion.x + ACCELERATION, MAX_SPEED, .75)
		$Sprite.flip_h = false
		$Sprite.play("right")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed('left_%s' % id):
		motion.x = lerp(motion.x - ACCELERATION, -MAX_SPEED, .75)
		$Sprite.flip_h = true
		$Sprite.play("right")
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		motion.x = 0
		$Sprite.play("idle")
		friction = true
		
# Movment 2
#	if Input.get_action_strength('right_%s' % id):
#		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
#		$Sprite.flip_h = false
#		$Sprite.play("right")
#	elif Input.get_action_strength('left_%s' % id):
#		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
#		$Sprite.flip_h = true
#		$Sprite.play("right")
#		if sign($Position2D.position.x) == 1:
#			$Position2D.position.x *= -1
#	else:
#		motion.x = 0
#		$Sprite.play("idle")
#		friction = true

		
# # Throw
#	if Input.is_action_just_pressed("fire_%s" % id):
#		var throwInstance = throw.instance()
#		if sign($Position2D.position.x) == 1:
#			throw.set_throw_direction(1)
#		else:
#			throw.set_throw_direction(-1)
#		get_tree().get_root().add_child(throwInstance)
#		throwInstance.position = $Position2D.global_position
		

	if coyote_time.is_stopped():
		motion.y += GRAVITY

	if is_on_floor():
		pass
		if Input.is_action_pressed('up_%s' % id):
			$JumpSound.play()
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0: 
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)

	var _was_on_floor = is_on_floor()
	# For interacting with rigid bodies
	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)
	
	
func _on_Bottle_body_entered(_delta):
	$CoinSound.play()
	score += 1
	print(score)






