extends KinematicBody2D

export var speed = 50
var velocity = Vector2()
#-1 move left +1 move right
export var direction = -1
# true does not fall on cliff, false falls off cliff
export var detects_cliffs = true

func _ready():
	#if moving right move sprite to the right
	if direction == 1:
		$Sprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	
func _physics_process(delta):
	
	# moves if bumps into wall
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction 
	
	#gravity
	velocity.y += 5
	
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)
	

## damage detection
#func _on_top_checker_body_entered(body):
#	$Sprite.play("squashed")
#	speed = 0
#	set_collision_layer_bit(4,false)
#	set_collision_mask_bit(0,false)	
#	$top_checker.set_collision_layer_bit(4,false)
#	$top_checker.set_collision_mask_bit(0,false)
#	$sides_checker.set_collision_layer_bit(4,false)
#	$sides_checker.set_collision_mask_bit(0,false)
#	$Timer.start()
##	body.bounce()
#
#
#func _on_sides_checker_body_entered(body):
#	print("yeet")
##	body.ouch(position.x)
#
#
#func _on_Timer_timeout():
#	queue_free()
