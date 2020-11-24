# WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var world_scene

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "Player":
			$NextLevelSound.play()
			get_tree().change_scene(world_scene)

