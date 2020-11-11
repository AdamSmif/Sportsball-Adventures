extends KinematicBody2D

# Player Number
export var id = 1

# Movement
const MAX_SPEED = 100
const ACCELERATION = 40
const JUMP_HEIGHT = -100 
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


	




