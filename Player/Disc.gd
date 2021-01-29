extends KinematicBody2D


const SPEED = 500
const GRAVITY = .3
var JUMP_HEIGHT = -700 
var velocity = Vector2()
var knockback_vector = Vector2.ZERO
var direction = 1
# 1 is right -1 is left


func set_throw_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = false

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = SPEED * delta * direction
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func bounce():
	queue_free()
	


func _on_Hitbox_area_entered(area):
	queue_free()
#	set_collision_layer_bit(5,false)
#	set_collision_mask_bit(0,false)
#	$Hitbox.set_collision_layer_bit(5,false)
#	$Hitbox.set_collision_mask_bit(0,false)
