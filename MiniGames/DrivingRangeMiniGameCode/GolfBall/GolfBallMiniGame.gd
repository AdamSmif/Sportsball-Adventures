extends KinematicBody2D


export var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed * delta))
	$Sprite.play("default")
	if (collidedObject):
		$Sprite.play("boom")
		collidedObject.get_collider().queue_free()
		queue_free()

