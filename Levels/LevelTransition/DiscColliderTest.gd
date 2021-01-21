extends Control

export(String, FILE, "*.tscn") var next_world_scene

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "Disc" or "DiscLeft":
			yield(get_tree().create_timer(1), "timeout")
			$AnimationPlayer.play("fade")
			yield(get_tree().create_timer(5), "timeout")
			$AnimationPlayer.play_backwards("fade")
			yield(get_tree().create_timer(3), "timeout")
			pass # Replace with function body
			get_tree().change_scene(next_world_scene)
