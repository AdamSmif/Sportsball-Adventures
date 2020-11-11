extends KinematicBody2D

# Player Number
export var id = 1

# Movement
const MAX_SPEED = 700
const ACCELERATION = 90
const JUMP_HEIGHT = -800 
const GRAVITY = 40
 
var can_jump = false
var dub_jumps = 0
var max_num_dub_jumps = 1
var motion = Vector2()
var is_jumping = false
var coyote_time

# Score 
var score = 0

# allows rigid bodies to stay rigid
#export (int, 0, 200) var push = 5    

func _ready():
	coyote_time = Timer.new()
	coyote_time.one_shot = true
	coyote_time.wait_time = .02
	add_child(coyote_time)

func _physics_process(_delta):
	motion.y += GRAVITY
	var friction = false
	move_and_collide(Vector2(MAX_SPEED * _delta, 0))
	$Sprite.play("right")

	if is_on_floor():
		if Input.is_action_pressed('up_%s' % id):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)

	motion = move_and_slide(motion, Vector2.UP, false, 4, PI/4, false)
	pass
	




