extends KinematicBody2D

# Player Number
# export var id = 2

# Movement
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

# allows rigid bodies to stay rigid
export (int, 0, 200) var push = 5   

func _ready():
	if direction == 1:
		$Sprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs

func _physics_process(_delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 10
	
	velocity.x = -50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)





