extends Node2D


# Player Number
export var id = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialog = Dialogic.start("test")
	add_child(dialog)
