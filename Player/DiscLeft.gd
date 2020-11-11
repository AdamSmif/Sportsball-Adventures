extends KinematicBody2D


const SPEED = 10
const GRAVITY = 20
var velocity = Vector2()
var direction = 1
# 1 is right -1 is left

func _start():
	position = Vector2()
	
#func set_throw_direction(dir):
#	direction = dir
#	if dir == -1:
#		$Sprite.flip_h = true

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = SPEED * delta * direction
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
	

