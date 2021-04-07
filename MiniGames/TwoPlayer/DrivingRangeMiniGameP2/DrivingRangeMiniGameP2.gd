extends Node2D

# Spawn Carters
var player2 = preload("res://Player/golfcartplayer/GolfCartPlayer.tscn").instance()

func _ready():
	if Input.is_action_just_pressed("ui_accept"):
		print("Hey")
		add_child(player2)
