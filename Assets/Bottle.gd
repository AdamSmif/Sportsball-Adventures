extends Area2D

func _on_Bottle_body_entered(body):
#	$BotstleSound.play()
	$AnimationPlayer.play("bounce")
	body.add_bottle()
	queue_free()


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
