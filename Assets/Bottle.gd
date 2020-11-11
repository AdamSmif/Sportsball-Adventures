extends Area2D

func _on_Bottle_body_entered(_body):
	queue_free()
