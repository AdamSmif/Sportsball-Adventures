extends KinematicBody2D

export var MAX_SPEED = 10
var motion = Vector2()

func _physics_process(_delta):
	var friction = false
	move_and_collide(Vector2(MAX_SPEED * _delta, 0))
