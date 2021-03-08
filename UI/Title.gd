extends Control

export(String, FILE, "*.tscn") var next_world_scene

func _ready():

	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("FadeBlackBar")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play_backwards("FadeBlackBar")
#	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene(next_world_scene)
	pass # Replace with function body
