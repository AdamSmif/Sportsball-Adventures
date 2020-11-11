extends Area2D

# Player Number
export var id = 1

# Attack Variables
var baseball = preload("res://Assets/Baseball.tscn")
var fire_cooldown_time = 1000
var next_fire_time = 0


func _physics_process(_delta):
	# Pitch
	if Input.is_action_just_pressed("fire_%s" % id):
#		$Sprite.play("idle")
		#spawn baseball
		var baseballInstance = baseball.instance()
		baseballInstance.position = Vector2(position.x, position.y - 25)
		get_tree().get_root().add_child(baseballInstance)


