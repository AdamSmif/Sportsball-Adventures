extends KinematicBody2D


const GRAVITY = 20
var motion = Vector2()

func _ready():
	motion.y += GRAVITY
	$Sprite.play("idle")
