extends KinematicBody2D

onready var stats = $Stats

export var speed = 50
var velocity = Vector2()
var knockback = Vector2.ZERO
#-1 move left +1 move right
export var direction = -1
# true does not fall on cliff, false falls off cliff
export var detects_cliffs = true

func _ready():
	print(stats.max_health)
	print(stats.health)
	
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
	
	
	

func _on_sides_checker_body_entered(body):
	print("ouch!")
	body.ouch(position.x)
	


func _on_Timer_timeout():
	queue_free()

func _on_disc_checker_body_entered(body):
	stats.health -= 1
	body.bounce()


func _on_Stats_no_health():
#	$Hitbox.queue_free()
#	$Hurtbox.queue_free()
	$Hurtbox/CollisionShape2D.disabled = true
	$Hitbox/CollisionShape2D.disabled = true
	$Sprite.play("explosion")
	$ExplosionSound.play()
	speed = 0
	set_collision_layer_bit(5,false)
	set_collision_mask_bit(0,false)
	$Hurtbox.set_collision_layer_bit(8,false)
	$Hurtbox.set_collision_mask_bit(0,false)
	$Hitbox.set_collision_layer_bit(7,false)
	$Hitbox.set_collision_mask_bit(0,false)
	$Timer.start()



func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$HitBadGuy.play()
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150
