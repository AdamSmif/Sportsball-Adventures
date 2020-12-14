extends KinematicBody2D


const SPEED = 500
const GRAVITY = 2
var JUMP_HEIGHT = -600 
var velocity = Vector2()
var direction = 1
# 1 is right -1 is left


func set_throw_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = SPEED * delta * direction
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func bounce():
	velocity.y = JUMP_HEIGHT * 0.7
