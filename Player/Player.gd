extends KinematicBody2D

# Player Number
export var id = 1
# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

# Movement
export var MAX_SPEED = 250
export  var ACCELERATION = 150
export var JUMP_HEIGHT = -650 
export var GRAVITY = 20
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


func _on_FallZone_body_entered(body):
	get_tree().change_scene(lose_level_world_scene)
	
	
func bounce():
	motion.y = JUMP_HEIGHT * 0.7
	
func ouch(var enemyposx):
	print("ouch!")
	set_modulate(Color(1,0.3,0.3,0.4))
	motion.y = JUMP_HEIGHT * 0.7
	
	if position.x < enemyposx:
		motion.x = -800
	elif position.x > enemyposx:
		motion.x = 800
		
	Input.action_release("left_%s" % id)
	Input.action_release("right_%s" % id)
	
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene(lose_level_world_scene)
