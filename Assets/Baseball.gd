extends KinematicBody2D


var speed = 300

# allows rigid bodies to stay rigid
export (int, 0, 200) var push = 5   


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(speed * delta, 0))
#	if (collidedObject):
#		collidedObject.get_collider().queue_free()
#		queue_free()

