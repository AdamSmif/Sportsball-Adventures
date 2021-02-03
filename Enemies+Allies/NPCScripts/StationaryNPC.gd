extends KinematicBody2D

func _ready():
	queue_free()

func _on_Area2D_area_entered(area):
	if Input.is_action_pressed("ui_cancel"):
		print("hey")
