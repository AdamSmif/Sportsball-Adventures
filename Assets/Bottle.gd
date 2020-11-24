extends Area2D

func _on_Bottle_body_entered(body):
	$AnimationPlayer.play("bounce")
	body.add_bottle()
	queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
