extends KinematicBody2D

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
	
	velocity.x = 50 * direction
	velocity = move_and_slide(velocity, Vector2.UP)
	
