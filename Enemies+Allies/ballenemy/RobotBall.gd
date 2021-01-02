extends KinematicBody2D

onready var stats = $Stats
var knockback = Vector2.ZERO
export var speed = 50


func _ready():
	print(stats.max_health)
	print(stats.health)


func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)


func _on_Hurtbox_area_entered(area):
	knockback = Vector2.RIGHT * 150
	knockback = Vector2.LEFT * 150



func _on_Stats_no_health():
	print("Test")
	queue_free()
