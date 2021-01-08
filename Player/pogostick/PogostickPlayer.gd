extends KinematicBody2D

# Player Number
export var id = 1

const MAX_SPEED = 300
const ACCELERATION = 250
const JUMP = -300 
const GRAVITY = 15
 
# Coin Amount
var bottles_needed = 0
# Level Respawn
export(String, FILE, "*.tscn") var lose_level_world_scene
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

var jump_was_pressed = false
var can_jump = false
var pogo_jumps = 0
var max_num_pogo_jumps = 1
var motion = Vector2()
var is_jumping = false
var coyote_time    

func _ready():
	coyote_time = Timer.new()
	coyote_time.one_shot = true
	coyote_time.wait_time = .02 # Coyote Lag
	add_child(coyote_time)

func _physics_process(_delta):
	if Input.is_action_pressed('right_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("default")
		motion.x = min(motion.x+ACCELERATION,  MAX_SPEED)
	elif Input.is_action_pressed('left_%s' % id):
		$Sprite.flip_h = true
		$Sprite.play("default")
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	else:
		motion.x = 0

	if coyote_time.is_stopped():
		motion.y += GRAVITY

	if is_on_floor():
		is_jumping = false
		pogo_jumps = max_num_pogo_jumps
		if Input.is_action_just_pressed("ui_up"):
			is_jumping = true
			motion.y = JUMP
		elif pogo_jumps > 0:
			motion.y = JUMP
			pogo_jumps = pogo_jumps - 1

	var was_on_floor = is_on_floor()
	motion = move_and_slide(motion, Vector2.UP)
	
	
func bounce():
	motion.y = JUMP * 10
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.4))
	motion.y = JUMP * 0.2
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
