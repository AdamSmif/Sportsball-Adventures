extends KinematicBody2D

# Player Number
export var id = 1
# Stats
var stats = PlayerStats

# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

# Movement
export var MAX_SPEED = 250
export  var ACCELERATION = 75
export var MAX_SPRINT_SPEED = 450
export  var SPRINT_ACCELERATION = 350
var motion = Vector2()
# Jump
export var JUMP_HEIGHT = -500 
export var GRAVITY = 30
# Coyote Time
var CoyoteJump = true
var jumpWasPressed = false
onready var coyoteTimer := $CoyoteTimer

# Attack Variables
const throw = preload("res://Player/Disc.tscn")
const throwright = preload("res://Player/Disc.tscn")
const throwleft = preload("res://Player/DiscLeft.tscn")
# Cool Down
onready var discDelayTimer := $DiscTimer
export var throwDelay: float = 0.8
var vel := Vector2(0, 0)

# allows rigid bodies to stay rigid
export (int, 0, 200) var push = 5    

func _ready():
	pass


func _physics_process(_delta):
	motion.y += GRAVITY
	var friction = false

# Throw
	if Input.is_action_just_pressed("throwright_%s" % id) and discDelayTimer.is_stopped():
		$Sprite.play("fire")
		discDelayTimer.start(throwDelay)
		#spawn disc
		var throwInstance = throw.instance()
		throwInstance.position = $Position2D.global_position
		get_tree().get_root().add_child(throwInstance)

	if Input.is_action_just_pressed("throwleft_%s" % id) and discDelayTimer.is_stopped():
		$Sprite.play("fire")
		discDelayTimer.start(throwDelay)
		#spawn disc
		var throwLeftInstance = throwleft.instance()
		throwLeftInstance.position = $Position2D.global_position
		get_tree().get_root().add_child(throwLeftInstance)
		
#	if Input.is_action_just_pressed("throwright_%s" % id):
#		$Sprite.play("fire")
#		#spawn disc
#		var throwRightInstance = throwright.instance()
#		throwRightInstance.position = $Position2DRight.global_position
#		get_tree().get_root().add_child(throwRightInstance)
#		$DiscTimer.start()

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
		
	if Input.is_action_pressed('down_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("down")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= 1
		Input.action_release("left_%s" % id)
		Input.action_release("right_%s" % id)

# Sprinting
#	if Input.is_action_pressed('sprint_%s' % id) and ('right_%s' % id):
#		print("sprint right")
#		motion.x = lerp(motion.x + SPRINT_ACCELERATION, MAX_SPRINT_SPEED, .75)
#		$Sprite.flip_h = false
#		$Sprite.play("right")
#		if sign($Position2D.position.x) == -1:
#			$Position2D.position.x *= -1
#	elif Input.is_action_pressed('sprint_%s' % id) and ('left_%s' % id):
#		print("sprint right")
#		motion.x = lerp(motion.x + -SPRINT_ACCELERATION, -MAX_SPRINT_SPEED, .75)
#		$Sprite.flip_h = true
#		$Sprite.play("right")
#		if sign($Position2D.position.x) == 1:
#			$Position2D.position.x *= -1

	if is_on_floor():
		CoyoteJump = true
		if jumpWasPressed == true:
			motion.y = JUMP_HEIGHT
		pass
		if Input.is_action_pressed('up_%s' % id):
			jumpWasPressed = true
			rememberJumpTime()
			if CoyoteJump == true:
				$JumpSound.play()
				motion.y = JUMP_HEIGHT
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.2)
	else:
		coyoteTime()
		if motion.y < 0: 
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)

	var _was_on_floor = is_on_floor()
	# For interacting with rigid bodies
	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)

func coyoteTime():
	coyoteTimer
	CoyoteJump = false
	pass

func rememberJumpTime():
	yield(get_tree().create_timer(0.2), "timeout")
	jumpWasPressed = false
	pass

func _on_FallZone_body_entered(body):
	get_tree().change_scene(lose_level_world_scene)
	
	
func bounce():
	motion.y = JUMP_HEIGHT * 0.8
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.4))
	motion.y = JUMP_HEIGHT * 0.2
#
	if position.x < enemyposx:
		motion.x = -800
	elif position.x > enemyposx:
		motion.x = 800

	Input.action_release("left_%s" % id)
	Input.action_release("right_%s" % id)

	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene(lose_level_world_scene)


func _on_DiscTimer_timeout():
	pass # Replace with function body.


