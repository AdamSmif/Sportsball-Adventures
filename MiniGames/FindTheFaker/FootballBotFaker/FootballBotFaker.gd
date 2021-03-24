extends KinematicBody2D

var rng = 500

#var Left = AnimationPlayer.play("Left")

func _ready():
	get_node("AnimationPlayer").play("Left")

#func _process(delta):
#	randomize()
#	rng = rand_range(0.0, 500.0)
#	translate(Vector2(rng,rng)*delta)

#func play_random_animation(animation_player:AnimationPlayer):
#	var animation_list = animation_player.get_animation_list()
#	var random_animation = animation_list[randi() % animation_list.size()]
#	animation_player.play(random_animation)
