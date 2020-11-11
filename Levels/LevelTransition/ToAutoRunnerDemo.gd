# WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var world_scene

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "GolfballPlayer" or "Player" or "Swimmer" or "PogoPlayer" or "AutoRunner" or "GolfCart":
			get_tree().change_scene("res://Levels/AutoRunTest.tscn")
