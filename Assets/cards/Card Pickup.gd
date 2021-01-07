# WorldComplete.gd
extends Area2D

export(String, FILE, "*.tscn") var card_display

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
#	print(bodies)
	for body in bodies:
		if body.name == "Player" or "GolfCartPlayer" or "CYOAPlayer" or "PlayerAutoRun" or "PlayerSkateBoard" or "PogostickPlayer" or "Submarine":
			get_tree().set_visible(card_display)
			set_visible(true)

