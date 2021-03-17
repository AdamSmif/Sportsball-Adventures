extends KinematicBody2D

onready var stats = $Stats
var motion = Vector2()
var knockback = Vector2.ZERO
export var speed = 50
export var GRAVITY = 0

func _ready():
	print(stats.max_health)
	print(stats.health)


func _physics_process(delta):
	# Since gravity is 0, player will not fall to gravity
	motion.y += GRAVITY
	$AnimationPlayer.play("default")
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
#	knockback = move_and_slide(knockback)


func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$hitbadguy.play()
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150
#	$Timer.start()





func _on_Stats_no_health():
	$Sprite.play("explosion")
	$boom.play()
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$Hurtbox.set_collision_layer_bit(4,false)
	$Hurtbox.set_collision_mask_bit(0,false)
	$Timer.start()
	
func _on_Timer_timeout():
	queue_free()
