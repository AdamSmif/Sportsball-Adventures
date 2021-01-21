extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _ready():
	pass
	
func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Disc" or "DiscLeft":
			$AnimationPlayer.play("Net")
			yield(get_tree().create_timer(1), "timeout")
			get_tree().change_scene(next_world_scene)
			queue_free()
			
func next_level():
	var ERR = get_tree().change_scene_to(next_world_scene)
	
	if ERR != OK:
		print("something failed in the door scene")
