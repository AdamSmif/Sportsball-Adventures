extends Control

func _ready():

	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://UI/TitleScreen.tscn")
	pass # Replace with function body
